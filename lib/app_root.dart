import 'dart:math';

import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/me.graphql.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/router/analytics_observer.dart';
import 'package:brunstadtv_app/screens/auto_login.dart';
import 'package:brunstadtv_app/theme/bccm_theme.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:brunstadtv_app/helpers/navigation/navigation_utils.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  Future? authFuture;

  @override
  void initState() {
    super.initState();
    _setupFcmListeners();
    BccmPlayerInterface.instance.newPlayer().then((value) {
      if (!mounted) return;
      BccmPlayerInterface.instance.setPrimary(value);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('app_root didChangeDependencies');
    final gqlClient = ref.read(gqlClientProvider);
    final analytics = ref.read(analyticsProvider);
    final settingsNotifier = ref.read(settingsProvider.notifier);
    loadAuth();
    authSubscription?.close();
    authSubscription = ref.listenManual<AuthState>(authStateProvider, (previous, next) {
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
    });
  }

  @override
  void dispose() {
    authSubscription?.close();
    super.dispose();
  }

  void loadAuth() async {
    final deepLinkUri = await AppLinks().getInitialAppLink();
    setState(() {
      authFuture = ref.read(authStateProvider.notifier).load();
    });
    authFuture!.then((_) async {
      WidgetsBinding.instance.scheduleFrameCallback((d) {
        debugPrint('navigate(deepLinkUri: $deepLinkUri)');
        navigateAfterInitialAuth(deepLinkUri: deepLinkUri);
        Future.delayed(const Duration(milliseconds: 500), () {
          handleInitialNotification();
        });
      });
    });
  }

  void navigateAfterInitialAuth({Uri? deepLinkUri}) {
    final router = widget.appRouter;
    if (!mounted) return;
    if (deepLinkUri != null) {
      router.replaceAll([const TabsRootScreenRoute()]);
      router.navigateNamedFromRoot(
        uriStringWithoutHost(deepLinkUri),
        onFailure: (f) {
          router.navigateNamedFromRoot('/');
        },
      );
      return;
    }
    final hasCredentials = ref.read(authStateProvider).auth0AccessToken != null;
    debugPrint('hasCredentials $hasCredentials');
    if (!hasCredentials) {
      router.replaceAll([LoginScreenRoute()]);
    } else {
      router.replaceAll([const TabsRootScreenRoute()]);
    }
    print('navigateAfterInitialAuth DONE');
  }

  Future handleInitialNotification() async {
    var initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      debugPrint(initialMessage.data.toString());
      _handleMessageOpenedFromBackground(initialMessage);
    }
  }

  void _handleMessage(RemoteMessage message, {bool? openedFromBackground}) {
    debugPrint('message: ${message.data}');
    var navigatorContext = widget.navigatorKey.currentState?.context;
    var notification = message.notification;
    if (openedFromBackground != true && notification != null && message.data['show_in_app'] == true && navigatorContext != null) {
      showDialog(
          context: navigatorContext,
          builder: (context) {
            return SimpleDialog(
                title: Text(
              notification.title ?? '',
              style: BccmTextStyles.title3,
            ));
          });
    }
    if (openedFromBackground == true && message.data['action'] == 'deep_link') {
      //context.router.navigate();
      if (message.data.containsKey('deep_link') && message.data['deep_link'] is String) {
        String path = message.data['deep_link'];
        debugPrint('navigating to deep_link from notification: $path');
        debugPrint('navigatorContext: $navigatorContext');
        WidgetsBinding.instance.scheduleFrameCallback((d) {
          widget.appRouter.navigateNamedFromRoot(path);
        });
      }
    } else if (message.data['action'] == 'clear_cache') {
      // TODO: implement cache clearing
    }
  }

  void _handleMessageOpenedFromBackground(RemoteMessage message) {
    _handleMessage(message, openedFromBackground: true);
  }

  Future _setupFcmListeners() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message);
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification?.title}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) => _handleMessageOpenedFromBackground(message));
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
            initialRoutes: [LoginScreenRoute()],
            navigatorObservers: () => [AnalyticsNavigatorObserver()],
          ),
          routeInformationParser: widget.appRouter.defaultRouteParser(includePrefixMatches: true),
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: AuthLoadingScreen(
                authFuture: authFuture,
                onRetry: () {
                  reloadAppConfig(ref);
                  loadAuth();
                },
                onLogout: () async {
                  await ref.read(authStateProvider.notifier).logout();
                  loadAuth();
                },
                child: !kDebugMode
                    ? child!
                    : OnScreenRulerWidget(
                        gridColor: Colors.white60.withOpacity(0.1),
                        child: child!,
                      ),
              ),
            );
          }),
    );
  }
}
