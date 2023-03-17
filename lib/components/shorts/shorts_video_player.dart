import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:auto_route/auto_route.dart';

import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/components/shorts/fading_play_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class ShortsVideoStreamPlayer extends StatefulWidget {
  const ShortsVideoStreamPlayer({
    Key? key,
    required this.url,
    required this.duration,
    required this.episodeId,
  }) : super(key: key);

  final String url;
  final Duration? duration;
  final String episodeId;

  @override
  State<ShortsVideoStreamPlayer> createState() => _ShortsVideoStreamPlayerState();
}

class _ShortsVideoStreamPlayerState extends State<ShortsVideoStreamPlayer> {
  VideoPlayerController? _controller;
  Future<bool>? loadFuture;
  late bool isVideoPlaying;
  bool isVideoMuted = false;
  double opacityLevel = 1.0;

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
    _controller?.dispose();
    setState(() {
      _controller = VideoPlayerController.network(widget.url, formatHint: VideoFormat.hls);
    });

    await _controller?.initialize();
    // await _controller?.play();
    setState(() {
      isVideoPlaying = _controller!.value.isPlaying;
    });
    await _controller?.setLooping(true);
    await _controller?.seekTo(widget.duration!);

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
                _controller?.pause();
              } else {
                _controller?.play();
              }
              setState(() {
                isVideoPlaying = !isVideoPlaying;
                opacityLevel = isVideoPlaying ? 0.0 : 1.0;
              });
            },
            child: Stack(
              children: [
                if (_controller?.value.isInitialized == true)
                  Center(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: VideoPlayer(_controller!),
                    ),
                  )
                else
                  Positioned(
                    left: 40,
                    top: 100,
                    child: Column(
                      children: const [LoadingIndicator(), Text('The Controller of the Video Player is not Initialized')],
                    ),
                  ),
                FadingPlayButton(opacityLevel: opacityLevel, isVideoPlaying: isVideoPlaying),
                Positioned(
                  right: 20,
                  bottom: 80,
                  child: IconButton(
                    icon: const Icon(Icons.offline_share),
                    iconSize: 40,
                    onPressed: () async {
                      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                      await context.router.pushNamed('/embed/${widget.episodeId}?autoplay=true&t=${widget.duration!.inSeconds.toString()}',
                          includePrefixMatches: true);
                      if (!mounted) return;
                      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
                    },
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(isVideoMuted ? Icons.speaker_notes : Icons.speaker_notes_off_outlined),
                    onPressed: () {
                      setState(() {
                        _controller?.setVolume(isVideoMuted ? 1.0 : 0.0);
                        isVideoMuted = !isVideoMuted;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
