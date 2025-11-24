import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double? margin;
  final Color? color;
  const Separator({super.key, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin ?? 0),
      width: double.maxFinite,
      height: 1,
      color: color ?? Colors.grey.shade300,
    );
  }
}
