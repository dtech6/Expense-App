import 'package:flutter/material.dart';

class Summary {
  String? name;
  int? amount;
  Color? color;

  Summary({this.name, this.amount, this.color});
}

List<Summary> summaryData = [
  Summary(name: "Income", amount: 36000, color: Colors.green.shade100),
  Summary(name: "Expense", amount: 3000, color: Colors.red.shade100),
];

List<String> transactionTypes = ["Expense", "Income"];

List<String> paymentTypes = ["Cash", "Online"];

List<String> categories = [
  "Transport",
  "Shopping",
  "Travel",
  "Study",
  "Household",
  "Other"
];
