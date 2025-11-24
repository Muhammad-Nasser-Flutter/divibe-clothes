import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HoverBlurOverlay extends HookWidget {
  const HoverBlurOverlay({
    super.key,
    required this.child,
    required this.overlayWidget,
    this.blurAmount = 0.5,
    this.duration = const Duration(milliseconds: 500),
  });

  final Widget child;
  final Widget overlayWidget;
  final double blurAmount;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Stack(
        children: [
          // The main child content
          child,

          // Animated blur overlay
          AnimatedOpacity(
            opacity: isHovered.value ? 1.0 : 0.0,
            duration: duration,
            curve: Curves.easeInOut,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: isHovered.value ? blurAmount : 0,
                  sigmaY: isHovered.value ? blurAmount : 0,
                ),
                child: Container(
                  color: Colors.black12,
                  child: Center(
                    child: overlayWidget,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
