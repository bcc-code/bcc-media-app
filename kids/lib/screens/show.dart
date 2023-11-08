import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:brunstadtv_app/graphql/queries/kids/show.graphql.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/stack_close_button.dart';
import 'package:kids/components/grid/episode_grid.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/helpers/transitions.dart';
import 'package:kids/router/router.gr.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage<void>()
class ShowScreen extends HookConsumerWidget {
  const ShowScreen({
    super.key,
    @PathParam('showId') required this.showId,
  });

  final String showId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 20.0 : 40.0;
    final titleStyle = bp.smallerThan(TABLET) ? design.textStyles.headline3 : design.textStyles.headline2;

    final showQuery = useQuery$GetShowOverview(
      Options$Query$GetShowOverview(
        variables: Variables$Query$GetShowOverview(id: showId),
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    final episodes = showQuery.result.parsedData?.$show.seasons.items
        .expand((element) => element.episodes.items)
        .whereType<Fragment$KidsEpisodeThumbnail>()
        .map((e) => EpisodeGridItem.fromFragment(e))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverSafeArea(
                bottom: false,
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: bp.smallerThan(TABLET) ? 96 : 144, top: basePadding, right: basePadding, bottom: basePadding),
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
                                Text('Title of the show', style: titleStyle),
                                Text('23 episodes', style: design.textStyles.body2),
                              ],
                            ),
                          )
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(showQuery.result.parsedData!.$show.title, style: titleStyle),
                              Text('${showQuery.result.parsedData!.$show.episodeCount} ${S.of(context).episodes.toLowerCase()}',
                                  style: design.textStyles.body2),
                            ],
                          ),
                        const Spacer(),
                        const SizedBox(width: 24),
                        design.buttons.responsive(
                          onPressed: () {
                            if (episodes == null) return;
                            final randomEpisode = episodes[Random().nextInt(episodes.length)];
                            context.router.push(EpisodeScreenRoute(id: randomEpisode.id, shuffle: true));
                          },
                          labelText: S.of(context).playRandom,
                          image: SizedBox(
                            height: 24,
                            child: Center(
                              child: SvgPicture.string(SvgIcons.play),
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
              else if (episodes != null)
                SliverSafeArea(
                  top: false,
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: basePadding).copyWith(bottom: basePadding),
                      child: EpisodeGrid(
                        onTap: (item, index, morphKey) {
                          currentMorphKey = morphKey;
                          context.router.push(EpisodeScreenRoute(id: item.id));
                          ref.read(analyticsProvider).sectionItemClicked(context,
                              sectionAnalyticsOverride: SectionAnalytics(
                                id: 'ShowEpisodes-$showId',
                                position: 0,
                                type: 'ShowEpisodes',
                              ),
                              itemAnalyticsOverride: SectionItemAnalytics(
                                position: index,
                                type: 'Episode',
                                id: item.id,
                              ));
                        },
                        items: episodes,
                      ),
                    ),
                  ),
                )
            ],
          ),
          const StackCloseButton(),
        ],
      ),
    );
  }
}
