import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_bloc_event.dart';
part 'app_bloc_state.dart';

class AppBlocBloc extends Bloc<AppBlocEvent, AppBlocState> {
  final SharedPreferences sharedPreferences;
  AppBlocBloc(this.sharedPreferences) : super(AppBlocInitial()) {
    on<AppBlocEvent>((event, emit) async {
      if (event is AppHome) {
        String? token = sharedPreferences.getString('token');
        if (token?.isEmpty ?? true) {
          emit(AuthAppBlocState());
        } else {
          emit(HomeAppBlocState());
        }
      }
      // else if (event is AppAuth) {
      //   emit(AuthAppBlocState());
      // }
    });
  }
}
