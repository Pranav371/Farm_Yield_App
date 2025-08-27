import 'dart:convert';

import 'package:farm_yield/models/expenses.dart';
import 'package:farm_yield/models/workers.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://10.76.166.211:5000";

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
