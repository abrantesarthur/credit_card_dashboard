import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class DoughnutChartData {
  String getXValue();
  String getLabel();
  num getYValue();
  Color getColor();
}

class DoughnutChart extends StatelessWidget {
  final List<DoughnutChartData> chartData;
  final String title;

  const DoughnutChart({
    Key? key,
    required this.chartData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(
        text: title,
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
        position: LegendPosition.top,
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
        DoughnutSeries<DoughnutChartData, String>(
          dataSource: chartData,
          xValueMapper: (DoughnutChartData data, _) => data.getXValue(),
          yValueMapper: (DoughnutChartData data, _) => data.getYValue(),
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(
              fontFamily: "Inter",
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          dataLabelMapper: (DoughnutChartData data, _) => data.getLabel(),
          enableTooltip: true,
          pointColorMapper: (DoughnutChartData data, _) => data.getColor(),
          animationDuration: 700,
        )
      ],
    );
  }
}
