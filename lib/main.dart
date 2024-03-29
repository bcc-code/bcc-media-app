import 'dart:async';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/background_tasks.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/router/special_routes.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/auth.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/graphql.dart';
import 'package:brunstadtv_app/providers/notifications.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:bccm_core/firebase.dart';
import 'package:brunstadtv_app/providers/unleash.dart';
import 'package:brunstadtv_app/router/router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:universal_io/io.dart';

import 'app_root.dart';
import 'flavors.dart';
import 'l10n/app_localizations.dart';

const useDevicePreview = false;

/// This function is called from the flavor-specific entrypoints
/// E.g. main_dev.dart, main_prod.dart
Future<void> $main({
  List<Override>? providerOverrides,
}) async {
  final sw = Stopwatch()..start();
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await BccmCore().setup();
  await setDefaults();

  //FocusDebugger.instance.activate();

  if (FlavorConfig.current.firebaseOptions != null) {
    await initFirebase(
      FlavorConfig.current.firebaseOptions!,
      onFirebaseBackgroundMessage: onFirebaseBackgroundMessage,
    );
  }

  final appRouter = AppRouter(navigatorKey: globalNavigatorKey);
  final coreOverrides = await BccmCore().setupCoreOverrides(
    analyticsMetaEnricherProviderOverride: analyticsMetaEnricherProvider.overrideWith((ref) => BccmAnalyticsMetaEnricher()),
    specialRoutesHandlerProviderOverride: specialRoutesHandlerProvider.overrideWith((ref) => BccmSpecialRoutesHandler(ref)),
    rootRouterProviderOverride: rootRouterProvider.overrideWithValue(appRouter),
    commonSettingsProviderOverride: commonSettingsProviderOverride,
    bccmGraphQLProviderOverride: bccmGraphQLProviderOverride,
    authStateProviderOverride: authStateProviderOverride,
    analyticsProviderOverride: analyticsProviderOverride,
    featureFlagVariantListProviderOverride: featureFlagVariantListProviderOverride,
    rawUnleashProviderOverride: rawUnleashProviderOverride,
    unleashContextProviderOverride: unleashContextProviderOverride,
    notificationServiceProviderOverride: notificationServiceProviderOverride,
  );
  final providerContainer = await initProviderContainer([
    ...coreOverrides,
    if (providerOverrides != null) ...providerOverrides,
  ]);

  // Initialize bccm_player
  await BccmPlayerInterface.instance.setup();

  final app = UncontrolledProviderScope(
    container: providerContainer,
    child: AppRoot(
      navigatorKey: globalNavigatorKey,
      appRouter: appRouter,
    ),
  );
  Widget maybeWrappedApp;
  if (kDebugMode && !kIsWeb) {
    final interactiveViewer = InteractiveViewer(maxScale: 10, child: app);
    maybeWrappedApp = useDevicePreview ? DevicePreview(builder: (context) => interactiveViewer) : interactiveViewer;
  } else {
    maybeWrappedApp = app;
  }

  if (kDebugMode) {
    Animate.restartOnHotReload = true;
  }
  debugPrint('App initialized in ${sw.elapsedMilliseconds}ms');
  runApp(maybeWrappedApp);
}

Future setDefaults() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  if (!isAndroidTv) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  // How much space all bitmaps collectively can take up in memory.
  // The default is 100MiB, as of flutter 3.7. This lowers it to 50MiB.
  // I don't think this was very important, so there is room for increasing it if necessary.
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 50;

  // Locale normally comes from the MaterialApp.locale field.
  // This sets the default locale when Intl is used "outside" a MaterialApp-descendant BuildContext.
  Intl.defaultLocale = await getDefaultLocale(
    fallbackLanguage: FlavorConfig.current.defaultLanguage,
    supportedLocales: S.supportedLocales.map((l) => l.languageCode).toList(),
  );
}

Future<ProviderContainer> initProviderContainer(List<Override> overrides) async {
  var providerContainer = ProviderContainer(overrides: overrides);
  providerContainer.read(settingsProvider.notifier);
  providerContainer.read(analyticsProvider);
  providerContainer.read(deepLinkServiceProvider);
  providerContainer.read(notificationServiceProvider);
  providerContainer.read(authFeatureFlagListener);
  try {
    await providerContainer.read(unleashProvider.future).timeout(const Duration(milliseconds: 1000));
  } catch (e, st) {
    if (e is TimeoutException) {
      debugPrint('Timeout: Unleash not ready, continuing boot.');
    } else {
      FirebaseCrashlytics.instance.recordError(e, st);
    }
  }
  await providerContainer.read(playbackServiceProvider).init();
  return providerContainer;
}
