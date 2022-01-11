import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';

class LabelAndValue extends StatelessWidget {
  final String label;
  final double value;
  const LabelAndValue({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        SizedBox(height: screenHeight / 100),
        Padding(
          padding: EdgeInsets.only(left: screenWidth / 50),
          child: Text(
            "\$" + value.toString().addCommas(),
            style: const TextStyle(
              fontFamily: "Inter",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
