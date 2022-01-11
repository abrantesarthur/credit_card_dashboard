import 'package:credit_card_dashboard/widgets/transaction.dart';

enum MerchantCategory {
  rideSharing,
  dining,
  travel,
  software,
  news,
  generic,
}

extension MerchantCategoryExtension on MerchantCategory {
  static MerchantCategory fromString(String t) {
    switch (t) {
      case "ride_sharing":
        return MerchantCategory.rideSharing;
      case "dining":
        return MerchantCategory.dining;
      case "travel":
        return MerchantCategory.travel;
      case "software":
        return MerchantCategory.software;
      case "news":
        return MerchantCategory.news;
      default:
        return MerchantCategory.generic;
    }
  }
}

class Merchant {
  MerchantCategory category;
  String name;

  Merchant({required this.category, required this.name});

  factory Merchant.fromJson(Map json) {
    return Merchant(
      category: MerchantCategoryExtension.fromString(json["merchant_category"]),
      name: json["merchant_name"],
    );
  }
}

class TransactionType {
  final int timestamp;
  final Merchant merchant;
  final int pointsEarned;
  final double amount;

  TransactionType({
    required this.timestamp,
    required this.merchant,
    required this.pointsEarned,
    required this.amount,
  });

  factory TransactionType.fromJson(Map json) {
    return TransactionType(
      merchant: Merchant.fromJson(json),
      timestamp: json["timestamp"],
      amount: json["amount"],
      pointsEarned: json["points_earned"],
    );
  }
}

class TransactionList {
  final List<TransactionType> transactions;

  TransactionList(this.transactions);

  factory TransactionList.fromJson(List<dynamic> json) {
    // convert transactions
    List<TransactionType> transactions =
        json.map((t) => TransactionType.fromJson(t)).toList();

    // sort transactions by time
    transactions.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return TransactionList(transactions);
  }
}

class CreditCard {
  final TransactionList transactions;
  double creditLimit;
  final double maxLimit;
  double travelAlert;
  double softwareAlert;
  double diningAlert;
  double ridesharingAlert;
  double newsAlert;

  CreditCard({
    required this.transactions,
    required this.creditLimit,
    required this.maxLimit,
    required this.travelAlert,
    required this.softwareAlert,
    required this.diningAlert,
    required this.ridesharingAlert,
    required this.newsAlert,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    print(json["credit_limit"]);
    return CreditCard(
      transactions: TransactionList.fromJson(json["transactions"]),
      creditLimit: json["credit_limit"],
      maxLimit: json["max_limit"],
      travelAlert: json["travel_alert"],
      softwareAlert: json["software_alert"],
      diningAlert: json["dining_alert"],
      ridesharingAlert: json["ridesharing_alert"],
      newsAlert: json["news_alert"],
    );
  }
}
