part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class LoadingOtpState extends OtpState {}

class SuccessOtpState extends OtpState {
  final SuccessEntity success;

  const SuccessOtpState(this.success);
}

class ErrorOtpState extends OtpState {
  final String message;

  const ErrorOtpState(this.message);
}
