import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/pages/auth_screen.dart';
import 'package:grocery_app/features/auth/presentaion/pages/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.textTitleColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add your details to sign up',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.textColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthTextFieldWidget(
                        controller: TextEditingController(),
                        hint: 'Name',
                      ),
                      SizedBox(height: 28.h),
                      AuthTextFieldWidget(
                        controller: TextEditingController(),
                        hint: 'Mobile No',
                      ),
                      SizedBox(height: 28.h),
                      AuthTextFieldWidget(
                        controller: TextEditingController(),
                        hint: 'Address',
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
                            print('method login');
                          },
                          backgroundColor: ColorManager.primary,
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r))),
                          child: const Text('Login'),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(CupertinoPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                        },
                        child: RichText(
                            text: TextSpan(
                                text: 'Already have an Account?',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: ColorManager.textColor,
                                    fontWeight: FontWeight.w400),
                                children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: ColorManager.primary,
                                    fontWeight: FontWeight.bold),
                              )
                            ])),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
