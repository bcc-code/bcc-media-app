import 'dart:async';

import 'package:alice/alice.dart';
import 'package:brunstadtv_app/providers/notification_service.dart';
import 'package:brunstadtv_app/providers/router_provider.dart';
import 'package:brunstadtv_app/providers/deeplink_service.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/helpers/firebase.dart';
import 'package:brunstadtv_app/theme/bccm_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';

import 'app_root.dart';

final Alice alice = Alice(showNotification: true);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// This function is called from the flavor-specific entrypoints
/// E.g. main_dev.dart, main_prod.dart
Future<void> $main({required FirebaseOptions? firebaseOptions, List<Override>? providerOverrides}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await setDefaults();

  if (firebaseOptions != null) {
    await initFirebase(firebaseOptions);
  }

  final appRouter = AppRouter(navigatorKey);
  final providerContainer = await initProviderContainer([
    rootRouterProvider.overrideWithValue(appRouter),
    if (providerOverrides != null) ...providerOverrides,
  ]);

  final app = UncontrolledProviderScope(
    container: providerContainer,
    child: AppRoot(
      navigatorKey: navigatorKey,
      appRouter: appRouter,
    ),
  );
  final maybeWrappedApp = kDebugMode && !kIsWeb ? InteractiveViewer(maxScale: 10, child: app) : app;
  runApp(maybeWrappedApp);
}

Future setDefaults() async {
  BccmTheme.configureSystemUI();
  // How much space all bitmaps collectively can take up in memory.
  // The default is 100MiB, as of flutter 3.7. This lowers it to 50MiB.
  // I don't think this was very important, so there is room for increasing it if necessary.
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 50;

  // Locale normally comes from the MaterialApp.locale field.
  // This sets the default locale when Intl is used "outside" a MaterialApp-descendant BuildContext.
  Intl.defaultLocale = await getDefaultLocale();
}

Future<String?> getDefaultLocale() async {
  final String systemLocale = await findSystemLocale();
  final verifiedLocale = Intl.verifiedLocale(systemLocale, NumberFormat.localeExists, onFailure: (String _) => 'en');
  if (verifiedLocale != null) {
    final locale = Intl.shortLocale(verifiedLocale);
    switch (locale) {
      case 'tk':
        return 'tr';
      case 'nb':
      case 'nn':
        return 'no';
      default:
        return locale;
    }
  }
  return null;
}

Future<ProviderContainer> initProviderContainer(List<Override> overrides) async {
  var providerContainer = ProviderContainer(overrides: overrides);
  providerContainer.read(settingsProvider.notifier).init();
  providerContainer.read(appConfigProvider);
  providerContainer.read(analyticsProvider);
  providerContainer.read(deepLinkServiceProvider);
  providerContainer.read(notificationServiceProvider);
  providerContainer.read(playbackServiceProvider);
  return providerContainer;
}
