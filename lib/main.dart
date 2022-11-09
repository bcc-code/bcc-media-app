import 'package:alice/alice.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/debug_app.dart';
import 'package:brunstadtv_app/helpers/btv_colors.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/providers/settings_service.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/router/special_routes_guard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/chromecast.dart';
import 'package:brunstadtv_app/providers/playback_api.dart';
import 'package:brunstadtv_app/providers/playback_listener.dart';
import 'package:brunstadtv_app/router/auth_guard.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/services/auth_service.dart';
import 'package:bccm_player/chromecast_pigeon.g.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:on_screen_ruler/on_screen_ruler.dart';

import 'app_root.dart';
import 'background_tasks.dart';
import 'env/env.dart';
import 'l10n/app_localizations.dart';

final Alice alice = Alice(showNotification: true);

/// There is 1 main() per environment, e.g. main_dev.dart
/// This function runs on all of them
void $main({required FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 50;

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await AuthService.instance.init();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final appRouter = AppRouter(
      authGuard: AuthGuard(),
      specialRoutesGuard: SpecialRoutesGuard(),
      navigatorKey: navigatorKey);

  alice.setNavigatorKey(navigatorKey);

  var chromecastListenerOverride = chromecastListenerProvider.overrideWith((c) {
    var listener = ChromecastListener(providerRef: c);
    ChromecastPigeon.setup(listener);
    return listener;
  });

  var providerContainer =
      ProviderContainer(overrides: [chromecastListenerOverride]);

  PlaybackListenerPigeon.setup(
      PlaybackListener(providerContainer: providerContainer));

  providerContainer.read(settingsProvider.notifier).load();
  providerContainer.read(chromecastListenerProvider);

  providerContainer
      .read(playbackApiProvider)
      .getChromecastState()
      .then((value) {
    providerContainer.read(isCasting.notifier).state =
        value?.connectionState == CastConnectionState.connected;
    providerContainer
        .read(castPlayerProvider.notifier)
        .setMediaItem(value?.mediaItem);
  });

  if (Env.npawAccountCode != '') {
    providerContainer.read(playbackApiProvider).setNpawConfig(NpawConfig(
        accountCode: Env.npawAccountCode,
        appName: 'mobile',
        appReleaseVersion: '4.0.0-alpha'));
  }

  if (firebaseOptions != null) {
    try {
      await Firebase.initializeApp(
        options: firebaseOptions,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    FirebaseMessaging.onBackgroundMessage(onFirebaseBackgroundMessage);
  }

  Intl.defaultLocale = await getDefaultLocale();

  final app = UncontrolledProviderScope(
    container: providerContainer,
    child: Consumer(
        builder: (context, ref, w) => MaterialApp.router(
            localizationsDelegates: S.localizationsDelegates,
            supportedLocales: S.supportedLocales,
            locale: ref.watch(settingsProvider).appLanguage,
            theme: ThemeData(),
            darkTheme: createTheme(),
            themeMode: ThemeMode.dark,
            title: 'BrunstadTV',
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: AppRoot(
                  navigatorKey: navigatorKey,
                  child: !kDebugMode
                      ? child
                      : OnScreenRulerWidget(
                          gridColor: Colors.white60.withOpacity(0.1),
                          child: child!),
                ),
              );
            })),
  );

  runApp(!kDebugMode ? app : InteractiveViewer(maxScale: 10, child: app));
}

ThemeData createTheme() {
  return ThemeData(
    //useMaterial3: true,
    cupertinoOverrideTheme: const CupertinoThemeData(
        barBackgroundColor: BtvColors.background1,
        textTheme:
            CupertinoTextThemeData(tabLabelTextStyle: BtvTextStyles.caption3)),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: BtvColors.tint1),
    fontFamily: 'Barlow',
    canvasColor: BtvColors.background1,
    backgroundColor: BtvColors.background2,
    highlightColor: BtvColors.background2.withOpacity(0.5),
    splashColor: BtvColors.background2.withOpacity(1),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: BtvColors.tint1),
    appBarTheme: AppBarTheme(
        titleTextStyle: BtvTextStyles.title3.copyWith(height: 1),
        toolbarTextStyle: BtvTextStyles.button2,
        centerTitle: true,
        toolbarHeight: 44,
        iconTheme: IconThemeData(color: BtvColors.tint1),
        backgroundColor: BtvColors.background1),
    scaffoldBackgroundColor: BtvColors.background1,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: BtvColors.tint1,
        elevation: 0,
        selectedLabelStyle:
            BtvTextStyles.caption3.copyWith(color: BtvColors.tint1),
        unselectedLabelStyle: BtvTextStyles.caption3),
    typography: Typography.material2021().copyWith(
        white: Typography.material2021()
            .white
            .copyWith(headlineMedium: BtvTextStyles.headline2)),
  );
}

Future<String?> getDefaultLocale() async {
  final String systemLocale = await findSystemLocale();
  final verifiedLocale = Intl.verifiedLocale(
      systemLocale, NumberFormat.localeExists,
      onFailure: (String _) => 'en');
  if (verifiedLocale != null) {
    final locale = Intl.shortLocale(verifiedLocale);
    return findCorrectFromAlternativeLocales(locale);
  }
  return null;
}

String findCorrectFromAlternativeLocales(String locale) {
  switch (locale) {
    case 'tk':
      return 'tr';
    case 'nb':
    case 'nn':
      return 'no';
  }
  return locale;
}
