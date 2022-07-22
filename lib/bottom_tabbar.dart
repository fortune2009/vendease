import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendease/tabs/delivery.dart';
import 'package:vendease/tabs/home.dart';
import 'package:vendease/tabs/invoice.dart';
import 'package:vendease/tabs/orders.dart';
import 'package:vendease/tabs/products.dart';
import 'package:vendease/widgets/utils/colors.dart';
import 'package:vendease/widgets/utils/styles.dart';

class TabLayout extends StatefulWidget {
  const TabLayout({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout> with TickerProviderStateMixin {
  TabController _tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    // _tabController.animateTo(2);
  }

  List<Tab> tab() {
    return [
      Tab(
          icon: Image.asset(
            "assets/images/home.png",
            color: currentIndex == 0 ? primaryColor : supportTextColor,
            width: 24.w,
            height: 24.h,
          ),
          child: Styles.regular('Home', fontSize: 10.sp, fontWeight: FontWeight.w400,
              color: currentIndex == 0 ? primaryColor : supportTextColor)),
      Tab(
          icon: Image.asset(
            "assets/images/clock.png",
            color: currentIndex == 1 ? primaryColor : supportTextColor,
            width: 24.w,
            height: 24.h,
          ),
          child: Styles.regular('Orders', fontSize: 10.sp, fontWeight: FontWeight.w400,
              color: currentIndex == 1 ? primaryColor : supportTextColor)),
      Tab(
          icon: Image.asset(
            "assets/images/product.png",
            color: currentIndex == 2 ? primaryColor : supportTextColor,
            width: 24.w,
            height: 24.h,
          ),
          child: Styles.regular('Products', fontSize: 10.sp, fontWeight: FontWeight.w400,
              color: currentIndex == 2 ? primaryColor : supportTextColor)),
      Tab(
          icon: Image.asset(
            "assets/images/receipt-item.png",
            color: currentIndex == 3 ? primaryColor : supportTextColor,
            width: 24.w,
            height: 24.h,
          ),
          child: Styles.regular('Invoice', fontSize: 10.sp, fontWeight: FontWeight.w400,
              color: currentIndex == 3 ? primaryColor : supportTextColor) ),
      Tab(
          icon: Image.asset(
            "assets/images/group.png",
            color: currentIndex == 4 ? primaryColor : supportTextColor,
            width: 24.w,
            height: 24.h,
          ),
          child: Styles.regular('Delivery', fontSize: 10.sp, fontWeight: FontWeight.w400,
              color: currentIndex == 4 ? primaryColor : supportTextColor) ),
    ];
  }

  static const List<Widget> _views = [
    Home(),
    Orders(),
    Product(),
    Invoice(),
    Delivery(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: primaryColor,
                width: 2.w,
              ),
              insets: EdgeInsets.symmetric(horizontal: 8.w),
            ),
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            // indicatorPadding:
            // EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
            // EdgeInsets.symmetric(horizontal: 38.w, vertical: 6.h),
            tabs: tab(),
            labelColor: primaryColor,
            unselectedLabelColor: supportTextColor,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(fontStyle: FontStyle.normal, color: supportTextColor),

            physics: const  BouncingScrollPhysics(),
            onTap: (int index) {
              currentIndex = index;
              setState(() {
                currentIndex = index;
              });
            },
            enableFeedback: true,
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            controller: _tabController,
          ),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            controller: _tabController,
            children: _views,
          ),
        ),
      ),
    );
  }
}
