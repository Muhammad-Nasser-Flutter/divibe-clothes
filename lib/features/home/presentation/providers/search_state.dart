import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';

/// Search state sealed class
sealed class SearchState {
  const SearchState();
}

/// Initial state - no search performed
class SearchInitial extends SearchState {
  const SearchInitial();
}

/// Loading state - search in progress
class SearchLoading extends SearchState {
  const SearchLoading();
}

/// Loaded state - search results available
class SearchLoaded extends SearchState {
  final List<ProductModel> results;
  final String query;

  const SearchLoaded({
    required this.results,
    required this.query,
  });
}

/// Error state - search failed
class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message});
}
