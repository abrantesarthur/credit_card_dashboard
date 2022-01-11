import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';

class LabelAndValue extends StatelessWidget {
  final String label;
  final double value;
  const LabelAndValue({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Average",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: screenWidth / 50),
        Text(
          "\$" + value.toString().addCommas(),
          style: const TextStyle(
            fontFamily: "Inter",
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
