import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloth_ecommerce/core/helpers/color_helper.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/cart/presentation/providers/cart_provider.dart';
import 'package:cloth_ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class CartItemWidget extends ConsumerWidget {
  final CartItemModel item;

  const CartItemWidget({
    super.key,
    required this.item,
  });

  String _getColorName() {
    final colorHex = item.variant.optionValues['Color'] ?? '';
    return ColorHelper.getColorName(colorHex);
  }

  String _getSize() {
    return item.variant.optionValues['Size'] ?? '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canIncrease = item.quantity < item.variant.stock;

    return Container(
      height: 125,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          SizedBox(
            height: double.maxFinite,
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: item.product.imageUrl,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: double.maxFinite,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  item.product.name,
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // Variant Details
                Text(
                  '${_getColorName()} · ${_getSize()}',
                  style: context.bodyMedium.copyWith(
                    color: AppColors.gray600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),

                // Quantity Controls
                Row(
                  children: [
                    ScaleWidget(
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.remove, size: 16),
                          onPressed: () {
                            ref.read(cartNotifierProvider.notifier).decreaseQuantity(item);
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: Text(
                        '${item.quantity}',
                        style: context.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    ScaleWidget(
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: canIncrease ? AppColors.pureWhite : AppColors.gray100,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.add,
                            size: 16,
                            color: canIncrease ? AppColors.textPrimary : AppColors.gray400,
                          ),
                          onPressed: canIncrease
                              ? () {
                                  ref.read(cartNotifierProvider.notifier).increaseQuantity(item);
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Price and Delete
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Delete Button
              ScaleWidget(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Iconify(
                    Gg.trash,
                    color: AppColors.redColor,
                    size: 20,
                  ),
                  onPressed: () {
                    ref.read(cartNotifierProvider.notifier).removeFromCart(item);
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Price
              Text(
                '\$${item.totalPrice.toStringAsFixed(2)}',
                style: context.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
