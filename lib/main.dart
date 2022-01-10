import 'package:credit_card_dashboard/configure_web.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/models/creditCard.dart';
import 'package:credit_card_dashboard/routes/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final CreditCardModel creditCardModel = CreditCardModel();

  @override
  void initState() {
    creditCardModel.downloadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brex Dashboard',
      theme: ThemeData(fontFamily: "Inter"),
      initialRoute: Dashboard.routeName,
      routes: {
        Dashboard.routeName: (context) => const Dashboard(),
      },
    );
  }
}
