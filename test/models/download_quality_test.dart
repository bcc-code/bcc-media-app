import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/models/offline/download_quality.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Track track({required String id, int? bitrate, int? height}) {
    return Track(id: id, bitrate: bitrate, height: height, isSelected: false);
  }

  group('downloadQualitiesForTracks', () {
    test('returns an empty map for no tracks', () {
      expect(downloadQualitiesForTracks([]), isEmpty);
    });

    test('ignores tracks without a valid bitrate or height', () {
      final result = downloadQualitiesForTracks([
        track(id: 'no-bitrate', bitrate: null, height: 360),
        track(id: 'zero-bitrate', bitrate: 0, height: 360),
        track(id: 'no-height', bitrate: 1000, height: null),
      ]);
      expect(result, isEmpty);
    });

    test('buckets by height with 360/720 thresholds (inclusive upper bounds)', () {
      final result = downloadQualitiesForTracks([
        track(id: 'low', bitrate: 500, height: 360),
        track(id: 'medium', bitrate: 1500, height: 720),
        track(id: 'high', bitrate: 4000, height: 1080),
      ]);
      expect(result[DownloadQuality.low]?.id, 'low');
      expect(result[DownloadQuality.medium]?.id, 'medium');
      expect(result[DownloadQuality.high]?.id, 'high');
    });

    test('picks the highest track within each bucket', () {
      final result = downloadQualitiesForTracks([
        track(id: 'low-240', bitrate: 300, height: 240),
        track(id: 'low-360', bitrate: 600, height: 360),
        track(id: 'high-1080', bitrate: 4000, height: 1080),
        track(id: 'high-2160', bitrate: 8000, height: 2160),
      ]);
      expect(result[DownloadQuality.low]?.id, 'low-360');
      expect(result.containsKey(DownloadQuality.medium), isFalse);
      expect(result[DownloadQuality.high]?.id, 'high-2160');
    });

    test('361p falls into the medium bucket, not low', () {
      final result = downloadQualitiesForTracks([track(id: 'just-above-low', bitrate: 800, height: 361)]);
      expect(result.containsKey(DownloadQuality.low), isFalse);
      expect(result[DownloadQuality.medium]?.id, 'just-above-low');
    });
  });
}
