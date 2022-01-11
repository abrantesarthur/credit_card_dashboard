import 'dart:html';

import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/models/creditCard.dart';
import 'package:credit_card_dashboard/widgets/appButton.dart';
import 'package:credit_card_dashboard/widgets/cartesianChart.dart';
import 'package:credit_card_dashboard/widgets/doughnutChart.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Insights extends StatefulWidget {
  const Insights({Key? key}) : super(key: key);

  @override
  InsightsState createState() => InsightsState();
}

class InsightsState extends State<Insights> {
  late List<ExpenseByMerchantCategory> _expensesByMerchantCategory = [];
  late List<CartesianChartData> _cartesianChartData = [];
  late CartesianPeriod selectedPeriod = CartesianPeriod.months;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _expensesByMerchantCategory = getExpensesByMerchantCategory(
          context: context,
        );
        _cartesianChartData = getExpensesBy(
          context: context,
          period: CartesianPeriod.months,
        );
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
          height: screenHeight / 1.4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Expenses " + selectedPeriod.getString(),
                  style: const TextStyle(
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
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 2,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<CartesianPeriod>(
                                      value: selectedPeriod,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedPeriod =
                                              value ?? CartesianPeriod.months;
                                          _cartesianChartData = getExpensesBy(
                                            context: context,
                                            period: selectedPeriod,
                                          );
                                        });
                                      },
                                      items: CartesianPeriod.values
                                          .map(
                                            (p) => DropdownMenuItem(
                                              child: Text(
                                                p.getString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              value: p,
                                            ),
                                          )
                                          .toList()),
                                ),
                              ),
                            ),
                            Expanded(flex: 1, child: Container()),
                          ],
                        ),
                      )
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
  DoughnutPeriod period = DoughnutPeriod.thisMonth,
}) {
  CreditCardModel ccm = Provider.of<CreditCardModel>(context, listen: false);

  return MerchantCategory.values
      .map(
        (merchant) => ExpenseByMerchantCategory(
          merchant,
          ccm.getExpenseByMerchant(
            merchantCategory: merchant,
            startTs: period.getStartTimestamp(),
            endTs: period.getEndTimestamp(),
          ),
        ),
      )
      .toList();
}

// return expenses by category from November to April
List<CartesianChartData> getExpensesBy({
  required BuildContext context,
  required CartesianPeriod period,
}) {
  CreditCardModel ccm = Provider.of<CreditCardModel>(context, listen: false);

  if (period == CartesianPeriod.weeks) {
    return [
      [
        DateTime(2022, 3, 31),
        DateTime(2022, 4, 7),
      ],
      [
        DateTime(2022, 4, 7),
        DateTime(2022, 4, 14),
      ],
      [
        DateTime(2022, 4, 14),
        DateTime(2022, 4, 21),
      ],
      [
        DateTime(2022, 4, 21),
        DateTime(2022, 4, 28),
      ],
    ]
        .map(
          (dates) => CartesianChartData(
            label: dates[0].month.toString() +
                "/" +
                dates[0].day.toString() +
                " to " +
                dates[1].month.toString() +
                "/" +
                dates[1].day.toString(),
            // label: DateFormat("EEEE").format(date),
            travelExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.travel,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            softwareExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.software,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            ridesharingExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.rideSharing,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            diningExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.dining,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            newsExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.news,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
          ),
        )
        .toList();
  } else if (period == CartesianPeriod.days) {
    return [
      DateTime(2022, 4, 25),
      DateTime(2022, 4, 26),
      DateTime(2022, 4, 27),
      DateTime(2022, 4, 24),
      DateTime(2022, 4, 28),
      DateTime(2022, 4, 29),
      DateTime(2022, 4, 30),
    ]
        .map(
          (date) => CartesianChartData(
            label: date.month.toString() + "/" + date.day.toString(),
            // label: DateFormat("EEEE").format(date),
            travelExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.travel,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            softwareExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.software,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            ridesharingExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.rideSharing,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            diningExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.dining,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            newsExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.news,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
          ),
        )
        .toList();
  } else if (period == CartesianPeriod.months) {
    return Month.values
        .where((month) => (month == Month.jan ||
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

  return [];
}
