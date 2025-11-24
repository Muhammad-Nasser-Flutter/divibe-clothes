import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({
    super.key,
    required this.delay,
    this.scaleFrom = Alignment.center,
    required this.child,
    this.beginScale = 0.0,
  });

  ///Begin scale value for the animation, default is 0.0 should be between 0.0 and 1.0
  ///Delay for the animation, delay*2000 milliseconds
  ///Child widget to be animated
  ///Alignment from which the scale animation will start, default is Alignment.center

  final double delay;
  final Widget child;
  final AlignmentGeometry scaleFrom;
  final double beginScale;

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  // late Animation<Offset> offsetAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (2000 * widget.delay).round()),
    );

    scaleAnimation = Tween<double>(begin: widget.beginScale, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.fastEaseInToSlowEaseOut))
      ..addListener(() {
        if (mounted) setState(() {});
      });
    // offsetAnimation = Tween<Offset>(
    //   begin: widget.startingOffset,
    //   end: const Offset(0, 0),
    // ).animate(
    //   CurvedAnimation(parent: controller, curve: Curves.fastEaseInToSlowEaseOut),
    // )..addListener(
    //     () {
    //       if (mounted) setState(() {});
    //     },
    //   );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Transform.scale(
      alignment: widget.scaleFrom,
      scale: scaleAnimation.value,
      child: widget.child,
    );
  }
}
