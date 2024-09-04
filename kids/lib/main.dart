import 'dart:async';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/auth.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/graphql.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:bccm_core/firebase.dart';
import 'package:brunstadtv_app/providers/unleash.dart';
import 'package:brunstadtv_app/theme/bccm_gradients.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:kids/app_root.dart';
import 'package:kids/design_system.dart';
import 'package:kids/helpers/analytics_meta.dart';
import 'package:kids/providers/special_routes.dart';
import 'package:kids/router/router.dart';

import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import './firebase_options.dart';
import 'package:universal_io/io.dart';

Future<void> main() async {
  FlavorConfig.register(
    FlavorConfig(
      flavor: Flavor.kids,
      firebaseOptions: DefaultFirebaseOptions.currentPlatform,
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
      appTheme: (context) => AppThemeData(
        studyGradient: BccmGradients.greenYellow,
        genericBackgroundGradient: BccmGradients.purpleTransparentTopBottom,
        achievementBackgroundGradient: BccmGradients.purpleTransparent,
        appBarTransparent: false,
        tabTheme: AppTabThemeData(
          activeColor: DesignSystem.of(context).colors.tint3,
          iconActiveGradient: LinearGradient(
            colors: [DesignSystem.of(context).colors.tint3, DesignSystem.of(context).colors.tint3],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
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
  await SentryFlutter.init((options) {
    options.dsn = Env.sentryDsnKids;
    options.tracesSampleRate = 0.5;
    options.profilesSampleRate = 0.5;
  }, appRunner: () async {
    usePathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();
    await BccmCore().setup();

    await setDefaults();

    if (FlavorConfig.current.firebaseOptions != null) {
      await initFirebase(FlavorConfig.current.firebaseOptions!);
    }

    // Initialize bccm_player
    await BccmPlayerInterface.instance.setup();
    if (Platform.isAndroid) {
      BccmPlayerController.primary.switchToVideoTexture();
    }

    final appRouter = AppRouter(navigatorKey: globalNavigatorKey);
    final coreOverrides = await BccmCore().setupCoreOverrides(
      analyticsMetaEnricherProviderOverride: analyticsMetaEnricherProvider.overrideWith((ref) => KidsAnalyticsMetaEnricher()),
      specialRoutesHandlerProviderOverride: specialRoutesHandlerProvider.overrideWith((ref) => KidsSpecialRoutesHandler(ref)),
      rootRouterProviderOverride: rootRouterProvider.overrideWithValue(appRouter),
      commonSettingsProviderOverride: commonSettingsProviderOverride,
      bccmGraphQLProviderOverride: bccmGraphQLProviderOverride,
      authStateProviderOverride: authStateProviderOverride,
      analyticsProviderOverride: analyticsProviderOverride,
      featureFlagVariantListProviderOverride: featureFlagVariantListProviderOverride,
      unleashContextProviderOverride: unleashContextProviderOverride,
      notificationServiceProviderOverride: null,
    );
    final providerContainer = await initProviderContainer([
      ...coreOverrides,
      if (providerOverrides != null) ...providerOverrides,
    ]);

    final app = UncontrolledProviderScope(
      container: providerContainer,
      child: AppRoot(appRouter: appRouter, navigatorKey: globalNavigatorKey),
    );

    if (kDebugMode) {
      Animate.restartOnHotReload = true;
    }

    runApp(kDebugMode && !kIsWeb ? InteractiveViewer(maxScale: 10, child: app) : app);
  });
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

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

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
  providerContainer.read(appConfigFutureProvider);
  providerContainer.read(analyticsProvider);
  providerContainer.read(deepLinkServiceProvider);
  providerContainer.read(notificationServiceProvider);
  providerContainer.read(authFeatureFlagListener);
  await providerContainer.read(playbackServiceProvider).init();
  return providerContainer;
}
