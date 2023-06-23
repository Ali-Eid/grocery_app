import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/intro/onBoarding/on_boarding_screen.dart';
import 'package:grocery_app/features/intro/splash/bloc/app_bloc_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Timer(const Duration(seconds: 3), () {
    // Navigator.of(context).pushReplacement(
    //     CupertinoPageRoute(builder: (context) => const OnBoardingScreen()));
    // });
    context.read<AppBlocBloc>().add(AppHome());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: context.read<AppBlocBloc>(),
        listener: (context, state) {
          if (state is HomeAppBlocState) {
            Timer(const Duration(seconds: 2), () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(
                  builder: (context) => const OnBoardingScreen()));

              // Navigator.of(context).pushReplacement(
              //     CupertinoPageRoute(builder: (context) => const HomeScreen()));
            });
          } else {
            Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => const OnBoardingScreen()));
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash_logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
