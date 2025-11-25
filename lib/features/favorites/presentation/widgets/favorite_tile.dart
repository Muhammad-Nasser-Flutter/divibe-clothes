import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/cart/presentation/providers/cart_provider.dart';
import 'package:cloth_ecommerce/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

/// Compact product tile for favorites list
class FavoriteTile extends ConsumerStatefulWidget {
  final ProductModel product;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const FavoriteTile({
    super.key,
    required this.product,
    required this.scaffoldKey,
  });

  @override
  ConsumerState<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends ConsumerState<FavoriteTile> {
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
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.gray200,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: widget.product.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 80,
                    height: 80,
                    color: AppColors.gray200,
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 80,
                    height: 80,
                    color: AppColors.gray200,
                    child: const Icon(Icons.error_outline),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Product Info
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.go('/product/${widget.product.id}');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: context.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gray200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.product.category,
                          style: context.bodySmall.copyWith(
                            color: AppColors.gray700,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${(_selectedVariant?.price ?? widget.product.basePrice).toStringAsFixed(2)}',
                        style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Remove from favorites button
              ScaleWidget(
                onTap: () {
                  ref.read(favoritesNotifierProvider.notifier).removeFavorite(widget.product.id);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.gray100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: AppColors.gray700,
                  ),
                ),
              ),
            ],
          ),

          // Variant Selection (Color and Size) + Add to Cart
          if (widget.product.options.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Divider(height: 1, color: AppColors.gray200),
            const SizedBox(height: 12),

            // Color Selector
            if (widget.product.colors.isNotEmpty) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      'Color:',
                      style: context.bodySmall.copyWith(
                        color: AppColors.gray700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
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
                            width: 24,
                            height: 24,
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
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],

            // Size Selector
            if (widget.product.sizes.isNotEmpty) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      'Size:',
                      style: context.bodySmall.copyWith(
                        color: AppColors.gray700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.product.sizes.map((size) {
                        final isSelected = _selectedSize == size;
                        return ScaleWidget(
                          onTap: () {
                            setState(() {
                              _selectedSize = size;
                              _updateSelectedVariant();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.pureBlack : AppColors.gray100,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: isSelected ? AppColors.pureBlack : AppColors.gray300,
                              ),
                            ),
                            child: Text(
                              size,
                              style: context.bodySmall.copyWith(
                                color: isSelected ? AppColors.pureWhite : AppColors.gray700,
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                text: (_selectedVariant?.isInStock ?? true) ? 'Add to Cart' : 'Out of Stock',
                prefixIcon: Iconify(
                  Gg.shopping_cart,
                  color: (_selectedVariant?.isInStock ?? true) ? AppColors.pureWhite : AppColors.gray600,
                  size: 18,
                ),
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
                    : () {}, // No-op when out of stock
                backgroundColor: (_selectedVariant?.isInStock ?? true) ? AppColors.pureBlack : AppColors.gray300,
                foregroundColor: (_selectedVariant?.isInStock ?? true) ? AppColors.pureWhite : AppColors.gray600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
