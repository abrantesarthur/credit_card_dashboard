import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:flutter/material.dart';

extension MTExtension on MerchantType {
  Color getColor() {
    switch (this) {
      case MerchantType.dining:
        return AppColors.diningColor;
      case MerchantType.rideSharing:
        return AppColors.ridesharingColor;
      case MerchantType.tool:
        return AppColors.toolColor;
      case MerchantType.trip:
        return AppColors.tripColor;
      default:
        return Colors.black;
    }
  }
}
