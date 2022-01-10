import 'package:credit_card_dashboard/database/data.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';

Transactions getTransactions() {
  return Transactions.fromJson(transactions);
}
