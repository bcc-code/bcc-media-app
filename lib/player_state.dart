import 'package:better_player/better_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PlayerState extends ChangeNotifier {
  late BetterPlayerController _controller;
  //late Future<void> _initializeVideoPlayerFuture;
  
  PlayerState() {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        liveStream: false,
        videoFormat: BetterPlayerVideoFormat.hls,
        notificationConfiguration: const BetterPlayerNotificationConfiguration(
          showNotification: true,
          title: 'Elephant dream',
          author: 'Some author',
          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/African_Bush_Elephant.jpg/1200px-African_Bush_Elephant.jpg',
          activityName: 'MainActivity',
        ),
        'https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=https%3a%2f%2fvod.brunstad.tv%2f5d94de31-b721-4183-858d-9661edf8bc8f%2fFKTB_20220611_2100_SEQ.ism%2fmanifest(format%3dm3u8-aapl%2caudio-only%3dfalse)&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cm46bWljcm9zb2Z0OmF6dXJlOm1lZGlhc2VydmljZXM6Y29udGVudGtleWlkZW50aWZpZXIiOiI0YmUxMDM2YS05Njc0LTQzZDYtOTQ2Ny1mNmZmMjA3ZDRjZmYiLCJuYmYiOjE2NTU4MDQzOTIsImV4cCI6MTY1NTgxNTQ5MiwiaXNzIjoiaHR0cHM6Ly9icnVuc3RhZC50diIsImF1ZCI6InVybjpicnVuc3RhZHR2In0.sRZc-Z3CTUaCQtz0hJ3iH5-i6Emc59V_mVqVJ_fX_XM&subs=false');

    _controller = BetterPlayerController(
        const BetterPlayerConfiguration(handleLifecycle: false, autoDispose: false, fullScreenAspectRatio: 16/9, fit: BoxFit.fitHeight, deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp]),
        betterPlayerDataSource: betterPlayerDataSource);
    //_initializeVideoPlayerFuture = _controller.initialize().then((value) => 
    //_controller.play(),);
  }

  BetterPlayerController get controller => _controller;
 // Future<void> get initializeVideoPlayerFuture => _initializeVideoPlayerFuture;

  void setController(BetterPlayerController c) {
    _controller = c;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}