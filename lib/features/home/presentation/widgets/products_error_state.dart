import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Error state widget with retry button
class ProductsErrorState extends ConsumerWidget {
  final String message;

  const ProductsErrorState({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.redColor,
          ),
          const SizedBox(height: 16),
          Text(
            'Oops! Something went wrong',
            style: context.headlineSmall.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: context.bodyLarge.copyWith(
              color: AppColors.gray600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          CustomElevatedButton(
            onPressed: () {
              ref.read(productsNotifierProvider.notifier).refresh();
            },
            text: 'Try Again',
          ),
        ],
      ),
    );
  }
}
