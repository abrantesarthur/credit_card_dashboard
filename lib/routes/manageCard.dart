import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/database/methods.dart';
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
  final CreditCard creditCard = getCreditCard();

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
                      creditCard.maxLimit.getString(signed: false),
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
                              creditCard.creditLimit.getString(
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
                            currentLimit: creditCard.creditLimit,
                            maxLimit: creditCard.maxLimit,
                            onChanged: (val) => setState(() {
                              creditCard.creditLimit = val;
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
        // TODO: activate button only if client modifies alert
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
                          "Manage Alerts",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: screenHeight / 30),
                        AlertSlider(
                          merchantType: MerchantCategory.travel,
                          currentLimit: creditCard.travelLimit,
                          maxLimit: creditCard.maxLimit,
                          onChanged: (val) => setState(() {
                            creditCard.travelLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantCategory.dining,
                          currentLimit: creditCard.diningLimit,
                          maxLimit: creditCard.maxLimit,
                          onChanged: (val) => setState(() {
                            creditCard.diningLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantCategory.rideSharing,
                          currentLimit: creditCard.ridesharingLimit,
                          maxLimit: creditCard.maxLimit,
                          onChanged: (val) => setState(() {
                            creditCard.ridesharingLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantCategory.software,
                          currentLimit: creditCard.softwareLimit,
                          maxLimit: creditCard.maxLimit,
                          onChanged: (val) => setState(() {
                            creditCard.softwareLimit = val;
                          }),
                        ),
                        SizedBox(height: screenHeight / 50),
                        AlertSlider(
                          merchantType: MerchantCategory.news,
                          currentLimit: creditCard.newsLimit,
                          maxLimit: creditCard.maxLimit,
                          onChanged: (val) => setState(() {
                            creditCard.newsLimit = val;
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


// TODO: add subscriptions