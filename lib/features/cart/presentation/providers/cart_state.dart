import 'package:cloth_ecommerce/features/cart/data/models/cart_item_model.dart';

class CartState {
  final List<CartItemModel> items;
  final double shipping;

  const CartState({
    this.items = const [],
    this.shipping = 10.0,
  });

  double get subtotal {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  double get total => subtotal + shipping;

  int get itemCount {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  CartState copyWith({
    List<CartItemModel>? items,
    double? shipping,
  }) {
    return CartState(
      items: items ?? this.items,
      shipping: shipping ?? this.shipping,
    );
  }
}
