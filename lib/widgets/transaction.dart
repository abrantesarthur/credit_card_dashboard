import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/widgets/points.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final TransactionType transaction;
  const Transaction({Key? key, required this.transaction}) : super(key: key);

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
              transaction.date,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  transaction.merchant.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Points(
                points: transaction.pointsEarned,
                backgroundColor: getMerchantColor(transaction.merchant.type),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              transaction.amount.toString(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Color getMerchantColor(MerchantType? t) {
    switch (t) {
      case MerchantType.dining:
        return AppColors.diningColor;
      case MerchantType.rideSharing:
        return AppColors.ridesharingColor;
      case MerchantType.tool:
        return AppColors.toolColor;
      case MerchantType.trip:
        return AppColors.tripColor;
      default:
        return Colors.black;
    }
  }
}
