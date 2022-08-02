/* import 'package:better_player/better_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class BetterPlayerState extends ChangeNotifier {
  late BetterPlayerPlaylistController _controller;
  //late Future<void> _initializeVideoPlayerFuture;

  BetterPlayerState() {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        liveStream: false,
        useAsmsSubtitles: true,
        videoFormat: BetterPlayerVideoFormat.hls,
        'https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=https%3a%2f%2fvod.brunstad.tv%2fa97a0f51-3866-46ff-8171-29d53004aeb5%2fMAGA_S01_E04_BIEX_SEQ.ism%2fmanifest(format%3dm3u8-aapl%2caudio-only%3dfalse)&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cm46bWljcm9zb2Z0OmF6dXJlOm1lZGlhc2VydmljZXM6Y29udGVudGtleWlkZW50aWZpZXIiOiJmMjhhOTE3Ni1mMTU5LTQ3MWItYmVkZi1jYzczZDQ3NDZkYzUiLCJuYmYiOjE2NTYwNzA3MzUsImV4cCI6MTY1NjA4MTgzNSwiaXNzIjoiaHR0cHM6Ly9icnVuc3RhZC50diIsImF1ZCI6InVybjpicnVuc3RhZHR2In0.-WVIvFZHGpSP2Zn1RFr4DjcO5812L-JYBr2Z1YtGwfA&subs=false',
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
 */