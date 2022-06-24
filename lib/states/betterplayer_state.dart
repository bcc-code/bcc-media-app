import 'package:better_player/better_player.dart';
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
        'https://vod2.stream.brunstad.tv/out/v1/244ef7496e274a299f64e353756190e7/ab9e7540a3e34bee86ec6af8c7cdc342/1467e3c2761c4947ae7dc7a6c162747f/index.m3u8?EncodedPolicy=Policy%3deyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6Imh0dHBzOi8vdm9kMi5zdHJlYW0uYnJ1bnN0YWQudHYvKiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTY1NTk5MjI2M319fV19%26Signature%3dg7yp82Lvf6ot3v7WPI0LoSKsfav4lO%7e9VWDDPZZbBeDXK2Krl3K3HYkzoHmvDlV2hTAjSdRGyNa1c3ZyO3EBLhwfdvRurLzVvQpbCqPJPOgNDDTtGpdolHHx-omJ8GZURn%7efg6gS-dKGLm1MxxnZHWJ4rl8J%7eJaIQr2quOBtjjxgrCOn%7epxwudQEaQ7g19ayTyb2mi0Q5py2im8nJ7HLhYYWTLZpgkKeGyharsvSZ3X6a0NqSiEIS-7nYmHw5cOgVTp94nCYKh7lXtnjIJjyNAOkd0SSVwV5Rs6YsWbJRtEgyKz9rGrn8VpA5aLUGuuuj4vrVt6dvUz-zEE1FUBJMQ__%26Key-Pair-Id%3dK2ONPB9SDZ4ZMH',
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
