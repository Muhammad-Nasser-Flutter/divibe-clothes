import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/providers/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizeSelector extends ConsumerWidget {
  final ProductModel product;

  const SizeSelector({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (product.sizes.isEmpty) return const SizedBox.shrink();

    final detailsState = ref.watch(productDetailsProvider(product));
    final detailsNotifier = ref.read(productDetailsProvider(product).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          'Size',
          style: context.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: product.sizes.map((size) {
            final isSelected = detailsState.selectedSize == size;
            return ScaleWidget(
              onTap: () => detailsNotifier.updateSize(size),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.pureBlack : AppColors.pureWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? AppColors.pureBlack : AppColors.gray300,
                    width: 1,
                  ),
                ),
                child: Text(
                  size,
                  style: context.bodyMedium.copyWith(
                    color: isSelected ? AppColors.pureWhite : AppColors.gray700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
