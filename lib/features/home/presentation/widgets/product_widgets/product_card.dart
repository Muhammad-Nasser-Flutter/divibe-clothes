import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/cart/presentation/providers/cart_provider.dart';
import 'package:cloth_ecommerce/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/product_widgets/animated_card.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/product_widgets/product_category_badge.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/product_widgets/product_favorite_button.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/product_widgets/product_image_widget.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/product_widgets/size_widget.dart';
import 'package:flutter/material.dart';

import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class ProductCard extends ConsumerStatefulWidget {
  final ProductModel product;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProductCard({
    super.key,
    required this.product,
    required this.scaffoldKey,
  });

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  String? _selectedSize;
  String? _selectedColor;
  ProductVariant? _selectedVariant;

  @override
  void initState() {
    super.initState();
    // Pre-select first size and color
    _selectedSize = widget.product.sizes.isNotEmpty ? widget.product.sizes[0] : null;
    _selectedColor = widget.product.colors.isNotEmpty ? widget.product.colors[0] : null;
    _updateSelectedVariant();
  }

  void _updateSelectedVariant() {
    if (_selectedSize != null && _selectedColor != null) {
      _selectedVariant = widget.product.findVariant({
        'Size': _selectedSize!,
        'Color': _selectedColor!,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(isFavoriteProvider(widget.product.id));

    return GestureDetector(
      onTap: () {
        context.go('/product/${widget.product.id}');
      },
      child: AnimatedCard(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.pureWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.gray200, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Expanded(
                child: Stack(
                  children: [
                    // Product Image
                    ProductImageWidget(
                      selectedVariant: _selectedVariant,
                      ref: ref,
                      product: widget.product,
                      scaffoldKey: widget.scaffoldKey,
                    ),

                    // Category Badge
                    ProductCategoryBadge(
                      productName: widget.product.category,
                    ),

                    // Favorite Button
                    ProductFavoriteButton(
                      ref: ref,
                      product: widget.product,
                      isFavorite: isFavorite,
                    ),
                  ],
                ),
              ),

              // Product Details
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    SelectableText(
                      widget.product.name,
                      style: context.bodyLarge.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),

                    // Color Selector
                    Row(
                      children: widget.product.colors.map((colorHex) {
                        final isSelected = _selectedColor == colorHex;
                        return ScaleWidget(
                          scaleValue: 1.2,
                          onTap: () {
                            setState(() {
                              _selectedColor = colorHex;
                              _updateSelectedVariant();
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 6),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: colorHex.toColor(),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? AppColors.pureBlack : AppColors.gray300,
                                width: isSelected ? 2 : 1,
                              ),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.2),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 12),
                    // Size Selector
                    SizedBox(
                      height: 28,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.product.sizes.length > 5 ? 5 : widget.product.sizes.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 6),
                        itemBuilder: (context, index) {
                          final size = widget.product.sizes[index];
                          final isSelected = _selectedSize == size;

                          return SizeWidget(
                            size: size,
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                _selectedSize = size;
                                _updateSelectedVariant();
                              });
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Stock Indicator
                    if (_selectedVariant != null && _selectedVariant!.isLowStock)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: SelectableText(
                          'Only ${_selectedVariant!.stock} left!',
                          style: context.bodySmall.copyWith(
                            color: AppColors.redColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    if (_selectedVariant != null && !_selectedVariant!.isInStock)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: SelectableText(
                          'Out of stock',
                          style: context.bodySmall.copyWith(
                            color: AppColors.gray600,
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    // Price and Add to Cart
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SelectableText(
                          '\$${(_selectedVariant?.price ?? widget.product.price).toStringAsFixed(2)}',
                          style: context.headlineSmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        ScaleWidget(
                          rotatable: true,
                          scalable: true,
                          onTap: (_selectedVariant?.isInStock ?? true)
                              ? () {
                                  if (_selectedVariant != null && _selectedVariant!.isInStock) {
                                    ref
                                        .read(cartNotifierProvider.notifier)
                                        .addToCart(
                                          widget.product,
                                          _selectedVariant!,
                                        );
                                    widget.scaffoldKey.currentState?.openEndDrawer();
                                  }
                                }
                              : null,
                          child: IconButton.filled(
                            onPressed: (_selectedVariant?.isInStock ?? true)
                                ? () {
                                    if (_selectedVariant != null && _selectedVariant!.isInStock) {
                                      ref
                                          .read(cartNotifierProvider.notifier)
                                          .addToCart(
                                            widget.product,
                                            _selectedVariant!,
                                          );
                                      widget.scaffoldKey.currentState?.openEndDrawer();
                                    }
                                  }
                                : null,
                            padding: const EdgeInsets.all(8),
                            style: IconButton.styleFrom(
                              backgroundColor: (_selectedVariant?.isInStock ?? true)
                                  ? AppColors.pureBlack
                                  : AppColors.gray300,
                              shape: const CircleBorder(),
                            ),
                            icon: Iconify(
                              Gg.shopping_cart,
                              color: (_selectedVariant?.isInStock ?? true) ? AppColors.pureWhite : AppColors.gray600,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
