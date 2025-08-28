import 'dart:convert';

import 'package:farm_yield/models/expenses.dart';
import 'package:farm_yield/models/workers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://10.76.166.238:5000";

// Workers Page Endpoints

Future<List<Workers>> fetchWorkers() async {
  final response = await http.get(Uri.parse("${baseUrl}/workers"));

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList
        .map((json) => Workers.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception("Failed to fetch Workers");
  }
}

Future<bool> addWorker(String name, String phone) async {
  final url = Uri.parse("${baseUrl}/add-worker");
  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "phone": phone}),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print("Error: ${response.body}");
      return false;
    }
  } catch (e) {
    print("Error: $e");
    return false;
  }
}

Future<bool> updateWorker(int id, String name, String phoneNo) async {
  final url = Uri.parse("${baseUrl}/update-worker/$id");
  try {
    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "phone": phoneNo}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Error updating worker: ${response.body}");
      return false;
    }
  } catch (e) {
    print("Error updating worker: $e");
    return false;
  }
}

Future<bool> deleteWorker(int id) async {
  final url = Uri.parse("${baseUrl}/delete-worker/$id");
  try {
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Error deleting worker: ${response.body}");
      return false;
    }
  } catch (e) {
    print("Error deleting worker: $e");
    return false;
  }
}

//Expense Page Endpoints

Future<List<Expenses>> fetchExpenses() async {
  final response = await http.get(Uri.parse('${baseUrl}/expenses'));
  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList
        .map((json) => Expenses.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  else{
    throw Exception("Failed to fetch Expenses");
  }
}

Future<void> addExpenseAPI(BuildContext context, String category, int amount, String paidTo) async {
  try {
    final response = await http.post(
      Uri.parse("${baseUrl}/expenses/add"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "expense_category": category,
        "expense_amount": amount,
        "expense_paid_to": paidTo,
      }),
    );

    if (response.statusCode == 201) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Expense Added Successfully ✅")),
      );
    } else {

      final msg = jsonDecode(response.body)["Error"] ?? "Something went wrong";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $msg")),
      );
    }
  } catch (e) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: $e")),
    );
  }
}

Future<int> fetchTotalAmount() async {
  try {
    final response = await http.get(
      Uri.parse("${baseUrl}/expenses/total")
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = jsonDecode(response.body);

      // convert to int safely
      final total = (jsonBody['total_expenses'] as num).toInt();

      print("Total Expenses: $total");
      return total;
    } else {
      print("Failed to load total. Status code: ${response.statusCode}");
      return 0;
    }
  } catch (e) {
    print("Error fetching total: $e");
    return 0;
  }
}