import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/widgets/doughnutChart.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';

class Insights extends StatefulWidget {
  const Insights({Key? key}) : super(key: key);

  @override
  InsightsState createState() => InsightsState();
}

class InsightsState extends State<Insights> {
  late List<SpendingByMerchantType> _chartData;

  List<SpendingByMerchantType> getChartData() {
    final chartData = [
      SpendingByMerchantType(MerchantType.dining, 150),
      SpendingByMerchantType(MerchantType.rideSharing, 110),
      SpendingByMerchantType(MerchantType.tool, 150),
      SpendingByMerchantType(MerchantType.trip, 80),
    ];
    return chartData;
  }

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
            color: Colors.white,
            height: 500,
            child: DoughnutChart(chartData: _chartData)),
        SizedBox(height: screenHeight / 25),
        Container(
          color: Colors.white,
          child: Column(
            children: [],
          ),
        ),
      ],
    );
  }
}

class SpendingByMerchantType implements ChartData {
  final MerchantType merchantType;
  final double spending;

  SpendingByMerchantType(this.merchantType, this.spending);

  @override
  String getXValue() {
    return merchantType.getString();
  }

  @override
  double getYValue() {
    return spending;
  }

  @override
  Color getColor() {
    return merchantType.getColor();
  }
}
