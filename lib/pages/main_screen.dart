import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ui_app/pages/counter_page.dart';
import 'package:ui_app/pages/settings_page.dart';
import 'package:ui_app/riverpods/river_pod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [CounterScreen(), SettingsScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap:
            (index) =>
                ref.read(bottomNavProvider.notifier).state =
                    index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.countertops),
            label: "Counter",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
