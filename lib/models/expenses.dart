
import 'package:intl/intl.dart';

class Expenses {
  final int expense_id;
  final String expense_category;
  final int expense_amount;
  final DateTime expense_timestamp;
  final String expense_paid_to;

  const Expenses({
    required this.expense_id,
    required this.expense_category,
    required this.expense_amount,
    required this.expense_timestamp,
    required this.expense_paid_to,
  });

  factory Expenses.fromJson(Map<String, dynamic> json) {
    return Expenses(
      expense_id: json['expense_id'],
      expense_category: json['expense_category'],
      expense_amount: json['expense_amount'],
      expense_timestamp:  parseHttpDate(json['expense_timestamp']),
      expense_paid_to: json['expense_paid_to'],
    );
  }
}



DateTime parseHttpDate(String httpDate){
  final formatter = DateFormat('EEE, dd MMM yyyy HH:mm:ss');


  String dateWithoutGmt = httpDate.replaceAll('GMT', '');
  DateTime parsedDate = formatter.parse(dateWithoutGmt);

  return DateTime.utc(
    parsedDate.year,
    parsedDate.month,
    parsedDate.day,
    parsedDate.hour,
    parsedDate.minute,
    parsedDate.second,
  );
}