import 'package:flutter/cupertino.dart';

Color primaryColor = const Color(0xff135FDC);
Color green = const Color(0xff10D12B);
Color white = const Color(0xffFFFFFF);
Color lightYellow = const Color(0xffFFE8D7);
Color lightPink = const Color(0xffFFDDED);
Color lightBlue = const Color(0xffDDE9FB);
Color lightRed = const Color(0xffFB0B0B);
Color black = const Color(0xff0B2253);
Color supportTextColor = const Color(0xff8091B3);
Color textColor = const Color(0xff0B2253);
Color darkBlueColor = const Color(0xff1C1348);
Color gray = const Color(0xffF7F9FB);
Color inputFieldColor = const Color(0xffF1F4F5);
Color appbarShadowColor = const Color(0xff4f4f4f);


Color getColors(int index) {
  // List colors = [];
  switch(index) {
    case 0:
      return const Color(0xffDDE9FB);
      break;
    case 1:
      return const Color(0xffFFDDED);
      break;
    case 2:
      return const Color(0xffFFE8D7);
      break;
    default:
      return const Color(0xff8091B3);
      break;
  }
}