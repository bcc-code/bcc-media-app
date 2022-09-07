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
  @ObjCSelector("replaceCurrentMediaItem:mediaItem:")
  void replaceCurrentMediaItem(String playerId, MediaItem mediaItem);

  @async
  @ObjCSelector("setPrimary:")
  void setPrimary(String id);

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
