import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:credit_card_dashboard/utils.dart';

abstract class ChartData {
  String getXValue();
  num getYValue();
  Color getColor();
}

class DoughnutChart extends StatelessWidget {
  final List<ChartData> chartData;

  const DoughnutChart({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(
        text: "Spending by Merchant Category",
        alignment: ChartAlignment.near,
        textStyle: const TextStyle(
          fontFamily: "Inter",
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
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
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.getXValue(),
          yValueMapper: (ChartData data, _) => data.getYValue(),
          dataLabelSettings: const DataLabelSettings(
            isVisible: false,
          ),
          enableTooltip: true,
          pointColorMapper: (ChartData data, _) => data.getColor(),
        )
      ],
    );
  }
}
