import 'package:farm_yield/data/data.dart';
import 'package:farm_yield/models/expenses.dart';
import 'package:farm_yield/widgets/expenses_card-widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  late Future<List<Expenses>> expenses;

  @override
  void initState() {
    // TODO: implement initState
    expenses = fetchExpenses();
    super.initState();
  }


  String formatExpensesDate(DateTime date){
    return DateFormat('EEE, yyyy-MM-dd  hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(75, 214, 75, 0.507),
            floating: true,
            expandedHeight: 150,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Expenses Page"),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  DropdownButton(
                    items: [DropdownMenuItem(child: Text('2025'))],
                    onChanged: (value) {
                      print("Selected Value ${value}");
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Total Expenses this year',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(75, 214, 75, 0.507),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          spreadRadius: 2, // How much it spreads
                          blurRadius: 10, // How soft the shadow looks
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Text("\$2,000"),
                  ),
                ],
              ),
            ),
          ),

          FutureBuilder<List<Expenses>>(
            future: expenses,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text('No workers found')),
                );
              }

              final expenses = snapshot.data!;
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final expense = expenses[index];
                  return ExpensesCardWidget(
                    expenseCategory: expense.expense_category,
                    expensePaidTo: expense.expense_paid_to,
                    expenseAmount: expense.expense_amount,
                    expenseId: expense.expense_id,
                    expenseTimestamp: formatExpensesDate(expense.expense_timestamp),
                  );
                }, childCount: expenses.length),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Add Expenses"),
        onPressed: () {},
      ),
    );
  }
}
