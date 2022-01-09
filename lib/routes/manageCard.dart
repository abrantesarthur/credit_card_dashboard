import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/utils.dart';
import 'package:credit_card_dashboard/widgets/alertSlider.dart';
import 'package:credit_card_dashboard/widgets/appButton.dart';
import 'package:credit_card_dashboard/widgets/appSlider.dart';
import 'package:flutter/material.dart';

// TODO: add range on top of alerts
// TODO: move credit limit to the top!
class ManageCard extends StatefulWidget {
  const ManageCard({Key? key}) : super(key: key);

  @override
  ManageCardState createState() => ManageCardState();
}

class ManageCardState extends State<ManageCard> {
  double currentLimit = 7000; // TODO: starts dynamic
  double maxLimit = 12000; // TODO: make dynamic
  double travelLimit = 1000;
  double softwareLimit = 4000;
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Credit Limit",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      maxLimit.getString(signed: false),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(height: screenHeight / 25),
                    AppButton(
                      width: 200,
                      height: 50,
                      textData: "Request Increase",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      onTapCallBack: () {}, // TODO: display popup
                    ),
                  ],
                ),
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
                        "Adjust Current Limit",
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
                      SizedBox(height: screenHeight / 25),
                      AppButton(
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
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
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
                          "Set Alerts",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: screenHeight / 30),
                        AlertSlider(
                          merchantType: MerchantCategory.travel,
                          currentLimit: travelLimit,
                          maxLimit: maxLimit,
                          onChanged: (val) => setState(() {
                            travelLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantCategory.dining,
                          currentLimit: diningLimit,
                          maxLimit: maxLimit,
                          onChanged: (val) => setState(() {
                            diningLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantCategory.rideSharing,
                          currentLimit: ridesharingLimit,
                          maxLimit: maxLimit,
                          onChanged: (val) => setState(() {
                            ridesharingLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantCategory.software,
                          currentLimit: softwareLimit,
                          maxLimit: maxLimit,
                          onChanged: (val) => setState(() {
                            softwareLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 25),
                        AppButton(
                          width: 200,
                          height: 50,
                          textData: "Set",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          onTapCallBack: () {}, // TODO: display popup
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight / 5),
        Align(
          alignment: Alignment.center,
          child: AppButton(
            width: 250,
            height: 50,
            iconLeft: Icons.lock_open,
            textData: "LOCK CARD", // make dynamic
            onTapCallBack: () {}, // TODO: substitute lock icon
          ),
        ),
        SizedBox(height: screenHeight / 10),
      ],
    );
  }
}
