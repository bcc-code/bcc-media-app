import 'package:auto_route/auto_route.dart';

import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/providers/shorts_videos_service.dart';
import 'package:flutter/services.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';

class ShortsVideoPlayerScreen extends ConsumerStatefulWidget {
  final VideoPlayerController controller;
  final ShortsVideo shortsVideo;
  final int index;

  final Function playControllerAtIndex;
  final Function stopControllerAtIndex;

  const ShortsVideoPlayerScreen(
      {required this.controller,
      required this.index,
      required this.playControllerAtIndex,
      required this.stopControllerAtIndex,
      Key? key,
      required this.shortsVideo})
      : super(key: key);

  @override
  ConsumerState<ShortsVideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<ShortsVideoPlayerScreen> {
  bool isVideoPlaying = true;
  bool isVideoMuted = false;
  String urlLink = '';

  @override
  Widget build(BuildContext context) {
    Player? player;
    if (ref.watch(isCasting)) {
      player = ref.watch(castPlayerProvider);
    } else {
      player = ref.watch(primaryPlayerProvider);
    }
    final playerId = player?.playerId ?? '';
    return Stack(
      children: [
        GestureDetector(
          onTapDown: (details) {
            if (widget.controller.value.isPlaying) {
              widget.stopControllerAtIndex(widget.index);
            } else {
              widget.playControllerAtIndex(widget.index);
            }
            setState(() {
              isVideoPlaying = widget.controller.value.isPlaying;
            });
            return;
          },
          child: Align(
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayer(widget.controller),
            ),
          ),
        ),
        FadingPlayButton(opacityLevel: isVideoPlaying ? 0.0 : 1.0, isVideoPlaying: isVideoPlaying),
        ForwardButton(widget: widget, ref: ref, playerId: playerId, mounted: mounted),
        Positioned(
          right: 30,
          bottom: 20,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              setState(() {
                widget.controller.setVolume(isVideoMuted ? 1.0 : 0.0);
                isVideoMuted = !isVideoMuted;
              });
            },
            child: Icon(
              isVideoMuted ? Icons.volume_up_outlined : Icons.volume_off_outlined,
              size: 40,
            ),
          ),
        ),
        VideoDescription(
          episodeId: widget.shortsVideo.id,
          title: widget.shortsVideo.title,
          urlLink: '/embed/${widget.shortsVideo.id}?autoplay=true&t=${widget.controller.value.duration.inSeconds.toString()}',
          playerId: playerId,
        ),
        Positioned(
          left: 30,
          top: 30,
          child: IconButton(
              color: BccmColors.label4,
              onPressed: () {
                context.router.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 35,
              )),
        ),
      ],
    );
  }
}

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

class ForwardButton extends StatelessWidget {
  const ForwardButton({
    super.key,
    required this.widget,
    required this.ref,
    required this.playerId,
    required this.mounted,
  });

  final ShortsVideoPlayerScreen widget;
  final WidgetRef ref;
  final String playerId;
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 80,
      child: IconButton(
        icon: const Icon(Icons.forward_outlined),
        iconSize: 40,
        onPressed: () async {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

          await context.router.pushNamed('/embed/${widget.shortsVideo.id}?autoplay=true&t=${widget.controller.value.duration.inSeconds.toString()}',
              includePrefixMatches: true);
          ref.read(playbackApiProvider).stop(playerId, true);

          if (!mounted) return;
          SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
        },
      ),
    );
  }
}

class VideoDescription extends ConsumerWidget {
  const VideoDescription({
    Key? key,
    required this.episodeId,
    required this.title,
    this.urlLink,
    required this.playerId,
  }) : super(key: key);

  final String episodeId;
  final String title;
  final String? urlLink;
  final String playerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: -10,
      left: 0.0,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

          await context.router.pushNamed(urlLink ?? '/embed/$episodeId?autoplay=true', includePrefixMatches: true);
          ref.read(playbackApiProvider).stop(playerId, true);
          SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
        },
        child: Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          height: MediaQuery.of(context).size.height * 0.2,
          padding: const EdgeInsets.only(left: 30.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              title,
              style: BccmTextStyles.body1.copyWith(color: BccmColors.onTint),
            ),
          ),
        ),
      ),
    );
  }
}
