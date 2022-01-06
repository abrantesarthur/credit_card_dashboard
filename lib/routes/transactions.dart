import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/widgets/overallPadding.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  static String routeName = "/transactions";

  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    children: const [
                      Text("LOGO HERE"),
                      Text("Page Title Here"),
                    ],
                  ),
                  Column(
                    children: const [
                      Text("Transactions"),
                    ],
                  ),
                  Column(
                    children: const [
                      Text("Transactions"),
                    ],
                  ),
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
