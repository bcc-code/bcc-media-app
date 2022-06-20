import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class PlayerState extends ChangeNotifier {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  
  PlayerState() {
    _controller = VideoPlayerController.network(
        'https://d2zihajmogu5jn.cloudfront.net/bipbop-advanced/bipbop_16x9_variant.m3u8', videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true));
    _initializeVideoPlayerFuture = _controller.initialize().then((value) => 
    _controller.play(),);
  }

  VideoPlayerController get controller => _controller;
  Future<void> get initializeVideoPlayerFuture => _initializeVideoPlayerFuture;

  void setController(VideoPlayerController c) {
    _controller = c;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}