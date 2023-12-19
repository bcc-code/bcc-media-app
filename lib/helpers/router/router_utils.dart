import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:brunstadtv_app/providers/graphql.dart';
import 'package:bccm_core/api.dart';
import '../../providers/analytics.dart';
import '../../providers/todays_calendar_entries.dart';
import '../../router/router.gr.dart';
import 'special_routes.dart';
import 'navigation_override.dart';

extension StackRouterCustomNavigation on StackRouter {
  Future navigateNamedFromRoot(String path, {OnNavigationFailure? onFailure}) async {
    final context = navigatorKey.currentState?.context;
    debugPrint('navigateNamedFromRoot, navigatorKey: ${navigatorKey.currentState?.context}, using context: $context');
    // ignore: use_build_context_synchronously
    if (context != null) {
      final ref = ProviderScope.containerOf(context, listen: false);
      if (await ref.read(specialRoutesHandlerProvider).handle(context, path)) {
        debugPrint('Route handled by SpecialRoutesHandler');
        return;
      }
    }
    var result = root.matcher.match(path, includePrefixMatches: true);
    if (result != null) {
      return navigateAll(result, onFailure: onFailure);
    }
    return Future.value();
  }
}

extension ToQueryString on Parameters {
  String toQueryString() {
    return mapToQueryString(rawMap);
  }
}

String mapToQueryString(Map<String, dynamic> rawMap) {
  if (rawMap.isEmpty) {
    return '';
  }
  var queryString = '?';
  queryString += rawMap.entries.map((kv) => '${kv.key}=${kv.value}').join('&');
  return queryString;
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

Future<dynamic>? handleSectionItemClick(BuildContext context, Fragment$ItemSectionItem$item item, {String? collectionId}) {
  final ref = ProviderScope.containerOf(context, listen: false);
  final analytics = ref.read(analyticsProvider);
  analytics.sectionItemClicked(context);

  final navigationOverride = NavigationOverride.of(context);
  final router = context.router;
  final episodeItem = item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
  if (episodeItem != null) {
    final isLive = ref.read(currentLiveEpisodeProvider)?.episode?.id == episodeItem.id;
    if (!episodeItem.locked) {
      return overrideAwareNavigation(navigationOverride, router, EpisodeScreenRoute(episodeId: episodeItem.id, collectionId: collectionId));
    } else if (isLive) {
      return router.navigate(const LiveScreenRoute());
    }
  }

  final showItem = item.asOrNull<Fragment$ItemSectionItem$item$$Show>();
  if (showItem != null) {
    return overrideAwareNavigation(navigationOverride, router, EpisodeScreenRoute(episodeId: showItem.defaultEpisode.id));
  }

  final pageItem = item.asOrNull<Fragment$ItemSectionItem$item$$Page>();
  if (pageItem != null) {
    return overrideAwareNavigation(navigationOverride, router, PageScreenRoute(pageCode: pageItem.code));
  }

  final linkItem = item.asOrNull<Fragment$ItemSectionItem$item$$Link>();
  if (linkItem != null) {
    return launchUrlString(linkItem.url, mode: LaunchMode.externalApplication);
  }

  final gameItem = item.asOrNull<Fragment$ItemSectionItem$item$$Game>();
  if (gameItem != null) {
    return context.router.root.push(GameScreenRoute(gameId: gameItem.uuid));
  }

  return null;
}
