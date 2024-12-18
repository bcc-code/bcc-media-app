import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../components/offline/offline_home.dart';
import '../components/status/loading_indicator.dart';
import '../helpers/constants.dart';
import '../l10n/app_localizations.dart';
import '../router/router.gr.dart';

/// The route that is shown when the app is starting up.
///
/// It will show a loading spinner while:
/// - Initializing the authentication state
/// - Other async tasks that are required to start the app, such as waiting a few seconds for feature flags
/// - Checking for deep links
///
/// If the setup fails, it will show an error message and allow retrying / logging out.
///
/// Why is it not in main()? Because that wouldnt allow us to show a loading spinner while initializing.
/// Why is it not in AppRoot? I wish, but it's hard because of how navigation works with auto_route:
///
/// - MaterialApp or AutoRoute makes a Navigator, and we can't use router.navigate() etc until that exists.
/// - We could use a Stack with a loading spinner on top of the navigator, but we would anyways need to render an initial route.
/// - PS #1: MaterialApp has a builder((child) => ...), but that 'child' is the navigator, so we can't replace it with eg. a loading spinner otherwise we can't navigate.
/// - PS #2: Optimal solution: If you can somehow set the initial route AFTER MaterialApp and BEFORE rendering the navigator, that would be cleaner.
@RoutePage()
class InitScreen extends ConsumerStatefulWidget {
  const InitScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends ConsumerState<InitScreen> {
  Future<void>? authFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    load();
  }

  void load() async {
    if (!mounted) return;
    setState(() {
      authFuture = ref.read(authStateProvider.notifier).initialize();
    });
    await authFuture;
    await tryCatchRecordErrorAsync(() async {
      await ref.read(featureFlagsProvider.notifier).activateFeatureFlags().timeout(const Duration(seconds: 2));
    });
    ref.invalidate(appConfigFutureProvider);

    // Set "hasEverLoggedIn" in SharedPreferences to false initially.
    final hasEverLoggedIn = ref.read(sharedPreferencesProvider).getBool(PrefKeys.hasEverLoggedIn);
    if (hasEverLoggedIn == null) {
      ref.read(sharedPreferencesProvider).setBool(PrefKeys.hasEverLoggedIn, false);
    }

    continueNavigation();
    globalEventBus.fire(AppReadyEvent());
    TimeMeasurements.startupToInitDone.track(ref.read(analyticsProvider));
    TimeMeasurements.mainFunction.track(ref.read(analyticsProvider));
  }

  Future<void> continueNavigation({Uri? deepLinkUri}) async {
    final deepLinkUri = await tryCatchRecordErrorAsync(() => AppLinks().getInitialLink());
    if (!mounted) return;
    final router = context.router;
    if (deepLinkUri != null && !deepLinkUri.path.contains('init')) {
      router.replaceAll([const TabsRootScreenRoute()]);
      router.navigateNamedFromRoot(
        uriStringWithoutHost(deepLinkUri),
        onFailure: (f) {
          router.navigateNamedFromRoot('/');
        },
      );
      return;
    }
    final isLoggedIn = ref.read(authStateProvider).isLoggedIn;
    final hasCompletedOnboarding = ref.read(sharedPreferencesProvider).getBool(PrefKeys.onboardingCompleted) == true;
    final hasEverLoggedIn = ref.read(sharedPreferencesProvider).getBool(PrefKeys.hasEverLoggedIn) == true;

    /*
      Onboarding will be shown the first time for every user, but if the user selects "Explore public content"
      the onboarding will not be shown again, and the user will be sent directly to the home screen.

      If the user has ever logged in before, and thus is counted as a BCC member, 
      we will show the onboarding again.
    */
    if (!isLoggedIn && (!hasCompletedOnboarding || hasEverLoggedIn)) {
      router.replaceAll([OnboardingScreenRoute()]);
      ref.read(analyticsProvider).log(LogEvent(
            name: 'sent to login screen',
            message: 'user was sent to login screen from the init screen continueNavigation method.',
          ));
      return;
    }

    TimeMeasurements.startupToHomeLoaded.addCheckpoint('init');
    router.replaceAll([const TabsRootScreenRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return simpleFutureBuilder<void>(
      future: authFuture,
      error: (e) => _ErrorWidget(onRetry: load),
      noData: () => const _LoadingWidget(),
      ready: (_) => const _LoadingWidget(),
      loading: () => const _LoadingWidget(),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoadingIndicator(),
            const SizedBox(height: 12),
            Text(S.of(context).loading, style: DesignSystem.of(context).textStyles.body2),
          ],
        ),
      ),
    );
  }
}

class _ErrorWidget extends HookConsumerWidget {
  final VoidCallback onRetry;

  const _ErrorWidget({required this.onRetry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final focusingLogout = useState(false);
    final isOffline = ref.watch(isOfflineProvider);
    return isOffline
        ? const OfflineHome()
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FocusableActionDetector(
                            actions: {
                              ActivateIntent: CallbackAction<Intent>(
                                onInvoke: (Intent intent) {
                                  ref.read(authStateProvider.notifier).logout();
                                  ref.read(analyticsProvider).log(LogEvent(
                                        name: 'logout',
                                        message: 'error widget',
                                        pageCode: 'init',
                                        meta: {'manual': true},
                                      ));
                                },
                              ),
                            },
                            onFocusChange: (value) => focusingLogout.value = value,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                ref.read(authStateProvider.notifier).logout();
                                ref.read(analyticsProvider).log(LogEvent(
                                      name: 'logout',
                                      message: 'error widget',
                                      pageCode: 'init',
                                      meta: {'manual': true},
                                    ));
                              },
                              child: SizedBox(
                                height: 24,
                                width: 56,
                                child: Text(
                                  S.of(context).logOutButton,
                                  style: !focusingLogout.value
                                      ? design.textStyles.button2
                                      : design.textStyles.button2.copyWith(shadows: [
                                          Shadow(
                                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white30 : Colors.black26,
                                            blurRadius: 8,
                                            offset: const Offset(0, 0),
                                          )
                                        ]),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(
                              S.of(context).anErrorOccurred,
                              style: design.textStyles.headline1,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              S.of(context).loginFailedCheckNetwork,
                              style: design.textStyles.body1.copyWith(color: design.colors.label3),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: design.buttons.large(
                              autofocus: true,
                              onPressed: (() {
                                onRetry();
                              }),
                              labelText: S.of(context).tryAgainButton,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
