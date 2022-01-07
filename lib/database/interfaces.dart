enum MerchantType { rideSharing, dining, trip, tool, generic }

extension MerchantTypeExtension on MerchantType {
  static MerchantType fromString(String t) {
    switch (t) {
      case "ride_sharing":
        return MerchantType.rideSharing;
      case "dining":
        return MerchantType.dining;
      case "trip":
        return MerchantType.trip;
      case "tool":
        return MerchantType.tool;
      default:
        return MerchantType.generic;
    }
  }
}

class Merchant {
  MerchantType type;
  String name;

  Merchant({required this.type, required this.name});

  factory Merchant.fromJson(Map json) {
    return Merchant(
      type: MerchantTypeExtension.fromString(json["type"]),
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
