import 'package:alice/alice.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:brunstadtv_app/helpers/btv_colors.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/providers/rudder.dart';
import 'package:brunstadtv_app/providers/settings_service.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/router/special_routes_guard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:bccm_player/chromecast_pigeon.g.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:on_screen_ruler/on_screen_ruler.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';

import 'app_root.dart';
import 'background_tasks.dart';
import 'env/env.dart';
import 'helpers/utils.dart';
import 'l10n/app_localizations.dart';

final Alice alice = Alice(showNotification: true);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// There is 1 main() per environment, e.g. main_dev.dart
/// This function runs on all of them
void $main({required FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();
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

  if (firebaseOptions != null && !kDebugMode) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

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

  final appRouter = AppRouter(authGuard: AuthGuard(), specialRoutesGuard: SpecialRoutesGuard(), navigatorKey: navigatorKey);

  alice.setNavigatorKey(navigatorKey);

  var chromecastListenerOverride = chromecastListenerProvider.overrideWith((c) {
    var listener = ChromecastListener(providerRef: c);
    ChromecastPigeon.setup(listener);
    return listener;
  });

  var providerContainer = ProviderContainer(overrides: [chromecastListenerOverride]);
  PlaybackListenerPigeon.setup(PlaybackListener(providerContainer: providerContainer));
  final authLoadingCompleter = wrapInCompleter(providerContainer.read(authStateProvider.notifier).load());
  providerContainer.read(settingsProvider.notifier).load();
  providerContainer.read(chromecastListenerProvider);
  providerContainer.read(appConfigProvider);
  providerContainer.read(playbackApiProvider).getChromecastState().then((value) {
    providerContainer.read(isCasting.notifier).state = value?.connectionState == CastConnectionState.connected;
    providerContainer.read(castPlayerProvider.notifier).setMediaItem(value?.mediaItem);
  });
  initializeRudderStack();

  if (Env.npawAccountCode != '') {
    providerContainer
        .read(playbackApiProvider)
        .setNpawConfig(NpawConfig(accountCode: Env.npawAccountCode, appName: 'mobile', appReleaseVersion: '4.0.0-alpha'));
  }

  Intl.defaultLocale = await getDefaultLocale();

  PageRouteInfo initialRoute = const AutoLoginScreeenRoute();
  if (authLoadingCompleter.isCompleted) {
    final authenticated = await authLoadingCompleter.future;
    if (authenticated) {
      initialRoute = const TabsRootScreenRoute();
    } else {
      initialRoute = LoginScreenRoute();
    }
  }

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
            routerDelegate: appRouter.delegate(initialRoutes: [initialRoute], navigatorObservers: () => [AnalyticsNavigatorObserver()]),
            routeInformationParser: appRouter.defaultRouteParser(),
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: AppRoot(
                  navigatorKey: navigatorKey,
                  child: !kDebugMode ? child : OnScreenRulerWidget(gridColor: Colors.white60.withOpacity(0.1), child: child!),
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
        barBackgroundColor: BtvColors.background1, textTheme: CupertinoTextThemeData(tabLabelTextStyle: BtvTextStyles.caption3)),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: BtvColors.tint1),
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
    dialogTheme:
        const DialogTheme(backgroundColor: BtvColors.background2, contentTextStyle: BtvTextStyles.body1, titleTextStyle: BtvTextStyles.title3),
    scaffoldBackgroundColor: BtvColors.background1,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: BtvColors.tint1,
        elevation: 0,
        selectedLabelStyle: BtvTextStyles.caption3.copyWith(color: BtvColors.tint1),
        unselectedLabelStyle: BtvTextStyles.caption3),
    typography: Typography.material2021().copyWith(white: Typography.material2021().white.copyWith(headlineMedium: BtvTextStyles.headline2)),
  );
}

Future<String?> getDefaultLocale() async {
  final String systemLocale = await findSystemLocale();
  final verifiedLocale = Intl.verifiedLocale(systemLocale, NumberFormat.localeExists, onFailure: (String _) => 'en');
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
