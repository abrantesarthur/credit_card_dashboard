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
        // TODO: add button to select monthly or YTD
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
                        child: SfCartesianChart(
                          legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap,
                            position: LegendPosition.bottom,
                            isResponsive: true,
                            textStyle: const TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          tooltipBehavior: TooltipBehavior(
                            enable: true,
                            duration: 1,
                            textStyle: const TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          series: <ChartSeries>[
                            StackedColumnSeries<ExpenseByMonth, String>(
                              dataSource: _expensesByMonth,
                              xValueMapper: (data, _) => data.month.getString(),
                              yValueMapper: (data, _) => data.diningExpenses,
                              name: MerchantCategory.dining.getString(),
                              color: MerchantCategory.dining.getColor(),
                            ),
                            StackedColumnSeries<ExpenseByMonth, String>(
                              dataSource: _expensesByMonth,
                              xValueMapper: (data, _) => data.month.getString(),
                              yValueMapper: (data, _) =>
                                  data.rideSharingExpenses,
                              name: MerchantCategory.rideSharing.getString(),
                              color: MerchantCategory.rideSharing.getColor(),
                            ),
                            StackedColumnSeries<ExpenseByMonth, String>(
                              dataSource: _expensesByMonth,
                              xValueMapper: (data, _) => data.month.getString(),
                              yValueMapper: (data, _) => data.toolExpenses,
                              name: MerchantCategory.tool.getString(),
                              color: MerchantCategory.tool.getColor(),
                            ),
                            StackedColumnSeries<ExpenseByMonth, String>(
                              dataSource: _expensesByMonth,
                              xValueMapper: (data, _) => data.month.getString(),
                              yValueMapper: (data, _) => data.tripExpenses,
                              name: MerchantCategory.trip.getString(),
                              color: MerchantCategory.trip.getColor(),
                            ),
                          ],
                          primaryXAxis: CategoryAxis(),
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

// TODO: make dynamic
List<ExpenseByMerchantCategory> getExpensesByMerchantCategory() {
  return [
    ExpenseByMerchantCategory(MerchantCategory.dining, 150),
    ExpenseByMerchantCategory(MerchantCategory.rideSharing, 110),
    ExpenseByMerchantCategory(MerchantCategory.tool, 150),
    ExpenseByMerchantCategory(MerchantCategory.trip, 80),
  ];
}

// TODO: make dynamic
List<ExpenseByMonth> getExpensesByMonth() {
  return [
    ExpenseByMonth(
      month: Month.aug,
      tripExpenses: 17,
      toolExpenses: 142,
      rideSharingExpenses: 87,
      diningExpenses: 100,
    ),
    ExpenseByMonth(
      month: Month.sep,
      tripExpenses: 142,
      toolExpenses: 130,
      rideSharingExpenses: 130,
      diningExpenses: 100,
    ),
    ExpenseByMonth(
      month: Month.oct,
      tripExpenses: 100,
      toolExpenses: 87,
      rideSharingExpenses: 130,
      diningExpenses: 100,
    ),
    ExpenseByMonth(
      month: Month.nov,
      tripExpenses: 100,
      toolExpenses: 17,
      rideSharingExpenses: 100,
      diningExpenses: 130,
    ),
    ExpenseByMonth(
      month: Month.dec,
      tripExpenses: 130,
      toolExpenses: 100,
      rideSharingExpenses: 87,
      diningExpenses: 17,
    ),
    ExpenseByMonth(
      month: Month.jan,
      tripExpenses: 150,
      toolExpenses: 120,
      rideSharingExpenses: 10,
      diningExpenses: 80,
    ),
  ];
}
