import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';

/// Base class for products state
sealed class ProductsState {
  const ProductsState();
}

/// Loading state - shown when fetching products
class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

/// Error state - shown when an error occurs
class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);
}

/// Success state - contains the loaded products
class ProductsData extends ProductsState {
  final List<ProductModel> products;
  final bool hasMore;
  final int currentPage;
  final String? currentCategory;
  final bool isLoadingMore;

  const ProductsData({
    required this.products,
    required this.hasMore,
    required this.currentPage,
    this.currentCategory,
    this.isLoadingMore = false,
  });

  ProductsData copyWith({
    List<ProductModel>? products,
    bool? hasMore,
    int? currentPage,
    String? currentCategory,
    bool? isLoadingMore,
  }) {
    return ProductsData(
      products: products ?? this.products,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      currentCategory: currentCategory ?? this.currentCategory,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
