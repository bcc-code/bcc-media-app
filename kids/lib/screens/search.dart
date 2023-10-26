import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kids/components/search/search_bar.dart';
import 'package:kids/components/search/search_results.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

@RoutePage<void>()
class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;

    final controller = useTextEditingController();

    useListenable(controller);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverSafeArea(
                bottom: false,
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: basePadding,
                      bottom: bp.smallerThan(TABLET) ? 8 : 24,
                    ),
                    child: Center(
                      child: KidsSearchBar(
                        controller: controller,
                        autofocus: true,
                      ),
                    ),
                  ),
                ),
              ),
              SliverSafeArea(
                left: false,
                right: false,
                top: false,
                sliver: SliverToBoxAdapter(
                  child: controller.text.trim().isEmpty ? null : SearchResults(searchQuery: controller.text),
                ),
              ),
            ],
          ),
          Positioned(
              top: 0,
              left: 0,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(basePadding),
                  child: design.buttons.responsive(
                    labelText: '',
                    onPressed: () => context.router.pop(),
                    image: SvgPicture.string(SvgIcons.close),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
