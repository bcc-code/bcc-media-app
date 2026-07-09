import 'package:brunstadtv_app/helpers/episode_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // A fixed reference point so the date-boundary logic is deterministic.
  final now = DateTime.parse('2026-07-09T12:00:00Z');

  String daysFromNow(int days) => now.add(Duration(days: days)).toIso8601String();

  group('isUnavailable', () {
    test('returns false when publishDate is null', () {
      expect(isUnavailable(null, now: now), isFalse);
    });

    test('returns false when publishDate is not parseable', () {
      expect(isUnavailable('not-a-date', now: now), isFalse);
    });

    test('returns true when publish date is in the future', () {
      expect(isUnavailable(daysFromNow(1), now: now), isTrue);
    });

    test('returns false when publish date is in the past', () {
      expect(isUnavailable(daysFromNow(-1), now: now), isFalse);
    });
  });

  group('isComingSoon', () {
    test('returns false when publishDate is null', () {
      expect(isComingSoon(publishDate: null, locked: true, now: now), isFalse);
    });

    test('returns false when publishDate is not parseable', () {
      expect(isComingSoon(publishDate: 'nope', locked: true, now: now), isFalse);
    });

    test('returns true when locked and publishing within 2 days', () {
      expect(isComingSoon(publishDate: daysFromNow(1), locked: true, now: now), isTrue);
    });

    test('returns false when not locked, even if publishing soon', () {
      expect(isComingSoon(publishDate: daysFromNow(1), locked: false, now: now), isFalse);
    });

    test('returns false when publishing more than 2 days out', () {
      expect(isComingSoon(publishDate: daysFromNow(3), locked: true, now: now), isFalse);
    });

    test('returns false for already-published locked episodes', () {
      // A locked episode whose publish date is in the past is available now,
      // so it is not "coming soon".
      expect(isComingSoon(publishDate: daysFromNow(-1), locked: true, now: now), isFalse);
    });
  });

  group('isNewEpisode', () {
    test('returns false when locked', () {
      expect(isNewEpisode(daysFromNow(-1), true, now: now), isFalse);
    });

    test('returns false when publishDate is null', () {
      expect(isNewEpisode(null, false, now: now), isFalse);
    });

    test('returns false when publishDate is not parseable', () {
      expect(isNewEpisode('nope', false, now: now), isFalse);
    });

    test('returns true when published within the last 7 days', () {
      expect(isNewEpisode(daysFromNow(-3), false, now: now), isTrue);
    });

    test('returns false when published more than 7 days ago', () {
      expect(isNewEpisode(daysFromNow(-8), false, now: now), isFalse);
    });

    test('returns false when the publish date is in the future', () {
      expect(isNewEpisode(daysFromNow(1), false, now: now), isFalse);
    });

    test('returns true for an episode published just now', () {
      expect(isNewEpisode(now.toIso8601String(), false, now: now), isTrue);
    });
  });
}
