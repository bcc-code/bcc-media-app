import 'dart:async';

import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/graphql/queries/calendar_episode_entries.graphql.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/utils.dart';

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

final currentLiveEpisodeProvider = FutureProvider<Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry?>((ref) async {
  await ref.watch(_timerProvider(const Duration(seconds: 5)).future);
  final todaysEpisodes = await ref.watch(todaysCalendarEpisodesProvider.future);
  if (todaysEpisodes == null) {
    return null;
  }
  for (var entry in todaysEpisodes.day.entries) {
    if (isLiveNow(entry.start, entry.end)) {
      return entry as Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry;
    }
  }
  return null;
});
