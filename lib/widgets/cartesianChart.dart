import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:credit_card_dashboard/utils.dart';

class CartesianChartData {
  final String label;
  final num diningExpenses;
  final num ridesharingExpenses;
  final num travelExpenses;
  final num newsExpenses;
  final num softwareExpenses;

  CartesianChartData({
    required this.label,
    required this.diningExpenses,
    required this.ridesharingExpenses,
    required this.travelExpenses,
    required this.newsExpenses,
    required this.softwareExpenses,
  });
}

class CartesianChart extends StatelessWidget {
  final List<CartesianChartData> chartData;

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
        StackedColumnSeries<CartesianChartData, String>(
          dataSource: chartData,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => data.diningExpenses,
          name: MerchantCategory.dining.getString(),
          color: MerchantCategory.dining.getColor(),
        ),
        StackedColumnSeries<CartesianChartData, String>(
          dataSource: chartData,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => data.ridesharingExpenses,
          name: MerchantCategory.rideSharing.getString(),
          color: MerchantCategory.rideSharing.getColor(),
        ),
        StackedColumnSeries<CartesianChartData, String>(
          dataSource: chartData,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => data.softwareExpenses,
          name: MerchantCategory.software.getString(),
          color: MerchantCategory.software.getColor(),
        ),
        StackedColumnSeries<CartesianChartData, String>(
          dataSource: chartData,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => data.travelExpenses,
          name: MerchantCategory.travel.getString(),
          color: MerchantCategory.travel.getColor(),
        ),
        StackedColumnSeries<CartesianChartData, String>(
          dataSource: chartData,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => data.newsExpenses,
          name: MerchantCategory.news.getString(),
          color: MerchantCategory.news.getColor(),
        ),
      ],
      primaryXAxis: CategoryAxis(),
    );
  }
}
