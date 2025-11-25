import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/providers/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VariantImageSelector extends ConsumerWidget {
  final ProductModel product;

  const VariantImageSelector({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsState = ref.watch(productDetailsProvider(product));
    final detailsNotifier = ref.read(productDetailsProvider(product).notifier);

    return Row(
      children: [
        // Left Arrow Button
        IconButton(
          onPressed: detailsNotifier.canScrollPrevious ? () => detailsNotifier.scrollToPreviousVariant() : null,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: detailsNotifier.canScrollPrevious ? AppColors.pureBlack : AppColors.gray300,
            size: 20,
          ),
        ),

        // Variant Images ListView
        Expanded(
          child: SizedBox(
            height: 100,
            child: Center(
              child: ListView.separated(
                controller: detailsState.variantScrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemCount: product.variants.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final variant = product.variants[index];
                  final isSelected = detailsState.selectedVariant?.id == variant.id;

                  return ScaleWidget(
                    onTap: () => detailsNotifier.selectVariant(variant),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? AppColors.pureBlack : AppColors.gray300,
                          width: isSelected ? 3 : 1,
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: variant.imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: AppColors.gray200,
                            child: const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.gray200,
                            child: const Icon(Icons.error_outline, size: 24),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // Right Arrow Button
        IconButton(
          onPressed: detailsNotifier.canScrollNext ? () => detailsNotifier.scrollToNextVariant() : null,
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: detailsNotifier.canScrollNext ? AppColors.pureBlack : AppColors.gray300,
            size: 20,
          ),
        ),
      ],
    );
  }
}
