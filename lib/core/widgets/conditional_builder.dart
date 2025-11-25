import 'package:flutter/material.dart';

class ConditionalBuilder extends StatelessWidget {
  const ConditionalBuilder({
    super.key,
    required this.condition,
    required this.builder,
    required this.fallback,
  });

  final bool condition;
  final Widget Function(BuildContext context) builder;
  final Widget Function(BuildContext context) fallback;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: condition ? builder(context) : fallback(context),
    );
  }
}
