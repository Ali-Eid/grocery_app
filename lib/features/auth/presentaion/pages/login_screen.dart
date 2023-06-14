import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/bloc/login_bloc/login_bloc.dart';
import 'package:grocery_app/features/auth/presentaion/pages/auth_screen.dart';
import 'package:grocery_app/features/auth/presentaion/pages/otp_screen.dart';
import 'package:grocery_app/features/auth/presentaion/pages/reset_password_screen.dart';
import 'package:grocery_app/features/auth/presentaion/pages/signup_screen.dart';
import 'package:grocery_app/features/home/presentation/pages/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          child: BlocConsumer(
            bloc: context.read<LoginBloc>(),
            listener: (context, state) {
              if (state is SuccessLoginByGoogleState) {
                Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false);
              }
              if (state is SuccessAuthLoginState) {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) =>
                        OTPScreen(phone: _phoneController.text)));
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        SizedBox(height: 60.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
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
                              'Add your details to login',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.textColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 36.h),
                        AuthTextFieldWidget(
                          controller: _phoneController,
                          hint: 'Mobile No',
                        ),
                        // SizedBox(height: 28.h),
                        // AuthTextFieldWidget(
                        //   controller: _passController,
                        //   hint: 'Password',
                        //   isPassword: true,
                        // ),
                        SizedBox(height: 28.h),
                        SizedBox(
                          height: 56.h,
                          width: double.infinity,
                          child: ButtonWidget(
                            onPress: () async {
                              context
                                  .read<LoginBloc>()
                                  .add(LoginPhoneEvent(_phoneController.text));
                              // Navigator.of(context).push(CupertinoPageRoute(
                              //     builder: (context) =>
                              //         OTPScreen(phone: _phoneController.text)));
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
                            Navigator.of(context).push(CupertinoPageRoute(
                              // builder: (context) => const OTPScreen(),
                              builder: (context) => const ResetPasswordScreen(),
                            ));
                            print('method reset password');
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.textColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'or Login With',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.textColor),
                            ),
                            SizedBox(height: 16.h),
                            SizedBox(
                              height: 56.h,
                              width: double.infinity,
                              child: ButtonWidget(
                                onPress: () {
                                  context
                                      .read<LoginBloc>()
                                      .add(LoginByGoogleEvent());
                                },
                                backgroundColor: ColorManager.darkPrimary,
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(FontAwesomeIcons.google, size: 12.w),
                                    SizedBox(width: 20.w),
                                    Text(
                                      'Login with Google',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ));
                              },
                              child: RichText(
                                  text: TextSpan(
                                      text: 'Don\'t have an Account?',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: ColorManager.textColor,
                                          fontWeight: FontWeight.w400),
                                      children: [
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: ColorManager.primary,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                            ),
                            SizedBox(height: 40.h)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }
}

class AuthTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  bool? isPassword;
  AuthTextFieldWidget(
      {super.key,
      required this.controller,
      required this.hint,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 14.sp, color: ColorManager.black),
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        hintStyle:
            TextStyle(fontSize: 14.sp, color: ColorManager.hintTextColor),
        hintText: hint,
        filled: true,
        fillColor: ColorManager.textFieldFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
