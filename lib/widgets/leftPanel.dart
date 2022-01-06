import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  final double width;

  const LeftPanel({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      // TODO: extract this into a "build left panel" function
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Transactions",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black, // TODO: vary if selected
            ),
          ),
          SizedBox(height: screenHeight / 100),
          const Text(
            "Manage Card",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.gray, // TODO: vary if selected
            ),
          ),
          SizedBox(height: screenHeight / 100),
          const Text(
            "Insights",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.gray, // TODO: vary if selected
            ),
          ),
        ],
      ),
    );
  }
}
