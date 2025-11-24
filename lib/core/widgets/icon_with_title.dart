import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloth_ecommerce/core/widgets/conditional_repaint_boundary.dart';

class IconWithTitleWidget extends StatelessWidget {
  const IconWithTitleWidget({
    super.key,
    required this.svgIcon,
    required this.title,
    this.iconColor,
    this.iconSize,
    this.titleColor,
    this.titleSize,
    this.onTap,
    this.padding,
    this.isNetwork = false,
    this.spacing,
    this.hasIcon = true,
    this.weight,
    this.iconBackgroundColor,
  });
  final String svgIcon;
  final String title;
  final double? titleSize;
  final double? iconSize;
  final double? spacing;
  final Color? iconColor;
  final Color? titleColor;
  final VoidCallback? onTap;
  final bool hasIcon;
  final bool isNetwork;
  final double? padding;
  final FontWeight? weight;
  final Color? iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasIcon)
              CircleAvatar(
                radius: iconSize ?? 14,
                backgroundColor: iconBackgroundColor,
                child: ConditionalRepaintBoundary(
                  child: isNetwork
                      ? SvgPicture.network(
                          svgIcon,
                          width: iconSize ?? 14,
                          colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
                        )
                      : SvgPicture.asset(
                          svgIcon,
                          width: iconSize ?? 14,
                          colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
                        ),
                ),
              )
            else
              SizedBox(
                width: iconSize ?? 14,
              ),
            SizedBox(
              width: spacing ?? 5,
            ),
            Flexible(
              child: Text(
                title,
                style: context.bodySmall.copyWith(
                  fontSize: titleSize ?? 12,
                  color: titleColor,
                  fontWeight: weight ?? FontWeight.w500,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
