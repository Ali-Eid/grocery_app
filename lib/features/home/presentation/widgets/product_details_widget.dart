import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/pages/auth_screen.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: SizedBox(
              height: 138.h,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 130.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: ColorManager.backgroundImgColor,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: const Image(
                          image: AssetImage('assets/images/product.png')),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Lorem ipsum'),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                        SizedBox(height: 15.h),
                        const Text('\$ 0.00'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam',
            style: TextStyle(fontSize: 10.sp),
          ),
          SizedBox(height: 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/mines.png'),
                width: 32.w,
                height: 32.h,
              ),
              SizedBox(width: 20.w),
              const Text('1'),
              SizedBox(width: 20.w),
              Image(
                  image: const AssetImage('assets/images/plus.png'),
                  width: 32.w,
                  height: 32.h)
            ],
          ),
          SizedBox(height: 25.h),
          SizedBox(
            height: 56.h,
            width: double.infinity,
            child: ButtonWidget(
              onPress: () async {},
              backgroundColor: ColorManager.primary,
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r))),
              child: Text(
                'Add 1 to order * \$2.3',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
