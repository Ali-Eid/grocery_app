import 'package:get_it/get_it.dart';
import 'package:grocery_app/features/auth/data/datasource/local_data_source.dart';
import 'package:grocery_app/features/auth/data/datasource/remote_data_source.dart';
import 'package:grocery_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:grocery_app/features/auth/domain/repositroy/auth_repository.dart';
import 'package:grocery_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:grocery_app/features/auth/domain/usecases/otp_usecase.dart';
import 'package:grocery_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:grocery_app/features/auth/presentaion/bloc/login_bloc/login_bloc.dart';
import 'package:grocery_app/features/auth/presentaion/bloc/otp/otp_bloc.dart';
import 'package:grocery_app/features/home/presentation/bloc/enable_location/enable_location_bloc.dart';
import 'package:grocery_app/features/intro/splash/bloc/app_bloc_bloc.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc

  sl.registerFactory(() => EnableLocationBloc(location: sl()));
  sl.registerFactory(() => LoginBloc(loginUsecase: sl(), signUpUsecase: sl()));
  sl.registerFactory(() => OtpBloc(otpUsecase: sl()));
  sl.registerFactory(() => AppBlocBloc(sl()));

  //usecase
  sl.registerFactory(() => LoginUsecase(sl()));
  sl.registerFactory(() => SignUpUsecase(sl()));
  sl.registerFactory(() => OtpUsecase(sl()));

  //Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositroyImpl(sl(), sl()));

  //DataSource

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));

  //External

  // final firestore = FirebaseFirestore.instance;
  // final fireAuth = FirebaseAuth.instance;
  final sharedprefernce = await SharedPreferences.getInstance();
  final location = Location();
  // sl.registerLazySingleton(() => firestore);
  // sl.registerLazySingleton(() => fireAuth);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => sharedprefernce);
  sl.registerLazySingleton(() => location);
}
