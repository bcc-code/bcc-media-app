import 'dart:async';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/helpers/router/special_routes.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/notification_service.dart';
import 'package:brunstadtv_app/providers/package_info.dart';
import 'package:brunstadtv_app/providers/shared_preferences.dart';
import 'package:brunstadtv_app/providers/androidtv_provider.dart';
import 'package:brunstadtv_app/providers/unleash.dart';
import 'package:brunstadtv_app/providers/router_provider.dart';
import 'package:brunstadtv_app/providers/deeplink_service.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/helpers/firebase.dart';
import 'package:brunstadtv_app/router/analytics_observer.dart';
import 'package:device_info_plus/device_info_plus.dart';
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
import 'package:kids/app_root.dart';
import 'package:kids/helpers/analytics_meta.dart';
import 'package:kids/providers/special_routes.dart';
import 'package:kids/router/router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_io/io.dart';
import 'package:brunstadtv_app/providers/global_navigator_key.dart';

import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:kids/design_system.dart';
import 'package:brunstadtv_app/env/kids_prod/firebase_options.dart' as kids_prod_firebase;

const useDevicePreview = false;
bool _isAndroidTv = false;

Future<void> main() async {
  FlavorConfig.register(
    FlavorConfig(
      flavor: Flavor.kids,
      firebaseOptions: kids_prod_firebase.DefaultFirebaseOptions.currentPlatform,
      enableNotifications: false,
      applicationCode: 'kids',
      strictAnonymousAnalytics: true,
      designSystem: () => BibleKidsDesignSystem(),
      strings: (context) => FlavorStrings(
        onboardingTitle: S.of(context).kidsOnboardingTitle,
        onboardingSecondaryTitle: S.of(context).kidsOnboardingSecondaryTitle,
        aboutText: S.of(context).biblekidsAbout,
        contactEmail: 'hello@biblekids.io',
        contactWebsite: Uri.parse('https://biblekids.io'),
      ),
    ),
  );
  return $main();
}

/// This function is called from the flavor-specific entrypoints
/// E.g. main_dev.dart, main_prod.dart
Future<void> $main({
  List<Override>? providerOverrides,
}) async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    _isAndroidTv = androidDeviceInfo.systemFeatures.contains('android.software.leanback');
  }

  await setDefaults();

  //FocusDebugger.instance.activate();

  if (FlavorConfig.current.firebaseOptions != null) {
    await initFirebase(FlavorConfig.current.firebaseOptions!);
  }

  // Initialize bccm_player
  await BccmPlayerInterface.instance.setup();

  final appRouter = AppRouter(navigatorKey: navigatorKey);
  final sharedPrefs = await SharedPreferences.getInstance();
  final packageInfo = await PackageInfo.fromPlatform();
  final providerContainer = await initProviderContainer([
    analyticsMetaEnricherProvider.overrideWith((ref) => KidsAnalyticsMetaEnricher()),
    rootRouterProvider.overrideWithValue(appRouter),
    sharedPreferencesProvider.overrideWith((ref) => sharedPrefs),
    packageInfoProvider.overrideWith((ref) => packageInfo),
    isAndroidTvProvider.overrideWithValue(_isAndroidTv),
    specialRoutesHandlerProvider.overrideWith((ref) => KidsSpecialRoutesHandler(ref)),
    if (providerOverrides != null) ...providerOverrides,
  ]);

  final app = UncontrolledProviderScope(
    container: providerContainer,
    child: AppRoot(appRouter: appRouter, navigatorKey: navigatorKey),
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
    //debugRepaintRainbowEnabled = true;
  }

  runApp(maybeWrappedApp);
}

Future setDefaults() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
      systemStatusBarContrastEnforced: true,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  if (!_isAndroidTv) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
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
  switch (shortLocale) {
    case 'tk':
      return 'tr';
    case 'nb':
    case 'nn':
      return 'no';
    default:
      return shortLocale;
  }
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
