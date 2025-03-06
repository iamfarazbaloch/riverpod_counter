import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Counter Provider
final counterProvider = StateProvider<int>((ref) => 0);

// Theme Mode Provider
final themeProvider = StateProvider<bool>((ref) => false);

// Bottom Navigation Provider
final bottomNavProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode:
          isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MainScreen(),
    );
  }
}

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

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: $count',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () =>
                      ref
                          .read(counterProvider.notifier)
                          .state++,
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed:
                  () =>
                      ref
                          .read(counterProvider.notifier)
                          .state--,
              child: const Icon(Icons.remove),
            ),
            ElevatedButton(
              onPressed:
                  () =>
                      ref
                          .read(counterProvider.notifier)
                          .state = 0,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Center(
        child: SwitchListTile(
          title: const Text("Dark Mode"),
          value: isDarkMode,
          onChanged: (value) {
            ref.read(themeProvider.notifier).state = value;
          },
        ),
      ),
    );
  }
}
