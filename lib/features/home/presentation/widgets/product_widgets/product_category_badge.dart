import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';

class ProductCategoryBadge extends StatelessWidget {
  const ProductCategoryBadge({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      left: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.badgeHoodies,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SelectableText(
          productName,
          style: context.bodySmall.copyWith(
            color: AppColors.pureWhite,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
