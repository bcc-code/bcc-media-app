import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/me.graphql.dart';
import 'package:brunstadtv_app/router/analytics_observer.dart';
import 'package:brunstadtv_app/theme/bccm_theme.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:on_screen_ruler/on_screen_ruler.dart';
import 'l10n/app_localizations.dart';
import 'models/auth_state.dart';
import 'providers/auth_state/auth_state.dart';

class AppRoot extends ConsumerStatefulWidget {
  const AppRoot({super.key, required this.navigatorKey, required this.appRouter});

  final GlobalKey<NavigatorState> navigatorKey;
  final AppRouter appRouter;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppRootState();
}

class _AppRootState extends ConsumerState<AppRoot> {
  ProviderSubscription? authSubscription;

  @override
  void initState() {
    super.initState();
    BccmPlayerInterface.instance.newPlayer().then((value) {
      if (!mounted) return;
      BccmPlayerInterface.instance.setPrimary(value);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('app_root didChangeDependencies');
    authSubscription?.close();
    authSubscription = ref.listenManual<AuthState>(authStateProvider, onAuthChanged);
  }

  void onAuthChanged(AuthState? previous, AuthState next) {
    final gqlClient = ref.read(gqlClientProvider);
    final analytics = ref.read(analyticsProvider);
    final settingsNotifier = ref.read(settingsProvider.notifier);
    debugPrint('authSubscription');
    if (previous?.auth0AccessToken != null && next.auth0AccessToken == null) {
      settingsNotifier.setAnalyticsId(null);
      settingsNotifier.refreshSessionId();
      widget.navigatorKey.currentContext?.router.root.navigate(LoginScreenRoute());
    } else if (next.auth0AccessToken != null && next.user != null) {
      gqlClient.query$me().then((value) {
        if (value.exception != null) {
          throw value.exception!;
        }
        if (value.parsedData == null) {
          throw ErrorDescription('"Me" data is null.');
        }
        analytics.identify(next.user!, value.parsedData!.me.analytics.anonymousId);
      });
    }
  }

  @override
  void dispose() {
    authSubscription?.close();
    authSubscription = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(ref.watch(gqlClientProvider)),
      child: MaterialApp.router(
          localizationsDelegates: S.localizationsDelegates,
          localeResolutionCallback: (locale, supportedLocales) {
            return locale?.languageCode == 'no' ? const Locale('nb') : locale;
          },
          supportedLocales: S.supportedLocales,
          locale: ref.watch(settingsProvider).appLanguage,
          theme: ThemeData(),
          darkTheme: BccmTheme.getThemeData(),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          title: 'BCC Media',
          routerDelegate: widget.appRouter.delegate(
            initialRoutes: [const AutoLoginScreenRoute()],
            navigatorObservers: () => [AnalyticsNavigatorObserver()],
          ),
          routeInformationParser: widget.appRouter.defaultRouteParser(includePrefixMatches: true),
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: !kDebugMode
                  ? child!
                  : OnScreenRulerWidget(
                      gridColor: Colors.white60.withOpacity(0.1),
                      child: child!,
                    ),
            );
          }),
    );
  }
}
