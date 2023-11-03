import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class SplashVideo extends StatefulWidget {
  const SplashVideo({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<SplashVideo> createState() => _SplashVideoState();
}

class _SplashVideoState extends State<SplashVideo> {
  late VideoPlayerController? playerController;
  bool done = false;

  @override
  void initState() {
    super.initState();
    playerController = VideoPlayerController.asset('assets/flavors/prod/logo_anim.mp4')
      ..setVolume(0.3)
      ..initialize().then((_) {
        if (mounted && playerController != null) playerController!.play();
      })
      ..addListener(() {
        if (playerController == null) return;
        if (playerController!.value.isCompleted) {
          setState(() {
            done = true;
          });
          Future.delayed(const Duration(seconds: 5), () {
            playerController?.dispose();
            playerController = null;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    if (done) {
      return widget.child;
    } else {
      return Container(
        color: Colors.black,
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width * 9 / 16,
            child: playerController == null ? null : VideoPlayer(playerController!),
          ),
        ),
      );
    }
  }
}
