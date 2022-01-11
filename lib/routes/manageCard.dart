import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/database/methods.dart';
import 'package:credit_card_dashboard/models/creditCard.dart';
import 'package:credit_card_dashboard/utils.dart';
import 'package:credit_card_dashboard/widgets/alertSlider.dart';
import 'package:credit_card_dashboard/widgets/appButton.dart';
import 'package:credit_card_dashboard/widgets/appSlider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageCard extends StatefulWidget {
  const ManageCard({Key? key}) : super(key: key);

  @override
  ManageCardState createState() => ManageCardState();
}

class ManageCardState extends State<ManageCard> {
  bool activateAdjustLimitButton = false;
  double adjustedCreditLimit = 0;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      CreditCardModel ccm = Provider.of<CreditCardModel>(
        context,
        listen: false,
      );
      setState(() {
        adjustedCreditLimit = ccm.creditLimit;
      });
    });
    super.initState();
  }

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
                    Consumer<CreditCardModel>(
                      builder: (context, ccm, _) {
                        return Text(
                          ccm.maxLimit.getString(signed: false),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 36,
                          ),
                        );
                      },
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
                            child: Consumer<CreditCardModel>(
                              builder: (context, ccm, _) => Text(
                                adjustedCreditLimit.getString(
                                  signed: false,
                                  rounded: true,
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth / 30),
                          Consumer<CreditCardModel>(
                            builder: (context, ccm, _) => AppSlider(
                              currentLimit: adjustedCreditLimit,
                              maxLimit: ccm.maxLimit,
                              onChanged: (val) => setState(() {
                                activateAdjustLimitButton = true;
                                adjustedCreditLimit = val;
                              }),
                            ),
                          ),
                          SizedBox(width: screenWidth / 20),
                        ],
                      ),
                      SizedBox(height: screenHeight / 25),
                      Consumer<CreditCardModel>(
                        builder: (context, ccm, _) => AppButton(
                          width: 200,
                          height: 50,
                          textData: "Adjust",
                          buttonColor: activateAdjustLimitButton
                              ? AppColors.orange
                              : AppColors.gray,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          onTapCallBack: () {
                            ccm.creditLimit = adjustedCreditLimit;
                          },
                        ),
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
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AlertSlider(
                            merchantType: MerchantCategory.travel,
                            currentLimit: ccm.travelLimit,
                            maxLimit: ccm.maxLimit,
                            onChanged: (val) => setState(() {
                              ccm.travelLimit = val;
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AlertSlider(
                            merchantType: MerchantCategory.dining,
                            currentLimit: ccm.diningLimit,
                            maxLimit: ccm.maxLimit,
                            onChanged: (val) => setState(() {
                              ccm.diningLimit = val;
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AlertSlider(
                            merchantType: MerchantCategory.rideSharing,
                            currentLimit: ccm.ridesharingLimit,
                            maxLimit: ccm.maxLimit,
                            onChanged: (val) => setState(() {
                              ccm.ridesharingLimit = val;
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AlertSlider(
                            merchantType: MerchantCategory.software,
                            currentLimit: ccm.softwareLimit,
                            maxLimit: ccm.maxLimit,
                            onChanged: (val) => setState(() {
                              ccm.softwareLimit = val;
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AlertSlider(
                            merchantType: MerchantCategory.news,
                            currentLimit: ccm.newsLimit,
                            maxLimit: ccm.maxLimit,
                            onChanged: (val) => setState(() {
                              ccm.newsLimit = val;
                            }),
                          ),
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