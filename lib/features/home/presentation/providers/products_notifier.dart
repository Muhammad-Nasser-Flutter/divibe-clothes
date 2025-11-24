import 'package:cloth_ecommerce/features/home/data/repositories/products_repository.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/products_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  final ProductsRepository _repository;
  static const int _pageSize = 8;

  ProductsNotifier(this._repository) : super(const ProductsLoading());

  /// Load the first page of products
  Future<void> loadProducts({String? category}) async {
    state = const ProductsLoading();

    try {
      final products = await _repository.fetchProducts(
        page: 0,
        pageSize: _pageSize,
        category: category,
      );

      final totalCount = _repository.getTotalCount(category: category);
      final hasMore = products.length < totalCount;

      state = ProductsData(
        products: products,
        hasMore: hasMore,
        currentPage: 0,
        currentCategory: category,
      );
    } catch (e) {
      state = ProductsError('Failed to load products: ${e.toString()}');
    }
  }

  /// Load the next page of products
  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is! ProductsData || !currentState.hasMore) {
      return;
    }

    // Set loading state
    state = currentState.copyWith(isLoadingMore: true);

    try {
      final nextPage = currentState.currentPage + 1;
      final newProducts = await _repository.fetchProducts(
        page: nextPage,
        pageSize: _pageSize,
        category: currentState.currentCategory,
      );

      final allProducts = [...currentState.products, ...newProducts];
      final totalCount = _repository.getTotalCount(
        category: currentState.currentCategory,
      );
      final hasMore = allProducts.length < totalCount;

      state = currentState.copyWith(
        products: allProducts,
        hasMore: hasMore,
        currentPage: nextPage,
        isLoadingMore: false,
      );
    } catch (e) {
      // Reset loading state on error
      state = currentState.copyWith(isLoadingMore: false);
      // Could also show error state, but keeping current products visible
      state = ProductsError('Failed to load more products: ${e.toString()}');
    }
  }

  /// Refresh products (reload from first page)
  Future<void> refresh() async {
    final currentState = state;
    final category = currentState is ProductsData ? currentState.currentCategory : null;

    await loadProducts(category: category);
  }
}
