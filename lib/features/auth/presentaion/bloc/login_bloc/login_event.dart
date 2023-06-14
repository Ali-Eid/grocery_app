part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneEvent extends LoginEvent {
  final String phoneNumber;
  // String? otp;
  const LoginPhoneEvent(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class OTPPhoneEvent extends LoginEvent {
  final String verfyId;
  final String otpNumber;

  const OTPPhoneEvent(this.verfyId, this.otpNumber);

  @override
  List<Object> get props => [verfyId, otpNumber];
}

class LoginByGoogleEvent extends LoginEvent {}
