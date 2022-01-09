import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/widgets/cartesianChart.dart';
import 'package:credit_card_dashboard/widgets/doughnutChart.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';

class Insights extends StatefulWidget {
  const Insights({Key? key}) : super(key: key);

  @override
  InsightsState createState() => InsightsState();
}

class InsightsState extends State<Insights> {
  late List<ExpenseByMerchantCategory> _expensesByMerchantCategory;
  late List<ExpenseByMonth> _expensesByMonth;

  @override
  void initState() {
    // TODO: make dynamic
    _expensesByMerchantCategory = getExpensesByMerchantCategory();
    _expensesByMonth = getExpensesByMonth();
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
                          chartData: getExpensesByMonth(),
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

class ExpenseByMonth {
  final Month month;
  final num travelExpenses;
  final num softwareExpenses;
  final num rideSharingExpenses;
  final num diningExpenses;

  ExpenseByMonth({
    required this.month,
    required this.travelExpenses,
    required this.softwareExpenses,
    required this.rideSharingExpenses,
    required this.diningExpenses,
  });
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

// TODO: make dynamic
List<ExpenseByMerchantCategory> getExpensesByMerchantCategory() {
  return [
    ExpenseByMerchantCategory(MerchantCategory.dining, 150),
    ExpenseByMerchantCategory(MerchantCategory.rideSharing, 110),
    ExpenseByMerchantCategory(MerchantCategory.software, 150),
    ExpenseByMerchantCategory(MerchantCategory.travel, 80),
  ];
}

// TODO: make dynamic
List<ExpenseByMonth> getExpensesByMonth() {
  return [
    ExpenseByMonth(
      month: Month.aug,
      travelExpenses: 17,
      softwareExpenses: 142,
      rideSharingExpenses: 87,
      diningExpenses: 100,
    ),
    ExpenseByMonth(
      month: Month.sep,
      travelExpenses: 142,
      softwareExpenses: 130,
      rideSharingExpenses: 130,
      diningExpenses: 100,
    ),
    ExpenseByMonth(
      month: Month.oct,
      travelExpenses: 100,
      softwareExpenses: 87,
      rideSharingExpenses: 130,
      diningExpenses: 100,
    ),
    ExpenseByMonth(
      month: Month.nov,
      travelExpenses: 100,
      softwareExpenses: 17,
      rideSharingExpenses: 100,
      diningExpenses: 130,
    ),
    ExpenseByMonth(
      month: Month.dec,
      travelExpenses: 130,
      softwareExpenses: 100,
      rideSharingExpenses: 87,
      diningExpenses: 17,
    ),
    ExpenseByMonth(
      month: Month.jan,
      travelExpenses: 150,
      softwareExpenses: 120,
      rideSharingExpenses: 10,
      diningExpenses: 80,
    ),
  ];
}
