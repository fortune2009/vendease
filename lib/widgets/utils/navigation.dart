
import 'package:flutter/material.dart';

class Nav {
  static forward(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static forwardNoReturn(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  static back(BuildContext context) {
    Navigator.pop(context);
  }
}