part of 'enable_location_bloc.dart';

abstract class EnableLocationState extends Equatable {
  const EnableLocationState();

  @override
  List<Object> get props => [];
}

class EnableLocationInitial extends EnableLocationState {}

class PleaseEnableLocationState extends EnableLocationState {}

class HomeState extends EnableLocationState {}
