import 'package:farm_yield/data/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
              icon: Icon(Icons.people_alt_outlined),
              label: 'Workers',
            ),
            NavigationDestination(
              icon: Icon(LucideIcons.sprout),
              label: 'Yield',
            ),
            NavigationDestination(
              icon: Icon(LucideIcons.coins),
              label: 'Expenses',
            ),
            NavigationDestination(
              icon: Icon(LucideIcons.indianRupee),
              label: 'Payments',
            ),

            NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          ],
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
