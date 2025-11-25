import 'package:cloth_ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:cloth_ecommerce/features/cart/presentation/providers/cart_state.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Cart state notifier for managing cart items
class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  /// Add a product variant to cart
  void addToCart(ProductModel product, ProductVariant variant) {
    final items = List<CartItemModel>.from(state.items);

    // Check if item with same product and variant already exists
    final existingIndex = items.indexWhere(
      (item) => item.product.id == product.id && item.variant.id == variant.id,
    );

    if (existingIndex != -1) {
      // Item exists, increase quantity
      final existingItem = items[existingIndex];
      items[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );
    } else {
      // New item, add to cart
      items.add(
        CartItemModel(
          product: product,
          variant: variant,
          quantity: 1,
        ),
      );
    }

    state = state.copyWith(items: items);
  }

  /// Remove an item from cart
  void removeFromCart(CartItemModel item) {
    final items = List<CartItemModel>.from(state.items);
    items.removeWhere((cartItem) => cartItem == item);
    state = state.copyWith(items: items);
  }

  /// Increase quantity of an item
  void increaseQuantity(CartItemModel item) {
    final items = List<CartItemModel>.from(state.items);
    final index = items.indexWhere((cartItem) => cartItem == item);

    if (index != -1) {
      final cartItem = items[index];
      // Check if we can increase (don't exceed stock)
      if (cartItem.quantity < cartItem.variant.stock) {
        items[index] = cartItem.copyWith(quantity: cartItem.quantity + 1);
        state = state.copyWith(items: items);
      }
    }
  }

  /// Decrease quantity of an item
  void decreaseQuantity(CartItemModel item) {
    final items = List<CartItemModel>.from(state.items);
    final index = items.indexWhere((cartItem) => cartItem == item);

    if (index != -1) {
      final cartItem = items[index];
      if (cartItem.quantity > 1) {
        items[index] = cartItem.copyWith(quantity: cartItem.quantity - 1);
      } else {
        // Remove item if quantity becomes 0
        items.removeAt(index);
      }
      state = state.copyWith(items: items);
    }
  }

  /// Clear all items from cart
  void clearCart() {
    state = const CartState();
  }
}
