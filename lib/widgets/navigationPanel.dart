import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/routes/dashboard.dart';
import 'package:flutter/material.dart';

class NavigationPanel extends StatelessWidget {
  final void Function(DashboardPage) onPageChange;
  final DashboardPage currentPage;

  const NavigationPanel({
    Key? key,
    required this.onPageChange,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => onPageChange(DashboardPage.transactions),
          child: Text(
            "Transactions",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: currentPage == DashboardPage.transactions
                  ? Colors.black
                  : AppColors.gray,
            ),
          ),
        ),
        SizedBox(height: screenHeight / 100),
        InkWell(
          onTap: () => onPageChange(DashboardPage.manageCard),
          child: Text(
            "Manage Card",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: currentPage == DashboardPage.manageCard
                  ? Colors.black
                  : AppColors.gray,
            ),
          ),
        ),
        SizedBox(height: screenHeight / 100),
        InkWell(
          onTap: () => onPageChange(DashboardPage.insights),
          child: Text(
            "Insights",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: currentPage == DashboardPage.insights
                  ? Colors.black
                  : AppColors.gray,
            ),
          ),
        ),
      ],
    );
  }
}
