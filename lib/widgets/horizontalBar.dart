import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class HorizontalBar extends StatelessWidget {
  final double fill;
  final double? width;

  const HorizontalBar({
    Key? key,
    required this.fill,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: screenHeight / 100,
          width: fill > 1
              ? (width ?? screenWidth / 2)
              : fill < 0
                  ? 0
                  : fill * (width ?? screenWidth / 2),
          color: AppColors.orange,
        ),
        Container(
          height: screenHeight / 100,
          width: fill > 1
              ? 0
              : fill < 0
                  ? (width ?? screenWidth / 2)
                  : (1 - fill) * (width ?? screenWidth / 2),
          color: Colors.black.withOpacity(0.15),
        ),
      ],
    );
  }
}
