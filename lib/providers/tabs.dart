import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../flavors.dart';
import '../l10n/app_localizations.dart';
import '../router/router.gr.dart';
import '../screens/tabs/search.dart';
import 'auth_state/auth_state.dart';
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

  const TabInfo({
    required this.id,
    required this.route,
    required this.title,
    required this.icon,
    required this.analyticsName,
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
    ),
    games: TabInfo(
      id: TabId.games,
      route: const GamesWrapperScreenRoute(),
      title: (BuildContext context) => S.of(context).gamesTab,
      icon: FlavorConfig.current.bccmImages!.games,
      analyticsName: 'games',
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
    ),
    live: TabInfo(
      id: TabId.live,
      route: const LiveScreenRoute(),
      title: (BuildContext context) => S.of(context).liveTab,
      icon: FlavorConfig.current.bccmImages!.live,
      analyticsName: 'live',
    ),
    calendar: TabInfo(
      id: TabId.calendar,
      route: const CalendarScreenRoute(),
      title: (BuildContext context) => S.of(context).calendar,
      icon: FlavorConfig.current.bccmImages!.calendar,
      analyticsName: 'calendar',
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
    ),
    profile: TabInfo(
      id: TabId.profile,
      route: const ProfileWrapperScreenRoute(),
      title: (BuildContext context) => S.of(context).profileTab,
      icon: FlavorConfig.current.bccmImages!.profile,
      analyticsName: 'profile',
    ),
  );
});

final currentTabIdsProvider = Provider<List<TabId>>((ref) {
  final enableGames = ref.watch(featureFlagsProvider.select((value) => value.gamesTab));
  final guest = ref.watch(authStateProvider).guestMode;
  final shorts = ref.watch(featureFlagsProvider.select((value) => value.shorts));
  return [
    TabId.home,
    if (enableGames) TabId.games,
    TabId.search,
    if (!guest) TabId.live,
    if (!guest && shorts) TabId.shorts,
    if (!guest && !shorts) TabId.calendar,
    TabId.profile,
  ];
});
