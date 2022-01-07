enum MerchantType { rideSharing, restaurant, trip, tool }

extension MerchantTypeExtension on MerchantType {
  static MerchantType? fromString(String t) {
    switch (t) {
      case "ride_sharing":
        return MerchantType.rideSharing;
      case "restaurant":
        return MerchantType.rideSharing;
      case "trip":
        return MerchantType.rideSharing;
      case "tool":
        return MerchantType.rideSharing;
    }
  }
}

class Merchant {
  MerchantType? type;
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
  final String date;
  final Merchant merchant;
  final int pointsEarned;
  final double amount;

  TransactionType({
    required this.date,
    required this.merchant,
    required this.pointsEarned,
    required this.amount,
  });

  factory TransactionType.fromJson(Map json) {
    return TransactionType(
      date: json["date"],
      merchant: json["merchant"],
      pointsEarned: json["points_earned"],
      amount: json["amount"],
    );
  }
}
