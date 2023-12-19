import 'dart:async';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/background_tasks.dart';
import 'package:brunstadtv_app/helpers/languages.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/providers/auth.dart';
import 'package:brunstadtv_app/providers/notification_service.dart';
import 'package:brunstadtv_app/providers/unleash.dart';
import 'package:brunstadtv_app/providers/router_provider.dart';
import 'package:brunstadtv_app/providers/deeplink_service.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:bccm_core/firebase.dart';
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
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app_root.dart';
import 'flavors.dart';
import 'l10n/app_localizations.dart';

const useDevicePreview = false;

/// This function is called from the flavor-specific entrypoints
/// E.g. main_dev.dart, main_prod.dart
Future<void> $main({
  List<Override>? providerOverrides,
}) async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  final coreOverrides = await BccmCore().setup();
  await setDefaults();

  //FocusDebugger.instance.activate();

  if (FlavorConfig.current.firebaseOptions != null) {
    await initFirebase(
      FlavorConfig.current.firebaseOptions!,
      onFirebaseBackgroundMessage: onFirebaseBackgroundMessage,
    );
  }

  // Initialize bccm_player
  await BccmPlayerInterface.instance.setup();

  final appRouter = AppRouter(navigatorKey: globalNavigatorKey);
  final providerContainer = await initProviderContainer([
    ...coreOverrides,
    rootRouterProvider.overrideWithValue(appRouter),
    if (providerOverrides != null) ...providerOverrides,
  ]);

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
  Intl.defaultLocale = await getDefaultLocale();
}

Future<String> getDefaultLocale() async {
  final String systemLocale = await findSystemLocale();
  final verifiedLocale = Intl.verifiedLocale(systemLocale, NumberFormat.localeExists, onFailure: (String _) => FlavorConfig.current.defaultLanguage);
  if (verifiedLocale == null) {
    return FlavorConfig.current.defaultLanguage;
  }
  final shortLocale = Intl.shortLocale(verifiedLocale);
  if (!S.supportedLocales.map((l) => l.languageCode).contains(shortLocale)) {
    return FlavorConfig.current.defaultLanguage;
  }

  return normalizeLanguage(shortLocale);
}

Future<ProviderContainer> initProviderContainer(List<Override> overrides) async {
  var providerContainer = ProviderContainer(overrides: overrides);
  providerContainer.read(settingsProvider.notifier);
  providerContainer.read(appConfigFutureProvider);
  providerContainer.read(analyticsProvider);
  providerContainer.read(deepLinkServiceProvider);
  providerContainer.read(notificationServiceProvider);
  providerContainer.read(authFeatureFlagListener);
  await providerContainer.read(playbackServiceProvider).init();
  try {
    await providerContainer.read(unleashProvider.future).timeout(const Duration(milliseconds: 300));
  } catch (e, st) {
    if (e is TimeoutException) {
      debugPrint('Timeout: Unleash not ready, continuing boot.');
    } else {
      FirebaseCrashlytics.instance.recordError(e, st);
    }
  }
  return providerContainer;
}
