import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/pages/login_screen.dart';
import 'package:grocery_app/features/auth/presentaion/pages/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(20.r),
                            bottomEnd: Radius.circular(20.r)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 36.w, end: 120.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: const AssetImage(
                                    'assets/images/big_square.png'),
                                width: 90.w,
                                height: 90.h,
                              ),
                              Image(
                                image: const AssetImage(
                                    'assets/images/small_square.png'),
                                width: 20.w,
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 36.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image(
                                image: const AssetImage(
                                    'assets/images/small_square.png'),
                                width: 20.w,
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: SizedBox(
                        height: 56.h,
                        width: double.infinity,
                        child: ButtonWidget(
                          onPress: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          backgroundColor: ColorManager.primary,
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r))),
                          child: const Text('Login'),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: SizedBox(
                        height: 56.h,
                        width: double.infinity,
                        child: ButtonWidget(
                          onPress: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
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
                            'Create an Account',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 43.h),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 233.w,
            height: 234.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 4.w, color: ColorManager.primary),
            ),
            child: const Image(image: AssetImage('assets/images/logo.png')),
          )
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  VoidCallback? onPress;
  Color? backgroundColor;
  double? elevation;
  MaterialStateProperty<OutlinedBorder?>? shape;
  Widget? child;
  ButtonWidget(
      {super.key,
      this.onPress,
      this.shape,
      this.child,
      this.backgroundColor = Colors.white,
      this.elevation = 2});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(elevation),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: shape),
        child: child);
  }
}
