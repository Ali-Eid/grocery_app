import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/bloc/login_bloc/login_bloc.dart';
import 'package:grocery_app/features/auth/presentaion/pages/auth_screen.dart';
import 'package:grocery_app/features/auth/presentaion/pages/login_screen.dart';
import 'package:grocery_app/features/auth/presentaion/pages/otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: context.read<LoginBloc>(),
        listener: (context, state) {
          if (state is SuccessSignUpState) {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => OTPScreen(phone: phoneController.text)));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthTextFieldWidget(
                          controller: nameController,
                          hint: 'Name',
                        ),
                        SizedBox(height: 28.h),
                        AuthTextFieldWidget(
                          controller: phoneController,
                          hint: 'Mobile No',
                        ),
                        SizedBox(height: 28.h),
                        AuthTextFieldWidget(
                          controller: passwordController,
                          hint: 'Password',
                          isPassword: true,
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
                              context.read<LoginBloc>().add(SignUpPhoneEvent(
                                  phoneNumber: phoneController.text,
                                  password: passwordController.text,
                                  name: nameController.text));
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
