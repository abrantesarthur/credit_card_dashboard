enum MerchantCategory { rideSharing, dining, trip, tool, generic }

extension MerchantCategoryExtension on MerchantCategory {
  static MerchantCategory fromString(String t) {
    switch (t) {
      case "ride_sharing":
        return MerchantCategory.rideSharing;
      case "dining":
        return MerchantCategory.dining;
      case "trip":
        return MerchantCategory.trip;
      case "tool":
        return MerchantCategory.tool;
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
      type: MerchantCategoryExtension.fromString(json["type"]),
      name: json["name"],
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
      timestamp: json["timestamp"],
      merchant: json["merchant"],
      pointsEarned: json["points_earned"],
      amount: json["amount"],
    );
  }
}
