import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/providers/product_details_provider.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/widgets/color_selector.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/widgets/product_action_buttons.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/widgets/product_image_section.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/widgets/product_info_section.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/widgets/size_selector.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/widgets/stock_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final ProductModel product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsState = ref.watch(productDetailsProvider(product));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image - Left Side
        Expanded(
          flex: 1,
          child: ProductImageSection(product: product),
        ),
        50.width,

        // Product Details - Right Side
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Info (Category, Name, Rating, Price, Description)
                ProductInfoSection(
                  product: product,
                  currentPrice: detailsState.selectedVariant?.price,
                ),

                // Color Selector
                ColorSelector(product: product),

                // Size Selector
                SizeSelector(product: product),

                // Stock Status
                StockStatusBadge(selectedVariant: detailsState.selectedVariant),

                // Action Buttons (Favorites & Add to Cart)
                ProductActionButtons(
                  product: product,
                  selectedVariant: detailsState.selectedVariant,
                ),
              ],
            ),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 140, vertical: 24);
  }
}
