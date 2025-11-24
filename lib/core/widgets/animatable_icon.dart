import 'package:flutter/material.dart';

/// An animatable widget that continuously animates a child widget
/// from a start offset to an end offset and back, repeatedly.
class AnimatableIcon extends StatefulWidget {
  /// The widget to animate (typically an Icon)
  final Widget child;

  /// Starting position offset
  final Offset startOffset;

  /// Ending position offset
  final Offset endOffset;

  /// Duration for one-way animation (start to end)
  final Duration duration;

  /// Optional curve for the animation
  final Curve curve;

  const AnimatableIcon({
    super.key,
    required this.child,
    required this.startOffset,
    required this.endOffset,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeInOut,
  });

  @override
  State<AnimatableIcon> createState() => _AnimatableIconState();
}

class _AnimatableIconState extends State<AnimatableIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Create the offset animation with the specified curve
    _offsetAnimation =
        Tween<Offset>(
          begin: widget.startOffset,
          end: widget.endOffset,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: widget.curve,
          ),
        );

    // Start the animation and repeat with reverse
    _controller.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(AnimatableIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update animation if parameters changed
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }

    if (oldWidget.startOffset != widget.startOffset ||
        oldWidget.endOffset != widget.endOffset ||
        oldWidget.curve != widget.curve) {
      _offsetAnimation =
          Tween<Offset>(
            begin: widget.startOffset,
            end: widget.endOffset,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: widget.curve,
            ),
          );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: _offsetAnimation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
