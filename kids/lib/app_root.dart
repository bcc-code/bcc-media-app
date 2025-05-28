import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:bccm_core/design_system.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:kids/app_root_inner.dart';
import 'package:kids/components/splash_video.dart';
import 'package:kids/router/router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppRoot extends ConsumerWidget {
  const AppRoot({super.key, required this.navigatorKey, required this.appRouter});

  final GlobalKey<NavigatorState> navigatorKey;
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: DesignSystem(
        designSystem: FlavorConfig.current.designSystem(),
        builder: (context) => BccmPlayerTheme(
          playerTheme: BccmPlayerThemeData(
            controls: BccmControlsThemeData(
              settingsListTextStyle: DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label2),
            ),
          ),
          child: GraphQLProvider(
            client: ValueNotifier(ref.watch(bccmGraphQLProvider)),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: MaterialApp.router(
                localizationsDelegates: S.localizationsDelegates,
                localeResolutionCallback: (locale, supportedLocales) {
                  if (locale?.languageCode == 'no') {
                    return const Locale('nb');
                  }
                  if (supportedLocales.map((e) => e.languageCode).contains(locale?.languageCode)) {
                    return locale;
                  }
                  return Locale(FlavorConfig.current.defaultLanguage);
                },
                supportedLocales: S.supportedLocales,
                locale: ref.watch(settingsProvider).appLanguage,
                theme: ThemeData(),
                darkTheme: DesignSystem.of(context).materialThemeData,
                themeMode: ThemeMode.dark,
                debugShowCheckedModeBanner: false,
                title: 'Bible Kids',
                routerDelegate: appRouter.delegate(
                  deepLinkBuilder: (_) => const DeepLink.path('/'),
                  navigatorObservers: () => [
                    AnalyticsNavigatorObserver(),
                    SentryNavigatorObserver(),
                  ],
                ),
                routeInformationParser: appRouter.defaultRouteParser(includePrefixMatches: true),
                builder: (BuildContext context, Widget? child) {
                  return ResponsiveBreakpoints.builder(
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: AppRootInner(
                        child: SplashVideo(
                          child: child ?? const SizedBox(),
                        ),
                      ),
                    ),
                    breakpoints: breakpoints,
                    breakpointsLandscape: breakpoints,
                    useShortestSide: true,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
