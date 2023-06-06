import 'dart:async';

import 'package:brunstadtv_app/providers/shorts_videos_service.dart';
import 'package:brunstadtv_app/components/shorts/shorts_video_player_screen.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../status_indicators/loading_generic.dart';

class ShortsVideosStreamPlayer extends ConsumerStatefulWidget {
  const ShortsVideosStreamPlayer({
    Key? key,
    required this.shortsVideos,
  }) : super(key: key);

  final List<ShortsVideo> shortsVideos;

  @override
  ConsumerState<ShortsVideosStreamPlayer> createState() => _ShortsVideosStreamPlayerState();
}

class _ShortsVideosStreamPlayerState extends ConsumerState<ShortsVideosStreamPlayer> {
  final Map<int, VideoPlayerController> _controllers = {};
  Future<bool>? _future;
  int prevPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _future = loadFirstVideo();
  }

  @override
  void dispose() {
    disposeControllers();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void disposeControllers() {
    List<int> indexList = [];
    _controllers.forEach((key, value) {
      indexList.add(key);
      value.dispose();
    });
    _controllers.clear();
  }

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
            itemCount: widget.shortsVideos.length,
            onPageChanged: (pageIndex) async {
              if (pageIndex > prevPageIndex) {
                await _playNext(pageIndex);
              } else {
                await _playPrevious(pageIndex);
              }
              if (mounted) {
                setState(() => prevPageIndex = pageIndex);
              }
            },
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: _future,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingGeneric();
                  } else {
                    return (_controllers[index] != null)
                        ? ShortsVideoPlayerScreen(
                            shortsVideo: widget.shortsVideos[index],
                            playControllerAtIndex: _playControllerAtIndex,
                            stopControllerAtIndex: _stopControllerAtIndex,
                            index: index,
                            controller: _controllers[index]!,
                          )
                        : const LoadingGeneric();
                  }
                },
              );
            }),
      ],
    );
  }

  Future _playPrevious(int pageIndex) async {
    _stopControllerAtIndex(pageIndex + 1);
    _disposeControllerAtIndex(pageIndex + 2);
    _playControllerAtIndex(pageIndex);
    await _initializeControllerAtIndex(pageIndex - 1);
  }

  Future _playNext(int pageIndex) async {
    _stopControllerAtIndex(pageIndex - 1);
    _disposeControllerAtIndex(pageIndex - 2);
    _playControllerAtIndex(pageIndex);
    await _initializeControllerAtIndex(pageIndex + 1);
  }

  Future _initializeControllerAtIndex(int index) async {
    if (widget.shortsVideos.length > index && index >= 0) {
      // Create new controller
      final VideoPlayerController controller = VideoPlayerController.network(
        widget.shortsVideos[index].hlsUrl,
        formatHint: VideoFormat.hls,
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false),
      );
      controller.seekTo(widget.shortsVideos[index].startPosition);
      // Add to [controllers] list
      await controller.initialize();
      setState(() {
        _controllers[index] = controller;
      });
      return controller.value.isInitialized;
    }
    return true;
  }

  bool checkControllersRange(int index) {
    final controller = _controllers[index];
    return widget.shortsVideos.length > index && index >= 0 && controller != null;
  }

  _playControllerAtIndex(int index) {
    if (checkControllersRange(index)) {
      _controllers[index]?.play();
      return _controllers[index]?.value.isPlaying;
    }
  }

  void _stopControllerAtIndex(int index) {
    if (checkControllersRange(index)) {
      _controllers[index]?.pause();
    }
  }

  void _disposeControllerAtIndex(int index) async {
    if (checkControllersRange(index)) {
      _controllers.removeWhere((key, value) => value == _controllers[index]);
      await _controllers[index]?.dispose();
    }
  }
}
