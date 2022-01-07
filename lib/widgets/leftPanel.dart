import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  final Function onIndexChanged;

  const LeftPanel({Key? key, required this.onIndexChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => onIndexChanged(0),
          child: const Text(
            "Transactions",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black, // TODO: vary if selected
            ),
          ),
        ),
        SizedBox(height: screenHeight / 100),
        InkWell(
          onTap: () => onIndexChanged(1),
          child: const Text(
            "Manage Card",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.gray, // TODO: vary if selected
            ),
          ),
        ),
        SizedBox(height: screenHeight / 100),
        InkWell(
          onTap: () => onIndexChanged(2),
          child: const Text(
            "Insights",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.gray, // TODO: vary if selected
            ),
          ),
        ),
      ],
    );
  }
}
