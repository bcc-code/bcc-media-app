import 'dart:async';

import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/calendar_episode_entries.graphql.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/helpers/btv_colors.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';

import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShortsVideo extends StatefulWidget {
  const ShortsVideo({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ShortsVideo> createState() => _ShortsVideoState();
}

class _ShortsVideoState extends State<ShortsVideo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   setState(() {
      //     isVideoPlaying = !isVideoPlaying;
      //   });
      //   isVideoPlaying ? _controller.play() : _controller.pause();
      // },
      child: Query$GetStreamsForEpisode$Widget(
          options: Options$Query$GetStreamsForEpisode(
            variables: Variables$Query$GetStreamsForEpisode(id: widget.id),
          ),
          builder: (result, {refetch, fetchMore}) {
            if (result.parsedData == null) return const LoadingGeneric();
            result.parsedData?.episode.duration;
            final bestURL = result.parsedData!.episode.streams.getBestStreamUrl();
            const testURL = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

            return VideoStream(testURL: testURL, bestURL: bestURL); //another Future Builder
          }),
    );
  }
}

class VideoStream extends StatefulWidget {
  const VideoStream({
    Key? key,
    required this.testURL,
    required this.bestURL,
  }) : super(key: key);

  final String testURL;
  final String bestURL;

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  late VideoPlayerController _controller;
  Future<bool>? loadFuture;
  bool isVideoPlaying = false;

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
    print('EnterED:    started');
    setState(() {
      _controller = VideoPlayerController.network(widget.bestURL, formatHint: VideoFormat.hls);
    });
    await _controller.initialize();
    await _controller.play();
    isVideoPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: loadFuture,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoadingGeneric());
          }
          return Column(
            children: [
              (_controller.value.isInitialized)
                  ? Expanded(child: VideoPlayer(_controller))
                  : Column(
                      children: [const LoadingIndicator(), const Text('waiting for video to load')],
                    ),
              Text(
                'URL:   ${widget.testURL}',
                style: BtvTextStyles.body1.copyWith(color: BtvColors.tint3),
              ),
              Text(
                'BEST URL:   ${widget.bestURL}',
                style: BtvTextStyles.body1.copyWith(color: BtvColors.tint2),
              )
            ],
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
