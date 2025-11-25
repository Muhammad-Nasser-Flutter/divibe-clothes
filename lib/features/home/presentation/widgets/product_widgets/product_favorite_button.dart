
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductFavoriteButton extends StatelessWidget {
  const ProductFavoriteButton({
    super.key,
    required this.ref,
    required this.product,
    required this.isFavorite,
  });

  final WidgetRef ref;
  final ProductModel product;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      right: 12,
      child: ScaleWidget(
        onTap: () {
          ref.read(favoritesNotifierProvider.notifier).toggleFavorite(product);
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
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? AppColors.redColor : AppColors.textSecondary,
            size: 20,
          ),
        ),
      ),
    );
  }
}
