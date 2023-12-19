import 'dart:async';

import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:bccm_core/api.dart';
import 'package:bccm_core/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/episode_state.dart';

final _timerProvider = StreamProvider.family<void, Duration>((ref, Duration duration) async* {
  while (true) {
    yield 1;
    await Future.delayed(duration);
  }
});

final todaysCalendarEpisodesProvider = FutureProvider<Query$CalendarDayEpisodeEntries$calendar?>((ref) async {
  await ref.watch(_timerProvider(const Duration(minutes: 30)).future);
  return await ref.read(apiProvider).getCalendarDayEpisodes(DateTime.now());
});

final currentLiveEpisodeFutureProvider = FutureProvider<Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry?>((ref) async {
  await ref.watch(_timerProvider(const Duration(seconds: 5)).future);
  final todaysEpisodes = await ref.read(todaysCalendarEpisodesProvider.future);
  if (todaysEpisodes == null) {
    return null;
  }
  for (var entry in todaysEpisodes.day.entries) {
    if (isLiveNow(entry.start, entry.end)) {
      return entry.asOrNull<Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry>();
    }
  }
  return null;
});

final currentLiveEpisodeProvider = StateProvider<Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry?>((ref) {
  return ref.watch(currentLiveEpisodeFutureProvider).valueOrNull;
});
