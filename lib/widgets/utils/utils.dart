

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendease/widgets/utils/colors.dart';
import 'package:vendease/widgets/utils/navigation.dart';
import 'package:vendease/widgets/utils/styles.dart';

///design height(responsiveness)
double logicalHeight() {
  return WidgetsBinding.instance.window.physicalSize.height /
      WidgetsBinding.instance.window.devicePixelRatio;
}

///design width(responsiveness)
double logicalWidth() {
  return WidgetsBinding.instance.window.physicalSize.width /
      WidgetsBinding.instance.window.devicePixelRatio;
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}


Widget scrollActionTag(
    BuildContext context,
    String tag,
    String cta,
    // Widget page,
    page,
    ) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Styles.regular(tag, color: textColor,  fontSize: 18.sp, fontWeight: FontWeight.w500),
      InkWell(
          onTap: page, //() => Nav.forward(context, page),
          child: Styles.regular(cta, color: primaryColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
    ],
  );
}
