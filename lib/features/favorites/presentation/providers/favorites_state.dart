import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';

/// State class for managing favorites
class FavoritesState {
  final List<ProductModel> favorites;

  const FavoritesState({
    this.favorites = const [],
  });

  /// Create a copy with updated values
  FavoritesState copyWith({
    List<ProductModel>? favorites,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
    );
  }

  /// Get the count of favorited items
  int get count => favorites.length;

  /// Check if a product is favorited
  bool isFavorite(String productId) {
    return favorites.any((product) => product.id == productId);
  }
}
