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

  bool _shouldHideMiniPlayer(BuildContext context) {
    if (kIsWeb) return true;
    final router = context.watchRouter;
    final currentRouteMatch = router.currentSegments.lastOrNull;
    if (currentRouteMatch == null) {
      debugPrint('router.currentSegments empty');
      return true;
    }
    final StateNotifierProvider<PlayerStateNotifier, PlayerState?>? playerProvider;
    if (ref.watch(isCasting)) {
      playerProvider = castPlayerProvider;
    } else {
      playerProvider = primaryPlayerProvider;
    }

    final String? currentMediaItemEpisodeId =
        ref.watch(playerProvider.select((player) => player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>()));

    if (currentMediaItemEpisodeId == null) {
      return true;
    }
    if (currentRouteMatch.meta.containsKey('hide_mini_player')) {
      return true;
    }
    final bool isInPipMode = ref.watch(playerProvider.select((value) => value?.isInPipMode == true));
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
              bottomNavigationBar: CustomTabBar(tabsRouter: tabsRouter)),
        );
      },
    );
  }
}
