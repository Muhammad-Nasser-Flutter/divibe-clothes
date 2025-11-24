import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundedText extends StatelessWidget {
  const BackgroundedText({
    super.key,
    this.textSize,
    this.textColor,
    this.prefixIconColor,
    this.backgroundColor,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    required this.text,
    this.hasChevron = false,
    this.onPressed,
    this.hasPrefix = false,
    this.prefixIconAsset,
    this.border,
    this.textWeight = FontWeight.w600,
    this.isReversed = false,
    this.iconSize,
    this.enabled = true,
    this.height,
    this.textAlign = TextAlign.start,
    this.ignoreTopStartBorderRadius = false,
    this.ignoreTopEndBorderRadius = false,
    this.ignoreBottomStartBorderRadius = false,
    this.ignoreBottomEndBorderRadius = false,
    this.alignment,
    this.spacing,
  });
  final String text;
  final double? textSize;
  final Color? textColor;
  final Color? prefixIconColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool hasChevron;
  final bool hasPrefix;
  final String? prefixIconAsset;
  final VoidCallback? onPressed;
  final FontWeight textWeight;
  final Border? border;
  final bool isReversed;
  final double? iconSize;
  final bool enabled;
  final double? height;
  final TextAlign textAlign;
  final bool ignoreTopStartBorderRadius;
  final bool ignoreTopEndBorderRadius;
  final bool ignoreBottomStartBorderRadius;
  final bool ignoreBottomEndBorderRadius;
  final MainAxisAlignment? alignment;
  final double? spacing;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onPressed : null,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 20, vertical: verticalPadding ?? 12),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadiusDirectional.only(
            topStart: ignoreTopStartBorderRadius ? Radius.zero : Radius.circular(borderRadius ?? 5),
            topEnd: ignoreTopEndBorderRadius ? Radius.zero : Radius.circular(borderRadius ?? 5),
            bottomStart: ignoreBottomStartBorderRadius ? Radius.zero : Radius.circular(borderRadius ?? 5),
            bottomEnd: ignoreBottomEndBorderRadius ? Radius.zero : Radius.circular(borderRadius ?? 5),
          ),
          color: !enabled ? Colors.grey : (backgroundColor ?? AppColors.primary400Color),
        ),
        child: IntrinsicWidth(
          child: Row(
            textDirection: isReversed ? TextDirection.rtl : TextDirection.ltr,
            mainAxisAlignment: alignment ?? MainAxisAlignment.center,
            spacing: spacing ?? 10,
            children: [
              if (hasPrefix)
                SvgPicture.asset(
                  prefixIconAsset!,
                  colorFilter: prefixIconColor != null ? ColorFilter.mode(prefixIconColor!, BlendMode.srcIn) : null,
                  height: iconSize ?? 20,
                ),

              Flexible(
                child: Text(
                  text,
                  style: context.bodySmall.copyWith(
                    fontSize: textSize,
                    height: 1.3,
                    color: textColor ?? Colors.white,
                    letterSpacing: 0.3,
                    fontWeight: textWeight,
                  ),
                  maxLines: 1,
                ),
              ),
              if (hasChevron) Icon(Icons.keyboard_arrow_down, color: Colors.white, size: iconSize ?? 15),
            ],
          ),
        ),
      ),
    );
  }
}
