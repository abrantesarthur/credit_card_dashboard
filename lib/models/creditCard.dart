import 'package:credit_card_dashboard/database/data.dart';
import 'package:credit_card_dashboard/database/interfaces.dart';
import 'package:credit_card_dashboard/database/methods.dart';
import 'package:credit_card_dashboard/utils.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_dashboard/utils.dart';

class CreditCardModel extends ChangeNotifier {
  late double _creditLimit;
  late double _maxLimit;
  late double _travelAlert;
  late double _softwareAlert;
  late double _diningAlert;
  late double _ridesharingAlert;
  late double _newsAlert;
  late List<TransactionType> _transactions;

  void fromCreditCardInterface(CreditCard cc) {
    _creditLimit = cc.creditLimit;
    _maxLimit = cc.maxLimit;
    _travelAlert = cc.travelAlert;
    _softwareAlert = cc.softwareAlert;
    _diningAlert = cc.diningAlert;
    _ridesharingAlert = cc.ridesharingAlert;
    _newsAlert = cc.newsAlert;
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

  double get travelAlert => _travelAlert;
  set travelAlert(double tl) {
    _travelAlert = tl;
    notifyListeners();
  }

  double get softwareAlert => _softwareAlert;
  set softwareAlert(double sl) {
    _softwareAlert = sl;
    notifyListeners();
  }

  double get diningAlert => _diningAlert;
  set diningAlert(double dl) {
    _diningAlert = dl;
    notifyListeners();
  }

  double get ridesharingAlert => _ridesharingAlert;
  set ridesharingAlert(double rl) {
    _ridesharingAlert = rl;
    notifyListeners();
  }

  double get newsAlert => _newsAlert;
  set newsAlert(double nl) {
    _newsAlert = nl;
    notifyListeners();
  }

  void downloadData() {
    CreditCard cc = getCreditCard();
    fromCreditCardInterface(cc);
  }

  double calculateBalance() {
    // get balance from April of 2022
    int ms = DateTime(2022, 4, 1).millisecondsSinceEpoch;

    double balance = 0;
    for (var t in transactions) {
      if (t.timestamp >= ms) {
        balance += t.amount;
      }
    }
    return balance;
  }

  String calculatePoints() {
    int points = 0;
    for (var t in transactions) {
      points += t.pointsEarned;
    }
    return points.toString().addCommas();
  }

  double calculateBalancePercentage() {
    double balance = calculateBalance();
    return balance / creditLimit;
  }

  double getAvailableBalance() {
    return creditLimit - calculateBalance();
  }

  double calculateDailyAverageExpenses() {
    // return average expenses from April 1st to April 15th
    int startTs = DateTime(2022, 4, 1).millisecondsSinceEpoch;
    int endTs = DateTime(2022, 4, 15).millisecondsSinceEpoch;
    double expenses = 0;
    for (var t in transactions) {
      if (t.timestamp > startTs && t.timestamp <= endTs) {
        expenses += t.amount;
      }
    }
    return ((expenses / 15) * 100).round() / 100;
  }

  double calculateExpectedAverage(CartesianPeriod period) {
    if (period == CartesianPeriod.days) {
      return ((creditLimit / 30) * 100).round() / 100;
    }
    if (period == CartesianPeriod.weeks) {
      return ((creditLimit / 4) * 100).round() / 100;
    }
    return creditLimit;
  }

  double calculateTargetAverage() {
    // we have 15 days left of balance
    print(getAvailableBalance());
    print(creditLimit);
    return ((getAvailableBalance() / 15) * 100).round() / 100;
  }

  double getExpenseByMerchant({
    required MerchantCategory merchantCategory,
    required int startTs,
    required int endTs,
  }) {
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
