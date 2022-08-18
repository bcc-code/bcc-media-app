import 'package:bccm_player/playback_service.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBccmPlayerPlatform
    with MockPlatformInterfaceMixin
    implements PlaybackPlatformInterface {
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
      Future<bool> setPrimary(String id) {
    // TODO: implement setPrimary
    throw UnimplementedError();
      }
    
      @override
      Future<void> setUrl({required String playerId, required String url, bool isLive = false}) {
    // TODO: implement setUrl
    throw UnimplementedError();
      }
}

void main() {
  final PlaybackPlatformInterface initialPlatform = PlaybackPlatformInterface.instance;

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
