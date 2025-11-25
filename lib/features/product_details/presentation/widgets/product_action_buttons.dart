import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/core/widgets/custom_outlined_button.dart';
import 'package:cloth_ecommerce/features/cart/presentation/providers/cart_provider.dart';
import 'package:cloth_ecommerce/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class ProductActionButtons extends ConsumerWidget {
  final ProductModel product;
  final ProductVariant? selectedVariant;

  const ProductActionButtons({
    super.key,
    required this.product,
    required this.selectedVariant,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoritesNotifierProvider.notifier).isFavorite(product.id);

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          // Favorites Button
          Expanded(
            child: CustomOutlinedButton(
              text: isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
              prefixIcon: const Iconify(
                Gg.heart,
                color: AppColors.redColor,
                size: 20,
              ),
              onPressed: () {
                ref.read(favoritesNotifierProvider.notifier).toggleFavorite(product);
              },
              borderColor: AppColors.redColor,
              backgroundColor: AppColors.pureWhite,
              foregroundColor: AppColors.redColor,
              borderRadius: 8,
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
          ),
          24.width,

          // Add to Cart Button
          Expanded(
            child: CustomElevatedButton(
              text: (selectedVariant?.isInStock ?? true) ? 'Add to Cart' : 'Out of Stock',
              prefixIcon: Iconify(
                Gg.shopping_cart,
                color: (selectedVariant?.isInStock ?? true) ? AppColors.pureWhite : AppColors.gray600,
                size: 20,
              ),
              onPressed: (selectedVariant?.isInStock ?? true)
                  ? () {
                      if (selectedVariant != null) {
                        ref.read(cartNotifierProvider.notifier).addToCart(product, selectedVariant!);
                        Scaffold.maybeOf(context)?.openEndDrawer();
                      }
                    }
                  : () {},
              backgroundColor: (selectedVariant?.isInStock ?? true) ? AppColors.pureBlack : AppColors.gray300,
              foregroundColor: (selectedVariant?.isInStock ?? true) ? AppColors.pureWhite : AppColors.gray600,
              borderRadius: 8,
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
          ),
        ],
      ),
    );
  }
}
