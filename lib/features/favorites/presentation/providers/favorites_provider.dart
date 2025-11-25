import 'package:cloth_ecommerce/features/favorites/presentation/providers/favorites_notifier.dart';
import 'package:cloth_ecommerce/features/favorites/presentation/providers/favorites_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for FavoritesNotifier
final favoritesNotifierProvider = StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
  return FavoritesNotifier();
});

/// Provider for favorite count (for badge)
final favoriteCountProvider = Provider<int>((ref) {
  final state = ref.watch(favoritesNotifierProvider);
  return state.count;
});

/// Family provider to check if a specific product is favorited
final isFavoriteProvider = Provider.family<bool, String>((ref, productId) {
  final state = ref.watch(favoritesNotifierProvider);
  return state.isFavorite(productId);
});
