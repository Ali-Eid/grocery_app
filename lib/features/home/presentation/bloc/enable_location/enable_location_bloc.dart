import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

part 'enable_location_event.dart';
part 'enable_location_state.dart';

class EnableLocationBloc
    extends Bloc<EnableLocationEvent, EnableLocationState> {
  final Location location;
  EnableLocationBloc({required this.location})
      : super(EnableLocationInitial()) {
    on<EnableLocationEvent>((event, emit) async {
      if (event is IsEnableLocationEvent) {
        bool ison = await location.serviceEnabled();
        if (!ison) {
          emit(PleaseEnableLocationState());
        } else {
          emit(HomeState());
        }
      } else if (event is PressEnableLocationEvent) {
        bool isturnedon = await location.requestService();
        if (isturnedon) {
          emit(HomeState());
        }
      }
    });
  }
}
