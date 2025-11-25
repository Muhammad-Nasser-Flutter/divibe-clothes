import 'dart:ui';

import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/conditional_builder.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_ui_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/app_bar_widgets/cart_app_bar_widget.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/app_bar_widgets/category_chips.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/app_bar_widgets/close_search_button.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/app_bar_widgets/favorites_app_bar_widget.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/app_bar_widgets/open_search_button.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/app_bar_widgets/products_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearchOpen = ref.watch(isSearchOpenProvider);
    final searchController = useTextEditingController();
    final searchFocusNode = useFocusNode();

    // Listen to search field changes
    useEffect(() {
      void listener() {
        ref.read(searchProvider.notifier).search(searchController.text);
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);

    // Close search when clicking outside
    useEffect(() {
      void focusListener() {
        if (!searchFocusNode.hasFocus && searchController.text.isEmpty) {
          Future.delayed(const Duration(milliseconds: 200), () {
            if (context.mounted) {
              ref.read(isSearchOpenProvider.notifier).state = false;
              ref.read(searchProvider.notifier).clear();
            }
          });
        }
      }

      searchFocusNode.addListener(focusListener);
      return () => searchFocusNode.removeListener(focusListener);
    }, [searchFocusNode]);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: AppColors.gray200.withValues(alpha: 0.5),
              ),
            ),
          ),
          child: Row(
            children: [
              // Logo
              if (!isSearchOpen)
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        AppColors.primaryGradientStart,
                        AppColors.primaryGradientEnd,
                        AppColors.accentBlue,
                      ],
                    ).createShader(bounds);
                  },
                  child: SelectableText(
                    'DiVibe',
                    textAlign: TextAlign.center,
                    style: context.headlineLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: AppColors.pureWhite,
                    ),
                  ),
                ),

              // Category Chips or Search Field
              Expanded(
                child: ConditionalBuilder(
                  condition: isSearchOpen,
                  fallback: (context) => const CategoryChips(),
                  builder: (context) => ProductsSearchTextField(
                    searchController: searchController,
                    searchFocusNode: searchFocusNode,
                  ),
                ),
              ),

              // Search Icon
              ConditionalBuilder(
                fallback: (context) => OpenSearchButton(
                  searchController: searchController,
                  searchFocusNode: searchFocusNode,
                ),
                condition: isSearchOpen,
                builder: (context) => CloseSearchButton(
                  searchController: searchController,
                  searchFocusNode: searchFocusNode,
                ),
              ),
              20.width,

              // Favorites Icon with Badge
              FavoritesAppBarWidget(scaffoldKey: scaffoldKey),
              20.width,

              // Cart Icon with Badge
              CartAppBarWidget(scaffoldKey: scaffoldKey),
              const SizedBox(width: 8),
            ],
          ).paddingSymmetric(horizontal: 140),
        ),
      ),
    );
  }
}

