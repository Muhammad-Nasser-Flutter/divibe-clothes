import 'package:cloth_ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final ProductModel product;
  final ProductVariant variant;

  AddToCart({
    required this.product,
    required this.variant,
  });
}

class RemoveFromCart extends CartEvent {
  final CartItemModel item;

  RemoveFromCart(this.item);
}

class IncreaseQuantity extends CartEvent {
  final CartItemModel item;

  IncreaseQuantity(this.item);
}

class DecreaseQuantity extends CartEvent {
  final CartItemModel item;

  DecreaseQuantity(this.item);
}

class ClearCart extends CartEvent {}
