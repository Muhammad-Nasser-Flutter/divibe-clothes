import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class StockStatusBadge extends StatelessWidget {
  final ProductVariant? selectedVariant;

  const StockStatusBadge({
    super.key,
    required this.selectedVariant,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedVariant == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: selectedVariant!.isInStock
                ? AppColors.primaryColor.withValues(alpha: 0.1)
                : AppColors.redColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selectedVariant!.isInStock ? Icons.check_circle : Icons.error,
                size: 16,
                color: selectedVariant!.isInStock ? AppColors.primaryColor : AppColors.redColor,
              ),
              const SizedBox(width: 6),
              Text(
                selectedVariant!.isInStock
                    ? selectedVariant!.isLowStock
                          ? 'Only ${selectedVariant!.stock} left'
                          : 'In Stock'
                    : 'Out of Stock',
                style: context.bodySmall.copyWith(
                  color: selectedVariant!.isInStock ? AppColors.primaryColor : AppColors.redColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
