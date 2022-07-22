import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendease/bottom_tabbar.dart';
import 'package:vendease/widgets/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(logicalWidth(), logicalHeight()),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Gilroy',
            primarySwatch: Colors.green,
            textTheme: TextTheme(
              //To support the following, you need to use the first initialization method
                button: TextStyle(fontSize: 45.sp)),
          ),
          home: const TabLayout())
    );
  }
}
