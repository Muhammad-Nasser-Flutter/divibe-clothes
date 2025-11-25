import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsSearchTextField extends ConsumerWidget {
  const ProductsSearchTextField({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
  });

  final TextEditingController searchController;
  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: 400,
          child: TextField(
            onTapOutside: (event) {
              ref.read(isSearchOpenProvider.notifier).state = false;
            },
            controller: searchController,
            focusNode: searchFocusNode,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search products...',
              hintStyle: context.bodyMedium.copyWith(
                color: AppColors.gray500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.gray300,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.gray300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                        ref.read(searchProvider.notifier).clear();
                      },
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
