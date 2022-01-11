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
  bool activateAdjustAlertButton = false;
  double adjustedCreditLimit = 0;
  double adjustedTravelAlert = 0;
  double adjustedDiningAlert = 0;
  double adjustedRidesharingAlert = 0;
  double adjustedSoftwareAlert = 0;
  double adjustedNewsAlert = 0;
  Color appSliderColor = Colors.black;
  bool limitAdjusted = false;
  bool alertsAdjusted = false;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      CreditCardModel ccm = Provider.of<CreditCardModel>(
        context,
        listen: false,
      );
      setState(() {
        adjustedCreditLimit = ccm.creditLimit;
        adjustedTravelAlert = ccm.travelAlert;
        adjustedDiningAlert = ccm.diningAlert;
        adjustedRidesharingAlert = ccm.ridesharingAlert;
        adjustedSoftwareAlert = ccm.softwareAlert;
        adjustedNewsAlert = ccm.newsAlert;
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
                              color: appSliderColor,
                              onChanged: (val) => setState(() {
                                if (val < ccm.calculateBalance()) {
                                  activateAdjustLimitButton = false;
                                  appSliderColor = Colors.red;
                                } else {
                                  activateAdjustLimitButton = true;
                                  appSliderColor = Colors.black;
                                }
                                limitAdjusted = false;
                                adjustedCreditLimit = val;
                              }),
                            ),
                          ),
                          SizedBox(width: screenWidth / 20),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight / 25,
                        child: appSliderColor == Colors.red
                            ? const Text(
                                "Current limit must be above current balance!",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            : Container(),
                      ),
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
                          onTapCallBack: activateAdjustLimitButton
                              ? () {
                                  setState(() {
                                    ccm.creditLimit = adjustedCreditLimit;
                                    if (ccm.creditLimit < ccm.diningAlert) {
                                      ccm.diningAlert = ccm.creditLimit;
                                      adjustedDiningAlert = ccm.creditLimit;
                                    }
                                    if (ccm.creditLimit < ccm.travelAlert) {
                                      ccm.travelAlert = ccm.creditLimit;
                                      adjustedTravelAlert = ccm.creditLimit;
                                    }
                                    if (ccm.creditLimit <
                                        ccm.ridesharingAlert) {
                                      ccm.ridesharingAlert = ccm.creditLimit;
                                      adjustedRidesharingAlert =
                                          ccm.creditLimit;
                                    }
                                    if (ccm.creditLimit < ccm.newsAlert) {
                                      ccm.newsAlert = ccm.creditLimit;
                                      adjustedNewsAlert = ccm.creditLimit;
                                    }
                                    if (ccm.creditLimit < ccm.softwareAlert) {
                                      ccm.softwareAlert = ccm.creditLimit;
                                      adjustedSoftwareAlert = ccm.creditLimit;
                                    }
                                    activateAdjustLimitButton = false;
                                    limitAdjusted = true;
                                  });
                                }
                              : () {},
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 25,
                        child: limitAdjusted
                            ? const Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "Current limit adjusted successfully!",
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            : Container(),
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
                            currentLimit: adjustedTravelAlert,
                            maxLimit: ccm.creditLimit,
                            onChanged: (val) => setState(() {
                              adjustedTravelAlert = val;
                              activateAdjustAlertButton = true;
                              alertsAdjusted = false;
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AlertSlider(
                            merchantType: MerchantCategory.dining,
                            currentLimit: adjustedDiningAlert,
                            maxLimit: ccm.creditLimit,
                            onChanged: (val) => setState(() {
                              adjustedDiningAlert = val;
                              activateAdjustAlertButton = true;
                              alertsAdjusted = false;
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AlertSlider(
                            merchantType: MerchantCategory.rideSharing,
                            currentLimit: adjustedRidesharingAlert,
                            maxLimit: ccm.creditLimit,
                            onChanged: (val) => setState(() {
                              adjustedRidesharingAlert = val;
                              activateAdjustAlertButton = true;
                              alertsAdjusted = false;
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AlertSlider(
                            merchantType: MerchantCategory.software,
                            currentLimit: adjustedSoftwareAlert,
                            maxLimit: ccm.creditLimit,
                            onChanged: (val) => setState(() {
                              adjustedSoftwareAlert = val;
                              activateAdjustAlertButton = true;
                              alertsAdjusted = false;
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AlertSlider(
                            merchantType: MerchantCategory.news,
                            currentLimit: adjustedNewsAlert,
                            maxLimit: ccm.creditLimit,
                            onChanged: (val) => setState(() {
                              adjustedNewsAlert = val;
                              activateAdjustAlertButton = true;
                              alertsAdjusted = false;
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight / 25),
                        Consumer<CreditCardModel>(
                          builder: (context, ccm, _) => AppButton(
                            width: 200,
                            height: 50,
                            textData: "Set",
                            buttonColor: activateAdjustAlertButton
                                ? AppColors.orange
                                : AppColors.gray,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            onTapCallBack: () {
                              ccm.travelAlert = adjustedTravelAlert;
                              ccm.diningAlert = adjustedDiningAlert;
                              ccm.newsAlert = adjustedNewsAlert;
                              ccm.softwareAlert = adjustedSoftwareAlert;
                              ccm.ridesharingAlert = adjustedRidesharingAlert;
                              activateAdjustAlertButton = false;
                              alertsAdjusted = true;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          height: screenHeight / 25,
                          child: alertsAdjusted
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "Alerts adjusted successfully!",
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                )
                              : Container(),
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
          child: Consumer<CreditCardModel>(
            builder: (context, ccm, _) => AppButton(
              width: 250,
              height: 50,
              iconLeft: Icons.lock_open,
              textData: "LOCK CARD", // make dynamic
              onTapCallBack: () {},
            ),
          ),
        ),
        SizedBox(height: screenHeight / 10),
      ],
    );
  }
}


// TODO: add subscriptions