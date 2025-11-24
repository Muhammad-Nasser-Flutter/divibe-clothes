import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for selected category
final selectedCategoryProvider = StateProvider<String>((ref) => 'All');
