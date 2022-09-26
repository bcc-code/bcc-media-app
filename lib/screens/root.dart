import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/components/mini_player.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

class RootScreen extends ConsumerStatefulWidget {
  static const route = '/';

  const RootScreen({super.key});

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> with AutoRouteAware {
  final double iconSize = 30;
  late final Map<String, Image> icons;

  @override
  void initState() {
    super.initState();
    icons = {
      'home_default': Image.asset(
        'assets/icons/Home_Default.png',
        gaplessPlayback: true,
      ),
      'home_selected':
          Image.asset('assets/icons/Home_Selected.png', gaplessPlayback: true),
      'search_default':
          Image.asset('assets/icons/Search_Default.png', gaplessPlayback: true),
      'search_selected': Image.asset('assets/icons/Search_Selected.png',
          gaplessPlayback: true),
      'live_default':
          Image.asset('assets/icons/Live_Default.png', gaplessPlayback: true),
      'live_selected':
          Image.asset('assets/icons/Live_Selected.png', gaplessPlayback: true),
      'calendar_default': Image.asset('assets/icons/Calendar_Default.png',
          gaplessPlayback: true),
      'calendar_selected': Image.asset('assets/icons/Calendar_Selected.png',
          gaplessPlayback: true),
    };
    ref.read(playbackApiProvider).newPlayer().then((playerId) {
      var player = Player(playerId: playerId);
      ref.read(playbackApiProvider).setPrimary(playerId);
      ref.read(primaryPlayerProvider.notifier).setState(player);
    });
  }

  @override
  void didChangeDependencies() {
    for (var icon in icons.entries) {
      precacheImage(icon.value.image, context, size: Size(iconSize, iconSize));
    }
    super.didChangeDependencies();
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    print('Changed to settings tab from ${previousRoute.name}');
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        navigatorObservers: () => [HeroController()],
        // list of your tab routes
        // routes used here must be declaraed as children
        // routes of /dashboard
        routes: const [
          HomeScreenRoute(),
          EmptyRouterPageRoute(),
          LiveScreenRoute(),
          HomeScreenRoute(),
        ],
        builder: (context, child, animation) {
          // obtain the scoped TabsRouter controller using context
          final tabsRouter = AutoTabsRouter.of(context);
          // Here we're building our Scaffold inside of AutoTabsRouter
          // to access the tabsRouter controller provided in this context
          //
          //alterntivly you could use a global key
          final hideMiniPlayer =
              tabsRouter.current.meta['hide_mini_player'] == true;
          return Scaffold(
              body: SafeArea(child: child),
              bottomSheet:
                  hideMiniPlayer ? const SizedBox.shrink() : const MiniPlayer(),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 1, color: Theme.of(context).dividerColor))),
                child: Theme(
                  data: Platform.isIOS
                      ? Theme.of(context).copyWith(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        )
                      : Theme.of(context),
                  child: BottomNavigationBar(
                    selectedFontSize: 12,
                    unselectedFontSize: 12,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: tabsRouter.activeIndex,
                    onTap: (index) {
                      // here we switch between tabs
                      tabsRouter.setActiveIndex(index);
                    },
                    items: [
                      BottomNavigationBarItem(
                          label: 'Home',
                          icon: SizedBox(
                              height: iconSize, child: icons['home_default']),
                          activeIcon: SizedBox(
                              height: iconSize, child: icons['home_selected'])),
                      BottomNavigationBarItem(
                          label: 'Search',
                          icon: SizedBox(
                              height: iconSize, child: icons['search_default']),
                          activeIcon: SizedBox(
                              height: iconSize,
                              child: icons['search_selected'])),
                      BottomNavigationBarItem(
                          label: 'Live',
                          icon: SizedBox(
                              height: iconSize, child: icons['live_default']),
                          activeIcon: SizedBox(
                              height: iconSize, child: icons['live_selected'])),
                      BottomNavigationBarItem(
                          label: 'Calendar',
                          icon: SizedBox(
                              height: iconSize,
                              child: icons['calendar_default']),
                          activeIcon: SizedBox(
                              height: iconSize,
                              child: icons['calendar_selected'])),
                    ],
                  ),
                ),
              ));
        });
  }
}
