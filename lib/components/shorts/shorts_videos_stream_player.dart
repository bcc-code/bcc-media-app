import 'dart:async';
import 'dart:developer';

import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/shorts/shorts_video_description.dart';
import 'package:brunstadtv_app/graphql/client.dart';

import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/providers/shorts_videos_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class ShortsVideosStreamPlayer extends ConsumerStatefulWidget {
  const ShortsVideosStreamPlayer({Key? key, required this.episode}) : super(key: key);

  final List<Episode> episode;

  @override
  ConsumerState<ShortsVideosStreamPlayer> createState() => _ShortsVideosStreamPlayerState();
}

class _ShortsVideosStreamPlayerState extends ConsumerState<ShortsVideosStreamPlayer> {
  final Map<int, VideoPlayerController> _controllers = {};
  Future<bool>? _future;
  int prevPageIndex = 0;

  @override
  void initState() {
    // if (_controllers.isNotEmpty) disposeControllers();
    _future = loadFirstVideo();
    super.initState();
  }

  // @override
  // void dispose() {
  //   disposeControllers();
  //   super.dispose();
  // }

  // void disposeControllers() {
  //   List<int> indexList = [];
  //   _controllers.forEach((key, value) {
  //     indexList.add(key);
  //     value.dispose();
  //   });
  //   _controllers.clear();
  //   super.dispose();
  //   log('🚀🚀🚀 DISPOSED ALL INDEX $indexList');
  // }

  Future<bool> loadFirstVideo() async {
    await _initializeControllerAtIndex(0);
    await _initializeControllerAtIndex(1);
    _playControllerAtIndex(0);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.episode.length,
            onPageChanged: (pageIndex) {
              log('🚀🚀🚀 pageIndex: $pageIndex');

              _playControllerAtIndex(pageIndex);

              if (pageIndex > prevPageIndex) {
                _stopControllerAtIndex(prevPageIndex);
                _playNext(pageIndex);
              } else {
                _playPrevious(pageIndex);
              }
              setState(() => prevPageIndex = pageIndex);
            },
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: _future,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingGeneric();
                  } else {
                    return Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: (_controllers[index]) != null
                              ? VideoPlayer(_controllers[index] ??
                                  VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
                              : Text('NONE'),
                        ),
                        VideoDescription(
                          episodeId: widget.episode[index].id,
                          title: widget.episode[index].title,
                        )
                      ],
                    );
                  }
                },
              );
            }),
        Center(
            child: Column(
          children: [
            for (var item in widget.episode) ...[
              Text('${item.title}', overflow: TextOverflow.ellipsis),
            ]
          ],
        )),
      ],
    );
  }

  void _playPrevious(int pageIndex) async {
    _stopControllerAtIndex(pageIndex + 1);
    _playControllerAtIndex(pageIndex);

    _disposeControllerAtIndex(pageIndex + 2);
    await _initializeControllerAtIndex(pageIndex - 1);
  }

  void _playNext(int pageIndex) async {
    await _initializeControllerAtIndex(pageIndex + 1);
    _stopControllerAtIndex(pageIndex - 1);
    _disposeControllerAtIndex(pageIndex - 2);
    _playControllerAtIndex(pageIndex);
    // _controllers.entries.first.value.value.duration
  }

  Future<ShortsVideo> _getStreamsForEpisode(int index) async {
    final client = ref.read(gqlClientProvider);
    final result = await client
        .query$GetStreamsForEpisode(
      Options$Query$GetStreamsForEpisode(
        variables: Variables$Query$GetStreamsForEpisode(id: widget.episode[index].id),
      ),
    )
        .onError((error, stackTrace) {
      1;
      throw Error();
    }).then((value) {
      if (value.hasException) {
        throw value.exception!;
      }
      if (value.parsedData == null) {
        throw ErrorDescription('GetStreamsForEpisode is null.');
      }
      //video start from 0.2 of the video length
      final duration = (((value.parsedData?.episode.duration ?? 0).toDouble()) * 0.5).toInt();
      return ShortsVideo(
        hlsUrl: value.parsedData!.episode.streams.getBestStreamUrl(),
        title: widget.episode[index].title,
        duration: Duration(seconds: duration),
      );
    });
    return result;
  }

  get getDuration async {
    final result = await _getStreamsForEpisode(prevPageIndex);
    return result.duration;
  }

  Future _initializeControllerAtIndex(int index) async {
    ShortsVideo result = await _getStreamsForEpisode(index);

    if (widget.episode.length > index && index >= 0) {
      // Create new controller
      final VideoPlayerController controller = VideoPlayerController.network(
        result.hlsUrl,
        formatHint: VideoFormat.hls,
      );

      controller.seekTo(result.duration);
      controller.addListener(() {});
      await controller.initialize();
      // Add to [controllers] list
      _controllers[index] = controller;
      if (index > 2) {
        print('awfawf');
      }
      log('🚀🚀🚀 INITIALIZED $index');
    }
  }

  void _playControllerAtIndex(int index) async {
    if (widget.episode.length > index && index >= 0) {
      final controller = _controllers[index];
      await controller?.play();

      log('🚀🚀🚀 PLAYING $index');
    }
  }

  void _stopControllerAtIndex(int index) {
    if (widget.episode.length > index && index >= 0) {
      final controller = _controllers[index];
      controller?.pause();

      log('🚀🚀🚀 STOPPED $index');
    }
  }

  void _disposeControllerAtIndex(int index) {
    log('_disposeControllerAtIndex---------------------------------- at $index');
    if (widget.episode.length > index && index >= 0) {
      final controller = _controllers[index];

      if (controller != null) {
        controller.dispose();
        _controllers.removeWhere((key, value) => value == controller);
        log('🚀🚀🚀 DISPOSED $index');
      }
    }
  }
}
