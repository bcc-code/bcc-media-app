import 'package:flutter/material.dart';

class FadingPlayButton extends StatelessWidget {
  const FadingPlayButton({Key? key, required this.opacityLevel, required this.isVideoPlaying}) : super(key: key);

  final double opacityLevel;
  final bool isVideoPlaying;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: opacityLevel,
        duration: const Duration(seconds: 2),
        child: Icon(
          isVideoPlaying ? Icons.pause_sharp : Icons.play_arrow,
          size: 50,
          color: Colors.amber,
        ),
      ),
    );
  }
}
