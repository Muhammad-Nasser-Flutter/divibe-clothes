import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provider to track if search is open
final isSearchOpenProvider = StateProvider<bool>((ref) => false);
