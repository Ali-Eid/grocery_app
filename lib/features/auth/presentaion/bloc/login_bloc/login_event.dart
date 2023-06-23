part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneEvent extends LoginEvent {
  final String phoneNumber;
  final String password;

  const LoginPhoneEvent({required this.phoneNumber, required this.password});

  @override
  List<Object> get props => [phoneNumber, password];
}

class SignUpPhoneEvent extends LoginEvent {
  final String phoneNumber;
  final String password;
  final String name;

  const SignUpPhoneEvent(
      {required this.phoneNumber, required this.password, required this.name});

  @override
  List<Object> get props => [phoneNumber, password, name];
}








//----------FireBase Events -----------

// class LoginPhoneEvent extends LoginEvent {
//   final String phoneNumber;
//   // String? otp;
//   const LoginPhoneEvent(this.phoneNumber);

//   @override
//   List<Object> get props => [phoneNumber];
// }

// class OTPPhoneEvent extends LoginEvent {
//   final String verfyId;
//   final String otpNumber;

//   const OTPPhoneEvent(this.verfyId, this.otpNumber);

//   @override
//   List<Object> get props => [verfyId, otpNumber];
// }

// class LoginByGoogleEvent extends LoginEvent {}
