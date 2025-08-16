import 'package:farm_yield/data/notifiers.dart';
import 'package:farm_yield/screens/expenses_page.dart';
import 'package:farm_yield/screens/history_page.dart';
import 'package:farm_yield/screens/home_page.dart';
import 'package:farm_yield/screens/payments_page.dart';
import 'package:farm_yield/screens/workers_page.dart';
import 'package:farm_yield/screens/yield_page.dart';
import 'package:farm_yield/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';


List<Widget> pages = [HomePage(), WorkersPage(), YieldPage(),ExpensesPage(), PaymentsPage(),  HistoryPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),

      bottomNavigationBar: NavbarWidget(),
    );
  }
}
