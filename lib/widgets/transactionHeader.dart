import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 30,
        left: 30,
        top: 10,
        bottom: 10,
      ),
      child: Row(
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
      ),
    );
  }
}
