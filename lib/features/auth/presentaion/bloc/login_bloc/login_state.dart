part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessAuthLoginState extends LoginState {
  final String verfyId;

  const SuccessAuthLoginState(this.verfyId);
}

class SuccessLoginState extends LoginState {
  final UserCredential user;

  const SuccessLoginState(this.user);
}

class ErrorLoginState extends LoginState {
  final String message;

  const ErrorLoginState(this.message);
}

class SuccessLoginByGoogleState extends LoginState {
  final UserCredential userCredential;

  const SuccessLoginByGoogleState(this.userCredential);
}
