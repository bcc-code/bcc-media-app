import 'dart:async';

import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/graphql/queries/calendar_episode_entries.graphql.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/utils.dart';

final _timerProvider = StreamProvider.family<int, Duration>((ref, Duration duration) async* {
  var counter = 0;
  while (true) {
    yield counter++;
    await Future.delayed(duration);
  }
});

final todaysCalendarEpisodes = FutureProvider<Query$CalendarDayEpisodeEntries$calendar?>((ref) async {
  await ref.watch(_timerProvider(const Duration(minutes: 30)).future);
  return await ref.read(apiProvider).getCalendarDayEpisodes(DateTime.now().add(Duration(hours: 4, minutes: 25)));
});

final currentLiveEpisode = FutureProvider<Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry?>((ref) async {
  await ref.watch(_timerProvider(const Duration(seconds: 5)).future);
  final todaysEpisodes = await ref.watch(todaysCalendarEpisodes.future);
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
