import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';

class UnderLineText extends StatelessWidget {
  const UnderLineText({
    super.key,
    required this.text,
    this.size,
    this.textColor,
    this.onTap,
    this.weight,
    this.height,
    this.underLineColor,
    this.direction,
    this.fontStyle,
  });
  final String text;
  final double? size;
  final Color? textColor;
  final Color? underLineColor;
  final VoidCallback? onTap;
  final FontWeight? weight;
  final double? height;
  final TextDirection? direction;
  final FontStyle? fontStyle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: underLineColor ?? AppColors.primaryColor, // Set the color of the line
              width: 1.0, // Set the width of the line
            ),
          ),
        ),
        child: Text(
          text,
          style: context.bodyMedium.copyWith(
            fontSize: size,
            height: height,
            color: textColor,
            fontWeight: weight ?? FontWeight.w400,
          ),
          textDirection: direction,
        ),
      ),
    );
  }
}
