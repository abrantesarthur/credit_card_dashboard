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
  late List<ExpensesByMerchantCategory> _chartData;

  List<ExpensesByMerchantCategory> getExpensesByMerchantCategory() {
    final chartData = [
      ExpensesByMerchantCategory(MerchantCategory.dining, 150),
      ExpensesByMerchantCategory(MerchantCategory.rideSharing, 110),
      ExpensesByMerchantCategory(MerchantCategory.tool, 150),
      ExpensesByMerchantCategory(MerchantCategory.trip, 80),
    ];
    return chartData;
  }

  @override
  void initState() {
    _chartData = getExpensesByMerchantCategory();
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

class ExpensesByMerchantCategory implements ChartData {
  final MerchantCategory merchantType;
  final double spending;

  ExpensesByMerchantCategory(this.merchantType, this.spending);

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
