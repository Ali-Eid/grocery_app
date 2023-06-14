import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/core/global/constants.dart';
import 'package:grocery_app/features/auth/domain/usecases/otp_verfy_usecase.dart';
import 'package:grocery_app/features/auth/domain/usecases/sign_in_google_usecase.dart';
import 'package:grocery_app/features/auth/domain/usecases/sign_in_phone_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SigninByPhoneUsecase signinByPhoneUsecase;
  final OTPVerfyUsecase otpVerfyUsecase;
  final SignInbyGoogleUsecase signInbyGoogleUsecase;
  LoginBloc(
      {required this.signinByPhoneUsecase,
      required this.otpVerfyUsecase,
      required this.signInbyGoogleUsecase})
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginPhoneEvent) {
        emit(LoadingLoginState());
        final failureOrVerfyId = await signinByPhoneUsecase(event.phoneNumber);
        failureOrVerfyId.fold((failure) {
          emit(ErrorLoginState(failure.toString()));
        }, (verfyId) {
          emit(SuccessAuthLoginState(veficationId));
        });
      } else if (event is OTPPhoneEvent) {
        emit(LoadingLoginState());
        final failureOrSuccess =
            await otpVerfyUsecase(event.verfyId, event.otpNumber);
        failureOrSuccess.fold((failure) {
          emit(ErrorLoginState(failure.toString()));
        }, (user) {
          emit(SuccessLoginState(user));
        });
      } else if (event is LoginByGoogleEvent) {
        emit(LoadingLoginState());
        final failureOrVerfyId = await signInbyGoogleUsecase();
        failureOrVerfyId.fold((failure) {
          emit(ErrorLoginState(failure.toString()));
        }, (userCredential) {
          emit(SuccessLoginByGoogleState(userCredential));
        });
      }
    });
  }
}
