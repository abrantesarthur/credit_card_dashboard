import 'package:credit_card_dashboard/configure_web.dart';
import 'package:credit_card_dashboard/screens/transactions.dart';
import 'package:flutter/material.dart';

void main() {
  configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venni',
      initialRoute: Transactions.routeName,
      routes: {Transactions.routeName: (context) => const Transactions()},
    );
  }
}
