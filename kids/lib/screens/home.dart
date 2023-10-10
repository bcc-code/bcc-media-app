import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/misc/parental_gate.dart';
import 'package:brunstadtv_app/components/pages/page_mixin.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/queries/application.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:brunstadtv_app/helpers/version.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/components/page/section_renderer.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

@RoutePage<void>()
class HomeScreen extends ConsumerStatefulWidget {
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
    _appConfigListener = ref.listenManual<Future<Query$Application?>>(appConfigFutureProvider, (prev, next) async {
      final value = await next;
      if (value == null) return;
      if (!context.mounted) return;
      showDialogIfOldAppVersion(context, value);
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
      final code = value?.application.page?.code;
      if (code == null) {
        throw ErrorHint('Application config error');
      }
      return api.getPage("kids2-frontpage");
    });
  }

  Future<Query$Page$page> getHomeAndAppConfig() async {
    reloadAppConfig(ref);
    return getHomePage();
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24 : 48;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: basePadding),
          Expanded(
            child: FutureBuilder(
              future: pageResult.future,
              builder: (context, result) => CustomScrollView(
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
                        ),
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
                        return SectionRenderer(section: section);
                      },
                    ),
                  const SliverPadding(padding: EdgeInsets.only(right: 60)),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            maintainBottomViewPadding: true,
            child: SizedBox(
              height: bp.smallerThan(TABLET) ? 104 : 176,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: basePadding),
                    design.buttons.responsive(
                      onPressed: () async {
                        if (!await checkParentalGate(context)) return;
                        if (!context.mounted) return;
                        context.router.pushNamed('/settings');
                      },
                      labelText: '',
                      image: SvgPicture.string(SvgIcons.profile),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
