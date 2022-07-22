import 'package:flutter/material.dart';
import 'package:vendease/widgets/utils/styles.dart';

class Orders extends StatefulWidget {
  const Orders({Key key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Styles.regular("Orders"),),
    );
  }
}
