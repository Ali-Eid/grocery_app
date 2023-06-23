import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/features/auth/presentaion/bloc/login_bloc/login_bloc.dart';
import 'package:grocery_app/features/intro/splash/bloc/app_bloc_bloc.dart';
import 'package:grocery_app/features/intro/splash/splash_screen.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  // token = di.sl<SharedPreferences>().getString('token') ?? '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<AppBlocBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => const MaterialApp(
          title: 'Grocery App',
          home: SplashScreen(),
        ),
      ),
    );
  }
}
