import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:collection/collection.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:bccm_core/platform.dart';
import '../../router/router.gr.dart';
import 'navigation_override.dart';

Future<dynamic>? navigateToShowWithoutEpisodeId(BuildContext context, String showId) async {
  debugPrint('navigateToShowWithoutEpisodeId');
  final navigationOverride = NavigationOverride.of(context);
  final router = context.router;
  final result = await ProviderScope.containerOf(context, listen: false)
      .read(bccmGraphQLProvider)
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
  final result = await ref.read(bccmGraphQLProvider).query$GetStudyTopicLessonStatuses(Options$Query$GetStudyTopicLessonStatuses(
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
  ref.read(analyticsProvider).sectionItemClicked(context);
  return navigateToSectionItem(context, item, collectionId: collectionId);
}

/// Type-safe wrapper for [_navigateToItem]
Future<dynamic>? navigateToSectionItem(BuildContext context, Fragment$ItemSectionItem$item item, {String? collectionId}) {
  return _navigateToItem(context, item, collectionId: collectionId);
}

/// Type-safe wrapper for [_navigateToItem]
Future<dynamic>? navigateToContributionItem(BuildContext context, Fragment$Contribution$item item, {String? collectionId}) {
  return _navigateToItem(context, item, collectionId: collectionId);
}

/// For this to work, the item must be navigatable, i.e. one of the Fragment$Navigatable* types
Future<dynamic>? _navigateToItem(BuildContext context, Object item, {String? collectionId}) {
  final navigationOverride = NavigationOverride.of(context);
  final router = context.router;
  final episodeItem = item.asOrNull<Fragment$NavigatableEpisode>();
  if (episodeItem != null) {
    if (episodeItem.locked) {
      debugPrint('bccm: warning, tried to navigate to locked episode ${episodeItem.id} ${StackTrace.current}');
      return null;
    }
    return overrideAwareNavigation(navigationOverride, router, EpisodeScreenRoute(episodeId: episodeItem.id, collectionId: collectionId));
  }

  final personItem = item.asOrNull<Fragment$NavigatablePerson>();
  if (personItem != null) {
    return router.navigate(HomeWrapperScreenRoute(
      children: [ContributorScreenRoute(personId: personItem.id)],
    ));
  }

  final shortItem = item.asOrNull<Fragment$NavigatableShort>();
  if (shortItem != null) {
    return router.navigate(HomeWrapperScreenRoute(
      children: [ShortScreenRoute(id: shortItem.id)],
    ));
  }

  final showItem = item.asOrNull<Fragment$NavigatableShow>();
  if (showItem != null) {
    return overrideAwareNavigation(navigationOverride, router, ShowScreenRoute(showId: showItem.id));
  }

  final pageItem = item.asOrNull<Fragment$NavigatablePage>();
  if (pageItem != null) {
    return overrideAwareNavigation(navigationOverride, router, PageScreenRoute(pageCode: pageItem.code));
  }

  final linkItem = item.asOrNull<Fragment$NavigatableLink>();
  if (linkItem != null) {
    final uri = Uri.tryParse(linkItem.url);
    if (uri == null) return null;
    if (uri.scheme.isEmpty) {
      return context.router.root.navigateNamedFromRoot(linkItem.url);
    }
    return launchUrlString(linkItem.url, mode: LaunchMode.externalApplication);
  }

  final gameItem = item.asOrNull<Fragment$NavigatableGame>();
  if (gameItem != null) {
    return context.router.root.push(WebviewScreenRoute(redirectCode: '/game-${gameItem.uuid}'));
  }

  final chapter = item.asOrNull<Fragment$Contribution$item$$Chapter>();
  if (chapter != null) {
    final episode = chapter.episode;
    if (episode == null) {
      FirebaseCrashlytics.instance.recordError(ErrorHint('Chapter without episode'), StackTrace.current);
      return null;
    }
    debugPrint('Navigating to chapter ${chapter.id} in episode ${episode.id} at time ${chapter.start}');
    overrideAwareNavigation(
      navigationOverride,
      router,
      EpisodeScreenRoute(
        episodeId: episode.id,
        queryParamStartPositionSeconds: chapter.start,
        autoplay: true,
      ),
    );
  }

  return null;
}
