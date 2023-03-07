import 'package:bccm_player/playback_platform_mobile.dart';
import 'package:bccm_player/src/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_platform_interface.dart';
import 'package:bccm_player/src/state/plugin_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBccmPlayerPlatform with MockPlatformInterfaceMixin implements PlaybackPlatformInterface {
  @override
  chromecastEventStream() => const Stream.empty();

  @override
  Future<ChromecastState> getChromecastState() {
    // TODO: implement getChromecastState
    throw UnimplementedError();
  }

  @override
  Future<String?> getPlatformVersion() {
    // TODO: implement getPlatformVersion
    throw UnimplementedError();
  }

  @override
  Future<String> newPlayer({String? url}) {
    // TODO: implement newPlayer
    throw UnimplementedError();
  }

  @override
  Future<void> queueMediaItem(String playerId, MediaItem mediaItem) {
    // TODO: implement queueMediaItem
    throw UnimplementedError();
  }

  @override
  Future<void> replaceCurrentMediaItem(String playerId, MediaItem mediaItem, {bool? playbackPositionFromPrimary, bool? autoplay}) {
    // TODO: implement replaceCurrentMediaItem
    throw UnimplementedError();
  }

  @override
  Future<bool> setPrimary(String id) {
    // TODO: implement setPrimary
    throw UnimplementedError();
  }

  @override
  void openCastDialog() {
    // TODO: implement openCastDialog
  }

  @override
  void openExpandedCastController() {
    // TODO: implement openExpandedCastController
  }

  @override
  void pause(String playerId) {
    // TODO: implement pause
  }

  @override
  void play(String playerId) {
    // TODO: implement play
  }

  @override
  void setNpawConfig(NpawConfig? config) {
    // TODO: implement setNpawConfig
  }

  @override
  Future<void> addPlaybackListener(PlaybackListenerPigeon listener) {
    // TODO: implement setPlaybackListener
    throw UnimplementedError();
  }

  @override
  void stop(String playerId, bool reset) {
    // TODO: implement stop
  }

  @override
  void setAppConfig(AppConfig? config) {
    // TODO: implement setAppConfig
  }

  @override
  void setPlayerViewVisibility(int viewId, bool visible) {
    // TODO: implement setPlayerViewVisibility
  }

  @override
  // TODO: implement stateNotifier
  PlayerPluginStateNotifier get stateNotifier => throw UnimplementedError();
}

void main() {
  final PlaybackPlatformInterface initialPlatform = PlaybackPlatformInterface.instance;

  test('$PlaybackPlatformMobile is the default instance', () {
    expect(initialPlatform, isInstanceOf<PlaybackPlatformMobile>());
  });
}
