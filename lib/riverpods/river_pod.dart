import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

// Theme Mode Provider
final themeProvider = StateProvider<bool>((ref) => false);

// Bottom Navigation Provider
final bottomNavProvider = StateProvider<int>((ref) => 0);
