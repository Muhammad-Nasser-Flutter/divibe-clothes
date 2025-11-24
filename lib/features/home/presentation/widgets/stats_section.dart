import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatsWidget(
            value: '500+',
            label: 'Products',
          ),
          StatsWidget(
            value: '10K+',
            label: 'Happy Customers',
          ),
          StatsWidget(
            value: '4.9',
            label: 'Reviews',
            suffixIcon: Iconify(
              Ph.star_fill,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class StatsWidget extends StatelessWidget {
  const StatsWidget({
    super.key,
    required this.value,
    required this.label,
    this.suffixIcon,
  });

  final String value;
  final String label;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SelectableText(
              value,
              style: context.headlineLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            ?suffixIcon,
          ],
        ),
        const SizedBox(height: 4),
        SelectableText(
          label,
          style: context.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
