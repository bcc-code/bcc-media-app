import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/components/page/section_renderer.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final reloadKey = useState(UniqueKey());
    final reloadAppConfig = useState(false);
    final pageFuture = useMemoized(() => getPage(reloadAppConfig.value), [reloadKey.value]);
    final pageResult = useFuture(pageFuture);
    final page = pageResult.data;

    ref.listen(settingsProvider.select((settings) => settings.appLanguage), (_, __) {
      // Workaround. Wait a bit for feature flags to be updated,
      // so that the correct content is loaded.
      Future.delayed(const Duration(milliseconds: 1000), () {
        reloadKey.value = UniqueKey();
      });
    });

    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 20 : 48;
    final scrollController = useScrollController();
    final isCasting = useListenableSelector(BccmPlayerController.primary, () => BccmPlayerController.primary.isChromecast);

    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: orientation == Orientation.portrait
            ? Container(color: Colors.white)
            : Column(
                children: [
                  SizedBox(height: basePadding),
                  Expanded(
                    child: InheritedData<ScrollController>(
                      inheritedData: scrollController,
                      builder: (context) => PrimaryScrollController(
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
                            if (pageResult.connectionState == ConnectionState.waiting)
                              const SliverFillRemaining(hasScrollBody: true, child: Center(child: LoadingIndicator()))
                            else if (page == null || pageResult.hasError)
                              SliverFillRemaining(
                                hasScrollBody: true,
                                child: ErrorGeneric(
                                  onRetry: () async {
                                    reloadAppConfig.value = true;
                                    reloadKey.value = UniqueKey();
                                  },
                                ),
                              )
                            else
                              SliverList.builder(
                                itemCount: page.sections.items.length,
                                itemBuilder: (context, index) {
                                  final section = page.sections.items[index];
                                  return SectionRenderer(section: section, index: index, pageCode: page.code);
                                },
                              ),
                            const SliverPadding(padding: EdgeInsets.only(right: 60)),
                          ],
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
