import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/utilies/functions.dart';
import 'package:cloth_ecommerce/core/widgets/animatable_icon.dart';
import 'package:cloth_ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:cloth_ecommerce/core/widgets/custom_outlined_button.dart';
import 'package:cloth_ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';
import 'package:cloth_ecommerce/core/widgets/fade_in_widget.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          // New Collection Badge
          FadeInWidget(
            offsetFromValue: const Offset(0, 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.circle,
                    size: 8,
                  ),
                  const SizedBox(width: 8),
                  SelectableText(
                    'New Collection 2025',
                    style: context.bodyMedium.copyWith(
                      color: AppColors.pureBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Main Headline
          Column(
            children: [
              FadeInWidget(
                offsetFromValue: const Offset(0, 20),
                duration: const Duration(milliseconds: 500),
                child: SelectableText(
                  'Wear Your',
                  textAlign: TextAlign.center,
                  style: context.headlineLarge.copyWith(
                    fontSize: 90,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    height: 1,
                  ),
                ),
              ),
              FadeInWidget(
                offsetFromValue: const Offset(0, 20),
                duration: const Duration(milliseconds: 700),
                child: ShaderMask(
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
                    'Vibe',
                    textAlign: TextAlign.center,
                    style: context.headlineLarge.copyWith(
                      fontSize: 90,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: AppColors.pureWhite, // Color is required for ShaderMask
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Subtitle
          FadeInWidget(
            offsetFromValue: const Offset(0, 20),
            duration: const Duration(milliseconds: 900),
            child: SelectableText(
              'Express yourself with our curated collection of streetwear essentials.\nPremium quality meets contemporary style.',
              textAlign: TextAlign.center,
              style: context.bodyLarge.copyWith(
                color: AppColors.gray800,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // CTA Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInWidget(
                offsetFromValue: const Offset(0, 20),
                duration: const Duration(milliseconds: 1100),
                child: CustomElevatedButton(
                  onPressed: () {
                    goToHomeSection(HomeScreen.productsKey);
                  },
                  text: 'Shop Now',
                  suffixIcon: const AnimatableIcon(
                    startOffset: Offset(0, 0),
                    endOffset: Offset(8, 0),
                    child: Iconify(
                      Gg.arrow_right_o,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              FadeInWidget(
                offsetFromValue: const Offset(0, 20),
                duration: const Duration(milliseconds: 1300),
                child: CustomOutlinedButton(
                  onPressed: () {},
                  text: 'View Lookbook',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
