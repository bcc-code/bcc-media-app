import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/loading_indicator.dart';
import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import '../helpers/navigation/navigation_utils.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';
import '../router/router.gr.dart';

class AutoLoginScreeen extends ConsumerStatefulWidget {
  const AutoLoginScreeen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AutoLoginScreeenState();
}

class _AutoLoginScreeenState extends ConsumerState<AutoLoginScreeen> {
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
    authFuture = ref.read(authStateProvider.notifier).load();
    authFuture!.then((_) {
      debugPrint('navigate(deepLinkUri: $deepLinkUri)');
      navigate(deepLinkUri: deepLinkUri);
    });
  }

  void navigate({Uri? deepLinkUri}) {
    if (!mounted) return;
    final router = context.router;
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
    if (!hasCredentials) {
      router.replaceAll([LoginScreenRoute()]);
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

  Widget error(BuildContext context) => Scaffold(
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
                            style: BccmTextStyles.button2,
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
                          style: BccmTextStyles.headline1,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          S.of(context).loginFailedCheckNetwork,
                          style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: BccmColors.tint1,
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
                          style: BccmTextStyles.button1.copyWith(color: BccmColors.onTint),
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

  Widget loading(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoadingIndicator(),
              const SizedBox(height: 12),
              Text(S.of(context).loading, style: BccmTextStyles.body2),
            ],
          ),
        ),
      );
}
