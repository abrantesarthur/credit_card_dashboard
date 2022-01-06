import 'package:credit_card_dashboard/screens/transactions.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    initializeApp();
    super.initState();
  }

  Future<void> initializeApp() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "OpenSans"),
      debugShowCheckedModeBanner: false,
      initialRoute: Transactions.routeName,
      // pass appropriate arguments to routes
      onGenerateRoute: (RouteSettings settings) {
        // if Home is pushed
        if (settings.name == Transactions.routeName) {
          return MaterialPageRoute(builder: (context) {
            return Transactions();
          });
        }
        return null;
      },
      routes: {Transactions.routeName: (context) => Transactions()},
    );
  }
}
