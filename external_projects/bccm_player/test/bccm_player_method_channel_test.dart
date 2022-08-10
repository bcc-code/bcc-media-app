import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bccm_player/bccm_player_method_channel.dart';

void main() {
  MethodChannelBccmPlayer platform = MethodChannelBccmPlayer();
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

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
