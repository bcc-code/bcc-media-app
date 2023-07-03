import 'dart:async';

import 'package:bccm_player/src/widgets/controls/control_fade_out.dart';
import 'package:flutter/material.dart';

class ControlsWrapper extends StatefulWidget {
  const ControlsWrapper({
    super.key,
    required this.builder,
    required this.autoHide,
  });

  final WidgetBuilder builder;
  final bool autoHide;

  @override
  ControlsWrapperState createState() => ControlsWrapperState();
}

class ControlsState extends InheritedWidget {
  final bool visible;
  final Animation<double> visibilityAnimation;
  final Duration animationDuration = const Duration(milliseconds: 150);

  const ControlsState({
    Key? key,
    required this.visible,
    required this.visibilityAnimation,
    required Widget child,
  }) : super(key: key, child: child);

  static ControlsState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ControlsState>()!;
  }

  @override
  bool updateShouldNotify(ControlsState oldWidget) {
    return oldWidget.visible != visible || oldWidget.visibilityAnimation != visibilityAnimation;
  }
}

class ControlsWrapperState extends State<ControlsWrapper> with SingleTickerProviderStateMixin {
  bool _visible = true;
  Timer? _visibilityTimer;
  late AnimationController visibilityAnimationController;

  @override
  void initState() {
    super.initState();
    visibilityAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _startTimer();
  }

  @override
  void dispose() {
    _visibilityTimer?.cancel();
    visibilityAnimationController.dispose();
    super.dispose();
  }

  void setVisible(bool visible) {
    setState(() {
      _visible = visible;
    });
    if (visible) {
      _startTimer();
    }
    visibilityAnimationController.animateTo(visible ? 1.0 : 0.0, duration: const Duration(milliseconds: 150));
  }

  void _startTimer() {
    _visibilityTimer?.cancel();
    _visibilityTimer = Timer(const Duration(seconds: 3), () {
      if (!widget.autoHide) {
        return;
      }
      setVisible(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ControlsState(
      visible: _visible,
      visibilityAnimation: visibilityAnimationController,
      child: Builder(builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            setVisible(!_visible);
          },
          child: Stack(
            children: [
              ControlFadeOut(
                child: Container(
                  color: Colors.black38,
                ),
              ),
              widget.builder(context),
            ],
          ),
        );
      }),
    );
  }
}
