import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/pages/auth_screen.dart';
import 'package:grocery_app/features/home/presentation/bloc/enable_location/enable_location_bloc.dart';
import 'package:grocery_app/features/home/presentation/pages/home_screen.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocListener(
        bloc: context.read<EnableLocationBloc>(),
        listener: (context, state) {
          if (state is HomeState) {
            Navigator.of(context).pushReplacement(CupertinoDialogRoute(
                builder: (context) => const MyHomeScreen(), context: context));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image(
                    height: 300.h,
                    image: const AssetImage('assets/images/map.png'),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Set your location to start exploring',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.textColor),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 56.h,
                    width: double.infinity,
                    child: ButtonWidget(
                      onPress: () {
                        context
                            .read<EnableLocationBloc>()
                            .add(PressEnableLocationEvent());
                      },
                      backgroundColor: ColorManager.primary,
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Enable Location',
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 56.h,
                    width: double.infinity,
                    child: ButtonWidget(
                      onPress: () {
                        Navigator.of(context).pushReplacement(
                            CupertinoDialogRoute(
                                builder: (context) => const MyHomeScreen(),
                                context: context));
                      },
                      elevation: 0,
                      backgroundColor: ColorManager.white,
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(color: ColorManager.primary),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: const Text(
                        'No, I do it later',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
