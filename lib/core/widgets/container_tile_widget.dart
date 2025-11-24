import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';

class ContainerTileWidget extends StatelessWidget {
  const ContainerTileWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.prefixWidget,
    this.suffixWidget,
    this.horizontalPadding,
    this.verticalPadding,
    this.bgColor,
    this.titleColor,
  });
  final VoidCallback onTap;
  final String title;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? bgColor;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 16, horizontal: horizontalPadding ?? 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.defaultBorderColor, width: 1),
          color: bgColor ?? AppColors.containerBGColor,
        ),
        child: Row(
          children: [
            if (prefixWidget != null) prefixWidget!,
            if (prefixWidget != null) 8.width,
            Expanded(
              child: Text(
                title,
                style: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            suffixWidget ??
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: titleColor ?? AppColors.secondary800Color,
                ),
          ],
        ),
      ),
    );
  }
}
