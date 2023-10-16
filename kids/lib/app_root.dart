import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/router/analytics_observer.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kids/providers/orientation.dart';
import 'package:kids/router/router.dart';
import 'package:kids/router/router.gr.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppRoot extends ConsumerStatefulWidget {
  const AppRoot({super.key, required this.navigatorKey, required this.appRouter});

  final GlobalKey<NavigatorState> navigatorKey;
  final AppRouter appRouter;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppRootState();
}

class _AppRootState extends ConsumerState<AppRoot> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: DesignSystem(
        designSystem: FlavorConfig.current.designSystem(),
        child: (context) => BccmPlayerTheme(
          playerTheme: BccmPlayerThemeData(
            controls: BccmControlsThemeData(
              settingsListTextStyle: DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label2),
            ),
          ),
          child: GraphQLProvider(
            client: ValueNotifier(ref.watch(gqlClientProvider)),
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
                routerDelegate: widget.appRouter.delegate(
                  initialRoutes: [const HomeScreenRoute()],
                  navigatorObservers: () => [AnalyticsNavigatorObserver()],
                ),
                routeInformationParser: widget.appRouter.defaultRouteParser(includePrefixMatches: true),
                builder: (BuildContext context, Widget? child) {
                  return ResponsiveBreakpoints.builder(
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: OrientationStateWatcher(
                        child: Builder(
                          builder: (context) => Stack(
                            alignment: Alignment.center,
                            children: [
                              child!,
                              if (OrientationController.of(context)!.transitioning)
                                IgnorePointer(child: Container(color: Colors.red.withOpacity(0.1)))
                              else
                                IgnorePointer(child: Container(color: Colors.blue.withOpacity(0.1))),
                            ],
                          ),
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
