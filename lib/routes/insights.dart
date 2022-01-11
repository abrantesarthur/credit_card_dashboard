import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/data.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/models/creditCard.dart';
import 'package:credit_card_dashboard/widgets/cartesianChart.dart';
import 'package:credit_card_dashboard/widgets/doughnutChart.dart';
import 'package:credit_card_dashboard/widgets/labelAndValue.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';
import 'package:provider/provider.dart';

class Insights extends StatefulWidget {
  const Insights({Key? key}) : super(key: key);

  @override
  InsightsState createState() => InsightsState();
}

class InsightsState extends State<Insights> {
  late List<ExpenseByMerchantCategory> _doughnutChartData = [];
  late List<CartesianChartData> _cartesianChartData = [];
  late CartesianPeriod cartesianPeriod = CartesianPeriod.months;
  late DoughnutPeriod doughnutPeriod = DoughnutPeriod.thisMonth;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _doughnutChartData = getExpensesByMerchantCategory(
          context: context,
          period: doughnutPeriod,
        );
        _cartesianChartData = getExpensesBy(
          context: context,
          period: cartesianPeriod,
        );
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    CreditCardModel creditCardModel = Provider.of<CreditCardModel>(
      context,
      listen: false,
    );

    return Column(
      children: [
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
                        flex: 2,
                        child: DoughnutChart(
                          title: "Expenses by Merchant Category",
                          chartData: _doughnutChartData,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: Container()),
                              Expanded(
                                flex: 2,
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<DoughnutPeriod>(
                                        value: doughnutPeriod,
                                        onChanged: (value) {
                                          setState(() {
                                            doughnutPeriod = value ??
                                                DoughnutPeriod.thisMonth;
                                            _doughnutChartData =
                                                getExpensesByMerchantCategory(
                                              context: context,
                                              period: doughnutPeriod,
                                            );
                                          });
                                        },
                                        items: DoughnutPeriod.values
                                            .map(
                                              (p) => DropdownMenuItem(
                                                child: Text(
                                                  p.getString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                value: p,
                                              ),
                                            )
                                            .toList()),
                                  ),
                                ),
                              ),
                              Expanded(flex: 1, child: Container()),
                            ],
                          ))
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
          height: screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Expenses " + cartesianPeriod.getString(),
                  style: const TextStyle(
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
                        child: CartesianChart(
                          chartData: _cartesianChartData,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 2,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<CartesianPeriod>(
                                      value: cartesianPeriod,
                                      onChanged: (value) {
                                        setState(() {
                                          cartesianPeriod =
                                              value ?? CartesianPeriod.months;
                                          _cartesianChartData = getExpensesBy(
                                            context: context,
                                            period: cartesianPeriod,
                                          );
                                        });
                                      },
                                      items: CartesianPeriod.values
                                          .map(
                                            (p) => DropdownMenuItem(
                                              child: Text(
                                                p.getString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              value: p,
                                            ),
                                          )
                                          .toList()),
                                ),
                              ),
                            ),
                            Expanded(flex: 1, child: Container()),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: screenHeight / 25),
                LabelAndValue(
                  label: "Expected Average",
                  value:
                      creditCardModel.calculateExpectedAverage(cartesianPeriod),
                ),
                SizedBox(height: screenHeight / 25),
                LabelAndValue(
                  label: "Actual Average",
                  value: getAverage(_cartesianChartData),
                ),
                cartesianPeriod == CartesianPeriod.days
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight / 25),
                          LabelAndValue(
                            label: "Target Average",
                            value: creditCardModel.calculateTargetAverage(),
                          ),
                          SizedBox(height: screenHeight / 25),
                          LabelAndValue(
                            label: "Days of Balance Left",
                            value: getAverage(_cartesianChartData),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// AVERAGE EXPENSES
// TARGET EXPENSES
// DAYS LEFT

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
    return spending.getString(signed: false, rounded: true).addCommas();
  }

  @override
  Color getColor() {
    return merchantType.getColor();
  }
}

List<ExpenseByMerchantCategory> getExpensesByMerchantCategory({
  required BuildContext context,
  DoughnutPeriod period = DoughnutPeriod.thisMonth,
}) {
  CreditCardModel ccm = Provider.of<CreditCardModel>(context, listen: false);

  return MerchantCategory.values
      .where((m) => m != MerchantCategory.generic)
      .map(
        (merchant) => ExpenseByMerchantCategory(
          merchant,
          ccm.getExpenseByMerchant(
            merchantCategory: merchant,
            startTs: period.getStartTimestamp(),
            endTs: period.getEndTimestamp(),
          ),
        ),
      )
      .toList();
}

double getAverage(List<CartesianChartData> chartData) {
  if (chartData.isEmpty) return 0;

  double expenses = 0;
  int count = 0;
  for (var d in chartData) {
    expenses += d.diningExpenses;
    expenses += d.newsExpenses;
    expenses += d.ridesharingExpenses;
    expenses += d.softwareExpenses;
    expenses += d.travelExpenses;
    count += 1;
  }

  return ((expenses / count) * 100).round() / 100;
}

// return expenses by category from November to April
List<CartesianChartData> getExpensesBy({
  required BuildContext context,
  required CartesianPeriod period,
}) {
  CreditCardModel ccm = Provider.of<CreditCardModel>(context, listen: false);

  if (period == CartesianPeriod.weeks) {
    return [
      [
        DateTime(2022, 3, 25),
        DateTime(2022, 3, 31),
      ],
      [
        DateTime(2022, 3, 31),
        DateTime(2022, 4, 7),
      ],
      [
        DateTime(2022, 4, 7),
        DateTime(2022, 4, 14),
      ],
      [
        DateTime(2022, 4, 14),
        DateTime(2022, 4, 21),
      ],
      [
        DateTime(2022, 4, 21),
        DateTime(2022, 4, 28),
      ],
    ]
        .map(
          (dates) => CartesianChartData(
            label: dates[0].month.toString() +
                "/" +
                dates[0].day.toString() +
                " to " +
                dates[1].month.toString() +
                "/" +
                dates[1].day.toString(),
            // label: DateFormat("EEEE").format(date),
            travelExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.travel,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            softwareExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.software,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            ridesharingExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.rideSharing,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            diningExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.dining,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            newsExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.news,
              startTs: dates[0].millisecondsSinceEpoch,
              endTs: dates[1].millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
          ),
        )
        .toList();
  } else if (period == CartesianPeriod.days) {
    return [
      DateTime(2022, 4, 9),
      DateTime(2022, 4, 10),
      DateTime(2022, 4, 11),
      DateTime(2022, 4, 12),
      DateTime(2022, 4, 13),
      DateTime(2022, 4, 14),
      DateTime(2022, 4, 15),
    ]
        .map(
          (date) => CartesianChartData(
            label: date.month.toString() + "/" + date.day.toString(),
            // label: DateFormat("EEEE").format(date),
            travelExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.travel,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            softwareExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.software,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            ridesharingExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.rideSharing,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            diningExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.dining,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
            newsExpenses: ccm.getExpenseByMerchant(
              merchantCategory: MerchantCategory.news,
              startTs: date.millisecondsSinceEpoch,
              endTs: date.millisecondsSinceEpoch + 24 * 60 * 60 * 1000,
            ),
          ),
        )
        .toList();
  } else if (period == CartesianPeriod.months) {
    return Month.values
        .where((month) => (month == Month.jan ||
            month == Month.feb ||
            month == Month.mar ||
            month == Month.apr))
        .map((m) {
      return CartesianChartData(
        label: m.getString(),
        travelExpenses: ccm.getExpenseByMerchant(
          merchantCategory: MerchantCategory.travel,
          startTs: m.getStartTimestamp(),
          endTs: m.getEndTimestamp(),
        ),
        softwareExpenses: ccm.getExpenseByMerchant(
          merchantCategory: MerchantCategory.software,
          startTs: m.getStartTimestamp(),
          endTs: m.getEndTimestamp(),
        ),
        ridesharingExpenses: ccm.getExpenseByMerchant(
          merchantCategory: MerchantCategory.rideSharing,
          startTs: m.getStartTimestamp(),
          endTs: m.getEndTimestamp(),
        ),
        diningExpenses: ccm.getExpenseByMerchant(
          merchantCategory: MerchantCategory.dining,
          startTs: m.getStartTimestamp(),
          endTs: m.getEndTimestamp(),
        ),
        newsExpenses: ccm.getExpenseByMerchant(
          merchantCategory: MerchantCategory.news,
          startTs: m.getStartTimestamp(),
          endTs: m.getEndTimestamp(),
        ),
      );
    }).toList();
  }

  return [];
}
