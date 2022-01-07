import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:flutter/material.dart';

Color getMerchantColor(MerchantType? t) {
  switch (t) {
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
