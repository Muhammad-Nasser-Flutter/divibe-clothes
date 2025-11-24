import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/category_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/products_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/products_state.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/products_error_state.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/products_grid.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/products_loading_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show useEffect;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsSection extends HookConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProductsSection({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final productsState = ref.watch(productsNotifierProvider);

    // Load products when category changes
    useEffect(() {
      Future.microtask(() {
        ref
            .read(productsNotifierProvider.notifier)
            .loadProducts(
              category: selectedCategory,
            );
      });
      return null;
    }, [selectedCategory]);

    return Column(
      children: [
        // Section Header
        SelectableText(
          selectedCategory == 'All' ? 'Latest Drops' : selectedCategory,
          style: context.displayMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 16),

        SelectableText(
          selectedCategory == 'All'
              ? 'Fresh styles, hand-picked for you'
              : 'Explore our ${selectedCategory.toLowerCase()} collection',
          style: context.bodyLarge.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.gray900,
          ),
        ),
        const SizedBox(height: 50),

        // Products Grid based on state
        switch (productsState) {
          ProductsLoading() => ProductsLoadingGrid(scaffoldKey: scaffoldKey),
          ProductsError(:final message) => ProductsErrorState(message: message),
          ProductsData(:final products, :final hasMore, :final isLoadingMore) => ProductsGrid(
            products: products,
            hasMore: hasMore,
            isLoadingMore: isLoadingMore,
            scaffoldKey: scaffoldKey,
          ),
        },
      ],
    );
  }
}
