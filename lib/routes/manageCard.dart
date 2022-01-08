import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/utils.dart';
import 'package:credit_card_dashboard/widgets/alertSlider.dart';
import 'package:credit_card_dashboard/widgets/appButton.dart';
import 'package:credit_card_dashboard/widgets/appSlider.dart';
import 'package:flutter/material.dart';

class ManageCard extends StatefulWidget {
  const ManageCard({Key? key}) : super(key: key);

  @override
  ManageCardState createState() => ManageCardState();
}

class ManageCardState extends State<ManageCard> {
  double currentLimit = 7000; // TODO: starts dynamic
  double maxLimit = 12000; // TODO: make dynamic
  double tripLimit = 1000;
  double toolLimit = 4000;
  double diningLimit = 1000;
  double ridesharingLimit = 1000;

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
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight / 25),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Credit Limit",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: screenHeight / 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenWidth / 18,
                              child: Text(
                                currentLimit.getString(
                                  signed: false,
                                  rounded: true,
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth / 30),
                            AppSlider(
                              currentLimit: currentLimit,
                              maxLimit: maxLimit,
                              onChanged: (val) => setState(() {
                                currentLimit = val;
                              }),
                            ),
                            SizedBox(width: screenWidth / 20),
                          ],
                        ),
                        SizedBox(height: screenHeight / 50),
                        // TODO: only show if user uses slider
                        AppButton(
                          textData: "Adjust",
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          width: 100,
                          height: 40,
                          onTapCallBack: () {},
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: AppButton(
                      width: 200,
                      height: 50,
                      textData: "Request Limit Increase",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      onTapCallBack: () {}, // TODO: display popup
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight / 25),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Alerts",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: screenHeight / 30),
                        AlertSlider(
                          merchantType: MerchantType.trip,
                          currentLimit: tripLimit,
                          maxLimit: maxLimit,
                          onChanged: (val) => setState(() {
                            tripLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantType.dining,
                          currentLimit: diningLimit,
                          maxLimit: maxLimit,
                          onChanged: (val) => setState(() {
                            diningLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantType.rideSharing,
                          currentLimit: ridesharingLimit,
                          maxLimit: maxLimit,
                          onChanged: (val) => setState(() {
                            ridesharingLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantType.tool,
                          currentLimit: toolLimit,
                          maxLimit: maxLimit,
                          onChanged: (val) => setState(() {
                            toolLimit = val;
                          }),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: AppButton(
                      width: 200,
                      height: 50,
                      textData: "Adjust",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      onTapCallBack: () {}, // TODO: display popup
                    ),
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
