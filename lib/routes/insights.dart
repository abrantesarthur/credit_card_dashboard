import 'dart:html';

import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/models/creditCard.dart';
import 'package:credit_card_dashboard/widgets/cartesianChart.dart';
import 'package:credit_card_dashboard/widgets/doughnutChart.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';
import 'package:provider/provider.dart';

class Insights extends StatefulWidget {
  const Insights({Key? key}) : super(key: key);

  @override
  InsightsState createState() => InsightsState();
}

class InsightsState extends State<Insights> {
  late List<ExpenseByMerchantCategory> _expensesByMerchantCategory = [];
  late List<CartesianChartData> _cartesianChartData = [];

  @override
  void initState() {
    // TODO: make dynamic

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _expensesByMerchantCategory = getExpensesByMerchantCategory(
          context: context,
        );
        _cartesianChartData = getExpensesByMonth(context: context);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        // TODO: add button to select "Current Month" or YTD
        Container(
          color: Colors.white,
          height: screenHeight / 1.5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        // TODO: add buttons to select thisMonth and YTD
                        child: DoughnutChart(
                          title: "Expenses by Merchant Category",
                          chartData: _expensesByMerchantCategory,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight / 25),
        Container(
          color: Colors.white,
          height: screenHeight / 1.5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Expenses by Month",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: screenHeight / 25),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        // TODO: add buttons to select by days and weeks
                        child: CartesianChart(
                          chartData: _cartesianChartData,
                        ),
                      ),
                      Expanded(flex: 1, child: Container())
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ExpenseByMerchantCategory implements DoughnutChartData {
  final MerchantCategory merchantType;
  final double spending;

  ExpenseByMerchantCategory(this.merchantType, this.spending);

  @override
  String getXValue() {
    return merchantType.getString();
  }

  @override
  double getYValue() {
    return spending;
  }

  @override
  String getLabel() {
    return spending.getString(signed: false, rounded: true);
  }

  @override
  Color getColor() {
    return merchantType.getColor();
  }
}

// TODO: this month, ytd,
List<ExpenseByMerchantCategory> getExpensesByMerchantCategory({
  required BuildContext context,
  Period period = Period.thisMonth,
}) {
  CreditCardModel ccm = Provider.of<CreditCardModel>(context, listen: false);

  return [
    ExpenseByMerchantCategory(
      MerchantCategory.dining,
      ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.dining,
        startTs: period.getStartTimestamp(),
        endTs: period.getEndTimestamp(),
      ),
    ),
    ExpenseByMerchantCategory(
      MerchantCategory.rideSharing,
      ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.rideSharing,
        startTs: period.getStartTimestamp(),
        endTs: period.getEndTimestamp(),
      ),
    ),
    ExpenseByMerchantCategory(
      MerchantCategory.software,
      ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.software,
        startTs: period.getStartTimestamp(),
        endTs: period.getEndTimestamp(),
      ),
    ),
    ExpenseByMerchantCategory(
      MerchantCategory.travel,
      ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.travel,
        startTs: period.getStartTimestamp(),
        endTs: period.getEndTimestamp(),
      ),
    ),
    ExpenseByMerchantCategory(
      MerchantCategory.news,
      ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.news,
        startTs: period.getStartTimestamp(),
        endTs: period.getEndTimestamp(),
      ),
    ),
  ];
}

// // return expenses by category from November to April
List<CartesianChartData> getExpensesByMonth({required BuildContext context}) {
  CreditCardModel ccm = Provider.of<CreditCardModel>(context, listen: false);

  return Month.values
      .where((month) => (month == Month.nov ||
          month == Month.dec ||
          month == Month.jan ||
          month == Month.feb ||
          month == Month.mar ||
          month == Month.apr))
      .map((m) {
    return CartesianChartData(
      label: m.getString(),
      travelExpenses: ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.travel,
        startTs: m.getStartTimestamp(),
        endTs: m.getEndTimestamp(),
      ),
      softwareExpenses: ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.software,
        startTs: m.getStartTimestamp(),
        endTs: m.getEndTimestamp(),
      ),
      ridesharingExpenses: ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.rideSharing,
        startTs: m.getStartTimestamp(),
        endTs: m.getEndTimestamp(),
      ),
      diningExpenses: ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.dining,
        startTs: m.getStartTimestamp(),
        endTs: m.getEndTimestamp(),
      ),
      newsExpenses: ccm.getExpenseByMerchant(
        merchantCategory: MerchantCategory.news,
        startTs: m.getStartTimestamp(),
        endTs: m.getEndTimestamp(),
      ),
    );
  }).toList();
}
