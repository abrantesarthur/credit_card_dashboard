import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/widgets/header.dart';
import 'package:credit_card_dashboard/widgets/leftPanel.dart';
import 'package:credit_card_dashboard/widgets/overallPadding.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final String routeTitle;
  final Widget child;

  const Layout({
    Key? key,
    required this.routeTitle,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final leftPanelWidth = screenWidth / 8;

    return LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      if (constraints.maxWidth >= 760) {
        return Scaffold(
          body: Container(
            color: AppColors.background,
            alignment: Alignment.topCenter,
            child: OverallPadding(
              child: Column(
                children: [
                  Header(
                    title: routeTitle,
                    leftPanelWidth: leftPanelWidth,
                  ),
                  SizedBox(height: screenHeight / 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LeftPanel(width: leftPanelWidth),
                      child,
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }

      // TODO: fix
      return Container();
    });
  }
}
