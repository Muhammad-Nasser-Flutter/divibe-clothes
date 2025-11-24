import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/widgets/animatable_icon.dart';
import 'package:cloth_ecommerce/core/widgets/separator.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_bloc.dart';
import 'package:cloth_ecommerce/features/cart/presentation/widgets/cart_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/hero_section.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/products_section.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/stats_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class HomeScreen extends HookWidget {
  HomeScreen({super.key});

  static final GlobalKey productsKey = GlobalKey();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return BlocProvider(
      create: (context) => CartBloc(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: scaffoldKey,
        ),
        endDrawer: const CartDrawer(),
        body: Consumer(
          builder: (context, ref, child) {
            // final selectedCategory = ref.watch(selectedCategoryProvider);

            return SingleChildScrollView(
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
                    scaffoldKey: scaffoldKey,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
