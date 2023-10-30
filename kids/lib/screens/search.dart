import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    final textController = useTextEditingController();
    final scrollController = useScrollController();

    useListenable(textController);
    final small = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    final double appBarHeight = small ? 80 : 136;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (textController.text.trim().isNotEmpty)
            CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              controller: scrollController,
              slivers: [
                SliverPadding(padding: EdgeInsets.only(top: appBarHeight)),
                SliverSearchResults(searchQuery: textController.text),
              ],
            ),
          Positioned.fill(
            top: 0,
            left: 0,
            child: SearchAppBar(
              scrollController: scrollController,
              textController: textController,
              height: appBarHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchAppBar extends HookWidget {
  const SearchAppBar({
    super.key,
    required this.scrollController,
    required this.textController,
    required this.height,
  });

  final ScrollController scrollController;
  final TextEditingController textController;
  final double height;

  @override
  Widget build(BuildContext context) {
    useListenable(scrollController);
    final offset = !scrollController.hasClients ? 0.0 : scrollController.offset;
    final animationValue = min(1.0, offset / (height));
    final bp = ResponsiveBreakpoints.of(context);
    final small = bp.smallerThan(TABLET);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;
    final design = DesignSystem.of(context);

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: small ? 8 : 24),
              alignment: Alignment.bottomCenter,
              child: KidsSearchBar(
                controller: textController,
                onTapAsButton: () => scrollController.animateTo(0, duration: 500.ms, curve: Curves.easeOutExpo),
                autofocus: true,
                morphState: animationValue,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: small ? 8 : 16),
              alignment: Alignment.bottomLeft,
              child: SafeArea(
                bottom: false,
                right: false,
                top: false,
                minimum: EdgeInsets.only(left: basePadding),
                child: design.buttons.responsive(
                  labelText: '',
                  onPressed: () => context.router.pop(),
                  image: SvgPicture.string(SvgIcons.close),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
