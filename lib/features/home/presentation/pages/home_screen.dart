import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/themes/colors/colors.dart';
import 'package:grocery_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:grocery_app/features/home/presentation/bloc/enable_location/enable_location_bloc.dart';
import 'package:grocery_app/features/home/presentation/pages/enable_location_screen.dart';
import 'package:grocery_app/injection_container.dart' as di;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late EnableLocationBloc enableLocationBloc;
  @override
  void initState() {
    enableLocationBloc = di.sl<EnableLocationBloc>()
      ..add(IsEnableLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: enableLocationBloc,
      builder: (context, state) {
        if (state is HomeState) {
          return const MyHomeScreen();
        }
        if (state is PleaseEnableLocationState) {
          return BlocProvider.value(
            value: enableLocationBloc,
            child: const EnableLocationScreen(),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({
    super.key,
  });

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeWidget(),
    const OffersScreen(),
    const FavouriteScreen(),
    const HollandScreen(),
    const UserInfoScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 9.sp,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          unselectedFontSize: 9.sp,
          showUnselectedLabels: true,
          selectedItemColor: ColorManager.primary,
          unselectedLabelStyle:
              TextStyle(color: ColorManager.primary, fontSize: 9.sp),
          selectedLabelStyle:
              TextStyle(color: ColorManager.primary, fontSize: 9.sp),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage('assets/images/homeIcon.png'),
                width: 40.w,
                height: 17.h,
                color: currentIndex == 0 ? ColorManager.primary : null,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage('assets/images/offerICon.png'),
                width: 40.w,
                height: 17.h,
                color: currentIndex == 1 ? ColorManager.primary : null,
              ),
              label: 'Offers',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage('assets/images/favourite.png'),
                width: 40.w,
                height: 17.h,
                color: currentIndex == 2 ? ColorManager.primary : null,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage('assets/images/holland.png'),
                width: 40.w,
                height: 17.h,
                color: currentIndex == 3 ? ColorManager.primary : null,
              ),
              label: 'Holland Go',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage('assets/images/preson.png'),
                width: 40.w,
                height: 17.h,
                color: currentIndex == 4 ? ColorManager.primary : null,
              ),
              label: 'Account',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: screens[currentIndex],
        ));
  }
}

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HollandScreen extends StatelessWidget {
  const HollandScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OffersScreen extends StatelessWidget {
  const OffersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 244.h,
          child: Stack(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/images/home.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 54.h, start: 16.w, end: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 46.h,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 14.sp, color: ColorManager.black),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: ColorManager.hintTextColor,
                                ),
                                suffixIcon: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18.w),
                                  child: Image(
                                    width: 19.w,
                                    height: 16.h,
                                    image: const AssetImage(
                                        'assets/images/filters.png'),
                                  ),
                                ),
                                suffixIconConstraints: BoxConstraints(
                                    minHeight: 16.h, minWidth: 19.w),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorManager.hintTextColor),
                                // hintText: 'Search',
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
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => CartScreen(),
                                ));
                              },
                              child: Container(
                                height: 46.h,
                                width: 51.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 11.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: ColorManager.white,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: const Image(
                                    image:
                                        AssetImage('assets/images/cart.png')),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7.w, vertical: 5.h),
                              child: Container(
                                width: 16.w,
                                height: 16.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorManager.primary),
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 9.sp),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 29.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Holland Bazar',
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Powered By TFC',
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: TitleHomeWidget(
                  fontSize: 13.sp,
                  onPress: () {
                    print('object');
                  },
                  label: 'Offers',
                  isSubTitle: false),
            ),
            SizedBox(
              height: 195.h,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                      shrinkWrap: true,
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          OfferWidget(index: index),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 38.h),
            SizedBox(
              height: 95.h,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                      shrinkWrap: true,
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          CategoryWidget(index: index),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27.h),
            TitleHomeWidget(
                onPress: () {
                  print('object');
                },
                label: 'Frequently Ordered',
                isSubTitle: true,
                subtitle: 'Suggestions based on your order history'),
            SizedBox(height: 18.h),
            SizedBox(
              height: 170.h,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                      shrinkWrap: true,
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: index == 0 ? 0 : 16.w),
                          child: const ProductItemWidget()),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h)
          ],
        )
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.index,
  });
  int index = 0;

  List<String> nameCategory = [
    'Past Order',
    'Free Delivery',
    'Beverages',
    'Breakfast',
    'Cooking',
    ''
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 16.w),
      child: Column(
        children: [
          Container(
            height: 75.h,
            width: 75.w,
            padding: index == 0 || index == 1
                ? EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h)
                : null,
            decoration: BoxDecoration(
              border: Border.all(width: 0.3.w, color: ColorManager.borderColor),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: index == 5
                ? InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.90,
                          );
                        },
                      );
                      // Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const CategoriesScreen(),));
                    },
                    child: Center(
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: ColorManager.textTitleColor),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      print('object1');
                    },
                    child: Image(
                      image: AssetImage('assets/images/cat$index.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
          SizedBox(height: 5.h),
          Text(
            nameCategory[index],
            style: TextStyle(fontSize: 10.sp, color: ColorManager.textColor),
          )
        ],
      ),
    );
  }
}

class OfferWidget extends StatelessWidget {
  OfferWidget({
    super.key,
    required this.index,
  });
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 16.w),
      child: Container(
        height: 195.h,
        width: 195.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: const DecorationImage(
                image: AssetImage('assets/images/offer1.png'),
                fit: BoxFit.fill)),
      ),
    );
  }
}

class TitleHomeWidget extends StatelessWidget {
  TitleHomeWidget(
      {super.key,
      required this.label,
      this.isSubTitle,
      this.subtitle,
      required this.onPress,
      this.fontSize});
  final String label;
  String? subtitle;
  bool? isSubTitle;
  double? fontSize;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: fontSize ?? 18.sp,
                    color: ColorManager.textTitleColor),
              ),
              isSubTitle ?? false ? SizedBox(height: 3.h) : const SizedBox(),
              isSubTitle ?? false
                  ? Text(
                      'Suggestions based on your order history',
                      style: TextStyle(
                          fontSize: 8.sp, color: ColorManager.textColor),
                    )
                  : const SizedBox(),
            ],
          ),
          InkWell(
            onTap: onPress,
            child: Row(
              children: [
                Text(
                  'See all',
                  style:
                      TextStyle(fontSize: 12.sp, color: ColorManager.primary),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ColorManager.primary,
                  size: 12.sp,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: ColorManager.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: ColorManager.backgroundImgColor,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: const Image(
                        image: AssetImage('assets/images/product.png')),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                    child: Container(
                      width: 18.w,
                      height: 18.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: ColorManager.white),
                      child: Icon(
                        Icons.add,
                        size: 18.sp,
                        color: ColorManager.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorem ipsum',
                  style: TextStyle(
                      fontSize: 7.sp, color: ColorManager.textTitleColor),
                ),
                Text(
                  '400 g',
                  style:
                      TextStyle(fontSize: 6.sp, color: ColorManager.textColor),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ 4.75 ',
                      style: TextStyle(
                          fontSize: 10.sp, color: ColorManager.primary),
                    ),
                    Row(
                      children: [
                        Text(
                          '4.9',
                          style: TextStyle(
                              fontSize: 8.sp, color: ColorManager.textColor),
                        ),
                        Icon(
                          Icons.star,
                          color: ColorManager.starsColor,
                          size: 8.sp,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 9.h),
        ],
      ),
    );
  }
}
