import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/router/router.gr.dart';

@RoutePage()
class InitScreen extends ConsumerStatefulWidget {
  const InitScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends ConsumerState<InitScreen> {
  @override
  void initState() {
    super.initState();
  }

  void load() async {
    if (!mounted) return;
    await ref.read(authStateProvider.notifier).initialize();
    await tryCatchRecordErrorAsync(() async {
      await ref.read(featureFlagsProvider.notifier).activateFeatureFlags().timeout(const Duration(seconds: 2));
    });
    if (!mounted) return;
    ref.invalidate(appConfigFutureProvider);

    continueNavigation();
    globalEventBus.fire(AppReadyEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    load();
  }

  Future<void> continueNavigation({Uri? deepLinkUri}) async {
    final deepLinkUri = await tryCatchRecordErrorAsync(() => AppLinks().getLatestLink());
    if (!mounted) return;
    final router = context.router;
    if (deepLinkUri != null && !deepLinkUri.path.contains('init')) {
      router.replaceAll([const HomeScreenRoute()]);
      router.navigateNamedFromRoot(
        uriStringWithoutHost(deepLinkUri),
        onFailure: (f) {
          router.navigateNamedFromRoot('/');
        },
      );
      return;
    }

    router.replaceAll([const HomeScreenRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return _LoadingWidget();
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
          ],
        ),
      ),
    );
  }
}
