import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/routes/insights.dart';
import 'package:credit_card_dashboard/routes/manageCard.dart';
import 'package:credit_card_dashboard/routes/transactions.dart';
import 'package:credit_card_dashboard/widgets/header.dart';
import 'package:credit_card_dashboard/widgets/navigationPanel.dart';
import 'package:credit_card_dashboard/widgets/overallPadding.dart';
import 'package:flutter/material.dart';

enum DashboardPage { transactions, manageCard, insights }

extension DashboardPageExtension on DashboardPage {
  String getTitle() {
    switch (this) {
      case DashboardPage.transactions:
        return "Transactions";
      case DashboardPage.manageCard:
        return "Manage Card";
      case DashboardPage.insights:
        return "Insights";
    }
  }
}

class Dashboard extends StatefulWidget {
  static String routeName = "/dashboard";

  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late DashboardPage currentPage;

  @override
  void initState() {
    currentPage = DashboardPage.insights;
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
                    title: currentPage.getTitle(),
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
                        child: NavigationPanel(
                          currentPage: currentPage,
                          onPageChange: (DashboardPage page) => setState(() {
                            currentPage = page;
                          }),
                        ),
                      ),
                      Expanded(
                        flex: rightFlex,
                        child: Container(
                          height: screenHeight / 1.2,
                          child: SingleChildScrollView(
                            child: currentPage == DashboardPage.transactions
                                ? Transactions()
                                : currentPage == DashboardPage.manageCard
                                    ? const ManageCard()
                                    : const Insights(),
                          ),
                        ),
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
