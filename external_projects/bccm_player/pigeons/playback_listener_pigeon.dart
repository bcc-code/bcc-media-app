import 'package:pigeon/pigeon.dart';

@FlutterApi()
abstract class PlaybackListenerPigeon {
  @ObjCSelector("onPositionUpdate:")
  void onPositionUpdate(PositionUpdateEvent event);
}

class PositionUpdateEvent {
  int? playbackPositionMs;
}
