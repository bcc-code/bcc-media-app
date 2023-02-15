import 'dart:async';

import 'package:alice/alice.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:bccm_player/playback_service_interface.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/providers/router_provider.dart';
import 'package:brunstadtv_app/services/deeplink_service.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:brunstadtv_app/theme/bccm_theme.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:brunstadtv_app/helpers/navigation_utils.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/providers/video_state.dart';
import 'package:brunstadtv_app/router/analytics_observer.dart';
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
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:on_screen_ruler/on_screen_ruler.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:app_links/app_links.dart';

import 'app_root.dart';
import 'background_tasks.dart';
import 'env/env.dart';
import 'helpers/utils.dart';
import 'l10n/app_localizations.dart';

final Alice alice = Alice(showNotification: true);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// There is 1 main() per environment, e.g. main_dev.dart
/// This function runs on all of them
Future<void> $main({required FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (firebaseOptions != null) {
    initFirebase(firebaseOptions);
  }

  configureSystemUI();

  final appRouter = AppRouter(specialRoutesGuard: SpecialRoutesGuard(), navigatorKey: navigatorKey);
  final providerContainer = await initProviderContainer([
    rootRouterProvider.overrideWithValue(appRouter),
  ]);
  final routerDelegate = await getRouterDelegate(providerContainer, appRouter);

  final app = UncontrolledProviderScope(
    container: providerContainer,
    child: Consumer(
      builder: (context, ref, w) => GraphQLProvider(
        client: ValueNotifier(ref.watch(gqlClientProvider)),
        child: MaterialApp.router(
            localizationsDelegates: S.localizationsDelegates,
            localeResolutionCallback: (locale, supportedLocales) {
              return locale?.languageCode == 'no' ? const Locale('nb') : locale;
            },
            supportedLocales: S.supportedLocales,
            locale: ref.watch(settingsProvider).appLanguage,
            theme: ThemeData(),
            darkTheme: appTheme(),
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            title: 'BCC Media',
            routerDelegate: routerDelegate,
            routeInformationParser: appRouter.defaultRouteParser(includePrefixMatches: true),
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: AppRoot(
                  navigatorKey: navigatorKey,
                  child: !kDebugMode ? child : OnScreenRulerWidget(gridColor: Colors.white60.withOpacity(0.1), child: child!),
                ),
              );
            }),
      ),
    ),
  );
  final maybeWrappedApp = kDebugMode && !kIsWeb ? InteractiveViewer(maxScale: 10, child: app) : app;
  runApp(maybeWrappedApp);
}

Future initFirebase(FirebaseOptions firebaseOptions) async {
  try {
    await Firebase.initializeApp(
      options: firebaseOptions,
    );
  } catch (e) {
    debugPrint(e.toString());
  }

  if (!kDebugMode) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  FirebaseMessaging.onBackgroundMessage(onFirebaseBackgroundMessage);
}

void configureSystemUI() {
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
}

Future initPlayback(Ref ref) async {
  PlaybackPlatformInterface.instance.setPlaybackListener(PlaybackListener(ref: ref));
  ref.listen<Player?>(primaryPlayerProvider, (_, next) {
    if (next?.currentMediaItem != null && next?.playbackState == PlaybackState.playing) {
      ref.read(analyticsProvider).heyJustHereToTellYouIBelieveTheSessionIsStillAlive();
    }
  });
  ref.read(playbackApiProvider).getChromecastState().then((value) {
    ref.read(isCasting.notifier).state = value?.connectionState == CastConnectionState.connected;
    ref.read(castPlayerProvider.notifier).setMediaItem(value?.mediaItem);
  });

  if (Env.npawAccountCode != '') {
    PackageInfo.fromPlatform().then(
      (packageInfo) => ref.read(playbackApiProvider).setNpawConfig(
            NpawConfig(
              accountCode: Env.npawAccountCode,
              appName: 'mobile',
              appReleaseVersion: formatAppVersion(packageInfo),
            ),
          ),
    );
  }
}

Future<ProviderContainer> initProviderContainer(List<Override> overrides) async {
  var providerContainer = ProviderContainer(overrides: overrides);
  providerContainer.read(settingsProvider.notifier).init();
  providerContainer.read(chromecastListenerProvider);
  providerContainer.read(appConfigProvider);
  providerContainer.read(analyticsProvider);
  providerContainer.read(deepLinkServiceProvider);
  return providerContainer;
}

Future<AutoRouterDelegate> getRouterDelegate(ProviderContainer providerContainer, AppRouter appRouter) async {
  final authLoadingCompleter = wrapInCompleter(providerContainer.read(authStateProvider.notifier).load());
  final appLinks = AppLinks();

  final deepLinkUri = await appLinks.getInitialAppLink();
  String? deepLink;
  List<PageRouteInfo<dynamic>>? initialRoutes;
  if (!authLoadingCompleter.isCompleted) {
    initialRoutes = [const AutoLoginScreeenRoute()];
  } else if (deepLinkUri != null) {
    deepLink = uriStringWithoutHost(deepLinkUri);
  } else {
    final authenticated = await authLoadingCompleter.future;
    if (authenticated) {
      initialRoutes = [const TabsRootScreenRoute()];
    } else {
      initialRoutes = [LoginScreenRoute()];
    }
  }
  return appRouter.delegate(
    initialDeepLink: deepLink,
    initialRoutes: initialRoutes,
    navigatorObservers: () => [AnalyticsNavigatorObserver()],
  );
}

Future init() async {
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 50;
  Intl.defaultLocale = await getDefaultLocale();
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
