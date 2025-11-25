import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/providers/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorSelector extends ConsumerWidget {
  final ProductModel product;

  const ColorSelector({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (product.colors.isEmpty) return const SizedBox.shrink();

    final detailsState = ref.watch(productDetailsProvider(product));
    final detailsNotifier = ref.read(productDetailsProvider(product).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          'Color',
          style: context.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: product.colors.map((colorHex) {
            final isSelected = detailsState.selectedColor == colorHex;
            return ScaleWidget(
              scaleValue: 1.2,
              onTap: () => detailsNotifier.updateColor(colorHex),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: colorHex.toColor(),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.pureBlack : AppColors.gray300,
                    width: isSelected ? 3 : 2,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
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
