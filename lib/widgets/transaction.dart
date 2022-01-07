import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/utils.dart';
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
              transaction.timestamp.getDate(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  transaction.merchant.type.getIcon(),
                  color: transaction.merchant.type.getColor(),
                  size: 20,
                ),
                const SizedBox(width: 5),
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
                backgroundColor: transaction.merchant.type.getColor(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              transaction.amount.getString(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
