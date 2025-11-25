import 'dart:ui';

import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_bloc.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_state.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_ui_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/category_chips.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

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
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isSearchOpen
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SizedBox(
                              width: 400,
                              child: TextField(
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
                        )
                      : const CategoryChips(),
                ),
              ),

              // Search Icon
              ScaleWidget(
                child: IconButton(
                  icon: Iconify(
                    isSearchOpen ? Gg.close : Gg.search,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () {
                    ref.read(isSearchOpenProvider.notifier).state = !isSearchOpen;
                    if (!isSearchOpen) {
                      searchController.clear();
                      ref.read(searchProvider.notifier).clear();
                    } else {
                      searchFocusNode.requestFocus();
                    }
                  },
                ),
              ),
              20.width,

              // Cart Icon with Badge
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ScaleWidget(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          icon: const Iconify(
                            Gg.shopping_bag,
                            color: AppColors.textPrimary,
                          ),
                          onPressed: () {
                            scaffoldKey.currentState?.openEndDrawer();
                          },
                        ),
                        if (state.itemCount > 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IgnorePointer(
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: AppColors.pureBlack,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 18,
                                  minHeight: 18,
                                ),
                                child: Text(
                                  '${state.itemCount}',
                                  style: context.bodySmall.copyWith(
                                    color: AppColors.pureWhite,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ).paddingSymmetric(horizontal: 140),
        ),
      ),
    );
  }
}
