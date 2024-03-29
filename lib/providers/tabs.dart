import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../flavors.dart';
import '../l10n/app_localizations.dart';
import '../router/router.gr.dart';
import '../screens/tabs/search.dart';
import 'feature_flags.dart';

enum TabId {
  home,
  games,
  search,
  live,
  calendar,
  shorts,
  profile,
}

class TabInfo {
  final TabId id;
  final PageRouteInfo<void> route;
  final String Function(BuildContext context) title;
  final StateImageProvider icon;
  final String analyticsName;
  final GlobalKey iconKey;

  const TabInfo({
    required this.id,
    required this.route,
    required this.title,
    required this.icon,
    required this.analyticsName,
    required this.iconKey,
  });
}

class TabInfos {
  final TabInfo home;
  final TabInfo games;
  final TabInfo search;
  final TabInfo live;
  final TabInfo calendar;
  final TabInfo shorts;
  final TabInfo profile;

  const TabInfos({
    required this.home,
    required this.games,
    required this.search,
    required this.live,
    required this.calendar,
    required this.shorts,
    required this.profile,
  });

  TabInfo getFor(TabId id) {
    return switch (id) {
      TabId.home => home,
      TabId.games => games,
      TabId.search => search,
      TabId.live => live,
      TabId.calendar => calendar,
      TabId.shorts => shorts,
      TabId.profile => profile
    };
  }
}

final tabInfosProvider = Provider<TabInfos>((ref) {
  return TabInfos(
    home: TabInfo(
      id: TabId.home,
      route: const HomeWrapperScreenRoute(),
      title: (BuildContext context) => S.of(context).homeTab,
      icon: FlavorConfig.current.bccmImages!.home,
      analyticsName: 'home',
      iconKey: GlobalKey(),
    ),
    games: TabInfo(
      id: TabId.games,
      route: const GamesWrapperScreenRoute(),
      title: (BuildContext context) => S.of(context).gamesTab,
      icon: FlavorConfig.current.bccmImages!.games,
      analyticsName: 'games',
      iconKey: GlobalKey(),
    ),
    search: TabInfo(
      id: TabId.search,
      route: SearchWrapperScreenRoute(
        children: [
          SearchScreenRoute(key: GlobalKey<SearchScreenState>()),
        ],
      ),
      title: (BuildContext context) => S.of(context).search,
      icon: FlavorConfig.current.bccmImages!.search,
      analyticsName: 'search',
      iconKey: GlobalKey(),
    ),
    live: TabInfo(
      id: TabId.live,
      route: const LiveScreenRoute(),
      title: (BuildContext context) => S.of(context).liveTab,
      icon: FlavorConfig.current.bccmImages!.live,
      analyticsName: 'live',
      iconKey: GlobalKey(),
    ),
    calendar: TabInfo(
      id: TabId.calendar,
      route: const CalendarScreenRoute(),
      title: (BuildContext context) => S.of(context).calendar,
      icon: FlavorConfig.current.bccmImages!.calendar,
      analyticsName: 'calendar',
      iconKey: GlobalKey(),
    ),
    shorts: TabInfo(
      id: TabId.shorts,
      route: ShortsWrapperScreenRoute(
        children: [
          ShortsScreenRoute(),
        ],
      ),
      title: (BuildContext context) => S.of(context).shortsTab,
      icon: FlavorConfig.current.bccmImages!.shorts,
      analyticsName: 'shorts',
      iconKey: GlobalKey(),
    ),
    profile: TabInfo(
      id: TabId.profile,
      route: const ProfileWrapperScreenRoute(),
      title: (BuildContext context) => S.of(context).profileTab,
      icon: FlavorConfig.current.bccmImages!.profile,
      analyticsName: 'profile',
      iconKey: GlobalKey(),
    ),
  );
});

final currentTabIdsProvider = Provider<List<TabId>>((ref) {
  final enableGames = ref.watch(featureFlagsProvider.select((value) => value.gamesTab));
  final guest = ref.watch(authStateProvider).guestMode;
  final shorts = ref.watch(featureFlagsProvider.select((value) => value.shorts));
  final live = !ref.watch(featureFlagsProvider.select((value) => value.removeLiveTab));
  final liveAppTransitionStarted =
      ref.watch(featureFlagsProvider.select((value) => value.linkToBccLive || value.forceBccLive || value.removeLiveTab));
  return [
    TabId.home,
    if (enableGames) TabId.games,
    TabId.search,
    if (!guest && live) TabId.live,
    if (!guest && shorts) TabId.shorts,
    if (!guest && !shorts && !liveAppTransitionStarted) TabId.calendar,
    TabId.profile,
  ];
});
