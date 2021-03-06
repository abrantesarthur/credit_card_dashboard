import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/database/methods.dart';
import 'package:credit_card_dashboard/models/creditCard.dart';
import 'package:credit_card_dashboard/widgets/horizontalBar.dart';
import 'package:credit_card_dashboard/widgets/transaction.dart';
import 'package:credit_card_dashboard/widgets/transactionHeader.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';
import 'package:provider/provider.dart';

class Transactions extends StatelessWidget {
  Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    CreditCardModel ccm = Provider.of<CreditCardModel>(context, listen: false);

    return Column(
      children: [
        Container(
          height: 150,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Current Balance",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ccm
                                .calculateBalance()
                                .getString(signed: false)
                                .addCommas(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: screenWidth / 100),
                          Text(
                            "Available " +
                                ccm
                                    .getAvailableBalance()
                                    .getString(signed: false)
                                    .addCommas(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      HorizontalBar(
                        fill: ccm.calculateBalancePercentage(),
                        width: 300,
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Current Statement",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "April 1 - May 1",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Points Earned",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        ccm.calculatePoints().toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "View Details",
                            style: TextStyle(
                              color: AppColors.orange,
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_right_alt_rounded,
                            color: AppColors.orange,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight / 25),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              const TransactionHeader(),
              Container(height: 1, color: AppColors.background),
              ...ccm.transactions.sublist(0, 20).map(
                    (t) => Transaction(transaction: t),
                  )
            ],
          ),
        ),
      ],
    );
  }
}

/**
 * Improvements
 *    allow clients to sort by date and amount
 *    open transaction details page
 */
