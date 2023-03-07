import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/mini_player.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/devices.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/screens/search/search.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../components/bottom_sheet_mini_player.dart';
import '../components/custom_tab_bar.dart';
import '../components/surveys/snackbars_survey.dart';

class TabsRootScreen extends ConsumerStatefulWidget {
  static const route = '/';

  const TabsRootScreen({super.key});

  @override
  ConsumerState<TabsRootScreen> createState() => _TabsRootScreenState();
}

class _TabsRootScreenState extends ConsumerState<TabsRootScreen> with AutoRouteAware {
  @override
  void initState() {
    super.initState();
    ref.read(playbackApiProvider).newPlayer().then((playerId) {
      var player = Player(playerId: playerId);
      ref.read(playbackApiProvider).setPrimary(playerId);
      ref.read(primaryPlayerProvider.notifier).setState(player);
    });
    initFcm();
  }

  StreamSubscription? fcmSubscription;
  ProviderSubscription? settingsSubscription;

  Future initFcm() async {
    var result = await FirebaseMessaging.instance.requestPermission();
    print(result.toString());
    var token = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: false, badge: false, sound: true);

    settingsSubscription = ref.listenManual<Settings>(settingsProvider, (old, value) async {
      var token = await FirebaseMessaging.instance.getToken();
      if (token != null && old?.appLanguage != value.appLanguage) {
        setDeviceToken(token);
      }
    });

    if (token != null) {
      if (!mounted) {
        return;
      }
      await setDeviceToken(token);
    }

    fcmSubscription = FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      if (!mounted) {
        return;
      }
      setDeviceToken(fcmToken);
      print('fcm token refreshed: $fcmToken');

      const storage = FlutterSecureStorage();
      storage.write(key: 'fcm_token', value: fcmToken);
      print('fcm token refreshed and stored: $fcmToken');
    });
    fcmSubscription?.onError((err) {
      print('error onTokenRefresh');
    });
  }

  Future setDeviceToken(String token) async {
    var result = await ref.read(gqlClientProvider).mutate$SetDeviceToken(Options$Mutation$SetDeviceToken(
        variables: Variables$Mutation$SetDeviceToken(token: token, languages: [ref.read(settingsProvider).appLanguage.languageCode])));
    return result;
  }

  @override
  void dispose() {
    fcmSubscription?.cancel();
    settingsSubscription?.close();
    super.dispose();
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    print('Changed to settings tab from ${previousRoute.name}');
  }

  bool _shouldHideMiniPlayer(BuildContext context) {
    final router = context.watchRouter;
    final currentRouteMatch = router.currentSegments.last;
    final StateNotifierProvider<PlayerNotifier, Player?>? playerProvider;
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
              bottomSheet: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SnackbarsSurvey(),
                  BottomSheetMiniPlayer(hidden: _shouldHideMiniPlayer(context)),
                ],
              ),
              bottomNavigationBar: CustomTabBar(tabsRouter: tabsRouter)),
        );
      },
    );
  }
}
