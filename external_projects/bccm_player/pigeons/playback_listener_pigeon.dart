import 'package:pigeon/pigeon.dart';

@FlutterApi()
abstract class PlaybackListenerPigeon {
  @ObjCSelector("onPositionUpdate:")
  void onPositionUpdate(PositionUpdateEvent event);
  @ObjCSelector("onIsPlayingChanged:")
  void onIsPlayingChanged(IsPlayingChangedEvent event);
}

class PositionUpdateEvent {
  late String playerId;
  int? playbackPositionMs;
}

class IsPlayingChangedEvent {
  String playerId;
  bool isPlaying;
  IsPlayingChangedEvent({required this.playerId, required this.isPlaying});
}
