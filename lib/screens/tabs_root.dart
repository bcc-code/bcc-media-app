import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/components/mini_player.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/notification_service.dart';
import 'package:brunstadtv_app/screens/search/search.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import '../components/bottom_sheet_mini_player.dart';
import '../components/custom_tab_bar.dart';
import '../components/prompts/prompts.dart';
import '../components/web/web_app_bar.dart';
import '../models/scroll_screen.dart';
import '../providers/analytics.dart';
import '../providers/app_config.dart';
import '../theme/bccm_colors.dart';

class TabsRootScreen extends ConsumerStatefulWidget {
  static const route = '/';

  const TabsRootScreen({super.key});

  @override
  ConsumerState<TabsRootScreen> createState() => _TabsRootScreenState();
}

class _TabsRootScreenState extends ConsumerState<TabsRootScreen> with AutoRouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.watch(notificationServiceProvider).requestPermissionAndSetup();
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    print('Changed to settings tab from ${previousRoute.name}');
  }

  onTabTap(BuildContext context, int index) {
    final tabsRouter = AutoTabsRouter.of(context);
    // here we switch between tabs
    if (tabsRouter.activeIndex == index) {
      final stackRouterOfIndex = tabsRouter.stackRouterOfIndex(index);
      if (stackRouterOfIndex?.stack.length == 1) {
        final searchState = tabsRouter.topPage?.child.asOrNull<SearchScreen>()?.key?.asOrNull<GlobalKey<SearchScreenState>>()?.currentState;
        if (searchState != null) {
          searchState.clear();
        }
        final screenState = tabsRouter.topPage?.child.key?.asOrNull<GlobalKey>()?.currentState.asOrNull<ScrollScreen>();
        if (screenState != null) {
          screenState.scrollToTop();
        }
      } else {
        stackRouterOfIndex?.popUntilRoot();
      }
    } else {
      sendAnalytics(index);
    }
    tabsRouter.setActiveIndex(index);
  }

  void sendAnalytics(int index) {
    const indexToNameMap = ['home', 'search', 'livestream', 'calendar'];
    if (index < 0 || index > indexToNameMap.length - 1) return;
    final tabName = indexToNameMap[index];
    final appConfig = ref.read(appConfigProvider);
    appConfig.then((value) {
      String? pageCode;
      if (tabName == 'home') {
        pageCode = value?.application.page?.code;
      } else if (tabName == 'search') {
        pageCode = value?.application.searchPage?.code;
      }
      Map<String, dynamic> extraProperties = {};
      if (pageCode != null) {
        extraProperties['pageCode'] = pageCode;
      }
      ref.read(analyticsProvider).screen(tabName, properties: extraProperties);
    });
  }

  bool _shouldHideMiniPlayer(BuildContext context) {
    if (kIsWeb) return true;
    final router = context.watchRouter;
    final currentRouteMatch = router.currentSegments.lastOrNull;
    if (currentRouteMatch == null) {
      debugPrint('router.currentSegments empty');
      return true;
    }

    final String? currentMediaItemEpisodeId =
        ref.watch(primaryPlayerProvider.select((player) => player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>()));

    if (currentMediaItemEpisodeId == null) {
      return true;
    }
    if (currentRouteMatch.meta.containsKey('hide_mini_player')) {
      return true;
    }
    final bool isInPipMode = ref.watch(primaryPlayerProvider.select((value) => value?.isInPipMode == true));
    if (isInPipMode) {
      return true;
    }

    if (currentRouteMatch.name == EpisodeScreenRoute.name) {
      final currentEpisodePageArgsId = currentRouteMatch.pathParams.optString('episodeId');
      final autoplayQueryParam = currentRouteMatch.queryParams.get('autoplay', false);
      final currentEpisodePageArgsAutoplay =
          (autoplayQueryParam == true) || (autoplayQueryParam is String && autoplayQueryParam.toLowerCase() == 'true');

      if (currentEpisodePageArgsAutoplay == true) {
        return true;
      }

      if (currentEpisodePageArgsId != null && currentEpisodePageArgsId == currentMediaItemEpisodeId) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var routes = [
      const HomeScreenWrapperRoute(),
      SearchScreenWrapperRoute(children: [SearchScreenRoute(key: GlobalKey<SearchScreenState>())]),
    ];
    if (!ref.watch(authStateProvider).guestMode) {
      routes.addAll([
        const LiveScreenRoute(),
        const CalendarPageRoute(),
      ]);
    }
    return AutoTabsRouter(
      navigatorObservers: () => [HeroController()],
      routes: routes,
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Theme(
          data: Theme.of(context).copyWith(bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent)),
          child: Scaffold(
            appBar: kIsWeb ? WebAppBar(tabsRouter: tabsRouter, onTabTap: (i) => onTabTap(context, i)) : null,
            body: Padding(padding: EdgeInsets.only(bottom: _shouldHideMiniPlayer(context) ? 0 : kMiniPlayerHeight), child: child),
            bottomSheet: Container(
              color: BccmColors.background1, // Fix gap between prompts and miniPlayer due to antialiasing issue
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Prompts(),
                  BottomSheetMiniPlayer(hidden: _shouldHideMiniPlayer(context)),
                ],
              ),
            ),
            bottomNavigationBar: kIsWeb
                ? null
                : CustomTabBar(
                    tabsRouter: tabsRouter,
                    onTabTap: (i) => onTabTap(context, i),
                  ),
          ),
        );
      },
    );
  }
}
