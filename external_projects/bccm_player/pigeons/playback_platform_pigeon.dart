import 'package:pigeon/pigeon.dart';

class Book {
  String? title;
  String? author;
}

@HostApi()
abstract class PlaybackPlatformPigeon {
  @async
  void attach();

  @async
  @ObjCSelector("newPlayer:")
  String newPlayer(String? url);

  @async
  @ObjCSelector("queueMediaItem:mediaItem:")
  void queueMediaItem(String playerId, MediaItem mediaItem);

  @async
  @ObjCSelector("replaceCurrentMediaItem:mediaItem:playbackPositionFromPrimary:autoplay:")
  void replaceCurrentMediaItem(String playerId, MediaItem mediaItem, bool? playbackPositionFromPrimary, bool? autoplay);

  @ObjCSelector("setPlayerViewVisibility:visible:")
  void setPlayerViewVisibility(int viewId, bool visible);

  @async
  @ObjCSelector("setPrimary:")
  void setPrimary(String id);

  @ObjCSelector("play:")
  void play(String playerId);

  @ObjCSelector("pause:")
  void pause(String playerId);

  @ObjCSelector("stop:reset:")
  void stop(String playerId, bool reset);

  @ObjCSelector("exitFullscreen:")
  void exitFullscreen(String playerId);

  @ObjCSelector("setNpawConfig:")
  void setNpawConfig(NpawConfig? config);

  @ObjCSelector("setAppConfig:")
  void setAppConfig(AppConfig? config);

  @async
  @ObjCSelector("getPlayerState:")
  PlayerStateSnapshot? getPlayerState(String? playerId);

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

class AppConfig {
  late String? appLanguage;
  late String? audioLanguage;
  late String? subtitleLanguage;
  late String? analyticsId;
  late int? sessionId;
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
  String? url;
  String? mimeType;
  MediaMetadata? metadata;
  bool? isLive;
  double? playbackStartPositionMs;
  String? lastKnownAudioLanguage;
  String? lastKnownSubtitleLanguage;
}

class MediaMetadata {
  String? artworkUri;
  String? title;
  String? artist;
  Map<String?, Object?>? extras;
}

class PlayerStateSnapshot {
  late String playerId;
  late PlaybackState playbackState;
  late bool isFullscreen;
  MediaItem? currentMediaItem;
  // This is double because pigeon uses NSNumber for int :(
  double? playbackPositionMs;
}

enum PlaybackState { stopped, paused, playing }

class ChromecastState {
  late CastConnectionState connectionState;
  MediaItem? mediaItem;
}

enum CastConnectionState {
  // ignore: unused_field
  none,
  noDevicesAvailable,
  notConnected,
  connecting,
  connected,
}

////////////////// Playback Listener

@FlutterApi()
abstract class PlaybackListenerPigeon {
  @ObjCSelector("onPrimaryPlayerChanged:")
  void onPrimaryPlayerChanged(PrimaryPlayerChangedEvent event);
  @ObjCSelector("onPositionDiscontinuity:")
  void onPositionDiscontinuity(PositionDiscontinuityEvent event);
  @ObjCSelector("onPlayerStateUpdate:")
  void onPlayerStateUpdate(PlayerStateUpdateEvent event);
  @ObjCSelector("onPlaybackStateChanged:")
  void onPlaybackStateChanged(PlaybackStateChangedEvent event);
  @ObjCSelector("onPlaybackEnded:")
  void onPlaybackEnded(PlaybackEndedEvent event);
  @ObjCSelector("onMediaItemTransition:")
  void onMediaItemTransition(MediaItemTransitionEvent event);
  @ObjCSelector("onPictureInPictureModeChanged:")
  void onPictureInPictureModeChanged(PictureInPictureModeChangedEvent event);
}

class PrimaryPlayerChangedEvent {
  late String? playerId;
}

abstract class PlayerEvent {
  late String playerId;
}

class PlayerStateUpdateEvent implements PlayerEvent {
  @override
  late String playerId;
  late PlayerStateSnapshot snapshot;
}

class PositionDiscontinuityEvent implements PlayerEvent {
  @override
  late String playerId;
  double? playbackPositionMs;
}

class PlaybackStateChangedEvent implements PlayerEvent {
  @override
  String playerId;
  PlaybackState playbackState;
  PlaybackStateChangedEvent({required this.playerId, required this.playbackState});
}

class PlaybackEndedEvent implements PlayerEvent {
  @override
  String playerId;
  MediaItem? mediaItem;
  PlaybackEndedEvent({required this.playerId, required this.mediaItem});
}

class PictureInPictureModeChangedEvent implements PlayerEvent {
  @override
  String playerId;
  bool isInPipMode;
  PictureInPictureModeChangedEvent({required this.playerId, required this.isInPipMode});
}

class MediaItemTransitionEvent implements PlayerEvent {
  @override
  String playerId;
  MediaItem? mediaItem;
  MediaItemTransitionEvent({required this.playerId, this.mediaItem});
}
