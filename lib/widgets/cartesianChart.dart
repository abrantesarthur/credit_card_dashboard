import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/routes/insights.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:credit_card_dashboard/utils.dart';

class CartesianChart extends StatelessWidget {
  final List<ExpenseByMonth> chartData;

  const CartesianChart({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
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
          dataSource: chartData,
          xValueMapper: (data, _) => data.month.getString(),
          yValueMapper: (data, _) => data.diningExpenses,
          name: MerchantCategory.dining.getString(),
          color: MerchantCategory.dining.getColor(),
        ),
        StackedColumnSeries<ExpenseByMonth, String>(
          dataSource: chartData,
          xValueMapper: (data, _) => data.month.getString(),
          yValueMapper: (data, _) => data.rideSharingExpenses,
          name: MerchantCategory.rideSharing.getString(),
          color: MerchantCategory.rideSharing.getColor(),
        ),
        StackedColumnSeries<ExpenseByMonth, String>(
          dataSource: chartData,
          xValueMapper: (data, _) => data.month.getString(),
          yValueMapper: (data, _) => data.toolExpenses,
          name: MerchantCategory.tool.getString(),
          color: MerchantCategory.tool.getColor(),
        ),
        StackedColumnSeries<ExpenseByMonth, String>(
          dataSource: chartData,
          xValueMapper: (data, _) => data.month.getString(),
          yValueMapper: (data, _) => data.travelExpenses,
          name: MerchantCategory.travel.getString(),
          color: MerchantCategory.travel.getColor(),
        ),
      ],
      primaryXAxis: CategoryAxis(),
    );
  }
}
