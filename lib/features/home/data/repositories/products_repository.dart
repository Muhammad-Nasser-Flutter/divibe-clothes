import 'package:cloth_ecommerce/core/constant.dart';
import 'package:cloth_ecommerce/core/constants/product_constants.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';

class ProductsRepository {
  static const int _defaultPageSize = 8;

  /// Simulates fetching products from an API with pagination
  /// Returns a list of products for the given page and category
  Future<List<ProductModel>> fetchProducts({
    required int page,
    int pageSize = _defaultPageSize,
    String? category,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    // Get all products
    final allProducts = ProductConstants.getSampleProducts();
    printDebug(
      allProducts
          .where(
            (product) => product.category.toLowerCase() == category?.toLowerCase(),
          )
          .toList(),
    );

    // Filter by category if provided
    final filteredProducts = category == null || category == 'All'
        ? allProducts
        : allProducts.where((product) => product.category.toLowerCase() == category.toLowerCase()).toList();

    // Calculate pagination
    final startIndex = page * pageSize;
    final endIndex = (startIndex + pageSize).clamp(0, filteredProducts.length);

    // Return empty list if page is out of bounds
    if (startIndex >= filteredProducts.length) {
      return [];
    }

    // Return paginated products
    return filteredProducts.sublist(startIndex, endIndex);
  }

  /// Get total count of products for a category
  int getTotalCount({String? category}) {
    final allProducts = ProductConstants.getSampleProducts();

    if (category == null || category == 'All') {
      return allProducts.length;
    }

    return allProducts.where((product) => product.category.toLowerCase() == category.toLowerCase()).length;
  }
}
