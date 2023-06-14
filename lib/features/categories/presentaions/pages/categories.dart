import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new_outlined,
                color: ColorManager.primary,
                size: 14.sp,
              ),
              Text(
                'Back',
                style: TextStyle(fontSize: 14.sp, color: ColorManager.primary),
              )
            ],
          ),
        ),
        title: Text(
          'Categories',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorManager.textTitleColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    height: 103.h,
                    width: 103.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.3.w, color: ColorManager.borderColor),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('object1');
                      },
                      child: const Image(
                        image: AssetImage('assets/images/cat2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Breakfast',
                    style: TextStyle(
                        fontSize: 13.sp, color: ColorManager.textColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
