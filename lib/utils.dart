import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:flutter/material.dart';

extension CurrencyExtension on double {
  String getString() {
    return (this < 0 ? "+" : "-") + // negative means refund
        "\$" +
        ((this * 100).round() / 100).toString();
  }
}

extension TimestampExtension on int {
  String getDate() {
    DateTime d = DateTime.fromMillisecondsSinceEpoch(this);
    String day = d.day < 10 ? "0" + d.day.toString() : d.day.toString();
    return day + " " + d.month.getMonth();
  }

  String getMonth() {
    switch (this) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }
}

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

  IconData getIcon() {
    switch (this) {
      case MerchantType.dining:
        return Icons.restaurant_menu;
      case MerchantType.rideSharing:
        return Icons.directions_car;
      case MerchantType.tool:
        return Icons.settings;
      case MerchantType.trip:
        return Icons.airplanemode_active;
      default:
        return Icons.turned_in;
    }
  }
}
