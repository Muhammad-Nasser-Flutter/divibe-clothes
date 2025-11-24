import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/core/widgets/el_mostashfa_loading.dart';
import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/products_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/product_card.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/products_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Products grid with pagination support
class ProductsGrid extends ConsumerWidget {
  final List<ProductModel> products;
  final bool hasMore;
  final bool isLoadingMore;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProductsGrid({
    super.key,
    required this.products,
    required this.hasMore,
    required this.isLoadingMore,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (products.isEmpty) {
      return const ProductsEmptyState();
    }

    return Column(
      children: [
        Padding(
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
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                key: ValueKey(product.id),
                product: product,
                scaffoldKey: scaffoldKey,
              );
            },
          ),
        ),

        // Load More Button or Loading Indicator
        if (hasMore) ...[
          const SizedBox(height: 32),
          if (isLoadingMore)
            const LoadingWidget()
          else
            CustomElevatedButton(
              onPressed: () {
                ref.read(productsNotifierProvider.notifier).loadMore();
              },
              text: 'Load More Products',
            ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}
