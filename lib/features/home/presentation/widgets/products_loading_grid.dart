import 'package:cloth_ecommerce/core/constants/product_constants.dart';
import 'package:cloth_ecommerce/core/widgets/skeletonizer_widget.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

/// Loading state widget with skeleton loaders
class ProductsLoadingGrid extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProductsLoadingGrid({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    // Get sample products for skeleton loading
    final sampleProducts = ProductConstants.getSampleProducts().take(4).toList();

    return SkeletonizerWidget(
      isLoading: true,
      isAnimated: true,
      ignoreContainers: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 600,
          ),
          itemCount: sampleProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: sampleProducts[index],
              scaffoldKey: scaffoldKey,
            );
          },
        ),
      ),
    );
  }
}
