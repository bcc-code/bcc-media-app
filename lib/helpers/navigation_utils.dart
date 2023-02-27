import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/client.dart';
import '../graphql/queries/episode.graphql.dart';
import '../graphql/queries/studies.graphql.dart';
import '../providers/analytics.dart';
import '../router/router.gr.dart';
import 'navigation_override.dart';
import 'utils.dart';

extension StackRouterCustomNavigation on StackRouter {
  Future navigateNamedFromRoot(String path) {
    var result = root.matcher.match(path, includePrefixMatches: true);
    if (result != null) {
      return navigateAll(result);
    }
    return Future.value();
  }
}

extension ToQueryString on Parameters {
  String toQueryStringWithQuestionMark() {
    if (isEmpty) {
      return '';
    }
    var queryString = '?';
    queryString += rawMap.entries.map((kv) => '${kv.key}=${kv.value}').join('&');
    return queryString;
  }
}

String uriStringWithoutHost(Uri uri) {
  var result = uri.path;
  if (uri.query.isNotEmpty) {
    result += '?${uri.query}';
  }
  if (uri.fragment.isNotEmpty) {
    result += '#${uri.fragment}';
  }
  return result;
}

Future<dynamic>? navigateToShowWithoutEpisodeId(BuildContext context, String showId) async {
  debugPrint('navigateToShowWithoutEpisodeId');
  final navigationOverride = NavigationOverride.of(context);
  final router = context.router;
  final result = await ProviderScope.containerOf(context, listen: false)
      .read(gqlClientProvider)
      .query$getDefaultEpisodeForShow(Options$Query$getDefaultEpisodeForShow(variables: Variables$Query$getDefaultEpisodeForShow(showId: showId)));
  final episodeId = result.parsedData?.$show.defaultEpisode.id;
  if (episodeId == null) {
    throw ErrorHint('Failed getting defaultEpisodeId for show $showId');
  }
  return overrideAwareNavigation(navigationOverride, router, EpisodeScreenRoute(episodeId: episodeId));
}

Future<bool>? navigateToStudyTopic(BuildContext context, String topicId) async {
  // TODO: nothing is as permanent as a temporary solution lol
  debugPrint('navigateToStudyTopic');
  final navigationOverride = NavigationOverride.of(context);
  final router = context.router;
  final ref = ProviderScope.containerOf(context, listen: false);
  tryCatchRecordError(() {
    final analytics = ref.read(analyticsProvider);
    analytics.sectionItemClicked(context);
  });
  final result = await ref.read(gqlClientProvider).query$GetStudyTopicLessonStatuses(Options$Query$GetStudyTopicLessonStatuses(
        variables: Variables$Query$GetStudyTopicLessonStatuses(id: topicId, first: 100),
      ));
  var episodeId = result.parsedData?.studyTopic.lessons.items
      .firstWhereOrNull((el) => !el.completed && el.episodes.items.firstOrNull?.locked == false)
      ?.episodes
      .items
      .firstOrNull
      ?.id;
  episodeId ??= result.parsedData?.studyTopic.lessons.items
      .lastWhereOrNull((el) => el.episodes.items.firstOrNull?.locked == false)
      ?.episodes
      .items
      .firstOrNull
      ?.id;
  if (episodeId == null) {
    throw ErrorHint('Failed finding an episode to navigate to for topic $topicId');
  }
  await overrideAwareNavigation(navigationOverride, router, EpisodeScreenRoute(episodeId: episodeId));
  return true;
}
