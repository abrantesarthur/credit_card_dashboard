import 'package:credit_card_dashboard/widgets/layout.dart';
import 'package:flutter/material.dart';

class ManageCard extends StatelessWidget {
  static String routeName = "/manage-card";

  const ManageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Layout(
      routeTitle: "Manage Card",
      child: Column(
        children: [
          Container(height: 150, color: Colors.white),
        ],
      ),
    );
  }
}
