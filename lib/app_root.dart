import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/app_root_inner.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
import 'package:brunstadtv_app/providers/me_provider.dart';
import 'package:brunstadtv_app/router/router.dart';
import 'package:brunstadtv_app/screens/onboarding/email_verification.dart';
import 'package:brunstadtv_app/screens/onboarding/signup.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'l10n/app_localizations.dart';
import 'package:bccm_core/bccm_core.dart';
import 'models/breakpoints.dart';

class AppRoot extends ConsumerStatefulWidget {
  const AppRoot({super.key, required this.appRouter});

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
    authSubscription?.close();
    authSubscription = ref.listenManual<AuthState>(authStateProvider, onAuthChanged);

    for (var image in FlavorConfig.current.bccmImages!) {
      precacheImage(image, context)
          .then((value) => print('precache succeeded for $image.'))
          .catchError((e) => print('precache failed for $image. Error: $e'));
    }
  }

  void onAuthChanged(AuthState? previous, AuthState next) async {
    final analytics = ref.read(analyticsProvider);
    if (previous?.auth0AccessToken != null && next.auth0AccessToken == null) {
      final rootRouter = globalNavigatorKey.currentContext?.router.root;
      rootRouter?.navigate(OnboardingScreenRoute());
      return;
    }
    if (next.auth0AccessToken == null || next.user == null) return;

    ref.invalidate(meProvider);
    final me = (await ref.read(meProvider.future))?.me;
    if (!mounted) return;
    if (me == null) throw ErrorDescription('"Me" data is null.');
    if (me.roles.contains('betatesters')) {
      ref.read(settingsProvider.notifier).setBetaTester(true);
    }
    if (!me.emailVerified && context.mounted) {
      showVerifyEmail();
    } else if (!me.completedRegistration && context.mounted) {
      continueSignup();
    }
    analytics.identify(next.user!, me.analytics.anonymousId);
    ref.read(settingsProvider.notifier).setAnalyticsId(me.analytics.anonymousId);
  }

  /// Opens the signup screen, so that the user can complete the registration process.
  Future continueSignup() async {
    await Future.delayed(const Duration(milliseconds: 1000), () async {
      final context = globalNavigatorKey.currentContext;
      if (context == null) return;
      return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return const SignupScreen();
        },
      );
    });
    if (!mounted) return;
    // if the user has not completed the registration process after closing the signup screen, log them out.
    ref.invalidate(meProvider);
    final me = await ref.read(meProvider.future);
    if (mounted && me?.me.completedRegistration == false) {
      ref.read(authStateProvider.notifier).logout();
      ref.read(analyticsProvider).log(LogEvent(
            name: 'logout',
            pageCode: 'app root',
            message: 'continueSignup()',
            meta: {'manual': true},
          ));
    }
  }

  Future showVerifyEmail() async {
    final context = globalNavigatorKey.currentContext;
    if (context == null) return;
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return const EmailVerificationScreen();
      },
    );
    if (mounted && ref.read(meProvider).valueOrNull?.me.emailVerified != true) {
      ref.read(authStateProvider.notifier).logout();
      ref.read(analyticsProvider).log(LogEvent(
            name: 'logout',
            pageCode: 'app root',
            message: 'showVerifyEmail()',
            meta: {'manual': true},
          ));
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
        designSystem: FlavorConfig.current.designSystem(),
        builder: (context) => AppTheme(
          theme: FlavorConfig.current.appTheme(context),
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
                  title: 'BCC Media',
                  routerDelegate: widget.appRouter.delegate(
                    deepLinkBuilder: (_) => const DeepLink.path('/init'),
                    navigatorObservers: () => [AnalyticsNavigatorObserver(), AutoRouteObserver()],
                  ),
                  routeInformationParser: widget.appRouter.defaultRouteParser(includePrefixMatches: true),
                  builder: (BuildContext context, Widget? child) {
                    return ResponsiveBreakpoints.builder(
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                        child: AppRootInner(child: child!),
                      ),
                      breakpoints: breakpoints,
                      breakpointsLandscape: breakpoints,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
