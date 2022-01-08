import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/routes/dashboard.dart';
import 'package:credit_card_dashboard/widgets/appButton.dart';
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
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    "images/credit-card.png",
                    height: 150,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                      alignment: Alignment.center,
                      child: AppButton(
                        width: 200,
                        height: 50,
                        iconLeft: Icons.lock_open,
                        textData: "LOCK", // make dynamic
                        onTapCallBack: () {}, // TODO: substitute lock icon
                      )),
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
