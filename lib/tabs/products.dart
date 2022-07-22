import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendease/models/product_model.dart';
import 'package:vendease/screens/cart_screen.dart';
import 'package:vendease/widgets/utils/colors.dart';
import 'package:vendease/widgets/utils/space.dart';
import 'package:vendease/widgets/utils/styles.dart';
import 'package:vendease/widgets/utils/utils.dart';

import '../widgets/utils/navigation.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  const Product({Key key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> with TickerProviderStateMixin {
  TabController _tabController;

  ProductModel _productModel;

  Future<bool> get() async {
    String url = 'https://live-vendease.herokuapp.com/';
    // Map<String, String> name = {"search": ''};
    Map<String, String> queryParameters = {
      '\$limit': '50',
      '\$search': 'co',
      '\$skip': '0',
      'cityCode': 'LA724629',
      'countryCode': 'NI904222'
    };
    final uri = Uri.parse('${url}product?');
    final finalUri = uri.replace(queryParameters: queryParameters);

    Map<String, String> header = {
      // HttpHeaders.authorizationHeader: "Token $token",
      HttpHeaders.contentTypeHeader: "application/json"
    };

    var response =
        await http.get(finalUri, headers: {"Accept": "Application/json"});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
    
    _productModel = ProductModel.fromJson(jsonDecode(response.body));

    if(_productModel == null) {
      get();
    } else {
      return true;
    }
    print("prod ${_productModel == null}");

    return false;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    get();
  }

  @override
  Widget build(BuildContext context) {
    // if(_productModel == null) {
    //   get();
    // }
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VSpace(25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Styles.bold("Products", fontSize: 24.sp),
            ),
            Divider(thickness: 1.5.h),
            VSpace(10.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: "Search Product"),
              ),
            ),
            VSpace(4.h),
            _productModel == null ? Center(
              child: SizedBox(
                height: deviceHeight(context),
                child: Column(
                children: [
                  Styles.regular("Something went wrong, Please try again!"),
                  OutlinedButton(onPressed: () async{
                    await get();
                    setState(() {
                    });
                  }, child: const Icon(Icons.refresh))
                ],
              ),
              ),
            )
                : _productModel.data == null ? const Center(child: CircularProgressIndicator())
                :
            Column(
              children: [
                SizedBox(
                  height: 40.h,
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: primaryColor,
                        labelColor: primaryColor,
                        unselectedLabelColor: supportTextColor,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(color: primaryColor, width: 2.w),
                          insets: EdgeInsets.symmetric(horizontal: 8.w),
                        ),
                        tabs: [
                          Tab(
                              icon: const SizedBox(),
                              child: Styles.regular(
                                'All Products',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          Tab(
                              icon: const SizedBox(),
                              child: Styles.regular(
                                'Fruits and Vegetables',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          Tab(
                              icon: const SizedBox(),
                              child: Styles.regular(
                                'Toiletries',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              )),
                        ]),
                  ),
                ),
                VSpace(10.h),
                Container(
                  height: deviceHeight(context).h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SizedBox(
                        height: deviceHeight(context),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: _productModel.data.length,
                          itemBuilder: (context, index) {
                            var item = _productModel.data[index];
                            return Container(
                              height: 110.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: white,
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: lightBlue,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Center(
                                          child: Image.network(
                                        item.image,
                                        height: 80.h,
                                        width: 80.w,
                                      )),
                                    ),
                                  ),
                                  // HSpace(20.w),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 150.w,
                                              child: Styles.regular(
                                                  item.name,
                                                  fontSize: 14.sp, overflow: TextOverflow.ellipsis),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Nav.forward(
                                                      context, const CartScreen());
                                                },
                                                child: Image.asset(
                                                  "assets/images/add-cart.png",
                                                  height: 30.h,
                                                  width: 30.w,
                                                ))
                                          ],
                                        ),
                                        // VSpace(5.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 160.w,
                                              child: Styles.regular(item.description,
                                                  fontSize: 12.sp, overflow: TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              // width: 100.w,
                                              height: 25.h,
                                              child: DropdownButton<String>(
                                                value: 'Available',
                                                items: <String>[
                                                  'Available',
                                                  'Unavailable',
                                                ].map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Styles.regular(value,
                                                        color: green,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  );
                                                }).toList(),
                                                onChanged: (_) {
                                                  // setState(() {
                                                  //   itm = _;
                                                  // });
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 100.w,
                                              height: 30.h,
                                              child: DropdownButton<String>(
                                                value: 'Each',
                                                items: <String>['Each', 'Kilogram']
                                                    .map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Styles.regular(value,
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  );
                                                }).toList(),
                                                onChanged: (_) {
                                                  // setState(() {
                                                  //   itm = _;
                                                  // });
                                                },
                                              ),
                                            ),
                                            Styles.regular("₦7,000",
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                        VSpace(5.h),
                                      ],
                                    ),
                                  ),
                                  HSpace(5.w),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return VSpace(8.h);
                          },
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight(context),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: _productModel.data.length,
                          itemBuilder: (context, index) {
                            var item = _productModel.data[index];
                            return Container(
                              height: 110.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: white,
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: lightBlue,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Center(
                                          child: Image.network(
                                        item.image,
                                        height: 80.h,
                                        width: 80.w,
                                      )),
                                    ),
                                  ),
                                  // HSpace(20.w),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 150.w,
                                              child: Styles.regular(
                                                  item.name,
                                                  fontSize: 14.sp, overflow: TextOverflow.ellipsis),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Nav.forward(
                                                      context, const CartScreen());
                                                },
                                                child: Image.asset(
                                                  "assets/images/add-cart.png",
                                                  height: 30.h,
                                                  width: 30.w,
                                                ))
                                          ],
                                        ),
                                        // VSpace(5.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 160.w,
                                              child: Styles.regular(item.description,
                                                  fontSize: 12.sp, overflow: TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              // width: 100.w,
                                              height: 25.h,
                                              child: DropdownButton<String>(
                                                value: 'Available',
                                                items: <String>[
                                                  'Available',
                                                  'Unavailable',
                                                ].map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Styles.regular(value,
                                                        color: green,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  );
                                                }).toList(),
                                                onChanged: (_) {
                                                  // setState(() {
                                                  //   itm = _;
                                                  // });
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 100.w,
                                              height: 30.h,
                                              child: DropdownButton<String>(
                                                value: 'Each',
                                                items: <String>['Each', 'Kilogram']
                                                    .map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Styles.regular(value,
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  );
                                                }).toList(),
                                                onChanged: (_) {
                                                  // setState(() {
                                                  //   itm = _;
                                                  // });
                                                },
                                              ),
                                            ),
                                            Styles.regular("₦7,000",
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                        VSpace(5.h),
                                      ],
                                    ),
                                  ),
                                  HSpace(5.w),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return VSpace(8.h);
                          },
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight(context),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: _productModel.data.length,
                          itemBuilder: (context, index) {
                            var item = _productModel.data[index];
                            return Container(
                              height: 110.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: white,
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: lightBlue,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Center(
                                          child: Image.network(
                                        item.image,
                                        height: 80.h,
                                        width: 80.w,
                                      )),
                                    ),
                                  ),
                                  // HSpace(20.w),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 150.w,
                                              child: Styles.regular(
                                                  item.name,
                                                  fontSize: 14.sp, overflow: TextOverflow.ellipsis),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Nav.forward(
                                                      context, const CartScreen());
                                                },
                                                child: Image.asset(
                                                  "assets/images/add-cart.png",
                                                  height: 30.h,
                                                  width: 30.w,
                                                ))
                                          ],
                                        ),
                                        // VSpace(5.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 160.w,
                                              child: Styles.regular(item.description,
                                                  fontSize: 12.sp, overflow: TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              // width: 100.w,
                                              height: 25.h,
                                              child: DropdownButton<String>(
                                                value: 'Available',
                                                items: <String>[
                                                  'Available',
                                                  'Unavailable',
                                                ].map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Styles.regular(value,
                                                        color: green,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  );
                                                }).toList(),
                                                onChanged: (_) {
                                                  // setState(() {
                                                  //   itm = _;
                                                  // });
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 100.w,
                                              height: 30.h,
                                              child: DropdownButton<String>(
                                                value: 'Each',
                                                items: <String>['Each', 'Kilogram']
                                                    .map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Styles.regular(value,
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  );
                                                }).toList(),
                                                onChanged: (_) {
                                                  // setState(() {
                                                  //   itm = _;
                                                  // });
                                                },
                                              ),
                                            ),
                                            Styles.regular("₦7,000",
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                        VSpace(5.h),
                                      ],
                                    ),
                                  ),
                                  HSpace(5.w),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return VSpace(8.h);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
