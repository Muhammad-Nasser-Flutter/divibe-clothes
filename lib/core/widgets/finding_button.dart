import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/widgets/custom_button.dart';

class FindingButton extends StatelessWidget {
  const FindingButton({
    super.key,
    required this.disabled,
    required this.onPressed,
    required this.text,
    this.color,
    this.height,
    this.fontSize,
  });
  final bool disabled;
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      disabled: disabled,
      fontSize: fontSize ?? 18,
      text: text,
      borderRadius: 15,
      onPressed: onPressed,
      fontWeight: FontWeight.w500,
      height: height ?? 50,
      color: color,
    );
  }
}
