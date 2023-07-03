import 'package:flutter/material.dart';

import 'controls_wrapper.dart';

class ControlFadeOut extends StatelessWidget {
  const ControlFadeOut({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animation = ControlsState.of(context).visibilityAnimation;
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, value) => IgnorePointer(
        ignoring: animation.value < 0.1,
        child: Opacity(
          opacity: animation.value,
          child: child,
        ),
      ),
    );
  }
}
