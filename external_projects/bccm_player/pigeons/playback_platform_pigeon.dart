import 'package:pigeon/pigeon.dart';

class Book {
  String? title;
  String? author;
}

@HostApi()
abstract class PlaybackPlatformPigeon {
  @async
  @ObjCSelector("newPlayer:")
  String newPlayer(String? url);

  @async
  @ObjCSelector("queueMediaItem:mediaItem:")
  void queueMediaItem(String playerId, MediaItem mediaItem);

  @async
  @ObjCSelector(
      "replaceCurrentMediaItem:mediaItem:playbackPositionFromPrimary:")
  void replaceCurrentMediaItem(
      String playerId, MediaItem mediaItem, bool? playbackPositionFromPrimary);

  @async
  @ObjCSelector("setPrimary:")
  void setPrimary(String id);

  @ObjCSelector("play:")
  void play(String playerId);

  @ObjCSelector("pause:")
  void pause(String playerId);

  @ObjCSelector("stop:reset:")
  void stop(String playerId, bool reset);

  @async
  @ObjCSelector("getChromecastState")
  ChromecastState? getChromecastState();
}

class SetUrlArgs {
  late String playerId;
  late String url;
  bool? isLive;
}

class MediaItem {
  late String url;
  String? mimeType;
  MediaMetadata? metadata;
  bool? isLive;
  int? playbackStartPositionMs;
}

class MediaMetadata {
  String? artworkUri;
  String? title;
  String? artist;
  String? episodeId;
}

class ChromecastState {
  late CastConnectionState connectionState;
}

enum CastConnectionState {
  _,
  noDevicesAvailable,
  notConnected,
  connecting,
  connected,
}
