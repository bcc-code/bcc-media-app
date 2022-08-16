import 'package:bccm_player/playback_service_pigeon.g.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PlaybackServicePigeon platform = PlaybackServicePigeon();
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
