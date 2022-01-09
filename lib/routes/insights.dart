import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/widgets/doughnutChart.dart';
import 'package:credit_card_dashboard/widgets/horizontalBar.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Insights extends StatefulWidget {
  const Insights({Key? key}) : super(key: key);

  @override
  InsightsState createState() => InsightsState();
}

// TODO: add buttons to see expenses by date and YTD
class InsightsState extends State<Insights> {
  late List<ExpenseByMerchantCategory> _expensesByMerchantCategory;
  late List<ExpenseByMonth> _expensesByMonth;

  // TODO: make dynamic
  List<ExpenseByMerchantCategory> getExpensesByMerchantCategory() {
    final chartData = [
      ExpenseByMerchantCategory(MerchantCategory.dining, 150),
      ExpenseByMerchantCategory(MerchantCategory.rideSharing, 110),
      ExpenseByMerchantCategory(MerchantCategory.tool, 150),
      ExpenseByMerchantCategory(MerchantCategory.trip, 80),
    ];
    return chartData;
  }

  // TODO: make dynamic
  List<ExpenseByMerchantCategory> getExpensesByMonth() {
    final chartData = [
      ExpenseByMonth(MerchantCategory.dining, 150),
    ];
    return chartData;
  }

  @override
  void initState() {
    _expensesByMerchantCategory = getExpensesByMerchantCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        // TODO: add button to select monthly or YTD
        Container(
          color: Colors.white,
          height: screenHeight / 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
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
        SizedBox(height: screenHeight / 25),
        Container(
          color: Colors.white,
          height: screenHeight / 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          StackedColumnSeries(
                            dataSource: dataSource,
                            xValueMapper: xValueMapper,
                            yValueMapper: yValueMapper,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpenseByMonth {
  final String month;
  final num tripExpenses;
  final num toolExpenses;
  final num rideSharingExpenses;
  final num diningExpenses;

  ExpenseByMonth({
    required this.month,
    required this.tripExpenses,
    required this.toolExpenses,
    required this.rideSharingExpenses,
    required this.diningExpenses,
  });
}

class ExpenseByMerchantCategory implements ChartData {
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
