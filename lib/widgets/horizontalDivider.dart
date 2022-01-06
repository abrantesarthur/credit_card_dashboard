import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final double height;

  const HorizontalDivider({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: height, color: AppColors.background);
  }
}
