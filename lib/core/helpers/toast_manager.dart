import 'package:flutter/material.dart';
import '../theming/colors.dart';

void showInfoToast(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.yellow,
      content: Text(
        message,
        style: context.bodyMedium.copyWith(),
      ),
    ),
  );
}

void showSuccessToast(
  String message,
  context,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primary400Color,
      content: Text(
        message,
        style: context.bodyMedium.copyWith(),
      ),
    ),
  );
}

void showErrorToast(String title, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        title,
        style: context.bodyMedium.copyWith(),
      ),
    ),
  );
}
