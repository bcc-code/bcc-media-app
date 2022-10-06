import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/providers/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/playback_listener.dart';
import 'package:brunstadtv_app/router/auth_guard.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/services/auth_service.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:bccm_player/chromecast_pigeon.g.dart';
import 'package:riverpod/riverpod.dart';
import 'package:bccm_player/playback_service_interface.dart';

import 'env/.env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  await AuthService.instance.init();
  final appRouter = AppRouter(authGuard: AuthGuard());

  var chromecastListenerOverride = chromecastListenerProvider
      .overrideWithProvider(Provider<ChromecastListener>((ref) {
    var listener = ChromecastListener(providerRef: ref);
    ChromecastPigeon.setup(listener);
    return listener;
  }));

  var providerContainer =
      ProviderContainer(overrides: [chromecastListenerOverride]);

  PlaybackListenerPigeon.setup(
      PlaybackListener(providerReader: providerContainer.read));

  providerContainer.read(chromecastListenerProvider);

  providerContainer.read(playbackApiProvider).getChromecastState().then(
      (value) => providerContainer.read(isCasting.notifier).state =
          value?.connectionState == CastConnectionState.connected);

  if (Env.NPAW_ACCOUNT_CODE != '') {
    providerContainer.read(playbackApiProvider).setNpawConfig(NpawConfig(
        accountCode: Env.NPAW_ACCOUNT_CODE,
        appName: 'mobile',
        appReleaseVersion: '4.0.0-alpha'));
  }

  providerContainer.read(settingsServiceProvider.notifier).load();

  runApp(UncontrolledProviderScope(
    container: providerContainer,
    child: Builder(
        builder: (context) => MaterialApp.router(
              theme: ThemeData(),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                colorScheme: ColorScheme.fromSeed(
                    brightness: Brightness.dark,
                    seedColor: const Color.fromARGB(255, 110, 176, 230)),
                fontFamily: 'Barlow',
                canvasColor: const Color.fromARGB(255, 13, 22, 35),
                textTheme: const TextTheme(
                    headlineMedium: TextStyle(
                        fontFamily: 'Barlow',
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
                scaffoldBackgroundColor: const Color.fromARGB(255, 13, 22, 35),
              ),
              themeMode: ThemeMode.dark,
              title: 'BCC Media',
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
            )),
  ));
}
