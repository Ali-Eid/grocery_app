part of 'enable_location_bloc.dart';

abstract class EnableLocationEvent extends Equatable {
  const EnableLocationEvent();

  @override
  List<Object> get props => [];
}

class IsEnableLocationEvent extends EnableLocationEvent {}

class PressEnableLocationEvent extends EnableLocationEvent {}
