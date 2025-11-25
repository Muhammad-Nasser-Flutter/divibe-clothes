import 'package:cloth_ecommerce/features/cart/presentation/providers/cart_notifier.dart';
import 'package:cloth_ecommerce/features/cart/presentation/providers/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Main cart state notifier provider
final cartNotifierProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

/// Provider for cart item count
final cartItemCountProvider = Provider<int>((ref) {
  final cartState = ref.watch(cartNotifierProvider);
  return cartState.itemCount;
});

/// Provider for cart total
final cartTotalProvider = Provider<double>((ref) {
  final cartState = ref.watch(cartNotifierProvider);
  return cartState.total;
});

/// Provider for cart subtotal
final cartSubtotalProvider = Provider<double>((ref) {
  final cartState = ref.watch(cartNotifierProvider);
  return cartState.subtotal;
});
