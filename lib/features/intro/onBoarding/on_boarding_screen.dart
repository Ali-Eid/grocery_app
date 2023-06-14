import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/auth/presentaion/pages/auth_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int index = 0;
  List<String> images = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png'
  ];
  List<String> texts = [
    'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
    'Fast food delivery to your home, office \n wherever you are',
    'Real time tracking of your food on the app \n once you placed the order'
  ];
  List<String> titles = [
    'Find Food You Love',
    'Fast Delivery',
    'Live Tracking'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (indexx) {
                  setState(() {
                    index = indexx;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                        width: 240.w,
                        height: 310.h,
                      ),
                      SizedBox(height: 30.h),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        effect: SlideEffect(
                            dotWidth: 8.0.w,
                            dotHeight: 8.0.h,
                            dotColor: ColorManager.grey,
                            activeDotColor: ColorManager.primary),
                      ),
                      SizedBox(height: 34.h),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          overflow: TextOverflow.clip,
                          titles[index],
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          overflow: TextOverflow.clip,
                          texts[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: SizedBox(
                    height: 56.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (index != 2) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linearToEaseOut);
                        } else {
                          Navigator.of(context)
                              .pushReplacement(CupertinoPageRoute(
                            builder: (context) => const AuthScreen(),
                          ));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(ColorManager.primary),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r)))),
                      child: const Text('Next'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
