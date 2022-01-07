import 'package:credit_card_dashboard/configure_web.dart';
import 'package:credit_card_dashboard/routes/dashboard.dart';
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
      title: 'Brex Dashboard',
      theme: ThemeData(fontFamily: "Inter"),
      initialRoute: Dashboard.routeName,
      routes: {
        Dashboard.routeName: (context) => const Dashboard(),
      },
    );
  }
}
