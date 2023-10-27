import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:brunstadtv_app/graphql/queries/kids/show.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/components/grid/episode_grid.dart';
import 'package:kids/helpers/playback.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/router/router.gr.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage<void>()
class PlaylistScreen extends HookConsumerWidget {
  const PlaylistScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;
    final titleStyle = bp.smallerThan(TABLET) ? design.textStyles.headline3 : design.textStyles.headline2;

    final query = useQuery$GetPlaylistOverview(
      Options$Query$GetPlaylistOverview(
        variables: Variables$Query$GetPlaylistOverview(id: id),
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    final items = query.result.parsedData?.playlist.items.items.whereType<Fragment$KidsEpisodeThumbnail>().toList();

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
                        if (query.result.isLoading || query.result.parsedData == null)
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
                              Text(query.result.parsedData!.playlist.title, style: titleStyle),
                              Text('${query.result.parsedData!.playlist.items.total} episodes', style: design.textStyles.body2),
                            ],
                          ),
                        const Spacer(),
                        const SizedBox(width: 24),
                        design.buttons.responsive(
                          onPressed: () {
                            if (items == null) return;
                            final randomEpisode = items[Random().nextInt(items.length)];
                            context.router.push(EpisodeScreenRoute(id: randomEpisode.id));
                          },
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
              if (query.result.isLoading)
                const SliverFillRemaining(hasScrollBody: true, child: LoadingGeneric())
              else if (items != null)
                SliverSafeArea(
                  top: false,
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: basePadding).copyWith(bottom: basePadding),
                      child: EpisodeGrid(
                        onTap: (item, morphKey) {
                          currentMorphKey = morphKey;
                          context.router.push(EpisodeScreenRoute(id: item.id));
                        },
                        items: items.map((e) => EpisodeGridItem.fromFragment(e)).toList(),
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
                  child: design.buttons.responsive(
                    labelText: '',
                    onPressed: () => context.router.pop(),
                    image: SvgPicture.string(SvgIcons.close),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
