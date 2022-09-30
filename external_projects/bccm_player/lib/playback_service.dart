import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [BccmPlayerPlatform] that uses method channels.
class PlaybackService extends PlaybackPlatformInterface {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bccm_player');

  final PlaybackPlatformPigeon _pigeon = PlaybackPlatformPigeon();
  final List<PlaybackListenerPigeon> listeners = [];

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String> newPlayer({String? url}) {
    return _pigeon.newPlayer(url);
  }

  @override
  Future<bool> setPrimary(String id) async {
    await _pigeon.setPrimary(id);
    return true;
  }

  @override
  Future<void> replaceCurrentMediaItem(String playerId, MediaItem mediaItem,
      {bool? playbackPositionFromPrimary, bool? autoplay}) async {
    await _pigeon.replaceCurrentMediaItem(
        playerId, mediaItem, playbackPositionFromPrimary, autoplay);
  }

  @override
  Future<void> queueMediaItem(String playerId, MediaItem mediaItem) {
    return _pigeon.queueMediaItem(playerId, mediaItem);
  }

  @override
  Future<ChromecastState?> getChromecastState() {
    return _pigeon.getChromecastState();
  }

  @override
  void openExpandedCastController() {
    _pigeon.openExpandedCastController();
  }

  @override
  void openCastDialog() {
    _pigeon.openCastDialog();
  }

  @override
  Future<void> setPlaybackListener(PlaybackListenerPigeon listener) async {
    PlaybackListenerPigeon.setup(listener);
  }

  @override
  void play(String playerId) {
    _pigeon.play(playerId);
  }

  @override
  void pause(String playerId) {
    _pigeon.pause(playerId);
  }

  @override
  void stop(String playerId, bool reset) {
    _pigeon.stop(playerId, reset);
  }

  @override
  void setNpawConfig(NpawConfig? config) {
    _pigeon.setNpawConfig(config);
  }
}
