import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConditionalRepaintBoundary extends StatelessWidget {
  const ConditionalRepaintBoundary({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      return child;
    } else {
      return RepaintBoundary(
        child: child,
      );
    }
  }
}
