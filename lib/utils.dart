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
      case MerchantCategory.software:
        return AppColors.softwareColor;
      case MerchantCategory.travel:
        return AppColors.travelColor;
      case MerchantCategory.news:
        return AppColors.newsColor;
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
      case MerchantCategory.software:
        return "Software";
      case MerchantCategory.travel:
        return "Travel";
      case MerchantCategory.news:
        return "News";
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
      case MerchantCategory.software:
        return Icons.settings;
      case MerchantCategory.travel:
        return Icons.airplanemode_active;
      case MerchantCategory.news:
        return Icons.chrome_reader_mode;
      default:
        return Icons.turned_in;
    }
  }
}

enum Month { jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec }

extension MonthExtension on Month {
  int getStartTimestamp() {
    switch (this) {
      case Month.jan:
        return DateTime(2022, 1, 1).millisecondsSinceEpoch;
      case Month.feb:
        return DateTime(2022, 2, 1).millisecondsSinceEpoch;
      case Month.mar:
        return DateTime(2022, 3, 1).millisecondsSinceEpoch;
      case Month.apr:
        return DateTime(2022, 4, 1).millisecondsSinceEpoch;
      case Month.may:
        return DateTime(2021, 5, 1).millisecondsSinceEpoch;
      case Month.jun:
        return DateTime(2021, 6, 1).millisecondsSinceEpoch;
      case Month.jul:
        return DateTime(2021, 7, 1).millisecondsSinceEpoch;
      case Month.aug:
        return DateTime(2021, 8, 1).millisecondsSinceEpoch;
      case Month.sep:
        return DateTime(2021, 9, 1).millisecondsSinceEpoch;
      case Month.oct:
        return DateTime(2021, 10, 1).millisecondsSinceEpoch;
      case Month.nov:
        return DateTime(2021, 11, 1).millisecondsSinceEpoch;
      case Month.dec:
        return DateTime(2021, 12, 1).millisecondsSinceEpoch;
    }
  }

  int getEndTimestamp() {
    switch (this) {
      case Month.jan:
        return DateTime(2022, 1, 31).millisecondsSinceEpoch;
      case Month.feb:
        return DateTime(2022, 2, 28).millisecondsSinceEpoch;
      case Month.mar:
        return DateTime(2022, 3, 31).millisecondsSinceEpoch;
      case Month.apr:
        return DateTime(2022, 4, 30).millisecondsSinceEpoch;
      case Month.may:
        return DateTime(2021, 5, 31).millisecondsSinceEpoch;
      case Month.jun:
        return DateTime(2021, 6, 30).millisecondsSinceEpoch;
      case Month.jul:
        return DateTime(2021, 7, 31).millisecondsSinceEpoch;
      case Month.aug:
        return DateTime(2021, 8, 31).millisecondsSinceEpoch;
      case Month.sep:
        return DateTime(2021, 9, 30).millisecondsSinceEpoch;
      case Month.oct:
        return DateTime(2021, 10, 31).millisecondsSinceEpoch;
      case Month.nov:
        return DateTime(2021, 11, 30).millisecondsSinceEpoch;
      case Month.dec:
        return DateTime(2021, 12, 31).millisecondsSinceEpoch;
    }
  }

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

extension StringExtension on String {
  String addCommas() {
    return replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},');
  }
}

enum DoughnutPeriod { thisMonth, ytd }

extension DoughnutPeriodExtension on DoughnutPeriod {
  // consider today is April 30th, 2022
  int getStartTimestamp() {
    if (this == DoughnutPeriod.thisMonth) {
      return DateTime(2022, 4, 1).millisecondsSinceEpoch;
    } else {
      return DateTime(2022, 1, 1).millisecondsSinceEpoch;
    }
  }

  int getEndTimestamp() {
    return DateTime(2022, 4, 30).millisecondsSinceEpoch;
  }

  String getString() {
    switch (this) {
      case DoughnutPeriod.thisMonth:
        return "This Month";
      case DoughnutPeriod.ytd:
        return "Year to Date";
    }
  }
}

enum CartesianPeriod { days, months, weeks }

extension CartesianPeriodExtension on CartesianPeriod {
  String getString() {
    switch (this) {
      case CartesianPeriod.days:
        return "By Day";
      case CartesianPeriod.months:
        return "By Month";
      case CartesianPeriod.weeks:
        return "By Week";
    }
  }
}
