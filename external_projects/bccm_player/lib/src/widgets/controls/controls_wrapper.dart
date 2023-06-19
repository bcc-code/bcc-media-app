import 'dart:async';

import 'package:flutter/material.dart';

class ControlsWrapper extends StatefulWidget {
  const ControlsWrapper({super.key, required this.child});

  final Widget child;

  @override
  ControlsWrapperState createState() => ControlsWrapperState();
}

class ControlsWrapperState extends State<ControlsWrapper> {
  bool _visible = true;
  Timer? _visibilityTimer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _visibilityTimer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _visibilityTimer?.cancel();
    _visibilityTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _visible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _visible = !_visible;
        });
        if (_visible) {
          _startTimer();
        }
      },
      child: AbsorbPointer(
        absorbing: !_visible,
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 150),
          child: Container(
            color: Colors.black38,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
