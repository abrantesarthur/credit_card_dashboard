import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/widgets/horizontalBar.dart';
import 'package:credit_card_dashboard/widgets/horizontalDivider.dart';
import 'package:credit_card_dashboard/widgets/layout.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  static String routeName = "/transactions";

  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Layout(
      routeTitle: "Transactions",
      child: Column(
        children: [
          Container(
            height: 150,
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Current Balance",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "\$4,000,000",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: screenWidth / 100),
                              const Text(
                                "Available \$123,456",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const HorizontalBar(fill: 0.5, width: 300),
                        ],
                      ),
                    ),
                  ),
                  const HorizontalDivider(height: 100),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Current Statement",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "June 12 - June 13",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const HorizontalDivider(height: 100),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Points Earned",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "43,000",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "View Details",
                                style: TextStyle(
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_right_alt_rounded,
                                color: AppColors.orange,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          SizedBox(height: screenHeight / 25),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
