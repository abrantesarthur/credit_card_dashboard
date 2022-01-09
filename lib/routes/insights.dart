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
  late List<ExpensesByMerchantType> _chartData;

  List<ExpensesByMerchantType> getExpensesByMerchant() {
    final chartData = [
      ExpensesByMerchantType(MerchantType.dining, 150),
      ExpensesByMerchantType(MerchantType.rideSharing, 110),
      ExpensesByMerchantType(MerchantType.tool, 150),
      ExpensesByMerchantType(MerchantType.trip, 80),
    ];
    return chartData;
  }

  @override
  void initState() {
    _chartData = getExpensesByMerchant();
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
          child: DoughnutChart(
            title: "Expenses by Merchant Category",
            chartData: _chartData,
          ),
        ),
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

class ExpensesByMerchantType implements ChartData {
  final MerchantType merchantType;
  final double spending;

  ExpensesByMerchantType(this.merchantType, this.spending);

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
