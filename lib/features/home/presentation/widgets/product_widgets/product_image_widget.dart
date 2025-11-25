import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/core/widgets/hover_blur_overlay.dart';
import 'package:cloth_ecommerce/features/cart/presentation/providers/cart_provider.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    super.key,
    required ProductVariant? selectedVariant,
    required this.ref,
    required this.product,
    required this.scaffoldKey,
  }) : _selectedVariant = selectedVariant;

  final ProductVariant? _selectedVariant;
  final WidgetRef ref;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return HoverBlurOverlay(
      overlayWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            prefixIcon: const Iconify(Gg.shopping_cart),
            onPressed: () {
              if (_selectedVariant != null && _selectedVariant.isInStock) {
                ref.read(cartNotifierProvider.notifier).addToCart(product, _selectedVariant);
                scaffoldKey.currentState?.openEndDrawer();
              }
            },
            backgroundColor: (_selectedVariant?.isInStock ?? true) ? AppColors.pureWhite : AppColors.gray300,
            foregroundColor: (_selectedVariant?.isInStock ?? true) ? AppColors.pureBlack : AppColors.gray600,
            opacityChangable: false,
            text: 'Add to Cart',
          ),
          const SizedBox(height: 16),
          CustomElevatedButton(
            // prefixIcon: const Iconify(Gg.details_more, color: AppColors.pureWhite),
            onPressed: () {
              context.go('/product/${product.id}');
            },
            backgroundColor: (_selectedVariant?.isInStock ?? true) ? AppColors.pureBlack : AppColors.gray300,
            foregroundColor: (_selectedVariant?.isInStock ?? true) ? AppColors.pureWhite : AppColors.gray600,
            opacityChangable: false,
            text: 'View Details',
          ),
        ],
      ),

      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          imageUrl: product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
