import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/widgets/animatable_icon.dart';
import 'package:cloth_ecommerce/core/widgets/separator.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_ui_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/search_results_overlay.dart';
import 'package:cloth_ecommerce/features/main_layout/main_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/hero_section.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/product_widgets/products_section.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/stats_section.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  static final GlobalKey productsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          // final selectedCategory = ref.watch(selectedCategoryProvider);

          final isSearchOpen = ref.watch(isSearchOpenProvider);

          return Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 140),
                child: Column(
                  children: [
                    // Hero Section
                    RepaintBoundary(
                      child: ColoredBox(
                        color: AppColors.containerWhite,
                        child: Column(
                          children: [
                            const HeroSection(),

                            // Stats Section
                            const StatsSection(),
                            20.height,
                            const AnimatableIcon(
                              startOffset: Offset(0, 0),
                              endOffset: Offset(0, -10),
                              child: Iconify(
                                Gg.mouse,
                                color: AppColors.gray600,
                                size: 30,
                              ),
                            ),
                            20.height,
                          ],
                        ),
                      ),
                    ),

                    Separator(
                      color: Colors.grey.shade100,
                    ),

                    const SizedBox(height: 50),

                    // Products Section
                    ProductsSection(
                      key: productsKey,
                      scaffoldKey: MainLayoutScreen.scaffoldKey,
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),

              // Search Results Overlay
              if (isSearchOpen)
                Positioned(
                  top: 0,
                  // left: 0,
                  right: 124,
                  child: Container(
                    width: 400,
                    margin: const EdgeInsets.symmetric(horizontal: 140),
                    child: const SearchResultsOverlay(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
