import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScaleWidget extends HookWidget {
  const ScaleWidget({
    super.key,
    required this.child,
    this.isScaled = false,
    this.onTap,
    this.rotatable = false,
    this.scalable = true,
    this.opacityChangable = false,
    this.scaleValue = 1.1,
    this.angleValue = 0.1,
    this.opacityValue = 0.8,
  });
  final bool isScaled;
  final Widget child;
  final Function()? onTap;
  final bool rotatable;
  final bool scalable;
  final bool opacityChangable;
  final double scaleValue;
  final double angleValue;
  final double opacityValue;
  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    final tapped = useState(false);
    final scale = tapped.value ? 0.98 : (isHovered.value || isScaled ? scaleValue : 1.0);
    final angle = tapped.value ? 0.0 : (isHovered.value || isScaled ? angleValue : 0.0);
    final opacity = isHovered.value || isScaled ? opacityValue : 1.0;
    return GestureDetector(
      onTap: onTap,
      onTapDown: (_) {
        tapped.value = true;
      },
      onTapUp: (_) {
        tapped.value = false;
      },
      onTapCancel: () {
        tapped.value = false;
      },
      child: MouseRegion(
        onEnter: (event) {
          isHovered.value = true;
        },
        onExit: (event) {
          isHovered.value = false;
        },
        child: AnimatedRotation(
          duration: const Duration(milliseconds: 100),
          turns: rotatable ? angle : 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: opacityChangable ? opacity : 1,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 100),
              scale: scalable ? scale : 1,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
