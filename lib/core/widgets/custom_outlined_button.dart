import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.borderColor = AppColors.gray300,
    this.backgroundColor = AppColors.pureWhite,
    this.foregroundColor = AppColors.pureBlack,
    required this.text,
    required this.onPressed,
    this.borderRadius = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
    this.spacing = 8,
    this.prefixIcon,
    this.suffixIcon,
    this.scaleValue = 1.05,
    this.angleValue = 0.05,
    this.opacityValue = 0.8,
    this.scalable = true,
    this.opacityChangable = true,
  });
  final Color borderColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final EdgeInsets padding;
  final double spacing;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double scaleValue;
  final double angleValue;
  final double opacityValue;
  final bool scalable;
  final bool opacityChangable;

  @override
  Widget build(BuildContext context) {
    return ScaleWidget(
      opacityChangable: opacityChangable,
      scalable: scalable,
      onTap: onPressed,
      scaleValue: scaleValue,
      angleValue: angleValue,
      opacityValue: opacityValue,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor,
          padding: padding,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          spacing: spacing,
          children: [
            ?prefixIcon,
            Text(
              text,
              style: context.bodyMedium.copyWith(
                color: foregroundColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            ?suffixIcon,
          ],
        ),
      ),
    );
  }
}
