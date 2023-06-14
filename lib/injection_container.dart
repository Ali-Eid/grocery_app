import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery_app/features/auth/data/datasource/local_data_source.dart';
import 'package:grocery_app/features/auth/data/datasource/remote_data_source.dart';
import 'package:grocery_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:grocery_app/features/auth/domain/repositroy/auth_repository.dart';
import 'package:grocery_app/features/auth/domain/usecases/otp_verfy_usecase.dart';
import 'package:grocery_app/features/auth/domain/usecases/sign_in_google_usecase.dart';
import 'package:grocery_app/features/auth/domain/usecases/sign_in_phone_usecase.dart';
import 'package:grocery_app/features/auth/presentaion/bloc/login_bloc/login_bloc.dart';
import 'package:grocery_app/features/home/presentation/bloc/enable_location/enable_location_bloc.dart';
import 'package:grocery_app/features/intro/splash/bloc/app_bloc_bloc.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc

  sl.registerFactory(() => EnableLocationBloc(location: sl()));
  sl.registerFactory(() => LoginBloc(
      signinByPhoneUsecase: sl(),
      otpVerfyUsecase: sl(),
      signInbyGoogleUsecase: sl()));
  sl.registerFactory(() => AppBlocBloc(sl()));
  //Usecase
  sl.registerLazySingleton(() => SigninByPhoneUsecase(sl()));
  sl.registerLazySingleton(() => OTPVerfyUsecase(sl()));
  sl.registerLazySingleton(() => SignInbyGoogleUsecase(sl()));

  //Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositroyImpl(sl(), sl()));

  //DataSource

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl(), sl()));

  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));

  //External

  final firestore = FirebaseFirestore.instance;
  final fireAuth = FirebaseAuth.instance;
  final sharedprefernce = await SharedPreferences.getInstance();
  final location = Location();
  sl.registerLazySingleton(() => firestore);
  sl.registerLazySingleton(() => fireAuth);
  sl.registerLazySingleton(() => sharedprefernce);
  sl.registerLazySingleton(() => location);
}
