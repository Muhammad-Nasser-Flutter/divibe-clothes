import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';

class CartItemModel {
  final ProductModel product;
  final ProductVariant variant;
  final int quantity;

  const CartItemModel({
    required this.product,
    required this.variant,
    required this.quantity,
  });

  double get totalPrice => variant.price * quantity;

  CartItemModel copyWith({
    ProductModel? product,
    ProductVariant? variant,
    int? quantity,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      variant: variant ?? this.variant,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItemModel && other.product.id == product.id && other.variant.id == variant.id;
  }

  @override
  int get hashCode => product.id.hashCode ^ variant.id.hashCode;
}
