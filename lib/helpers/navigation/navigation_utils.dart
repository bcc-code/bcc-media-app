import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../graphql/client.dart';
import '../../graphql/queries/episode.graphql.dart';
import '../../graphql/queries/page.graphql.dart';
import '../../graphql/queries/studies.graphql.dart';
import '../../providers/analytics.dart';
import '../../providers/todays_calendar_entries.dart';
import '../../router/router.gr.dart';
import 'navigation_override.dart';
import '../utils.dart';
import '../extensions.dart';

extension StackRouterCustomNavigation on StackRouter {
  Future navigateNamedFromRoot(String path, {OnNavigationFailure? onFailure}) {
    var result = root.matcher.match(path, includePrefixMatches: true);
    if (result != null) {
      return navigateAll(result, onFailure: onFailure);
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

Future overrideAwareNavigation(NavigationOverride? override, StackRouter router, PageRouteInfo<dynamic> route) {
  if (override?.pushInsteadOfReplace == true) {
    return router.push(route);
  } else {
    return router.navigate(route);
  }
}

Future<dynamic>? handleSectionItemClick(BuildContext context, Fragment$ItemSectionItem$item item) {
  final ref = ProviderScope.containerOf(context, listen: false);
  final analytics = ref.read(analyticsProvider);
  analytics.sectionItemClicked(context);

  final navigationOverride = NavigationOverride.of(context);
  final router = context.router;
  var episodeItem = item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
  if (episodeItem != null) {
    final curLiveEpisodeId = ref.read(currentLiveEpisodeProvider)?.episode?.id;
    if (curLiveEpisodeId == episodeItem.id) {
      router.navigate(const LiveScreenRoute());
      return null;
    }
    return overrideAwareNavigation(navigationOverride, router, EpisodeScreenRoute(episodeId: episodeItem.id));
  }

  var showItem = item.asOrNull<Fragment$ItemSectionItem$item$$Show>();
  if (showItem != null) {
    return overrideAwareNavigation(navigationOverride, router, EpisodeScreenRoute(episodeId: showItem.defaultEpisode.id));
  }

  var pageItem = item.asOrNull<Fragment$ItemSectionItem$item$$Page>();
  if (pageItem != null) {
    return overrideAwareNavigation(navigationOverride, router, PageScreenRoute(pageCode: pageItem.code));
  }

  var linkItem = item.asOrNull<Fragment$ItemSectionItem$item$$Link>();
  if (linkItem != null) {
    return launchUrlString(linkItem.url, mode: LaunchMode.externalApplication);
  }

  return null;
}
