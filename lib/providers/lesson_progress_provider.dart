import 'package:bccm_core/platform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


typedef LessonProgressCache = Map<String, Fragment$EpisodeLessonProgressOverview>;

final lessonProgressCacheProvider = StateNotifierProvider<LessonProgressCacheNotifier, LessonProgressCache>((ref) {
  return LessonProgressCacheNotifier(ref: ref);
});

class LessonProgressCacheNotifier extends StateNotifier<LessonProgressCache> {
  final Ref ref;
  LessonProgressCacheNotifier({required this.ref}) : super({});

  void _setStateForSingle(Fragment$EpisodeLessonProgressOverview episode) {
    state = {
      ...state,
      episode.id: episode,
    };
  }

  void _setStateForMany(List<Fragment$EpisodeLessonProgressOverview> episodes) {
    var cacheCopy = {...state};
    for (var element in episodes) {
      cacheCopy[element.id] = element;
    }
    state = cacheCopy;
  }

  Future<Query$GetEpisodeLessonProgress?> loadLessonProgressForEpisode(String id) async {
    final value = await ref.read(bccmGraphQLProvider).query$GetEpisodeLessonProgress(
          Options$Query$GetEpisodeLessonProgress(
            variables: Variables$Query$GetEpisodeLessonProgress(
              id: id,
            ),
          ),
        );
    final data = value.parsedData;
    if (mounted && data != null) _setStateForSingle(data.episode);
    return data;
  }

  Future<Query$GetSeasonLessonProgress?> loadLessonProgressForSeason(String id) async {
    final value = await ref.read(bccmGraphQLProvider).query$GetSeasonLessonProgress(
          Options$Query$GetSeasonLessonProgress(
            variables: Variables$Query$GetSeasonLessonProgress(id: id),
          ),
        );
    final data = value.parsedData;
    if (mounted && data != null) _setStateForMany(data.season.episodes.items);
    return data;
  }
}

final lessonProgressProvider = Provider.family.autoDispose<Fragment$EpisodeLessonProgressOverview?, String>((ref, id) {
  return ref.watch(lessonProgressCacheProvider)[id];
});
