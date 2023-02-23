import 'dart:async';

import 'package:flutter/material.dart';

class _OneTimeAnimatedIcon extends StatefulWidget {
  const _OneTimeAnimatedIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<_OneTimeAnimatedIcon> createState() => _OneTimeAnimatedIconState();
}

class _OneTimeAnimatedIconState extends State<_OneTimeAnimatedIcon> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late OverlayEntry _overlayEntry;

  double left = 100;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  didWidgetUpdate(_) {
    super.didUpdateWidget(_);
    setState(() {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
      );
      _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showAnimatedIcon() {
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 100.0,
          left: left += 5,
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(seconds: 2),
            child: Material(
              borderRadius: BorderRadius.circular(45),
              color: Colors.grey,
              child: Icon(
                Icons.pause_sharp,
                size: 50,
                color: Colors.amber,
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context)?.insert(_overlayEntry);

    // Schedule a function to remove the OverlayEntry after 3 seconds
    Timer(const Duration(seconds: 3), () {
      _overlayEntry.remove();
    });

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    //   return _showIcon
    //       ? Center(
    //           child: AnimatedIcon(
    //             icon: AnimatedIcons.play_pause,
    //             progress: _animation,
    //           ),
    //         )
    //       : Container();
    return GestureDetector(
      onTap: showAnimatedIcon,
      child: Center(
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
