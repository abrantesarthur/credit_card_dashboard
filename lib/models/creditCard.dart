import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/database/methods.dart';
import 'package:flutter/material.dart';

class CreditCardModel extends ChangeNotifier {
  late double _creditLimit;
  late double _maxLimit;
  late double _travelLimit;
  late double _softwareLimit;
  late double _diningLimit;
  late double _ridesharingLimit;
  late double _newsLimit;
  late List<TransactionType> _transactions;

  void fromCreditCardInterface(CreditCard cc) {
    _creditLimit = cc.creditLimit;
    _maxLimit = cc.maxLimit;
    _travelLimit = cc.travelLimit;
    _softwareLimit = cc.softwareLimit;
    _diningLimit = cc.diningLimit;
    _ridesharingLimit = cc.ridesharingLimit;
    _newsLimit = cc.newsLimit;
    _transactions = cc.transactions.transactions;
    notifyListeners();
  }

  CreditCardModel();

  List<TransactionType> get transactions => _transactions;

  double get creditLimit => _creditLimit;
  set creditLimit(double cl) {
    _creditLimit = cl;
    notifyListeners();
  }

  double get maxLimit => _maxLimit;
  set maxLimit(double ml) {
    _maxLimit = ml;
    notifyListeners();
  }

  double get travelLimit => _travelLimit;
  set travelLimit(double tl) {
    _travelLimit = tl;
    notifyListeners();
  }

  double get softwareLimit => _softwareLimit;
  set softwareLimit(double sl) {
    _softwareLimit = sl;
    notifyListeners();
  }

  double get diningLimit => _diningLimit;
  set diningLimit(double dl) {
    _diningLimit = dl;
    notifyListeners();
  }

  double get ridesharingLimit => _ridesharingLimit;
  set ridesharingLimit(double rl) {
    _ridesharingLimit = rl;
    notifyListeners();
  }

  double get newsLimit => _newsLimit;
  set newsLimit(double nl) {
    _newsLimit = nl;
    notifyListeners();
  }

  void downloadData() {
    CreditCard cc = getCreditCard();
    fromCreditCardInterface(cc);
  }

  double getExpenseByMerchant({
    required MerchantCategory merchantCategory,
    required int startTs,
    required int endTs,
  }) {
    // // calculate tiemstamp range considering today is 04/30/2022
    // int startTs = DateTime(2022, 4, 1).millisecondsSinceEpoch;
    // int endTs;
    // if (range == Range.thisMonth) {
    //   // this month range
    //   endTs = DateTime(2022, 4, 30).millisecondsSinceEpoch;
    // } else {
    //   // YTD range
    //   endTs = DateTime(2022, 4, 30).millisecondsSinceEpoch;
    // }

    double expenses = 0;
    for (var t in transactions) {
      if (t.merchant.category == merchantCategory &&
          t.timestamp > startTs &&
          t.timestamp <= endTs) {
        expenses += t.amount;
      }
    }
    return expenses;
  }
}
