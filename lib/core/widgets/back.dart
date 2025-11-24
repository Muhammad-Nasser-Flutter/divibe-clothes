import 'package:cloth_ecommerce/core/cache_helper/cache_helper.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class Back extends StatelessWidget {
  const Back({
    super.key,
    this.reversed = false,
    this.iconSize,
    this.bGColor,
    this.iconColor,
    this.border,
    this.onPressed,
    // this.icon,
  });
  final bool reversed;
  final Color? iconColor;
  final double? iconSize;
  final Color? bGColor;
  final Border? border;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onPressed ??
          () {
            context.pop();
          },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.transparent),
            color: bGColor ?? Colors.transparent,
          ),
          child: Center(
            child: Iconify(
              CacheHelper.isEn ? Gg.arrow_left : Gg.arrow_right,
              size: iconSize ?? 16,
              color: iconColor ?? AppColors.secondary700Color,
            ),
          ),
        ),
      ),
    );
  }
}
