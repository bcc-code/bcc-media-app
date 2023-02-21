import 'dart:async';

import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/components/shorts/shorts_video_player.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/calendar_episode_entries.graphql.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/helpers/btv_colors.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';

import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

class ShortsVideoStreamLoader extends StatelessWidget {
  const ShortsVideoStreamLoader({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return Query$GetStreamsForEpisode$Widget(
        options: Options$Query$GetStreamsForEpisode(
          variables: Variables$Query$GetStreamsForEpisode(id: id),
        ),
        builder: (result, {refetch, fetchMore}) {
          if (result.parsedData == null) return const LoadingGeneric();
          final Duration durationStartUp = Duration(
            seconds: ((result.parsedData?.episode.duration)! * 0.3).toInt(),
          );
          final bestURL = result.parsedData!.episode.streams.getBestStreamUrl();
          const testURL = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

          return ShortsVideoStreamPlayer(testURL: testURL, bestURL: bestURL, duration: durationStartUp); //Original Video Player
          // return ChewieVideoPlayer(testURL: testURL, bestURL: bestURL, duration: durationStartUp); //Chewie Video Player
        });
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* class FadingIcon extends StatelessWidget {
  const FadingIcon({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final _OneTimeAnimatedIcon widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: AnimatedOpacity(
          opacity: widget.isVideoPlaying ? 0.0 : 1.0,
          duration: const Duration(seconds: 2),
          child: Material(
            borderRadius: BorderRadius.circular(45),
            color: Colors.grey,
            child: Icon(
              widget._controller.value.isPlaying ? Icons.pause_sharp : Icons.play_arrow,
              size: 50,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
} */

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* 
class ChewieVideoPlayer extends StatefulWidget {
  const ChewieVideoPlayer({
    Key? key,
    required this.testURL,
    required this.bestURL,
    required this.duration,
  }) : super(key: key);

  final String testURL;
  final String bestURL;
  final Duration? duration;

  @override
  _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  Future<bool>? loadFuture;

  @override
  void initState() {
    loadFuture = loadVideo();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChewieVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadFuture = loadVideo();
  }

  Future<bool> loadVideo() async {
    setState(() {
      videoPlayerController = VideoPlayerController.network(widget.bestURL, formatHint: VideoFormat.hls);
    });

    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      // aspectRatio: 16 / 9,
      allowFullScreen: false,
      autoInitialize: true,
      startAt: widget.duration,

      progressIndicatorDelay: Duration(seconds: 2),
      placeholder: Image.asset('assets/icons/Seen.png'),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingGeneric();
          }
          return Column(
            children: [
              Expanded(
                child: Chewie(
                  controller: chewieController,
                ),
              ),
              Text(
                'Duration:   ${widget.duration}',
                style: BtvTextStyles.body1.copyWith(color: BtvColors.tint3),
                textAlign: TextAlign.end,
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
 */
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
