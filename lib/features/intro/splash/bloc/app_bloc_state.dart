part of 'app_bloc_bloc.dart';

abstract class AppBlocState extends Equatable {
  const AppBlocState();

  @override
  List<Object> get props => [];
}

class AppBlocInitial extends AppBlocState {}

class AuthAppBlocState extends AppBlocState {}

class HomeAppBlocState extends AppBlocState {}
