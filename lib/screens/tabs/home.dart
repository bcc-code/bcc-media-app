import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/helpers/app_theme.dart';
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

@RoutePage<void>()
class HomeScreen extends HookConsumerWidget {
  HomeScreen({Key? key}) : super(key: key ?? GlobalKey());

/*   @override
  void scrollToTop() {
    if (!pageScrollController.hasClients) return;
    pageScrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
  } */

/*    */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOffline = ref.watch(isOfflineProvider);
    if (isOffline) {
      return const OfflineHome();
    }

    final pageCode = ref.watch(appConfigProvider.select((appConfig) => appConfig?.application.page?.code));

    final scrollController = useScrollController();
    final pageFuture = useState<Future<Query$Page$page>?>(null);
    useEffect(() {
      if (pageCode != null) {
        pageFuture.value = ref.read(apiProvider).getPage(pageCode);
      }
    }, [pageCode]);

    // TODO: Handle watch progress updates

    final design = DesignSystem.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: kIsWeb
          ? null
          : AppBar(
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
      body: SafeArea(
        top: false,
        child: PageRenderer(
          pageFuture: pageFuture.value,
          onRefresh: ({bool? retry}) async {
            if (retry == true) {
              ref.invalidate(appConfigFutureProvider);
            }
            if (pageCode != null) {
              pageFuture.value = ref.read(apiProvider).getPage(pageCode);
            }
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
