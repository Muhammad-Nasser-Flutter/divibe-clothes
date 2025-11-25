import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/conditional_builder.dart';
import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/core/widgets/custom_outlined_button.dart';
import 'package:cloth_ecommerce/core/widgets/default_dialog.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:cloth_ecommerce/features/favorites/presentation/widgets/favorite_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class FavoritesDrawer extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const FavoritesDrawer({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesNotifierProvider);
    final favorites = favoritesState.favorites;

    return Drawer(
      width: 450,
      backgroundColor: AppColors.containerWhite,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: AppColors.pureWhite,
              border: Border(
                bottom: BorderSide(color: AppColors.gray200),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite,
                  size: 28,
                  color: AppColors.redColor,
                ),
                const SizedBox(width: 12),
                Text(
                  'Favorites',
                  style: context.headlineMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (favorites.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.gray200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${favorites.length}',
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray700,
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                ScaleWidget(
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 24),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),

          // Favorites List
          Expanded(
            child: ConditionalBuilder(
              condition: favorites.isEmpty,
              fallback: (context) => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return FavoriteTile(
                    product: favorites[index],
                    scaffoldKey: scaffoldKey,
                  );
                },
              ),
              builder: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      size: 64,
                      color: AppColors.gray400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No favorites yet',
                      style: context.bodyLarge.copyWith(
                        color: AppColors.gray600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Start adding products you love!',
                      style: context.bodyMedium.copyWith(
                        color: AppColors.gray500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Footer with clear all button
          if (favorites.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                border: const Border(
                  top: BorderSide(color: AppColors.gray200),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: CustomOutlinedButton(
                text: 'Clear All Favorites',
                prefixIcon: const Iconify(
                  Gg.trash,
                  size: 18,
                  color: AppColors.redColor,
                ),
                onPressed: () {
                  // Show confirmation dialog
                  _showClearFavoritesDialog(context);
                },
                borderColor: AppColors.redColor,
                foregroundColor: AppColors.redColor,
                borderRadius: 8,
              ),
            ),
        ],
      ),
    );
  }
}

void _showClearFavoritesDialog(BuildContext screenContext) {
  showDialog(
    context: screenContext,
    builder: (context) => const ClearFavoritesDialog(),
  );
}

class ClearFavoritesDialog extends ConsumerWidget {
  const ClearFavoritesDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Clear Favorites',
              style: context.headlineSmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            16.height,
            Text(
              'Are you sure you want to remove all favorites?',
              style: context.bodyMedium,
            ),
            24.height,
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: 'Cancel',
                    backgroundColor: AppColors.pureBlack,
                    foregroundColor: AppColors.pureWhite,
                    borderRadius: 8,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                16.width,
                Expanded(
                  child: CustomElevatedButton(
                    text: 'Clear All',
                    prefixIcon: const Iconify(
                      Gg.trash,
                      size: 18,
                      color: AppColors.pureWhite,
                    ),
                    backgroundColor: AppColors.redColor,
                    foregroundColor: AppColors.pureWhite,
                    borderRadius: 8,
                    onPressed: () {
                      ref.read(favoritesNotifierProvider.notifier).clearFavorites();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
