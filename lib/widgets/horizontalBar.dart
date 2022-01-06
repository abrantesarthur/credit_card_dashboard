import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class HorizontalBar extends StatelessWidget {
  final String? leftText;
  final Widget? leftWidget;
  final String rightText;
  final double fill;
  final double? centerWidth;
  final int? leftFlex;
  final int? rightFlex;

  const HorizontalBar({
    Key? key,
    required this.rightText,
    required this.fill,
    this.leftText,
    this.leftWidget,
    this.centerWidth,
    this.leftFlex,
    this.rightFlex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          flex: leftFlex ?? 1,
          child: leftWidget ??
              Text(
                leftText ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
        Container(
          height: screenHeight / 100,
          width: fill > 1
              ? (centerWidth ?? screenWidth / 2)
              : fill < 0
                  ? 0
                  : fill * (centerWidth ?? screenWidth / 2),
          color: AppColors.orange,
        ),
        Container(
          height: screenHeight / 100,
          width: fill > 1
              ? 0
              : fill < 0
                  ? (centerWidth ?? screenWidth / 2)
                  : (1 - fill) * (centerWidth ?? screenWidth / 2),
          color: Colors.black.withOpacity(0.15),
        ),
        Expanded(
          flex: rightFlex ?? 1,
          child: Text(
            rightText,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
