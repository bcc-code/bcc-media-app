import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBccmPlayerPlatform
    with MockPlatformInterfaceMixin
    implements PlaybackPlatformInterface {
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
  Future<void> replaceCurrentMediaItem(String playerId, MediaItem mediaItem) {
    // TODO: implement replaceCurrentMediaItem
    throw UnimplementedError();
  }

  @override
  Future<bool> setPrimary(String id) {
    // TODO: implement setPrimary
    throw UnimplementedError();
  }
}

void main() {
  final PlaybackPlatformInterface initialPlatform = PlaybackService();

  test('$PlaybackService is the default instance', () {
    expect(initialPlatform, isInstanceOf<PlaybackService>());
  });

  test('getPlatformVersion', () async {
    PlaybackService bccmPlayerPlugin = PlaybackService();
    MockBccmPlayerPlatform fakePlatform = MockBccmPlayerPlatform();
    PlaybackPlatformInterface.instance = fakePlatform;

    expect(await bccmPlayerPlugin.getPlatformVersion(), '42');
  });
}
