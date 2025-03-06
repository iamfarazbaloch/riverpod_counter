import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ui_app/riverpods/river_pod.dart';

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
