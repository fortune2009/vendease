import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/utils/colors.dart';
import '../widgets/utils/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.only(left: 14.w, bottom: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //   child: GestureDetector(
                //     onTap: () => Navigator.pop(context),
                //     child: Row(
                //       children: [
                //         Icon(
                //           Icons.arrow_back_ios,
                //           size: 12.sp,
                //           color: black,
                //         ),
                //         Styles.semiBold("Back",
                //             color: black, fontSize: 15.sp),
                //       ],
                //     ),
                //   ),
                // ),
                // HSpace(50.w),
                Expanded(
                    child: Center(
                        child: Styles.semiBold("Cart",
                            fontSize: 20.sp, color: black))),
                // Expanded(child: Container())
              ],
            ),
          ),
          preferredSize: Size(double.infinity, 30.h),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: (){}, //viewModel.refreshContent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Center(
                child: Image.asset("assets/images/shoppingcart.png"),
              )),
              Spacer(),
              // CustomButton(
              //     width: double.infinity.w,
              //     height: 48.h,
              //     radius: 24,
              //     isActive: true,
              //     color: blue,
              //     title: "Send gift (₦${viewModel.total})",
              //     onPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
