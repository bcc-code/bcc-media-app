import 'package:bccm_core/bccm_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('kiloBytesToString', () {
    test('converts kilobytes to a rounded MB string', () {
      expect(kiloBytesToString(1000), '1 MB');
      expect(kiloBytesToString(2500), '3 MB'); // rounds 2.5 -> 3
      expect(kiloBytesToString(0), '0 MB');
    });
  });

  group('kiloBytesForBitrateAndDuration', () {
    test('computes size from bitrate (bits/s) and duration', () {
      // 8000 bits/s for 10s = 80000 bits = 10000 bytes = 10 KB
      expect(kiloBytesForBitrateAndDuration(8000, const Duration(seconds: 10)), 10);
    });

    test('is zero for a zero-length duration', () {
      expect(kiloBytesForBitrateAndDuration(5000, Duration.zero), 0);
    });

    test('scales linearly with duration', () {
      final oneMinute = kiloBytesForBitrateAndDuration(128000, const Duration(minutes: 1));
      final twoMinutes = kiloBytesForBitrateAndDuration(128000, const Duration(minutes: 2));
      expect(twoMinutes, oneMinute * 2);
    });
  });
}
