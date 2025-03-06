import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ui_app/riverpods/river_pod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: SwitchListTile(
        title: const Text("Dark Mode"),
        value: isDarkMode,
        onChanged: (value) {
          ref.read(themeProvider.notifier).state = value;
        },
      ),
    );
  }
}
