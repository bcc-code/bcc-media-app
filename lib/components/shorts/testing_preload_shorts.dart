import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TestingPreloadShorts extends StatefulWidget {
  const TestingPreloadShorts({Key? key, required this.testURL, required this.bestURL, this.duration}) : super(key: key);

  final String testURL;
  final String bestURL;
  final Duration? duration;

  @override
  _TestingPreloadShortsState createState() => _TestingPreloadShortsState();
}

class _TestingPreloadShortsState extends State<TestingPreloadShorts> {
  late VideoPlayerController _controller;
  Future<bool>? loadFuture;

  @override
  initState() {
    super.initState();
    loadFuture = loadVideo();
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
    await _controller.seekTo(widget.duration!);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: loadFuture,
      builder: ((BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingGeneric();
        }
        return Stack(
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
          ],
        );
      }),
    );
  }
}
