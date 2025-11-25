import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/providers/product_details_provider.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/widgets/variant_image_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductImageSection extends ConsumerWidget {
  final ProductModel product;

  const ProductImageSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsState = ref.watch(productDetailsProvider(product));

    return Column(
      children: [
        // Main Image
        Container(
          height: 500,
          margin: const EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
            color: AppColors.pureWhite,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: AppColors.gray200,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: detailsState.currentImageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: AppColors.gray200,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: AppColors.gray200,
                child: const Icon(Icons.error_outline, size: 64),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Variant Image Selector
        VariantImageSelector(product: product),
        const SizedBox(height: 24),
      ],
    );
  }
}
