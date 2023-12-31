part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpVerify extends OtpEvent {
  final String otp;

  const OtpVerify({required this.otp});
}
