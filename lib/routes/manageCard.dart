import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/routes/dashboard.dart';
import 'package:flutter/material.dart';

class ManageCard extends StatelessWidget {
  const ManageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: 200, // TODO: take it out
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    "images/credit-card.png",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight / 25),
        Container(
          height: 200, // TODO: take it out
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight / 25),
        Container(
          height: 200, // TODO: take it out
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
