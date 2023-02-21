import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortsVideoStreamPlayer extends StatefulWidget {
  const ShortsVideoStreamPlayer({
    Key? key,
    required this.testURL,
    required this.bestURL,
    required this.duration,
  }) : super(key: key);

  final String testURL;
  final String bestURL;
  final Duration? duration;

  @override
  State<ShortsVideoStreamPlayer> createState() => _ShortsVideoStreamPlayerState();
}

class _ShortsVideoStreamPlayerState extends State<ShortsVideoStreamPlayer> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  Future<bool>? loadFuture;
  bool isVideoPlaying = false;
  bool isVideoMuted = false;
  double opacityLevel = 1.0;

  late AnimationController _animationController;

  @override
  initState() {
    super.initState();
    loadFuture = loadVideo();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  didUpdateWidget(old) {
    super.didUpdateWidget(old);
    loadFuture = loadVideo();
  }

  Future<bool> loadVideo() async {
    setState(() {
      _controller = VideoPlayerController.network(widget.bestURL, formatHint: VideoFormat.hls);
    });
    await _controller.initialize();
    await _controller.play();
    setState(() {
      isVideoPlaying = true;
    });
    await _controller.setLooping(true);
    await _controller.seekTo(widget.duration!);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: loadFuture,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingGeneric();
          }

          return GestureDetector(
            onTapDown: (_) {
              if (isVideoPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
              setState(() {
                isVideoPlaying = !isVideoPlaying;
              });
            },
            child: Stack(
              children: [
                (_controller.value.isInitialized)
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : Positioned(
                        left: 40,
                        top: 100,
                        child: Column(
                          children: [const LoadingIndicator(), const Text('The Controller of the Video Player is not Initialized')],
                        ),
                      ),
                // Center(
                //   child: Text('$isVideoPlaying'),
                // ),
                Center(
                  child: AnimatedOpacity(
                    opacity: opacityLevel,
                    duration: const Duration(seconds: 2),
                    child: Icon(
                      isVideoPlaying ? Icons.pause_sharp : Icons.play_arrow,
                      size: 50,
                      color: Colors.amber,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: IconButton(
                    icon: Icon(isVideoMuted ? Icons.speaker_notes_off_outlined : Icons.speaker_notes),
                    onPressed: () {
                      setState(() {
                        isVideoMuted = !isVideoMuted;
                      });
                    },
                  ),
                  // child: TextButton.icon(
                  //     onPressed: () {
                  //       setState(() {
                  //         isVideoMuted = !isVideoMuted;
                  //       });
                  //     },
                  //     icon: Icon(isVideoMuted ? Icons.speaker_notes_off_outlined : Icons.speaker_notes),
                  //     label: Text('')),
                )
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
