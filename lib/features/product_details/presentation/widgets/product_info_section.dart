import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductModel product;
  final double? currentPrice;

  const ProductInfoSection({
    super.key,
    required this.product,
    this.currentPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppColors.gray200,
            borderRadius: BorderRadius.circular(6),
          ),
          child: SelectableText(
            product.category,
            style: context.bodySmall.copyWith(
              color: AppColors.gray700,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Product Name
        SelectableText(
          product.name,
          style: context.headlineLarge.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),

        // Rating and Reviews
        SelectableRegion(
          focusNode: FocusNode(),
          selectionControls: DesktopTextSelectionControls(),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                product.rating.toStringAsFixed(1),
                style: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '(${product.reviewCount} reviews)',
                style: context.bodyMedium.copyWith(
                  color: AppColors.gray600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Price
        SelectableText(
          '\$${(currentPrice ?? product.basePrice).toStringAsFixed(2)}',
          style: context.headlineMedium.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 24),

        // Description
        if (product.description != null) ...[
          SelectableText(
            'Description',
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          SelectableText(
            product.description!,
            style: context.bodyMedium.copyWith(
              color: AppColors.gray700,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ],
    );
  }
}
