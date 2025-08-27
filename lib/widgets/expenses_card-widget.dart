import 'package:flutter/material.dart';

class ExpensesCardWidget extends StatelessWidget {
  final String expenseCategory;
  final String expensePaidTo;
  final int expenseAmount;
  final int expenseId;
  final String expenseTimestamp;

  const ExpensesCardWidget({
    super.key,
    required this.expenseCategory,
    required this.expensePaidTo,
    required this.expenseAmount,
    required this.expenseId,
    required this.expenseTimestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseCategory,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Paid to: $expensePaidTo"),
                Text("₹${expenseAmount.toStringAsFixed(2)}"),
              ],
            ),
            const SizedBox(height: 8),
            Text("Expense ID: $expenseId"),
            Text(
              "Date: ${expenseTimestamp}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}



