// Autogenerated from Pigeon (v9.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

enum PlaybackState {
  stopped,
  paused,
  playing,
}

enum CastConnectionState {
  none,
  noDevicesAvailable,
  notConnected,
  connecting,
  connected,
}

enum TrackType {
  audio,
  text,
}

class NpawConfig {
  NpawConfig({
    this.appName,
    this.appReleaseVersion,
    this.accountCode,
    this.deviceIsAnonymous,
  });

  String? appName;

  String? appReleaseVersion;

  String? accountCode;

  bool? deviceIsAnonymous;

  Object encode() {
    return <Object?>[
      appName,
      appReleaseVersion,
      accountCode,
      deviceIsAnonymous,
    ];
  }

  static NpawConfig decode(Object result) {
    result as List<Object?>;
    return NpawConfig(
      appName: result[0] as String?,
      appReleaseVersion: result[1] as String?,
      accountCode: result[2] as String?,
      deviceIsAnonymous: result[3] as bool?,
    );
  }
}

class AppConfig {
  AppConfig({
    this.appLanguage,
    this.audioLanguage,
    this.subtitleLanguage,
    this.analyticsId,
    this.sessionId,
  });

  String? appLanguage;

  String? audioLanguage;

  String? subtitleLanguage;

  String? analyticsId;

  int? sessionId;

  Object encode() {
    return <Object?>[
      appLanguage,
      audioLanguage,
      subtitleLanguage,
      analyticsId,
      sessionId,
    ];
  }

  static AppConfig decode(Object result) {
    result as List<Object?>;
    return AppConfig(
      appLanguage: result[0] as String?,
      audioLanguage: result[1] as String?,
      subtitleLanguage: result[2] as String?,
      analyticsId: result[3] as String?,
      sessionId: result[4] as int?,
    );
  }
}

class MediaItem {
  MediaItem({
    this.url,
    this.mimeType,
    this.metadata,
    this.isLive,
    this.playbackStartPositionMs,
    this.lastKnownAudioLanguage,
    this.lastKnownSubtitleLanguage,
  });

  String? url;

  String? mimeType;

  MediaMetadata? metadata;

  bool? isLive;

  double? playbackStartPositionMs;

  String? lastKnownAudioLanguage;

  String? lastKnownSubtitleLanguage;

  Object encode() {
    return <Object?>[
      url,
      mimeType,
      metadata?.encode(),
      isLive,
      playbackStartPositionMs,
      lastKnownAudioLanguage,
      lastKnownSubtitleLanguage,
    ];
  }

  static MediaItem decode(Object result) {
    result as List<Object?>;
    return MediaItem(
      url: result[0] as String?,
      mimeType: result[1] as String?,
      metadata: result[2] != null
          ? MediaMetadata.decode(result[2]! as List<Object?>)
          : null,
      isLive: result[3] as bool?,
      playbackStartPositionMs: result[4] as double?,
      lastKnownAudioLanguage: result[5] as String?,
      lastKnownSubtitleLanguage: result[6] as String?,
    );
  }
}

class MediaMetadata {
  MediaMetadata({
    this.artworkUri,
    this.title,
    this.artist,
    this.durationMs,
    this.extras,
  });

  String? artworkUri;

  String? title;

  String? artist;

  double? durationMs;

  Map<String?, Object?>? extras;

  Object encode() {
    return <Object?>[
      artworkUri,
      title,
      artist,
      durationMs,
      extras,
    ];
  }

  static MediaMetadata decode(Object result) {
    result as List<Object?>;
    return MediaMetadata(
      artworkUri: result[0] as String?,
      title: result[1] as String?,
      artist: result[2] as String?,
      durationMs: result[3] as double?,
      extras: (result[4] as Map<Object?, Object?>?)?.cast<String?, Object?>(),
    );
  }
}

class PlayerStateSnapshot {
  PlayerStateSnapshot({
    required this.playerId,
    required this.playbackState,
    required this.isBuffering,
    required this.isFullscreen,
    this.currentMediaItem,
    this.playbackPositionMs,
  });

  String playerId;

  PlaybackState playbackState;

  bool isBuffering;

  bool isFullscreen;

  MediaItem? currentMediaItem;

  double? playbackPositionMs;

  Object encode() {
    return <Object?>[
      playerId,
      playbackState.index,
      isBuffering,
      isFullscreen,
      currentMediaItem?.encode(),
      playbackPositionMs,
    ];
  }

  static PlayerStateSnapshot decode(Object result) {
    result as List<Object?>;
    return PlayerStateSnapshot(
      playerId: result[0]! as String,
      playbackState: PlaybackState.values[result[1]! as int],
      isBuffering: result[2]! as bool,
      isFullscreen: result[3]! as bool,
      currentMediaItem: result[4] != null
          ? MediaItem.decode(result[4]! as List<Object?>)
          : null,
      playbackPositionMs: result[5] as double?,
    );
  }
}

class ChromecastState {
  ChromecastState({
    required this.connectionState,
    this.mediaItem,
  });

  CastConnectionState connectionState;

  MediaItem? mediaItem;

  Object encode() {
    return <Object?>[
      connectionState.index,
      mediaItem?.encode(),
    ];
  }

  static ChromecastState decode(Object result) {
    result as List<Object?>;
    return ChromecastState(
      connectionState: CastConnectionState.values[result[0]! as int],
      mediaItem: result[1] != null
          ? MediaItem.decode(result[1]! as List<Object?>)
          : null,
    );
  }
}

class PlayerTracksSnapshot {
  PlayerTracksSnapshot({
    required this.playerId,
    required this.audioTracks,
    required this.textTracks,
  });

  String playerId;

  List<Track?> audioTracks;

  List<Track?> textTracks;

  Object encode() {
    return <Object?>[
      playerId,
      audioTracks,
      textTracks,
    ];
  }

  static PlayerTracksSnapshot decode(Object result) {
    result as List<Object?>;
    return PlayerTracksSnapshot(
      playerId: result[0]! as String,
      audioTracks: (result[1] as List<Object?>?)!.cast<Track?>(),
      textTracks: (result[2] as List<Object?>?)!.cast<Track?>(),
    );
  }
}

class Track {
  Track({
    required this.id,
    this.label,
    this.language,
    required this.isSelected,
  });

  String id;

  String? label;

  String? language;

  bool isSelected;

  Object encode() {
    return <Object?>[
      id,
      label,
      language,
      isSelected,
    ];
  }

  static Track decode(Object result) {
    result as List<Object?>;
    return Track(
      id: result[0]! as String,
      label: result[1] as String?,
      language: result[2] as String?,
      isSelected: result[3]! as bool,
    );
  }
}

class PrimaryPlayerChangedEvent {
  PrimaryPlayerChangedEvent({
    this.playerId,
  });

  String? playerId;

  Object encode() {
    return <Object?>[
      playerId,
    ];
  }

  static PrimaryPlayerChangedEvent decode(Object result) {
    result as List<Object?>;
    return PrimaryPlayerChangedEvent(
      playerId: result[0] as String?,
    );
  }
}

class PlayerStateUpdateEvent {
  PlayerStateUpdateEvent({
    required this.playerId,
    required this.snapshot,
  });

  String playerId;

  PlayerStateSnapshot snapshot;

  Object encode() {
    return <Object?>[
      playerId,
      snapshot.encode(),
    ];
  }

  static PlayerStateUpdateEvent decode(Object result) {
    result as List<Object?>;
    return PlayerStateUpdateEvent(
      playerId: result[0]! as String,
      snapshot: PlayerStateSnapshot.decode(result[1]! as List<Object?>),
    );
  }
}

class PositionDiscontinuityEvent {
  PositionDiscontinuityEvent({
    required this.playerId,
    this.playbackPositionMs,
  });

  String playerId;

  double? playbackPositionMs;

  Object encode() {
    return <Object?>[
      playerId,
      playbackPositionMs,
    ];
  }

  static PositionDiscontinuityEvent decode(Object result) {
    result as List<Object?>;
    return PositionDiscontinuityEvent(
      playerId: result[0]! as String,
      playbackPositionMs: result[1] as double?,
    );
  }
}

class PlaybackStateChangedEvent {
  PlaybackStateChangedEvent({
    required this.playerId,
    required this.playbackState,
    required this.isBuffering,
  });

  String playerId;

  PlaybackState playbackState;

  bool isBuffering;

  Object encode() {
    return <Object?>[
      playerId,
      playbackState.index,
      isBuffering,
    ];
  }

  static PlaybackStateChangedEvent decode(Object result) {
    result as List<Object?>;
    return PlaybackStateChangedEvent(
      playerId: result[0]! as String,
      playbackState: PlaybackState.values[result[1]! as int],
      isBuffering: result[2]! as bool,
    );
  }
}

class PlaybackEndedEvent {
  PlaybackEndedEvent({
    required this.playerId,
    this.mediaItem,
  });

  String playerId;

  MediaItem? mediaItem;

  Object encode() {
    return <Object?>[
      playerId,
      mediaItem?.encode(),
    ];
  }

  static PlaybackEndedEvent decode(Object result) {
    result as List<Object?>;
    return PlaybackEndedEvent(
      playerId: result[0]! as String,
      mediaItem: result[1] != null
          ? MediaItem.decode(result[1]! as List<Object?>)
          : null,
    );
  }
}

class PictureInPictureModeChangedEvent {
  PictureInPictureModeChangedEvent({
    required this.playerId,
    required this.isInPipMode,
  });

  String playerId;

  bool isInPipMode;

  Object encode() {
    return <Object?>[
      playerId,
      isInPipMode,
    ];
  }

  static PictureInPictureModeChangedEvent decode(Object result) {
    result as List<Object?>;
    return PictureInPictureModeChangedEvent(
      playerId: result[0]! as String,
      isInPipMode: result[1]! as bool,
    );
  }
}

class MediaItemTransitionEvent {
  MediaItemTransitionEvent({
    required this.playerId,
    this.mediaItem,
  });

  String playerId;

  MediaItem? mediaItem;

  Object encode() {
    return <Object?>[
      playerId,
      mediaItem?.encode(),
    ];
  }

  static MediaItemTransitionEvent decode(Object result) {
    result as List<Object?>;
    return MediaItemTransitionEvent(
      playerId: result[0]! as String,
      mediaItem: result[1] != null
          ? MediaItem.decode(result[1]! as List<Object?>)
          : null,
    );
  }
}

class _PlaybackPlatformPigeonCodec extends StandardMessageCodec {
  const _PlaybackPlatformPigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AppConfig) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is ChromecastState) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is MediaItem) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is MediaMetadata) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is NpawConfig) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is PlayerStateSnapshot) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is PlayerTracksSnapshot) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is Track) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return AppConfig.decode(readValue(buffer)!);
      case 129: 
        return ChromecastState.decode(readValue(buffer)!);
      case 130: 
        return MediaItem.decode(readValue(buffer)!);
      case 131: 
        return MediaMetadata.decode(readValue(buffer)!);
      case 132: 
        return NpawConfig.decode(readValue(buffer)!);
      case 133: 
        return PlayerStateSnapshot.decode(readValue(buffer)!);
      case 134: 
        return PlayerTracksSnapshot.decode(readValue(buffer)!);
      case 135: 
        return Track.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class PlaybackPlatformPigeon {
  /// Constructor for [PlaybackPlatformPigeon].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  PlaybackPlatformPigeon({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _PlaybackPlatformPigeonCodec();

  Future<void> attach() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.attach', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<String> newPlayer(String? arg_url) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.newPlayer', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_url]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as String?)!;
    }
  }

  Future<void> queueMediaItem(String arg_playerId, MediaItem arg_mediaItem) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.queueMediaItem', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId, arg_mediaItem]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> replaceCurrentMediaItem(String arg_playerId, MediaItem arg_mediaItem, bool? arg_playbackPositionFromPrimary, bool? arg_autoplay) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.replaceCurrentMediaItem', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId, arg_mediaItem, arg_playbackPositionFromPrimary, arg_autoplay]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setPlayerViewVisibility(int arg_viewId, bool arg_visible) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.setPlayerViewVisibility', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_viewId, arg_visible]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setPrimary(String arg_id) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.setPrimary', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_id]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> play(String arg_playerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.play', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> seekTo(String arg_playerId, double arg_positionMs) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.seekTo', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId, arg_positionMs]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<double> getPlaybackSpeed(String arg_playerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.getPlaybackSpeed', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as double?)!;
    }
  }

  Future<void> setPlaybackSpeed(String arg_playerId, double arg_playbackSpeed) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.setPlaybackSpeed', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId, arg_playbackSpeed]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> pause(String arg_playerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.pause', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> stop(String arg_playerId, bool arg_reset) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.stop', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId, arg_reset]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setSelectedTrack(String arg_playerId, TrackType arg_type, String arg_trackId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.setSelectedTrack', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId, arg_type.index, arg_trackId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> exitFullscreen(String arg_playerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.exitFullscreen', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> enterFullscreen(String arg_playerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.enterFullscreen', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setNpawConfig(NpawConfig? arg_config) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.setNpawConfig', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_config]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setAppConfig(AppConfig? arg_config) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.setAppConfig', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_config]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<PlayerTracksSnapshot?> getTracks(String? arg_playerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.getTracks', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as PlayerTracksSnapshot?);
    }
  }

  Future<PlayerStateSnapshot?> getPlayerState(String? arg_playerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.getPlayerState', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_playerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as PlayerStateSnapshot?);
    }
  }

  Future<ChromecastState?> getChromecastState() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.getChromecastState', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as ChromecastState?);
    }
  }

  Future<void> openExpandedCastController() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.openExpandedCastController', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> openCastDialog() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PlaybackPlatformPigeon.openCastDialog', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _PlaybackListenerPigeonCodec extends StandardMessageCodec {
  const _PlaybackListenerPigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MediaItem) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is MediaItemTransitionEvent) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is MediaMetadata) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is PictureInPictureModeChangedEvent) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is PlaybackEndedEvent) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is PlaybackStateChangedEvent) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is PlayerStateSnapshot) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is PlayerStateUpdateEvent) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is PositionDiscontinuityEvent) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is PrimaryPlayerChangedEvent) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return MediaItem.decode(readValue(buffer)!);
      case 129: 
        return MediaItemTransitionEvent.decode(readValue(buffer)!);
      case 130: 
        return MediaMetadata.decode(readValue(buffer)!);
      case 131: 
        return PictureInPictureModeChangedEvent.decode(readValue(buffer)!);
      case 132: 
        return PlaybackEndedEvent.decode(readValue(buffer)!);
      case 133: 
        return PlaybackStateChangedEvent.decode(readValue(buffer)!);
      case 134: 
        return PlayerStateSnapshot.decode(readValue(buffer)!);
      case 135: 
        return PlayerStateUpdateEvent.decode(readValue(buffer)!);
      case 136: 
        return PositionDiscontinuityEvent.decode(readValue(buffer)!);
      case 137: 
        return PrimaryPlayerChangedEvent.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

////////////////// Playback Listener
abstract class PlaybackListenerPigeon {
  static const MessageCodec<Object?> codec = _PlaybackListenerPigeonCodec();

  void onPrimaryPlayerChanged(PrimaryPlayerChangedEvent event);

  void onPositionDiscontinuity(PositionDiscontinuityEvent event);

  void onPlayerStateUpdate(PlayerStateUpdateEvent event);

  void onPlaybackStateChanged(PlaybackStateChangedEvent event);

  void onPlaybackEnded(PlaybackEndedEvent event);

  void onMediaItemTransition(MediaItemTransitionEvent event);

  void onPictureInPictureModeChanged(PictureInPictureModeChangedEvent event);

  static void setup(PlaybackListenerPigeon? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PlaybackListenerPigeon.onPrimaryPlayerChanged', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPrimaryPlayerChanged was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PrimaryPlayerChangedEvent? arg_event = (args[0] as PrimaryPlayerChangedEvent?);
          assert(arg_event != null,
              'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPrimaryPlayerChanged was null, expected non-null PrimaryPlayerChangedEvent.');
          api.onPrimaryPlayerChanged(arg_event!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PlaybackListenerPigeon.onPositionDiscontinuity', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPositionDiscontinuity was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PositionDiscontinuityEvent? arg_event = (args[0] as PositionDiscontinuityEvent?);
          assert(arg_event != null,
              'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPositionDiscontinuity was null, expected non-null PositionDiscontinuityEvent.');
          api.onPositionDiscontinuity(arg_event!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PlaybackListenerPigeon.onPlayerStateUpdate', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPlayerStateUpdate was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PlayerStateUpdateEvent? arg_event = (args[0] as PlayerStateUpdateEvent?);
          assert(arg_event != null,
              'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPlayerStateUpdate was null, expected non-null PlayerStateUpdateEvent.');
          api.onPlayerStateUpdate(arg_event!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PlaybackListenerPigeon.onPlaybackStateChanged', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPlaybackStateChanged was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PlaybackStateChangedEvent? arg_event = (args[0] as PlaybackStateChangedEvent?);
          assert(arg_event != null,
              'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPlaybackStateChanged was null, expected non-null PlaybackStateChangedEvent.');
          api.onPlaybackStateChanged(arg_event!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PlaybackListenerPigeon.onPlaybackEnded', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPlaybackEnded was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PlaybackEndedEvent? arg_event = (args[0] as PlaybackEndedEvent?);
          assert(arg_event != null,
              'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPlaybackEnded was null, expected non-null PlaybackEndedEvent.');
          api.onPlaybackEnded(arg_event!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PlaybackListenerPigeon.onMediaItemTransition', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onMediaItemTransition was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final MediaItemTransitionEvent? arg_event = (args[0] as MediaItemTransitionEvent?);
          assert(arg_event != null,
              'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onMediaItemTransition was null, expected non-null MediaItemTransitionEvent.');
          api.onMediaItemTransition(arg_event!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PlaybackListenerPigeon.onPictureInPictureModeChanged', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPictureInPictureModeChanged was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PictureInPictureModeChangedEvent? arg_event = (args[0] as PictureInPictureModeChangedEvent?);
          assert(arg_event != null,
              'Argument for dev.flutter.pigeon.PlaybackListenerPigeon.onPictureInPictureModeChanged was null, expected non-null PictureInPictureModeChangedEvent.');
          api.onPictureInPictureModeChanged(arg_event!);
          return;
        });
      }
    }
  }
}
