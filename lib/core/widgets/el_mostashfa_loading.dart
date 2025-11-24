import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../theming/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: AppColors.primaryColor,
        size: size ?? 50,
      ),
    );
  }
}
