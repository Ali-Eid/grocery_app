import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/global/constants.dart';
import 'package:grocery_app/features/auth/domain/entity/user_entity.dart';
import 'package:grocery_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:grocery_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:grocery_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final SigninByPhoneUsecase signinByPhoneUsecase;
  // final OTPVerfyUsecase otpVerfyUsecase;
  // final SignInbyGoogleUsecase signInbyGoogleUsecase;

  final LoginUsecase loginUsecase;
  final SignUpUsecase signUpUsecase;
  LoginBloc({
    required this.loginUsecase,
    required this.signUpUsecase,
  }) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginPhoneEvent) {
        emit(LoadingLoginState());
        final failureOrSuccess =
            await loginUsecase(event.phoneNumber, event.password);
        failureOrSuccess.fold((failure) {
          emit(ErrorLoginState(failure.toString()));
        }, (user) {
          sl<SharedPreferences>().setString('token', user.token);
          token = sl<SharedPreferences>().getString('token') ?? 'unknown';
          emit(SuccessLoginState(user));
        });
      } else if (event is SignUpPhoneEvent) {
        emit(LoadingLoginState());
        final failureOrSuccess =
            await signUpUsecase(event.phoneNumber, event.password, event.name);
        failureOrSuccess.fold((failure) {
          emit(ErrorLoginState(failure.toString()));
        }, (user) {
          sl<SharedPreferences>().setString('token', user.token);
          token = sl<SharedPreferences>().getString('token') ?? 'unknown';
          emit(SuccessSignUpState(user));
        });
      }
    });
  }
}


//----------------FireBase Events -------------------
  // if (event is LoginPhoneEvent) {
      //   emit(LoadingLoginState());
      //   final failureOrVerfyId = await signinByPhoneUsecase(event.phoneNumber);
      //   failureOrVerfyId.fold((failure) {
      //     emit(ErrorLoginState(failure.toString()));
      //   }, (verfyId) {
      //     emit(SuccessAuthLoginState(veficationId));
      //   });
      // } else if (event is OTPPhoneEvent) {
      //   emit(LoadingLoginState());
      //   final failureOrSuccess =
      //       await otpVerfyUsecase(event.verfyId, event.otpNumber);
      //   failureOrSuccess.fold((failure) {
      //     emit(ErrorLoginState(failure.toString()));
      //   }, (user) {
      //     emit(SuccessLoginState(user));
      //   });
      // } else if (event is LoginByGoogleEvent) {
      //   emit(LoadingLoginState());
      //   final failureOrVerfyId = await signInbyGoogleUsecase();
      //   failureOrVerfyId.fold((failure) {
      //     emit(ErrorLoginState(failure.toString()));
      //   }, (userCredential) {
      //     emit(SuccessLoginByGoogleState(userCredential));
      //   });
      // }