import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:vendease/screens/cart_screen.dart';
import 'package:vendease/tabs/products.dart';
import 'package:vendease/widgets/utils/navigation.dart';
import 'package:vendease/widgets/utils/styles.dart';
import 'package:vendease/widgets/utils/utils.dart';

import '../widgets/utils/colors.dart';
import '../widgets/utils/space.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // HomeList data = HomeList();
  String itm = 'This week';
  CarouselController carouselController = CarouselController();
  double dotInt = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VSpace(20.h),
                homeScreenHeader(context),
                VSpace(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Styles.regular("Show:")),
                    // VSpace(10.w),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        // width: 100.w,
                        child: DropdownButton<String>(
                          value: itm,
                          items: <String>[
                            'This week',
                            'Last Week',
                            'Last Month'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Styles.regular(value,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600),
                            );
                          }).toList(),
                          onChanged: (_) {
                            setState(() {
                              itm = _;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Styles.regular("View more",
                          align: TextAlign.right,
                          color: primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                VSpace(10.h),
                Container(
                    height: 160.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: lightYellow,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: CarouselSlider.builder(
                            carouselController: carouselController,
                            options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              aspectRatio: 3.0,
                              initialPage: 0,
                            ),
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              // setState(() {
                              //   dotInt = pageViewIndex.toDouble();
                              // });
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // VSpace(18.h),
                                  Styles.regular("Total Orders",
                                      color: black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                  VSpace(16.h),
                                  Styles.regular("200",
                                      color: Colors.deepOrangeAccent,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600),
                                  // VSpace(16.h),
                                ],
                              );
                            },
                          ),
                        ),
                        // VSpace(10.sp),
                        Expanded(
                          child: DotsIndicator(
                            dotsCount: 4,
                            position: 0.0, //.toDouble(),
                            decorator: const DotsDecorator(
                              color: Colors.white, // Inactive color
                              activeColor: Colors.deepOrangeAccent,
                            ),
                          ),
                        )
                      ],
                    )),
                VSpace(18.h),
                scrollActionTag(
                    context, 'Product categories', 'See all', (){

                }),
                VSpace(20.h)
,                SizedBox(
                  height: 150.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        height: 80.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                            color: getColors(index),
                            shape: BoxShape.rectangle,
                            border: Border.all(color: lightBlue,),
                            borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/drinks.png", height: 70.h),
                            VSpace(10.h),
                            SizedBox(width: 100.w, child: Styles.regular("Drinks", align: TextAlign.center, overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => HSpace(20.w),
                      itemCount: 4),
                ),
                // giftNotificationCard('Kingsley', 'Deji'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Styles.regular("Recent order list", color: textColor,  fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ],
                ),
                VSpace(25.h),
                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    // itemCount: data.categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.rectangle,
                          border: Border.all(color: lightBlue,),
                          borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: ClipRRect(
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: green.withOpacity(0.5),
                                    shape: BoxShape.rectangle
                                  ),
                      ),
                              ),
                      HSpace(20.w),
                      Expanded(
                          flex: 24,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Styles.regular("P016", fontSize: 14.sp),
                                          Styles.regular("₦8,000", fontSize: 13.sp),
                                        ],
                                      ),
                                     VSpace(20.h),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Styles.regular("Jan 3, 2021 10:11 AM", fontSize: 12.sp),
                                          Styles.regular("2 days ago", color: primaryColor, fontSize: 12.sp),
                                        ],
                                      )
                                    ],
                                  ),
                      ),
                              HSpace(20.w),
                            ],
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                      return VSpace(8.h);
                  },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget homeScreenHeader(
    BuildContext context,
    // String userName,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // HSpace(18.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Welcome,",
                        children: [
                          TextSpan(
                              text: " Mhiday",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500))
                        ],
                        style: TextStyle(
                            color: black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500))),
                VSpace(4.h),
                Styles.regular(
                  "What are you looking for today?",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: supportTextColor,
                )
              ],
            )
          ],
        ),
        HSpace(12.w),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            "assets/images/profile-image.png",
            fit: BoxFit.cover,
            width: 30,
            height: 30,
          ),
        ),
        // HSpace(10.w),
        InkWell(
          onTap: () => Nav.forward(context, CartScreen()),
          child: ClipRRect(
            child: Image.asset(
              "assets/images/cart.png",
              width: 30,
              height: 30,
            ),
          ),
        )
      ],
    );
  }
}
