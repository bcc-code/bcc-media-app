import 'package:bccm_player/playback_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bccm_player/platform_interface.dart';
import 'package:bccm_player/bccm_player_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBccmPlayerPlatform
    with MockPlatformInterfaceMixin
    implements BccmPlayerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  
  @override
  Future<String?> setPrimary(String id) {
    // TODO: implement setPrimary
    throw UnimplementedError();
  }
  
  @override
  Future<String> newPlayer({String? url}) {
    // TODO: implement newPlayer
    throw UnimplementedError();
  }
  
  @override
  Future<void> setUrl({required String playerId, required String url, bool isLive = false}) {
    // TODO: implement setUrl
    throw UnimplementedError();
  }
}

void main() {
  final BccmPlayerPlatform initialPlatform = BccmPlayerPlatform.instance;

  test('$MethodChannelBccmPlayer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBccmPlayer>());
  });

  test('getPlatformVersion', () async {
    PlaybackService bccmPlayerPlugin = PlaybackService();
    MockBccmPlayerPlatform fakePlatform = MockBccmPlayerPlatform();
    BccmPlayerPlatform.instance = fakePlatform;

    expect(await bccmPlayerPlugin.getPlatformVersion(), '42');
  });
}
