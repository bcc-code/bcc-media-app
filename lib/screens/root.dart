import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/devices.graphql.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/components/mini_player.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../components/custom_tab_bar.dart';

class RootScreen extends ConsumerStatefulWidget {
  static const route = '/';

  const RootScreen({super.key});

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

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
              bottomNavigationBar: CustomTabBar(tabsRouter: tabsRouter));
        });
  }
}
