import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/cart/presentation/providers/cart_provider.dart';
import 'package:cloth_ecommerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class CartDrawer extends ConsumerWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartNotifierProvider);

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
                const Iconify(
                  Gg.shopping_bag,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  'Your Cart',
                  style: context.headlineMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
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

          // Cart Items
          Expanded(
            child: cartState.items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Iconify(
                          Gg.shopping_cart,
                          size: 64,
                          color: AppColors.gray400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Your cart is empty',
                          style: context.bodyLarge.copyWith(
                            color: AppColors.gray600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartState.items.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(item: cartState.items[index]);
                    },
                  ),
          ),

          // Footer with totals
          if (cartState.items.isNotEmpty)
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
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Subtotal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: context.bodyLarge.copyWith(
                          color: AppColors.gray700,
                        ),
                      ),
                      Text(
                        '\$${cartState.subtotal.toStringAsFixed(2)}',
                        style: context.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Shipping
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: context.bodyLarge.copyWith(
                          color: AppColors.gray700,
                        ),
                      ),
                      Text(
                        '\$${cartState.shipping.toStringAsFixed(2)}',
                        style: context.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Divider(color: AppColors.gray200),
                  const SizedBox(height: 16),

                  // Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '\$${cartState.total.toStringAsFixed(2)}',
                        style: context.headlineSmall.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      text: 'Checkout',
                      prefixIcon: const Iconify(
                        Gg.credit_card,
                        color: AppColors.pureWhite,
                        size: 20,
                      ),
                      onPressed: () {
                        // TODO: Implement checkout
                      },
                      backgroundColor: AppColors.pureBlack,
                      foregroundColor: AppColors.pureWhite,
                      borderRadius: 12,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
