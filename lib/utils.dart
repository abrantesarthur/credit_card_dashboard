import 'package:credit_card_dashboard/colors.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:flutter/material.dart';

extension CurrencyExtension on double {
  String getString({
    bool signed = true,
    bool rounded = false,
  }) {
    return (signed ? (this < 0 ? "+" : "-") : "") + // negative means refund
        "\$" +
        (rounded
            ? (round().toString())
            : ((this * 100).round() / 100).toString());
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

extension MTExtension on MerchantCategory {
  Color getColor() {
    switch (this) {
      case MerchantCategory.dining:
        return AppColors.diningColor;
      case MerchantCategory.rideSharing:
        return AppColors.ridesharingColor;
      case MerchantCategory.tool:
        return AppColors.toolColor;
      case MerchantCategory.travel:
        return AppColors.travelColor;
      default:
        return Colors.black;
    }
  }

  String getString() {
    switch (this) {
      case MerchantCategory.dining:
        return "Dining";
      case MerchantCategory.rideSharing:
        return "Ridesharing";
      case MerchantCategory.tool:
        return "Tools";
      case MerchantCategory.travel:
        return "Travel";
      default:
        return "";
    }
  }

  IconData getIcon() {
    switch (this) {
      case MerchantCategory.dining:
        return Icons.restaurant_menu;
      case MerchantCategory.rideSharing:
        return Icons.directions_car;
      case MerchantCategory.tool:
        return Icons.settings;
      case MerchantCategory.travel:
        return Icons.airplanemode_active;
      default:
        return Icons.turned_in;
    }
  }
}

enum Month { jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec }

extension MonthExtension on Month {
  String getString() {
    switch (this) {
      case Month.jan:
        return "January";
      case Month.feb:
        return "Frebruary";
      case Month.mar:
        return "March";
      case Month.apr:
        return "April";
      case Month.may:
        return "May";
      case Month.jun:
        return "June";
      case Month.jul:
        return "July";
      case Month.aug:
        return "August";
      case Month.sep:
        return "September";
      case Month.oct:
        return "October";
      case Month.nov:
        return "November";
      case Month.dec:
        return "December";
    }
  }
}
