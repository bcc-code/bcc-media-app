import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerState extends ChangeNotifier {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  
  VideoPlayerState() {
  }

  play(String url) {
    _controller = VideoPlayerController.network(
      formatHint: VideoFormat.hls,
        url,
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true));
    _initializeVideoPlayerFuture = Future(() async {
      await _controller.initialize();
      _controller.play();
    });
    notifyListeners();
  }

  VideoPlayerController get controller => _controller;
  Future<void> get initializeVideoPlayerFuture => _initializeVideoPlayerFuture;
}