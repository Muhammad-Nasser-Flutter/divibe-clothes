import 'dart:ui';

import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_bloc.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_state.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/category_chips.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
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
                    // fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    color: AppColors.pureWhite, // Color is required for ShaderMask
                  ),
                ),
              ),

              const Expanded(
                child: CategoryChips(),
              ),

              ScaleWidget(
                child: IconButton(
                  icon: const Iconify(
                    Gg.search,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () {},
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
