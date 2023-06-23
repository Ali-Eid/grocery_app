import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/global/constants.dart';
import 'package:grocery_app/features/auth/domain/entity/success_entity.dart';
import 'package:grocery_app/features/auth/domain/usecases/otp_usecase.dart';
import 'package:grocery_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpUsecase otpUsecase;
  OtpBloc({required this.otpUsecase}) : super(OtpInitial()) {
    on<OtpEvent>((event, emit) async {
      if (event is OtpVerify) {
        token = sl<SharedPreferences>().getString('token') ?? 'unknown';
        print('token Event is $token');
        emit(LoadingOtpState());

        final failureOrSuccess = await otpUsecase(event.otp);
        failureOrSuccess.fold((failure) {
          emit(ErrorOtpState(failure.toString()));
        }, (success) {
          emit(SuccessOtpState(success));
        });
      }
    });
  }
}
