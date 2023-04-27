import 'package:flutter/material.dart';

class PulseCircle extends AnimatedWidget {
  const PulseCircle({super.key, required Animation<double> animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final curved = CurvedAnimation(curve: Curves.easeOutQuad, parent: animation);
    return LayoutBuilder(
      builder: (context, constraints) => OverflowBox(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: Center(
          child: SizedBox(
            width: constraints.maxWidth + curved.value * constraints.maxWidth * 2.7,
            height: constraints.maxHeight + curved.value * constraints.maxHeight * 2.7,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(
                  0.1 * (1 - curved.value),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PulseAnimation extends StatefulWidget {
  const PulseAnimation({super.key, this.duration = const Duration(milliseconds: 3000)});

  final Duration duration;

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: widget.duration,
    );
    _controller.forward(from: 0.0);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) _controller.forward(from: 0.0);
        });
      }
    });
  }

  @override
  void didUpdateWidget(PulseAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.duration = widget.duration;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PulseCircle(animation: _controller); // ...
  }
}
