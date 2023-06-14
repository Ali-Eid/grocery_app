import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/pages/auth_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoNavigationBarBackButton(
          color: ColorManager.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Orders Cart',
          style: TextStyle(
              color: ColorManager.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h),
                child: const ItemCartWidget(),
              ),
              itemCount: 2,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 28.w, horizontal: 24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(15.r),
                topEnd: Radius.circular(15.r),
              ),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.black),
                        ),
                        Text(
                          ' 524,000\$',
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.black),
                        ),
                        Text(
                          ' 2,000\$',
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Offer',
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.primary),
                        ),
                        Text(
                          '-4,000\$',
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.primary),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Grand Total',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 19.w),
                    Text(
                      '\$300,00',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        onPress: () {},
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r))),
                        backgroundColor: ColorManager.buttonColorCheckout,
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                              fontSize: 20.sp, color: ColorManager.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemCartWidget extends StatelessWidget {
  const ItemCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('0'),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        // height: 100.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              height: 72.h,
              width: 72.w,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: ColorManager.backgroundImgColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: const Image(
                image: AssetImage('assets/images/product.png'),
              ),
            ),
            SizedBox(width: 12.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Special Bulgogi',
                        style: TextStyle(
                            color: ColorManager.black, fontSize: 14.sp),
                      ),
                      Text(
                        'Indian chicken',
                        style: TextStyle(
                            color: ColorManager.subtitleColor, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                            fontSize: 12.sp, color: ColorManager.primary),
                      ),
                      Text(
                        '286',
                        style: TextStyle(fontSize: 12.sp),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: ColorManager.primary),
                  child: Text(
                    '-',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  alignment: Alignment.center,
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: ColorManager.primary),
                  child: Text(
                    '+',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
