import 'dart:async';

import 'package:cloth_ecommerce/core/constants/product_constants.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Search notifier with debounced search logic
class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(const SearchInitial());

  Timer? _debounceTimer;
  static const _debounceDuration = Duration(milliseconds: 500);

  /// Search products with debouncing
  void search(String query) {
    // Cancel previous timer
    _debounceTimer?.cancel();

    // If query is empty, reset to initial state
    if (query.trim().isEmpty) {
      state = const SearchInitial();
      return;
    }

    // Set loading state immediately
    state = const SearchLoading();

    // Start new debounce timer
    _debounceTimer = Timer(_debounceDuration, () {
      _performSearch(query);
    });
  }

  /// Perform the actual search
  void _performSearch(String query) {
    try {
      final allProducts = ProductConstants.getSampleProducts();
      final lowerQuery = query.toLowerCase().trim();

      // Search by name, category, or description
      final results = allProducts.where((product) {
        return product.name.toLowerCase().contains(lowerQuery) || product.category.toLowerCase().contains(lowerQuery);
      }).toList();

      state = SearchLoaded(
        results: results,
        query: query,
      );
    } catch (e) {
      state = SearchError(message: 'Search failed: ${e.toString()}');
    }
  }

  /// Clear search results
  void clear() {
    _debounceTimer?.cancel();
    state = const SearchInitial();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}

/// Search provider
final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});
