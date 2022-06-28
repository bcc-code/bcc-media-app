import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerState extends ChangeNotifier {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  
  VideoPlayerState() {
    _controller = VideoPlayerController.network(
      formatHint: VideoFormat.hls,
        'https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=https%3a%2f%2fvod.brunstad.tv%2fddfa071a-1ec2-4d4d-a094-566e53451122%2fMAGA_20220605_SEQ.ism%2fmanifest(format%3dm3u8-aapl%2caudio-only%3dfalse)&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cm46bWljcm9zb2Z0OmF6dXJlOm1lZGlhc2VydmljZXM6Y29udGVudGtleWlkZW50aWZpZXIiOiI0MTI4MGI3ZS1lMGJhLTQzNGQtOTc5My02NTY0ZjhmNTc1YTYiLCJuYmYiOjE2NTYwNzE0ODMsImV4cCI6MTY1NjA4MjU4MywiaXNzIjoiaHR0cHM6Ly9icnVuc3RhZC50diIsImF1ZCI6InVybjpicnVuc3RhZHR2In0.CmszfWGUa7UKevdVAqnJ4tvFJ5un3V38RG4nrbJl-W8&subs=true', videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true));
    _initializeVideoPlayerFuture = _controller.initialize().then((value) => 
    _controller.play(),);
  }

  VideoPlayerController get controller => _controller;
  Future<void> get initializeVideoPlayerFuture => _initializeVideoPlayerFuture;
}