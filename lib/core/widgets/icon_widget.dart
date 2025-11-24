import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloth_ecommerce/core/widgets/conditional_repaint_boundary.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    this.onPressed,
    required this.iconAsset,
    this.size,
    this.padding,
    this.iconColor,
    this.bGColor,
    this.border,
    this.radius,
    this.isNetwork = false,
    this.width,
    this.height,
  });
  final VoidCallback? onPressed;
  final String iconAsset;
  final double? size;
  final double? padding;
  final Color? iconColor;
  final Color? bGColor;
  final Border? border;
  final double? radius;
  final bool isNetwork;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding != null ? padding! : 10),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(radius ?? 6),
          color: bGColor,
        ),
        child: ConditionalRepaintBoundary(
          child: isNetwork
              ? SvgPicture.network(
                  iconAsset,
                  width: size ?? 25,
                  colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
                  height: 25,
                )
              : SvgPicture.asset(
                  iconAsset,
                  width: size ?? 25,
                  colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
                ),
        ),
      ),
    );
  }
}
