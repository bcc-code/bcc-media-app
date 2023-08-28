import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/main.dart';
import 'package:brunstadtv_app/providers/androidtv_provider.dart';
import 'package:brunstadtv_app/providers/me_provider.dart';
import 'package:brunstadtv_app/router/analytics_observer.dart';
import 'package:brunstadtv_app/screens/onboarding/email_verification.dart';
import 'package:brunstadtv_app/screens/onboarding/signup.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/design_system.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'l10n/app_localizations.dart';
import 'models/auth_state.dart';
import 'models/breakpoints.dart';
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('app_root didChangeDependencies');
    authSubscription?.close();
    authSubscription = ref.listenManual<AuthState>(authStateProvider, onAuthChanged);
    for (var image in FlavorConfig.current.images) {
      precacheImage(image, context)
          .then((value) => print('precache succeeded for $image.'))
          .catchError((e) => print('precache failed for $image. Error: $e'));
    }
  }

  void onAuthChanged(AuthState? previous, AuthState next) {
    final analytics = ref.read(analyticsProvider);
    debugPrint('authSubscription');
    if (previous?.auth0AccessToken != null && next.auth0AccessToken == null) {
      if (ref.read(isAndroidTvProvider)) {
        widget.navigatorKey.currentContext?.router.root.replaceAll([const TvLoginScreenRoute()]);
        return;
      }
      widget.navigatorKey.currentContext?.router.root.navigate(OnboardingScreenRoute());
    } else if (next.auth0AccessToken != null && next.user != null) {
      // ignore: unused_result
      ref.refresh(meProvider);
      ref.read(meProvider.future).then((value) {
        if (!mounted) return;
        final me = value?.me;
        if (me == null) {
          throw ErrorDescription('"Me" data is null.');
        }
        if (me.roles.contains('betatesters')) {
          ref.read(settingsProvider.notifier).setBetaTester(true);
        }
        if (!me.emailVerified && context.mounted) {
          showVerifyEmail();
        } else if (!me.completedRegistration && context.mounted) {
          ensureValidUser();
        }
        analytics.identify(next.user!, me.analytics.anonymousId);
      });
    }
  }

  Future ensureValidUser() async {
    await Future.delayed(const Duration(milliseconds: 1000), () async {
      final context = navigatorKey.currentContext;
      if (context == null) return;
      return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return const SignupScreen();
        },
      );
    });
    if (!mounted) return;
    // ignore: unused_result
    ref.refresh(meProvider);
    final me = await ref.read(meProvider.future);
    if (mounted && me?.me.completedRegistration == false) {
      ref.read(authStateProvider.notifier).logout(manual: true);
    }
  }

  Future showVerifyEmail() async {
    final context = navigatorKey.currentContext;
    if (context == null) return;
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return const EmailVerificationScreen();
      },
    );
    if (mounted && ref.read(meProvider).valueOrNull?.me.emailVerified != true) {
      ref.read(authStateProvider.notifier).logout(manual: true);
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
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: DesignSystem(
        designSystem: FlavorConfig.current.designSystem?.call() ?? BccMediaDesignSystem(),
        child: (context) => BccmPlayerTheme(
          playerTheme: BccmPlayerThemeData(
            controls: BccmControlsThemeData(
              settingsListTextStyle: DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label2),
            ),
          ),
          child: GraphQLProvider(
            client: ValueNotifier(ref.watch(gqlClientProvider)),
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
              title: 'BCC Media',
              routerDelegate: widget.appRouter.delegate(
                initialRoutes: [const AutoLoginScreenRoute()],
                navigatorObservers: () => [AnalyticsNavigatorObserver()],
              ),
              routeInformationParser: widget.appRouter.defaultRouteParser(includePrefixMatches: true),
              builder: (BuildContext context, Widget? child) {
                return ResponsiveBreakpoints.builder(
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  ),
                  breakpoints: breakpoints,
                  breakpointsLandscape: breakpoints,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
