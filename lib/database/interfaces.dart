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
  MerchantCategory type;
  String name;

  Merchant({required this.type, required this.name});

  factory Merchant.fromJson(Map json) {
    return Merchant(
      type: MerchantCategoryExtension.fromString(json["merchant_category"]),
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

class Transactions {
  final List<TransactionType> transactions;

  Transactions(this.transactions);

  factory Transactions.fromJson(List<dynamic> json) {
    List<TransactionType> transactions =
        json.map((t) => TransactionType.fromJson(t)).toList();
    return Transactions(transactions);
  }
}
