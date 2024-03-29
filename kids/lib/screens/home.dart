import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/misc/app_update_dialog.dart';
import 'package:brunstadtv_app/components/pages/page_mixin.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:bccm_core/platform.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/components/page/section_renderer.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

final GlobalKey homeKey = GlobalKey<_HomeScreenState>();

@RoutePage<void>()
class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with PageMixin {
  late ProviderSubscription<Future<Query$Application?>> _appConfigListener;

  @override
  void initState() {
    super.initState();
    pageResult = wrapInCompleter(getHomePage());
    _appConfigListener = ref.listenManual(appConfigFutureProvider, (prev, next) async {
      final value = await next;
      if (value == null) return;
      if (!context.mounted) return;
      if (isOldAppVersion(context, value)) {
        showDialog(
          context: context,
          builder: (context) => const AppUpdateDialog(),
        );
      }
    }, fireImmediately: true);
  }

  @override
  void dispose() {
    _appConfigListener.close();
    super.dispose();
  }

  Future<Query$Page$page> getHomePage() async {
    final api = ref.read(apiProvider);
    return ref.read(appConfigFutureProvider).then((value) {
      final code = value.application.page?.code;
      if (code == null) {
        throw ErrorHint('Application config error');
      }
      return api.getPage(code);
    });
  }

  Future<Query$Page$page> getHomeAndAppConfig() async {
    ref.invalidate(appConfigFutureProvider);
    return getHomePage();
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 20 : 48;
    final scrollController = useScrollController();
    final isCasting = useListenableSelector(BccmPlayerController.primary, () => BccmPlayerController.primary.isChromecast);
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        key: homeKey,
        resizeToAvoidBottomInset: false,
        body: orientation == Orientation.portrait
            ? Container(color: Colors.white)
            : Column(
                children: [
                  SizedBox(height: basePadding),
                  Expanded(
                    child: FutureBuilder(
                      future: pageResult.future,
                      builder: (context, result) => InheritedData<ScrollController>(
                        inheritedData: scrollController,
                        child: (context) => PrimaryScrollController(
                          controller: scrollController,
                          child: CustomScrollView(
                            primary: true,
                            scrollDirection: Axis.horizontal,
                            slivers: [
                              SliverSafeArea(
                                right: false,
                                sliver: SliverPadding(padding: EdgeInsets.only(left: basePadding)),
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: SizedBox(
                                    width: basePadding,
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Image.asset(
                                        'assets/flavors/prod/logo_neg.png',
                                      ),
                                    )
                                        .animate()
                                        .slideX(begin: 4, curve: Curves.easeOutExpo, duration: 2000.ms)
                                        .scale(begin: const Offset(0.5, 0.5))
                                        .rotate(begin: 0.05)
                                        .fadeIn(),
                                  ),
                                ),
                              ),
                              const SliverPadding(padding: EdgeInsets.only(left: 32)),
                              if (result.connectionState == ConnectionState.waiting)
                                const SliverFillRemaining(hasScrollBody: true, child: Center(child: LoadingIndicator()))
                              else if (result.data == null || result.hasError)
                                SliverFillRemaining(
                                  hasScrollBody: true,
                                  child: ErrorGeneric(
                                    onRetry: () {
                                      setState(() {
                                        pageResult = wrapInCompleter(getHomeAndAppConfig());
                                      });
                                    },
                                  ),
                                )
                              else
                                SliverList.builder(
                                  itemCount: result.data!.sections.items.length,
                                  itemBuilder: (context, index) {
                                    final section = result.data!.sections.items[index];
                                    return SectionRenderer(section: section, index: index);
                                  },
                                ),
                              const SliverPadding(padding: EdgeInsets.only(right: 60)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    top: false,
                    maintainBottomViewPadding: true,
                    child: SizedBox(
                      height: bp.smallerThan(TABLET) ? 88 : 168,
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: basePadding),
                            design.buttons
                                .responsive(
                                  onPressed: () {
                                    context.router.pushNamed('/settings');
                                  },
                                  labelText: '',
                                  image: SvgPicture.string(SvgIcons.profile),
                                )
                                .animate()
                                .scale(curve: Curves.easeOutBack, duration: 600.ms)
                                .rotate(begin: -0.5, end: 0, curve: Curves.easeOutExpo, duration: 1000.ms),
                            const Spacer(),
                            if (isCasting) ...[
                              design.buttons
                                  .responsive(
                                    variant: ButtonVariant.secondary,
                                    onPressed: () {
                                      BccmPlayerInterface.instance.openExpandedCastController();
                                    },
                                    labelText: '',
                                    image: SvgPicture.string(SvgIcons.cast),
                                  )
                                  .animate()
                                  .scale(curve: Curves.easeOutBack, duration: 600.ms)
                                  .rotate(begin: -0.5, end: 0, curve: Curves.easeOutExpo, duration: 1000.ms),
                              SizedBox(width: basePadding),
                            ],
                            design.buttons
                                .responsive(
                                  onPressed: () {
                                    context.router.pushNamed('/search');
                                  },
                                  labelText: '',
                                  image: SvgPicture.string(SvgIcons.search),
                                )
                                .animate()
                                .scale(curve: Curves.easeOutBack, duration: 600.ms)
                                .rotate(begin: -0.5, end: 0, curve: Curves.easeOutExpo, duration: 1000.ms),
                            SizedBox(width: basePadding),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
