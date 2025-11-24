import 'package:bloc/bloc.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_event.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_state.dart';
import 'package:cloth_ecommerce/features/cart/data/models/cart_item_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
    on<ClearCart>(_onClearCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final items = List<CartItemModel>.from(state.items);

    // Check if item with same product and variant already exists
    final existingIndex = items.indexWhere(
      (item) => item.product.id == event.product.id && item.variant.id == event.variant.id,
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
          product: event.product,
          variant: event.variant,
          quantity: 1,
        ),
      );
    }

    emit(state.copyWith(items: items));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final items = List<CartItemModel>.from(state.items);
    items.removeWhere((item) => item == event.item);
    emit(state.copyWith(items: items));
  }

  void _onIncreaseQuantity(IncreaseQuantity event, Emitter<CartState> emit) {
    final items = List<CartItemModel>.from(state.items);
    final index = items.indexWhere((item) => item == event.item);

    if (index != -1) {
      final item = items[index];
      // Check if we can increase (don't exceed stock)
      if (item.quantity < item.variant.stock) {
        items[index] = item.copyWith(quantity: item.quantity + 1);
        emit(state.copyWith(items: items));
      }
    }
  }

  void _onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) {
    final items = List<CartItemModel>.from(state.items);
    final index = items.indexWhere((item) => item == event.item);

    if (index != -1) {
      final item = items[index];
      if (item.quantity > 1) {
        items[index] = item.copyWith(quantity: item.quantity - 1);
      } else {
        // Remove item if quantity becomes 0
        items.removeAt(index);
      }
      emit(state.copyWith(items: items));
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(const CartState());
  }
}
