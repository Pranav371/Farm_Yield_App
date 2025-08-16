import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Workers Page"))
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Expense Page")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        
      },
      icon: Icon(Icons.add),
      label: Text('Add Expense')),
    );
  }
}