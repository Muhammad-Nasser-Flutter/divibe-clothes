import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    super.key,
    required this.content,
    this.title,
    this.backgroundColor,
    this.insetHorzontalPadding,
    this.contentHorizontallPadding,
  });
  final Widget content;
  final Widget? title;
  final Color? backgroundColor;
  final double? insetHorzontalPadding;
  final double? contentHorizontallPadding;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: insetHorzontalPadding ?? 29,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: contentHorizontallPadding ?? 16,
        vertical: 24,
      ),
      content: SizedBox(width: 320, child: content),
      title: title,
    );
  }
}
