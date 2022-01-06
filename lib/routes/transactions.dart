import 'package:credit_card_dashboard/widgets/layout.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  static String routeName = "/transactions";

  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      routeTitle: "Transactions",
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
      ),
    );
  }
}
