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
  search,
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
  final ScrollController? scrollController;

  const TabInfo({
    required this.id,
    required this.route,
    required this.title,
    required this.icon,
    required this.analyticsName,
    required this.iconKey,
    this.scrollController,
  });
}

class TabInfos {
  final TabInfo home;
  final TabInfo search;
  final TabInfo shorts;
  final TabInfo profile;

  const TabInfos({
    required this.home,
    required this.search,
    required this.shorts,
    required this.profile,
  });

  TabInfo getFor(TabId id) {
    return switch (id) {
      TabId.home => home,
      TabId.search => search,
      TabId.shorts => shorts,
      TabId.profile => profile,
    };
  }
}

/// Using riverpod here just because it's a simple way to cache the scroll controllers for each tab
final _scrollControllers = Provider.family<ScrollController, String>((ref, String id) {
  final controller = ScrollController(debugLabel: id);
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

final tabInfosProvider = Provider<TabInfos>((ref) {
  return TabInfos(
    home: TabInfo(
      id: TabId.home,
      route: const HomeWrapperScreenRoute(),
      title: (BuildContext context) => S.of(context).homeTab,
      icon: FlavorConfig.current.bccmImages!.home,
      analyticsName: 'home',
      iconKey: GlobalKey(),
      scrollController: ref.watch(_scrollControllers('home')),
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
      scrollController: ref.watch(_scrollControllers('search')),
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
      scrollController: ref.watch(_scrollControllers('profile')),
    ),
  );
});

final currentTabIdsProvider = Provider<List<TabId>>((ref) {
  final bccMember = ref.watch(authStateProvider).isBccMember;
  final shorts = ref.watch(featureFlagsProvider.select((value) => value.shorts));
  return [
    TabId.home,
    TabId.search,
    if (bccMember && shorts) TabId.shorts,
    TabId.profile,
  ];
});
