import 'package:flutter/material.dart';

import '../widgets/utils/styles.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Styles.regular("Orders"),),
    );
  }
}
