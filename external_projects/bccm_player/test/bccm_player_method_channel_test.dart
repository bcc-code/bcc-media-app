import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PlaybackPlatformPigeon platform = PlaybackPlatformPigeon();
  const MethodChannel channel = MethodChannel('bccm_player');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('newPlayer', () async {
    expect(await platform.newPlayer(""), '42');
  });
}
