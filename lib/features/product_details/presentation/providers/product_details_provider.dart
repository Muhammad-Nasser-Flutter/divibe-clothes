import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State class for product details
class ProductDetailsState {
  final String? selectedSize;
  final String? selectedColor;
  final ProductVariant? selectedVariant;
  final String currentImageUrl;
  final ScrollController variantScrollController;

  ProductDetailsState({
    required this.selectedSize,
    required this.selectedColor,
    required this.selectedVariant,
    required this.currentImageUrl,
    required this.variantScrollController,
  });

  ProductDetailsState copyWith({
    String? selectedSize,
    String? selectedColor,
    ProductVariant? selectedVariant,
    String? currentImageUrl,
  }) {
    return ProductDetailsState(
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedVariant: selectedVariant ?? this.selectedVariant,
      currentImageUrl: currentImageUrl ?? this.currentImageUrl,
      variantScrollController: variantScrollController,
    );
  }
}

/// Notifier for managing product details state
class ProductDetailsNotifier extends StateNotifier<ProductDetailsState> {
  final ProductModel product;

  ProductDetailsNotifier(this.product)
    : super(
        ProductDetailsState(
          selectedSize: product.sizes.isNotEmpty ? product.sizes[0] : null,
          selectedColor: product.colors.isNotEmpty ? product.colors[0] : null,
          selectedVariant: null,
          currentImageUrl: product.mainImageUrl ?? product.imageUrl,
          variantScrollController: ScrollController(),
        ),
      ) {
    _updateSelectedVariant();
  }

  @override
  void dispose() {
    state.variantScrollController.dispose();
    super.dispose();
  }

  void updateColor(String color) {
    state = state.copyWith(selectedColor: color);
    _updateSelectedVariant();
  }

  void updateSize(String size) {
    state = state.copyWith(selectedSize: size);
    _updateSelectedVariant();
  }

  void selectVariant(ProductVariant variant) {
    state = state.copyWith(
      selectedColor: variant.optionValues['Color'],
      selectedSize: variant.optionValues['Size'],
      selectedVariant: variant,
      currentImageUrl: variant.imageUrl,
    );
    _scrollToSelectedVariant();
  }

  void scrollToPreviousVariant() {
    if (state.selectedVariant == null) return;

    final currentIndex = product.variants.indexWhere(
      (v) => v.id == state.selectedVariant!.id,
    );

    if (currentIndex > 0) {
      final previousVariant = product.variants[currentIndex - 1];
      selectVariant(previousVariant);
    }
  }

  void scrollToNextVariant() {
    if (state.selectedVariant == null) return;

    final currentIndex = product.variants.indexWhere(
      (v) => v.id == state.selectedVariant!.id,
    );

    if (currentIndex < product.variants.length - 1) {
      final nextVariant = product.variants[currentIndex + 1];
      selectVariant(nextVariant);
    }
  }

  void _updateSelectedVariant() {
    if (state.selectedSize != null && state.selectedColor != null) {
      final variant = product.findVariant({
        'Size': state.selectedSize!,
        'Color': state.selectedColor!,
      });

      if (variant != null) {
        state = state.copyWith(
          selectedVariant: variant,
          currentImageUrl: variant.imageUrl,
        );
        _scrollToSelectedVariant();
      }
    }
  }

  void _scrollToSelectedVariant() {
    if (state.selectedVariant == null) return;

    final variantIndex = product.variants.indexWhere(
      (v) => v.id == state.selectedVariant!.id,
    );

    if (variantIndex != -1 && state.variantScrollController.hasClients) {
      final itemWidth = 80.0;
      final separatorWidth = 12.0;
      final scrollPosition = variantIndex * (itemWidth + separatorWidth);

      state.variantScrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  int get currentVariantIndex {
    if (state.selectedVariant == null) return -1;
    return product.variants.indexWhere(
      (v) => v.id == state.selectedVariant!.id,
    );
  }

  bool get canScrollPrevious => currentVariantIndex > 0;

  bool get canScrollNext => currentVariantIndex < product.variants.length - 1;
}

/// Provider for product details state
final productDetailsProvider = StateNotifierProvider.family<ProductDetailsNotifier, ProductDetailsState, ProductModel>((
  ref,
  product,
) {
  return ProductDetailsNotifier(product);
});
