import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FadeInWidget extends HookWidget {
  const FadeInWidget({super.key, required this.child, this.offsetFromValue, this.duration});

  final Widget child;
  final Offset? offsetFromValue;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final opacity = useState<double>(0.4);
    final currentOffset = useState<Offset>(offsetFromValue ?? Offset.zero);

    useEffect(() {
      Future.delayed(Duration.zero, () {
        opacity.value = 1.0;
        currentOffset.value = Offset.zero;
      });
      return null;
    }, const []);

    return AnimatedContainer(
      duration: duration ?? const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(currentOffset.value.dx, currentOffset.value.dy, 0),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(

        opacity: opacity.value,
        duration: duration ?? const Duration(milliseconds: 300),
        child: child,
      ),
    );
  }
}
