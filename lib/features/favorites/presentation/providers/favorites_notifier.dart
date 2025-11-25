import 'package:cloth_ecommerce/features/favorites/presentation/providers/favorites_state.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier for managing favorites state
class FavoritesNotifier extends StateNotifier<FavoritesState> {
  FavoritesNotifier() : super(const FavoritesState());

  /// Toggle a product's favorite status
  void toggleFavorite(ProductModel product) {
    final currentFavorites = state.favorites;
    final isFavorited = currentFavorites.any((p) => p.id == product.id);

    if (isFavorited) {
      // Remove from favorites
      state = state.copyWith(
        favorites: currentFavorites.where((p) => p.id != product.id).toList(),
      );
    } else {
      // Add to favorites
      state = state.copyWith(
        favorites: [...currentFavorites, product],
      );
    }
  }

  /// Check if a product is favorited
  bool isFavorite(String productId) {
    return state.isFavorite(productId);
  }

  /// Remove a specific product from favorites
  void removeFavorite(String productId) {
    state = state.copyWith(
      favorites: state.favorites.where((p) => p.id != productId).toList(),
    );
  }

  /// Clear all favorites
  void clearFavorites() {
    state = const FavoritesState();
  }
}
