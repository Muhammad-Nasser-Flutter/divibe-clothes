import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerWidget extends StatelessWidget {
  const SkeletonizerWidget({
    super.key,
    required this.child,
    this.isLoading = true,
    this.isAnimated = false,
    this.ignoreContainers = false,
  });
  final Widget child;
  final bool isLoading;
  final bool isAnimated;
  final bool ignoreContainers;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enableSwitchAnimation: isAnimated,
      containersColor: Colors.grey.shade100,
      effect: ShimmerEffect(
        // begin: AlignmentDirectional.centerStart,
        // end: AlignmentDirectional.centerEnd,
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey[400]!,
        duration: const Duration(seconds: 2),
      ),
      ignorePointers: true,
      justifyMultiLineText: true,
      ignoreContainers: ignoreContainers,
      enabled: isLoading,
      textBoneBorderRadius: const TextBoneBorderRadius.fromHeightFactor(0.3),
      switchAnimationConfig: const SwitchAnimationConfig(
        duration: Duration(seconds: 2),
        switchInCurve: Curves.easeInCubic,
        reverseDuration: Duration(seconds: 1),
      ),
      child: child,
    );
  }
}
