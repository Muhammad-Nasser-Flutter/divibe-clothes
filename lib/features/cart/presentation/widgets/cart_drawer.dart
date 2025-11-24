import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_bloc.dart';
import 'package:cloth_ecommerce/features/cart/bloc/cart_state.dart';
import 'package:cloth_ecommerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 450,
      backgroundColor: AppColors.containerWhite,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(
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
                child: state.items.isEmpty
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
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return CartItemWidget(item: state.items[index]);
                        },
                      ),
              ),

              // Footer with totals
              if (state.items.isNotEmpty)
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
                            '\$${state.subtotal.toStringAsFixed(2)}',
                            style: context.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

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
                            '\$${state.shipping.toStringAsFixed(2)}',
                            style: context.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Divider
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
                            '\$${state.total.toStringAsFixed(2)}',
                            style: context.headlineSmall.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Checkout Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: CustomElevatedButton(
                          text: 'Proceed to Checkout',
                          onPressed: () {
                            // TODO: Implement checkout
                          },
                          backgroundColor: AppColors.pureBlack,
                          foregroundColor: AppColors.pureWhite,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
