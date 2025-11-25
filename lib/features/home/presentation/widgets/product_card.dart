import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/core/widgets/hover_blur_overlay.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_bloc.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_event.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/animated_card.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/size_widget.dart';
import 'package:flutter/material.dart';

import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProductCard({
    super.key,
    required this.product,
    required this.scaffoldKey,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;
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

  Color _parseColor(String hexColor) {
    final hex = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  String _getCategoryDisplayName() {
    return widget.product.category;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
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
                  HoverBlurOverlay(
                    overlayWidget: CustomElevatedButton(
                      prefixIcon: const Iconify(Gg.shopping_cart),
                      onPressed: () {
                        if (_selectedVariant != null && _selectedVariant!.isInStock) {
                          context.read<CartBloc>().add(
                            AddToCart(
                              product: widget.product,
                              variant: _selectedVariant!,
                            ),
                          );
                          widget.scaffoldKey.currentState?.openEndDrawer();
                        }
                      },
                      backgroundColor: (_selectedVariant?.isInStock ?? true) ? AppColors.pureWhite : AppColors.gray300,
                      foregroundColor: (_selectedVariant?.isInStock ?? true) ? AppColors.pureBlack : AppColors.gray600,
                      opacityChangable: false,
                      text: 'Add to Cart',
                    ),

                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: double.infinity,
                        imageUrl: widget.product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Category Badge
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.badgeHoodies,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: SelectableText(
                        _getCategoryDisplayName(),
                        style: context.bodySmall.copyWith(
                          color: AppColors.pureWhite,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  // Favorite Button
                  Positioned(
                    top: 12,
                    right: 12,
                    child: ScaleWidget(
                      onTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.pureWhite,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: _isFavorite ? AppColors.redColor : AppColors.textSecondary,
                          size: 20,
                        ),
                      ),
                    ),
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
                            color: _parseColor(colorHex),
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
                                if (_selectedVariant != null) {
                                  context.read<CartBloc>().add(
                                    AddToCart(
                                      product: widget.product,
                                      variant: _selectedVariant!,
                                    ),
                                  );
                                  widget.scaffoldKey.currentState?.openEndDrawer();
                                }
                              }
                            : null,
                        child: IconButton.filled(
                          onPressed: (_selectedVariant?.isInStock ?? true)
                              ? () {
                                  if (_selectedVariant != null) {
                                    context.read<CartBloc>().add(
                                      AddToCart(
                                        product: widget.product,
                                        variant: _selectedVariant!,
                                      ),
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
    );
  }
}
