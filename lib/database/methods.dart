import 'package:credit_card_dashboard/database/data.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';

TransactionList getTransactions() {
  return TransactionList.fromJson(transactions);
}
