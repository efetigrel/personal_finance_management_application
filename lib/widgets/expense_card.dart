import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String category;
  final double amount;
  final DateTime date;

  ExpenseCard({
    required this.category,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Icon(Icons.money_off),
        title: Text(category),
        subtitle: Text(
            'Amount: \$${amount.toStringAsFixed(2)}\nDate: ${date.toLocal()}'),
      ),
    );
  }
}
