import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/routes/transactions.dart';
import 'package:credit_card_dashboard/widgets/header.dart';
import 'package:credit_card_dashboard/widgets/leftPanel.dart';
import 'package:credit_card_dashboard/widgets/overallPadding.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "/dashboard";

  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const int leftFlex = 1;
    const int rightFlex = 6;

    return LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      // desktop
      if (constraints.maxWidth >= 760) {
        return Scaffold(
          body: Container(
            color: AppColors.background,
            alignment: Alignment.topCenter,
            child: OverallPadding(
              child: Column(
                children: [
                  Header(
                    title: currentIndex == 0 ? "Transactions" : "not",
                    leftFlex: leftFlex,
                    rightFlex: rightFlex,
                  ),
                  SizedBox(height: screenHeight / 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: leftFlex,
                        child: LeftPanel(
                          onIndexChanged: (int index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: rightFlex,
                        child: currentIndex == 0
                            ? const Transactions()
                            : Container(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }

      return Container();
    });
  }
}
