import 'package:better_player/better_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PlayerState extends ChangeNotifier {
  late BetterPlayerPlaylistController _controller;
  //late Future<void> _initializeVideoPlayerFuture;

  PlayerState() {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        liveStream: false,
        useAsmsSubtitles: true,
        videoFormat: BetterPlayerVideoFormat.hls,
        'https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=https%3a%2f%2fvod.brunstad.tv%2fdb81335f-3274-4263-bc5c-3f190ef7ad69%2fPC22_TEMA_08_HEISRISEN_MAS_ENG.ism%2fmanifest(format%3dm3u8-aapl%2caudio-only%3dfalse)&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cm46bWljcm9zb2Z0OmF6dXJlOm1lZGlhc2VydmljZXM6Y29udGVudGtleWlkZW50aWZpZXIiOiI5ODZjNmQyMi02ODZlLTRhNzUtODg3YS0yMjc1YzIwYWExOWIiLCJuYmYiOjE2NTU4MDg5MDQsImV4cCI6MTY1NTgyMDAwNCwiaXNzIjoiaHR0cHM6Ly9icnVuc3RhZC50diIsImF1ZCI6InVybjpicnVuc3RhZHR2In0.X8Ec0LvIYIJrj1E3QIZhWWCE4nzhDvTDm8D3WrQQdZ4&subs=true',
        notificationConfiguration: const BetterPlayerNotificationConfiguration(
          showNotification: true,
          title: 'Elephant dream',
          author: 'Some author',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/African_Bush_Elephant.jpg/1200px-African_Bush_Elephant.jpg',
          activityName: 'MainActivity',
        ));

    _controller = BetterPlayerPlaylistController([betterPlayerDataSource],
        betterPlayerConfiguration: const BetterPlayerConfiguration(
            subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
                fontSize: 16, backgroundColor: Color.fromARGB(160, 0, 0, 0)),
            handleLifecycle: false,
            autoDispose: false,
            fullScreenAspectRatio: 16 / 9,
            fit: BoxFit.fitHeight,
            deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp]));
    //_initializeVideoPlayerFuture = _controller.initialize().then((value) =>
    //_controller.play(),);
  }

  BetterPlayerPlaylistController get controller => _controller;
  // Future<void> get initializeVideoPlayerFuture => _initializeVideoPlayerFuture;
}
