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
      "replaceCurrentMediaItem:mediaItem:playbackPositionFromPrimary:autoplay:")
  void replaceCurrentMediaItem(String playerId, MediaItem mediaItem,
      bool? playbackPositionFromPrimary, bool? autoplay);

  @async
  @ObjCSelector("setPrimary:")
  void setPrimary(String id);

  @ObjCSelector("play:")
  void play(String playerId);

  @ObjCSelector("pause:")
  void pause(String playerId);

  @ObjCSelector("stop:reset:")
  void stop(String playerId, bool reset);

  @ObjCSelector("setUser:")
  void setUser(User? user);

  @ObjCSelector("setNpawConfig:")
  void setNpawConfig(NpawConfig? config);

  @async
  @ObjCSelector("getChromecastState")
  ChromecastState? getChromecastState();

  @ObjCSelector("openExpandedCastController")
  void openExpandedCastController();

  @ObjCSelector("openCastDialog")
  void openCastDialog();
}

class NpawConfig {
  late String? appName;
  late String? appReleaseVersion;
  late String? accountCode;
}

class User {
  late String? id;
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
  Map<String?, String?>? extras;
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

////////////////// Playback Listener

@FlutterApi()
abstract class PlaybackListenerPigeon {
  @ObjCSelector("onPositionUpdate:")
  void onPositionUpdate(PositionUpdateEvent event);
  @ObjCSelector("onIsPlayingChanged:")
  void onIsPlayingChanged(IsPlayingChangedEvent event);
  @ObjCSelector("onMediaItemTransition:")
  void onMediaItemTransition(MediaItemTransitionEvent event);
  @ObjCSelector("onPictureInPictureModeChanged:")
  void onPictureInPictureModeChanged(PictureInPictureModeChangedEvent event);
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

class PictureInPictureModeChangedEvent {
  String playerId;
  bool isInPipMode;
  PictureInPictureModeChangedEvent(
      {required this.playerId, required this.isInPipMode});
}

class MediaItemTransitionEvent {
  String playerId;
  MediaItem? mediaItem;
  MediaItemTransitionEvent({required this.playerId, this.mediaItem});
}
