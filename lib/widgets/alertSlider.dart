import 'package:credit_card_dashboard/utils.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/widgets/appSlider.dart';
import 'package:flutter/material.dart';

class AlertSlider extends StatelessWidget {
  final double currentLimit;
  final double maxLimit;
  final void Function(double) onChanged;

  const AlertSlider({
    Key? key,
    required this.currentLimit,
    required this.maxLimit,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: screenWidth / 18,
          child: Row(
            children: [
              Icon(
                Icons.airplanemode_active,
                size: 20,
                color: MerchantType.trip.getColor(),
              ),
              const SizedBox(width: 10),
              const Text(
                "Travel",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: screenWidth / 30),
        AppSlider(
          currentLimit: currentLimit,
          maxLimit: maxLimit,
          onChanged: onChanged,
          color: MerchantType.trip.getColor(),
        ),
        SizedBox(width: screenWidth / 200),
        Text(
          currentLimit.getString(
            signed: false,
            rounded: true,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
