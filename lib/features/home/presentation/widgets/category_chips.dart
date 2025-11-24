import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/utilies/functions.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/category_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
  });

  void _onCategorySelected(String category, WidgetRef ref) {
    final currentCategory = ref.read(selectedCategoryProvider);
    if (currentCategory == category) return;

    // Update category using Riverpod - this is instant
    ref.read(selectedCategoryProvider.notifier).state = category;

    goToHomeSection(HomeScreen.productsKey);
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Hoodies',
      'Jeans',
      'T-Shirts',
      'Sweatpants',
      'Jackets',
      'Shorts',
      'Accessories',
    ];

    return Consumer(
      builder: (context, ref, child) {
        final selectedCategory = ref.watch(selectedCategoryProvider);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            ...categories.map((category) {
              return CategoryWidget(
                category: category,
                isSelected: selectedCategory == category,
                onTap: () {
                  _onCategorySelected(category, ref);
                },
              );
            }),
          ],
        );
      },
    );
  }
}

class CategoryWidget extends HookWidget {
  const CategoryWidget({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;

  final String category;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.pureBlack : AppColors.textSecondary;

    return ScaleWidget(
      onTap: onTap,
      isScaled: isSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transformAlignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: isSelected
                ? BorderSide(
                    color: color,
                    width: 2,
                  )
                : BorderSide.none,
          ),
        ),
        child: Center(
          child: Text(
            category,
            style: context.bodyMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
