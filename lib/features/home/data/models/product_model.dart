/// Represents a product option type (e.g., Color, Size)
class ProductOption {
  final String name;
  final List<String> values;

  const ProductOption({
    required this.name,
    required this.values,
  });

  /// Create ProductOption from JSON
  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(
      name: json['name'] as String,
      values: (json['values'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  /// Convert ProductOption to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'values': values,
    };
  }
}

/// Represents a specific product variant with unique combination of options
class ProductVariant {
  final String id;
  final Map<String, String> optionValues; // e.g., {"Color": "Black", "Size": "M"}
  final double price;
  final int stock;
  final String sku;

  const ProductVariant({
    required this.id,
    required this.optionValues,
    required this.price,
    required this.stock,
    required this.sku,
  });

  bool get isInStock => stock > 0;
  bool get isLowStock => stock > 0 && stock <= 5;

  /// Create ProductVariant from JSON
  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: json['id'] as String,
      optionValues: Map<String, String>.from(json['optionValues'] as Map),
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as int,
      sku: json['sku'] as String,
    );
  }

  /// Convert ProductVariant to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'optionValues': optionValues,
      'price': price,
      'stock': stock,
      'sku': sku,
    };
  }
}

class ProductModel {
  final String id;
  final String name;
  final String category;
  final double basePrice;
  final List<ProductOption> options;
  final List<ProductVariant> variants;
  final String imageUrl;
  final double rating;
  final int reviewCount;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.basePrice,
    required this.options,
    required this.variants,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
  });

  // Backward compatibility getters
  List<String> get sizes {
    final sizeOption = options.firstWhere(
      (opt) => opt.name.toLowerCase() == 'size',
      orElse: () => const ProductOption(name: 'Size', values: []),
    );
    return sizeOption.values;
  }

  List<String> get colors {
    final colorOption = options.firstWhere(
      (opt) => opt.name.toLowerCase() == 'color',
      orElse: () => const ProductOption(name: 'Color', values: []),
    );
    return colorOption.values;
  }

  double get price => basePrice;

  /// Find a variant matching the selected options
  ProductVariant? findVariant(Map<String, String> selectedOptions) {
    return variants.firstWhere(
      (variant) {
        return selectedOptions.entries.every((entry) {
          return variant.optionValues[entry.key] == entry.value;
        });
      },
      orElse: () => variants.first,
    );
  }

  /// Create ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      basePrice: (json['basePrice'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
      options: (json['options'] as List<dynamic>)
          .map((e) => ProductOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => ProductVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'basePrice': basePrice,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'options': options.map((e) => e.toJson()).toList(),
      'variants': variants.map((e) => e.toJson()).toList(),
    };
  }
}
