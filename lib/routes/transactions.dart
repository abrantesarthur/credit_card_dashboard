import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/widgets/header.dart';
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
                  const Header(title: "Transactions"),
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
