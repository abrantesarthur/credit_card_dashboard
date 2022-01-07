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
                    title: routeTitle,
                    leftFlex: leftFlex,
                    rightFlex: rightFlex,
                  ),
                  SizedBox(height: screenHeight / 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: leftFlex,
                        child: LeftPanel(),
                      ),
                      Expanded(flex: rightFlex, child: child),
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
