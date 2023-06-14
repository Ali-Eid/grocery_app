import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/pages/auth_screen.dart';
import 'package:grocery_app/features/auth/presentaion/pages/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New Password',
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
                  'Please enter your email to receive a \n link to  create a new password via email',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.textColor),
                ),
              ],
            ),
            SizedBox(height: 36.h),
            AuthTextFieldWidget(
              controller: TextEditingController(),
              hint: 'New Password',
            ),
            SizedBox(height: 28.h),
            AuthTextFieldWidget(
              controller: TextEditingController(),
              hint: 'Confirm Password',
            ),
            SizedBox(height: 28.h),
            SizedBox(
              height: 56.h,
              width: double.infinity,
              child: ButtonWidget(
                onPress: () {
                  print('method reset password');
                },
                backgroundColor: ColorManager.primary,
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r))),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
