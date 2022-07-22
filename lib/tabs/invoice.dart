import 'package:flutter/material.dart';

import '../widgets/utils/styles.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Styles.regular("Invoice"),),
    );

        }
}
