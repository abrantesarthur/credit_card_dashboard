import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class HorizontalBar extends StatelessWidget {
  final double fill;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;

  const HorizontalBar({
    Key? key,
    required this.fill,
    this.width,
    this.height,
    this.color,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color ?? AppColors.orange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius ?? 0),
              bottomLeft: Radius.circular(radius ?? 0),
            ),
          ),
          height: height ?? screenHeight / 100,
          width: fill > 1
              ? (width ?? screenWidth / 2)
              : fill < 0
                  ? 0
                  : fill * (width ?? screenWidth / 2),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.15),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius ?? 0),
              bottomRight: Radius.circular(radius ?? 0),
            ),
          ),
          height: height ?? screenHeight / 100,
          width: fill > 1
              ? 0
              : fill < 0
                  ? (width ?? screenWidth / 2)
                  : (1 - fill) * (width ?? screenWidth / 2),
        ),
      ],
    );
  }
}
