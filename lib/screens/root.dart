import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/devices.graphql.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/components/mini_player.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../helpers/btv_colors.dart';
import '../helpers/utils.dart';

final bool android = Platform.isAndroid;

class RootScreen extends ConsumerStatefulWidget {
  static const route = '/';

  const RootScreen({super.key});

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

const double iconSize = 28;

class _RootScreenState extends ConsumerState<RootScreen> with AutoRouteAware {
  @override
  void initState() {
    super.initState();
    ref.read(playbackApiProvider).newPlayer().then((playerId) {
      var player = Player(playerId: playerId);
      ref.read(playbackApiProvider).setPrimary(playerId);
      ref.read(primaryPlayerProvider.notifier).setState(player);
    });

    setupPushNotifications();
  }

  Future setupPushNotifications() async {
    if (!kDebugMode || !Platform.isAndroid) return;
    var token = await FirebaseMessaging.instance.getToken();
    print('autoinit: ${FirebaseMessaging.instance.isAutoInitEnabled}');
    print('token: ${token}');
    if (token != null) {
      ref.read(gqlClientProvider).mutate$SetDeviceToken(
          Options$Mutation$SetDeviceToken(
              variables: Variables$Mutation$SetDeviceToken(token: token)));
    }
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.

      // TODO: If necessary send token to application server.
      ref.read(gqlClientProvider).mutate$SetDeviceToken(
          Options$Mutation$SetDeviceToken(
              variables: Variables$Mutation$SetDeviceToken(token: fcmToken)));
      print('fcm token refreshed: $fcmToken');

      const storage = FlutterSecureStorage();
      storage.write(key: 'fcm_token', value: fcmToken);
      print('fcm token refreshed and stored: $fcmToken');
    }).onError((err) {
      print('error onTokenRefresh');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification?.title}');
      }
    });
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    print('Changed to settings tab from ${previousRoute.name}');
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        navigatorObservers: () => [HeroController()],
        routes: const [
          HomeScreenWrapperRoute(),
          SearchScreenWrapperRoute(),
          LiveScreenRoute(),
          CalendarPageRoute(),
        ],
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);

          final player = ref.watch(isCasting) == true
              ? ref.watch(castPlayerProvider)
              : ref.watch(primaryPlayerProvider);

          final episodeId = player?.currentMediaItem?.metadata?.extras?['id'];

          final isOnCurrentEpisodePage = episodeId != null &&
              tabsRouter.currentSegments.any((element) =>
                  element.stringMatch.contains('episode/$episodeId'));
          final hideMiniPlayer = player?.currentMediaItem == null ||
              tabsRouter.current.meta['hide_mini_player'] == true ||
              isOnCurrentEpisodePage;
          return Scaffold(
              body: child,
              bottomSheet: AnimatedSlide(
                  offset: hideMiniPlayer ? const Offset(0, 1) : Offset.zero,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutQuad,
                  child: const BottomSheetMiniPlayer()),
              bottomNavigationBar: TabBar(tabsRouter: tabsRouter));
        });
  }
}

class TabBar extends StatefulWidget {
  const TabBar({
    Key? key,
    required this.tabsRouter,
  }) : super(key: key);

  final TabsRouter tabsRouter;

  @override
  State<TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  late final Map<String, Image> icons;
  @override
  void initState() {
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
    super.initState();
  }

  @override
  void didChangeDependencies() {
    for (var icon in icons.entries) {
      precacheImage(icon.value.image, context,
          size: const Size(iconSize, iconSize));
    }
    super.didChangeDependencies();
  }

  Widget _icon(Image? image) {
    return Padding(
        padding: EdgeInsets.only(top: 2, bottom: android ? 2 : 0),
        child: SizedBox(height: iconSize, child: image));
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      BottomNavigationBarItem(
          label: 'Home',
          icon: _icon(icons['home_default']),
          activeIcon: _icon(icons['home_selected'])),
      BottomNavigationBarItem(
          label: 'Search',
          icon: _icon(icons['search_default']),
          activeIcon: _icon(icons['search_selected'])),
      BottomNavigationBarItem(
          label: 'Live',
          icon: _icon(icons['live_default']),
          activeIcon: _icon(icons['live_selected'])),
      BottomNavigationBarItem(
          label: 'Calendar',
          icon: _icon(icons['calendar_default']),
          activeIcon: _icon(icons['calendar_selected'])),
    ];

    if (android) {
      return Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: BtvColors.seperatorOnLight))),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: BtvColors.label3,
            unselectedLabelStyle: BtvTextStyles.caption3,
            currentIndex: widget.tabsRouter.activeIndex,
            onTap: (index) {
              // here we switch between tabs
              if (widget.tabsRouter.activeIndex == index) {
                widget.tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
              }
              widget.tabsRouter.setActiveIndex(index);
            },
            items: items),
      );
    }
    return CupertinoTabBar(
        iconSize: 24,
        height: 50,
        currentIndex: widget.tabsRouter.activeIndex,
        onTap: (index) {
          // here we switch between tabs
          if (widget.tabsRouter.activeIndex == index) {
            widget.tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
          }
          widget.tabsRouter.setActiveIndex(index);
        },
        inactiveColor: BtvColors.label3,
        activeColor: BtvColors.tint1,
        border: const Border(
            top: BorderSide(width: 1, color: BtvColors.seperatorOnLight)),
        items: items);
  }
}
