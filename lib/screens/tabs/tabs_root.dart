import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/components/guides/tab_feature_guides.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/events.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../components/player/bottom_sheet_mini_player.dart';
import '../../components/nav/custom_nav_tab_bar.dart';
import '../../components/prompts/prompts.dart';
import '../../components/nav/web_app_bar.dart';
import '../../providers/tabs.dart';
import 'package:bccm_core/design_system.dart';

@RoutePage<void>()
class TabsRootScreen extends StatefulHookConsumerWidget {
  static const route = '/';

  const TabsRootScreen({super.key});

  @override
  ConsumerState<TabsRootScreen> createState() => _TabsRootScreenState();
}

class _TabsRootScreenState extends ConsumerState<TabsRootScreen> with AutoRouteAwareStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.watch(notificationServiceProvider).requestPermissionAndSetup();
    Future.delayed(1000.ms, checkIfShouldShowShortGuide);
  }

  GuideController? shortGuideController;
  void checkIfShouldShowShortGuide() {
    if (!context.mounted) return;
    if (context.router.topRoute.name == ShortsWrapperScreenRoute.name || context.router.topRoute.name == ShortsScreenRoute.name) {
      return;
    }
    if (!ref.read(currentTabIdsProvider).contains(TabId.shorts)) return;
    if (ref.read(featureFlagsProvider).shortsGuide != true) return;

    final prefs = ref.read(sharedPreferencesProvider);
    final hasShownShortGuide = prefs.getBool(PrefKeys.shortsFeatureGuideShown) ?? false;
    if (hasShownShortGuide) return;
    prefs.setBool(PrefKeys.shortsFeatureGuideShown, true);

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final tabInfos = ref.read(tabInfosProvider);
      shortGuideController = createTabFeaturePopover(
        context,
        analyticsName: 'shorts_tab_guide',
        iconKey: tabInfos.shorts.iconKey,
        title: S.of(context).newFeature,
        description: S.of(context).shortsFeatureDescription,
        onContinue: () {
          if (!context.mounted) return;
          context.navigateTo(const ShortsWrapperScreenRoute(
            children: [ShortsScreenRoute()],
          ));
        },
      );

      ref.read(analyticsProvider).guideShown(const GuideShownEvent(guide: 'shorts-tab'));
    });
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    print('Changed to settings tab from ${previousRoute.name}');
  }

  onTabTap(BuildContext context, int index) {
    final tabsRouter = AutoTabsRouter.of(context);
    final tabId = ref.read(currentTabIdsProvider).elementAtOrNull(index);
    // here we switch between tabs
    if (tabsRouter.activeIndex == index) {
      final stackRouterOfIndex = tabsRouter.stackRouterOfIndex(index);
      if (stackRouterOfIndex?.stack.length == 1) {
        if (tabId != null) {
          final scrollController = PrimaryScrollController.of(context);
          if (scrollController.hasClients) {
            scrollController.animateTo(0, duration: 500.ms, curve: Curves.easeOutExpo);
          }
          globalEventBus.fire(TabClickedEvent(tabId));
        }
      } else {
        stackRouterOfIndex?.popUntilRoot();
      }
    } else {
      tryCatchRecordError(() {
        sendTabChangeAnalytics(index);
      });
    }
    if (tabId == TabId.shorts) {
      if (shortGuideController != null) {
        shortGuideController!.dismiss();
        shortGuideController = null;
      }
    }
    tabsRouter.setActiveIndex(index);
  }

  void sendTabChangeAnalytics(int newIndex) {
    final tabInfos = ref.read(tabInfosProvider);
    final currentTabs = ref.read(currentTabIdsProvider);
    final tabId = currentTabs.elementAtOrNull(newIndex);
    if (newIndex < 0 || newIndex > currentTabs.length - 1 || tabId == null) {
      throw Exception(['Tab index out of bounds:', newIndex]);
    }
    final tabInfo = tabInfos.getFor(tabId);

    final appConfig = ref.read(appConfigFutureProvider);
    appConfig.then((value) {
      String? pageCode;
      if (tabId == TabId.home) {
        pageCode = value.application.page?.code;
      } else if (tabId == TabId.search) {
        pageCode = value.application.searchPage?.code;
      }
      ref.read(analyticsProvider).screen(tabInfo.analyticsName, properties: {
        if (pageCode != null) 'pageCode': pageCode,
      });
    });
  }

  bool _shouldHideMiniPlayer(BuildContext context) {
    if (kIsWeb) return true;
    if (ref.watch(isOfflineProvider)) return true;
    final router = context.watchRouter;
    final currentRouteMatch = router.currentSegments.lastOrNull;
    if (currentRouteMatch == null) {
      debugPrint('router.currentSegments empty');
      return true;
    }

    final String? currentMediaItemEpisodeId = ref.watch(
      primaryPlayerProvider.select(
        (player) => player?.currentMediaItem?.metadata?.extras?['id']?.asOrNull<String>(),
      ),
    );

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabInfos = ref.watch(tabInfosProvider);
    final currentTabIds = ref.watch(currentTabIdsProvider);
    final authStatusSemantics = ref.watch(authStateProvider.select((u) => u.isLoggedIn)) ? 'Signed in' : 'Signed out';

    return CupertinoScaffold(
      body: AutoTabsRouter(
        navigatorObservers: () => [HeroController()],
        inheritNavigatorObservers: true,
        routes: currentTabIds.map((tabId) => tabInfos.getFor(tabId).route).toList(),
        lazyLoad: false,
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          final tabId = currentTabIds.elementAtOrNull(tabsRouter.activeIndex);
          final scrollController = tabId != null ? tabInfos.getFor(tabId).scrollController : null;
          return Semantics(
            label: authStatusSemantics,
            child: PrimaryScrollController(
              controller: scrollController ?? PrimaryScrollController.of(context),
              child: Builder(
                builder: (context) => Scaffold(
                  appBar: kIsWeb ? WebAppBar(tabsRouter: tabsRouter, onTabTap: (i) => onTabTap(context, i)) : null,
                  body: Padding(padding: EdgeInsets.only(bottom: _shouldHideMiniPlayer(context) ? 0 : kMiniPlayerHeight), child: child),
                  bottomSheet: Container(
                    color: DesignSystem.of(context).colors.background1, // Fix gap between prompts and miniPlayer due to antialiasing issue
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
                      : CustomNavTabBar(
                          tabsRouter: tabsRouter,
                          onTabTap: (i) => onTabTap(context, i),
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
