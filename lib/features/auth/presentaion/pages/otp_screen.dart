import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/global/constants.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/bloc/login_bloc/login_bloc.dart';
import 'package:grocery_app/features/auth/presentaion/pages/auth_screen.dart';
import 'package:grocery_app/features/auth/presentaion/pages/signup_screen.dart';
import 'package:grocery_app/features/home/presentation/pages/home_screen.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen({super.key, required this.phone});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OtpFieldController otpNumber = OtpFieldController();
  String smsCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: BlocConsumer(
          bloc: context.read<LoginBloc>(),
          listener: (context, state) {
            if (state is SuccessLoginState) {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 60.h),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'We have sent an OTP to',
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.textTitleColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'your Mobile',
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.textTitleColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Please check your mobile number 071*****12',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.textColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'continue to reset your password',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.textColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 54.h),
                OTPTextField(
                  controller: otpNumber,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 30.w,
                  style: const TextStyle(fontSize: 17),
                  // obscureText: true,
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: ColorManager.textFieldFillColor,
                    borderColor: ColorManager.textFieldFillColor,
                    enabledBorderColor: ColorManager.textFieldFillColor,
                    errorBorderColor: Colors.red,
                    focusBorderColor: ColorManager.textFieldFillColor,
                  ),
                  outlineBorderRadius: 12.r,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    setState(() {
                      smsCode += pin;
                    });
                  },
                ),
                SizedBox(height: 36.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ButtonWidget(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r))),
                    backgroundColor: ColorManager.primary,
                    onPress: () {
                      print(otpNumber.toString());
                      print('is ${veficationId.toString()}');
                      context
                          .read<LoginBloc>()
                          .add(OTPPhoneEvent(veficationId, smsCode));
                    },
                    child: const Text('Next'),
                  ),
                ),
                SizedBox(height: 32.h),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
                  },
                  child: RichText(
                      text: TextSpan(
                          text: 'Didn\'t Receive?',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: ColorManager.textColor,
                              fontWeight: FontWeight.w400),
                          children: [
                        TextSpan(
                          text: 'Click Here',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
