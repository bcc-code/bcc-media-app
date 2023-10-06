import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:brunstadtv_app/graphql/queries/kids/show.graphql.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:kids/components/grid/episode_grid.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage<void>()
class ShowScreen extends HookWidget {
  const ShowScreen({
    super.key,
    @PathParam('showId') required this.showId,
  });

  final String showId;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    double basePadding = 24.0;

    final showQuery = useQuery$GetEpisodesForShow(
      Options$Query$GetEpisodesForShow(
        variables: Variables$Query$GetEpisodesForShow(id: showId),
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverSafeArea(
                bottom: false,
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 96, top: basePadding, right: basePadding, bottom: basePadding),
                    child: Row(
                      children: [
                        if (showQuery.result.isLoading || showQuery.result.parsedData == null)
                          Skeletonizer(
                            containersColor: design.colors.background2,
                            effect: const ShimmerEffect(),
                            textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(55)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title of the show', style: design.textStyles.headline3),
                                Text('23 episodes', style: design.textStyles.body2),
                              ],
                            ),
                          )
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(showQuery.result.parsedData!.$show.title, style: design.textStyles.headline3),
                              Text('${showQuery.result.parsedData!.$show.episodeCount} episodes', style: design.textStyles.body2),
                            ],
                          ),
                        const Spacer(),
                        const SizedBox(width: 24),
                        design.buttons.small(
                          onPressed: () {},
                          labelText: 'Play random',
                          image: SizedBox(
                            height: 24,
                            child: Center(
                              child: SvgPicture.string(SvgIcons.magic),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (showQuery.result.isLoading)
                const SliverFillRemaining(hasScrollBody: true, child: LoadingGeneric())
              else if (showQuery.result.parsedData != null)
                SliverSafeArea(
                  top: false,
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: basePadding).copyWith(bottom: basePadding),
                      child: EpisodeGrid(
                        items: showQuery.result.parsedData!.$show.seasons.items.expand((element) => element.episodes.items).toList(),
                      ),
                    ),
                  ),
                )
            ],
          ),
          Positioned(
              top: 0,
              left: 0,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(basePadding),
                  child: design.buttons.small(
                    labelText: '',
                    onPressed: () => context.router.pop(),
                    image: SizedBox(
                      height: 24,
                      child: Center(
                        child: SvgPicture.string(SvgIcons.close),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
