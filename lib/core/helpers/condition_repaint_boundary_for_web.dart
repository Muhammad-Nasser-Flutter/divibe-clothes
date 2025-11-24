import 'package:flutter/material.dart';

/// A widget that conditionally wraps its child in a ConditionalRepaintBoundary
/// Only applies ConditionalRepaintBoundary in release mode to avoid debug issues on web
class ConditionalRepaintBoundary extends StatelessWidget {
  const ConditionalRepaintBoundary({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // if (kDebugMode && kIsWeb) {
    //   return child;
    // } else {
    return child;
    // }
  }
}
