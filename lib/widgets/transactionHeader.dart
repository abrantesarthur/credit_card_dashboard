import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class TransactionHeader extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;
  final String fourthTitle;

  const TransactionHeader({
    Key? key,
    required this.firstTitle,
    required this.secondTitle,
    required this.thirdTitle,
    required this.fourthTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Expanded(
          flex: 1,
          child: Text(
            "Date",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "Merchant",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "Points Earned",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "Amount",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
            ),
          ),
        ),
      ],
    );
  }
}
