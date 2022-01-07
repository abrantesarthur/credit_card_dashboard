import 'package:credit_card_dashboard/routes/dashboard.dart';
import 'package:flutter/material.dart';

class ManageCard extends StatelessWidget {
  const ManageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(height: 150, color: Colors.white),
      ],
    );
  }
}
