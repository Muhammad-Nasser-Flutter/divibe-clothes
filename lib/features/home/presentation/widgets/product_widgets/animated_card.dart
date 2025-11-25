import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedCard extends HookWidget {
  const AnimatedCard({super.key, required this.child, this.offsetValue});

  final Widget child;
  final Offset? offsetValue;

  @override
  Widget build(BuildContext context) {
    final duration = const Duration(milliseconds: 500);
    final isHovered = useState(false);
    final offset = isHovered.value ? (offsetValue ?? const Offset(0, -20)) : Offset.zero;
    return MouseRegion(
      onEnter: (event) {
        isHovered.value = true;
      },
      onExit: (event) {
        isHovered.value = false;
      },
      child: AnimatedContainer(
        duration: duration,
        transform: Matrix4.translationValues(offset.dx, offset.dy, 0),
        curve: Curves.easeIn,
        child: child,
      ),
    );
  }
}
