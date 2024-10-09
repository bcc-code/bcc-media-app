import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/app_bar_with_scroll_to_top.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/tabs.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/offline/offline_home.dart';
import '../../flavors.dart';
import 'package:bccm_core/design_system.dart';
import '../../components/pages/page_renderer.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  HomeScreen({Key? key}) : super(key: key ?? GlobalKey());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOffline = ref.watch(isOfflineProvider);
    if (isOffline) {
      TimeMeasurements.startupToHomeLoaded.cancel();
      return const OfflineHome();
    }

    final scrollController = ref.watch(tabInfosProvider.select((tabInfos) => tabInfos.home.scrollController));
    getPage(bool reloadAppConfig) async {
      final api = ref.read(apiProvider);
      String? pageCode = ref.read(appConfigProvider)?.application.page?.code;
      if (reloadAppConfig == true) {
        ref.invalidate(appConfigFutureProvider);
      }

      final ac = await ref.read(appConfigFutureProvider);
      pageCode = ac.application.page?.code;

      if (pageCode == null) {
        throw Exception('No page code found in app config');
      }

      return api.getPage(pageCode);
    }

    final pageFuture = useState<Future<Query$Page$page>?>(useMemoized(() => getPage(false)));
    final pageSnapshot = useFuture(pageFuture.value!);

    // Track time to load home screen
    useEffect(() {
      if (pageSnapshot.hasError) {
        TimeMeasurements.startupToHomeLoaded.cancel();
      }
      if (pageSnapshot.connectionState == ConnectionState.done) {
        TimeMeasurements.startupToHomeLoaded.track(ref.read(analyticsProvider));
      }
    }, [pageSnapshot]);

    final design = DesignSystem.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: kIsWeb
          ? null
          : AppBarWithScrollToTop(
              scrollController: scrollController,
              child: AppBar(
                toolbarHeight: 44,
                shadowColor: Colors.black,
                backgroundColor: AppTheme.of(context).appBarTransparent ? Colors.transparent : design.colors.background1,
                elevation: 0,
                centerTitle: true,
                title: Image(
                  image: FlavorConfig.current.bccmImages!.logo,
                  height: FlavorConfig.current.bccmImages!.logoHeight,
                  gaplessPlayback: true,
                ),
                leadingWidth: kIsWeb ? 300 : 100,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.loose(const Size(24, 24)),
                      child: CastButton(color: DesignSystem.of(context).colors.tint1),
                    ),
                  ),
                ],
                flexibleSpace: AppTheme.of(context).appBarTransparent ? const _BlurredAppBarBackground() : null,
              ),
            ),
      floatingActionButton: ref.watch(featureFlagsProvider.select((f) => f.bccmAudioTest))
          ? FloatingActionButton(
              child: const Icon(Icons.audiotrack),
              onPressed: () {
                context.router.push(const AudioScreenRoute());
              },
            )
          : null,
      body: SafeArea(
        top: false,
        child: PageRenderer(
          pageFuture: pageFuture.value,
          onRefresh: ({bool? retry}) async {
            pageFuture.value = getPage(true);
          },
          scrollController: scrollController,
        ),
      ),
    );
  }
}

class _BlurredAppBarBackground extends StatelessWidget {
  const _BlurredAppBarBackground();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 6),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [DesignSystem.of(context).colors.background1, Colors.transparent],
            ),
          ),
          height: 1000,
        ),
      ),
    );
  }
}
