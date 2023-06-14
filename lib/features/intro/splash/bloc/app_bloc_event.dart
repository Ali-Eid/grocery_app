part of 'app_bloc_bloc.dart';

abstract class AppBlocEvent extends Equatable {
  const AppBlocEvent();

  @override
  List<Object> get props => [];
}

class AppAuth extends AppBlocEvent {}

class AppHome extends AppBlocEvent {}
