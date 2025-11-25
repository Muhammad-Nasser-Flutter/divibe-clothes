import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomElevatedButton extends HookWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.pureBlack,
    this.foregroundColor = AppColors.pureWhite,
    this.borderRadius = 50,
    this.elevation = 0,
    this.suffixIcon,
    this.prefixIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
    this.spacing = 8,
    this.scaleValue = 1.05,
    this.angleValue = 0.05,
    this.opacityValue = 0.8,
    this.scalable = true,
    this.opacityChangable = true,
  });

  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final double borderRadius;
  final double elevation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsets padding;
  final double spacing;
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
      scaleValue: scaleValue,
      angleValue: angleValue,
      opacityValue: opacityValue,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
