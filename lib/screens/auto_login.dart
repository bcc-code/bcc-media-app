import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/event_bus.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/status_indicators/loading_indicator.dart';
import '../helpers/constants.dart';
import '../models/events/app_ready.dart';
import '../providers/shared_preferences.dart';
import '../theme/design_system/design_system.dart';

import '../helpers/navigation/navigation_utils.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';
import '../router/router.gr.dart';

class AutoLoginScreen extends ConsumerStatefulWidget {
  const AutoLoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AutoLoginScreeenState();
}

class _AutoLoginScreeenState extends ConsumerState<AutoLoginScreen> {
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
    final deepLinkUri = await AppLinks().getInitialAppLink();
    setState(() {
      authFuture = ref.read(authStateProvider.notifier).load();
    });
    authFuture!.then((_) {
      debugPrint('navigate(deepLinkUri: $deepLinkUri)');
      navigate(deepLinkUri: deepLinkUri);
      globalEventBus.fire(AppReadyEvent());
    });
  }

  void navigate({Uri? deepLinkUri}) {
    if (!mounted) return;
    final router = context.router;
    if (deepLinkUri != null && !deepLinkUri.path.contains('auto-login')) {
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
    final hasCompletedOnboarding = ref.read(sharedPreferencesProvider).getBool(PrefKeys.onboardingCompleted) == true;
    final alwaysShowOnboarding = ref.read(authEnabledProvider);
    if (!hasCredentials && (!hasCompletedOnboarding || alwaysShowOnboarding)) {
      router.replaceAll([OnboardingScreenRoute()]);
    } else {
      router.replaceAll([const TabsRootScreenRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return simpleFutureBuilder<void>(
      future: authFuture,
      error: (e) => error(context),
      noData: () => loading(context),
      ready: (_) => loading(context),
      loading: () => loading(context),
    );
  }

  Widget error(BuildContext context) {
    final design = DesignSystem.of(context);
    return Scaffold(
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
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        ref.read(authStateProvider.notifier).logout();
                      },
                      child: SizedBox(
                        height: 24,
                        width: 56,
                        child: Text(
                          S.of(context).logOutButton,
                          style: design.textStyles.button2,
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: design.colors.tint1,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: (() {
                        reloadAppConfig(ref);
                        load();
                      }),
                      child: Text(
                        S.of(context).tryAgainButton,
                        style: design.textStyles.button1.copyWith(color: design.colors.onTint),
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

  Widget loading(BuildContext context) => Scaffold(
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
