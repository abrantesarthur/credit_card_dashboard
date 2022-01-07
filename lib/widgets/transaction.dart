import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

enum merchantType { rideSharing, restaurant, trip, tool }

class Merchant {
  merchantType type;
  String name;

  Merchant(this.type, this.name);
}

class Transaction extends StatelessWidget {
  final String date;
  final Merchant merchant;
  final int pointsEarned;
  final double amount;

  const Transaction({
    Key? key,
    required this.date,
    required this.merchant,
    required this.pointsEarned,
    required this.amount,
  }) : super(key: key);

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
        children: [
          Expanded(
            flex: 1,
            child: Text(
              date,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.gray,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  merchant.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              pointsEarned.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.gray,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              amount.toString(),
              style: const TextStyle(
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
