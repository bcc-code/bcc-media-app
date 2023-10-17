import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
// import 'package:brunstadtv_app/components/status/loading_generic.dart';
// import 'package:brunstadtv_app/graphql/queries/kids/show.graphql.dart';
// import 'package:brunstadtv_app/helpers/extensions.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:graphql/client.dart';
import 'package:kids/components/buttons/button.dart';
// import 'package:kids/components/grid/episode_grid.dart';
// import 'package:kids/design_system.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
// import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the UI for the search screen
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;
    // final titleStyle = bp.smallerThan(TABLET) ? design.textStyles.headline3 : design.textStyles.headline2;
    // final textStyles = BibleKidsTextStyles(colors: colors);

    return Scaffold(
      body: Stack(
        children: [
          // SearchBar(),
          CustomScrollView(
            slivers: [
              SliverSafeArea(
                bottom: false,
                sliver: SliverToBoxAdapter(
                  // child: Row(
                  //   children: [
                  //     // const SearchBar(),
                  //     Spacer(),
                  //     SizedBox(width: 24),
                  //   ],
                  // ),
                  child: Padding(
                    // padding: EdgeInsets.only(left: bp.smallerThan(TABLET) ? 96 : 144, top: basePadding, right: basePadding, bottom: basePadding),
                    padding: EdgeInsets.only(
                        left: bp.smallerThan(TABLET) ? 144 : 216, top: basePadding, right: bp.smallerThan(TABLET) ? 96 : 144, bottom: basePadding),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchBar(), // Replaced the original logic with SearchBar
                      ],
                    ),
                  ),
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    // final bp = ResponsiveBreakpoints.of(context);
    // final small = bp.smallerThan(TABLET);
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 243, 249), // 很淡的灰色背景
        borderRadius: BorderRadius.circular(30.0), // 圆角边框
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.string(SvgIcons.search),
          ),
          Expanded(
            child: TextField(
              style: design.textStyles.title1.copyWith(color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none, // 隐藏输入框边框
                // hintText: 'Search...', // 提示文本
                hintStyle: TextStyle(color: Colors.blueGrey), // 设置hintText颜色
              ),
            ),
          ),
        ],
      ),
    );
  }
}
