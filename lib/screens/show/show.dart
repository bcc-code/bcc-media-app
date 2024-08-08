import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/episode/list/season_episode_list.dart';
import 'package:brunstadtv_app/components/misc/horizontal_slider.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/pages/sections/section_with_header.dart';
import 'package:brunstadtv_app/components/thumbnails/slider/thumbnail_slider_episode.dart';
import 'package:brunstadtv_app/helpers/episode_state.dart';
import 'package:brunstadtv_app/helpers/insets.dart';
import 'package:brunstadtv_app/models/episode_thumbnail_data.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage<void>()
class ShowScreen extends HookConsumerWidget {
  const ShowScreen({
    super.key,
    @PathParam() required this.showId,
  });

  final String showId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    seasonHasNewEpisodes(Query$GetShow$show$seasons$items season) {
      return season.episodes.items.any((episode) => isNewEpisode(episode.publishDate, episode.locked));
    }

    final seasons = useState<List<ShowScreenSeason>>([]);

    getShow() async {
      final gqlClient = ref.read(bccmGraphQLProvider);
      final show = await gqlClient.query$GetShow(Options$Query$GetShow(variables: Variables$Query$GetShow(id: showId)));

      if (show.parsedData == null) throw Exception('No show data found');

      for (final season in show.parsedData!.$show.seasons.items) {
        if (seasonHasNewEpisodes(season)) {
          final result = await gqlClient.query$GetSeasonEpisodes(
            Options$Query$GetSeasonEpisodes(
              variables: Variables$Query$GetSeasonEpisodes(id: season.id, dir: 'desc'),
            ),
          );

          final parsedData = result.parsedData;
          if (parsedData == null) throw Exception('No season data found');

          seasons.value.add(ShowScreenSeason(
            id: season.id,
            title: season.title,
            episodes: parsedData.season.episodes.items,
            newEpisodes: true,
          ));
        } else {
          seasons.value.add(ShowScreenSeason(
            id: season.id,
            title: season.title,
            episodes: season.episodes.items,
            newEpisodes: false,
          ));
        }
      }

      return show;
    }

    final design = BccMediaDesignSystem();

    final showFuture = useState<Future<QueryResult<Query$GetShow>>>(useMemoized(getShow));
    final showSnapshot = useFuture(showFuture.value);
    final showSnapshotData = showSnapshot.data?.parsedData?.$show;

    return Scaffold(
      appBar: ScreenInsetAppBar(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leadingWidth: 92,
          leading: const CustomBackButton(),
          title: Text(showSnapshotData?.title ?? ''),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                width: 24,
                child: CastButton(color: DesignSystem.of(context).colors.tint1),
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showSnapshot.connectionState == ConnectionState.waiting)
                const Center(child: CircularProgressIndicator())
              else ...[
                if (showSnapshotData != null && showSnapshotData.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: simpleFadeInImage(
                        url: showSnapshotData.image!,
                      ),
                    ),
                  ),
                if (showSnapshotData != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(showSnapshotData.title, style: design.textStyles.headline2),
                        const SizedBox(height: 6),
                        Text(
                          showSnapshotData.description,
                          style: design.textStyles.body2.copyWith(color: design.colors.label3),
                        ),
                      ],
                    ),
                  ),
                if (showSnapshotData != null && seasons.value.isNotEmpty)
                  for (final season in seasons.value)
                    SectionWithHeader(
                      title: season.title,
                      child: season.newEpisodes
                          ? SeasonEpisodeList(
                              items: season.episodes.map((episode) => SeasonEpisodeListEpisodeData(episode: episode)).toList(),
                              onEpisodeTap: (index, id) => {
                                context.router.push(EpisodeScreenRoute(episodeId: id)),
                              },
                            )
                          : HorizontalSlider(
                              height: 136,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              itemCount: season.episodes.length,
                              itemBuilder: (context, index) {
                                final episode = season.episodes[index];
                                return GestureDetector(
                                  onTap: () => context.router.push(EpisodeScreenRoute(episodeId: episode.id)),
                                  child: ThumbnailSliderEpisode(
                                    episode: EpisodeThumbnailData.fromFragment(episode),
                                    imageSize: const Size(140, 80),
                                    showSecondaryTitle: false,
                                  ),
                                );
                              },
                            ),
                    )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class ShowScreenSeason {
  const ShowScreenSeason({
    required this.title,
    required this.episodes,
    required this.id,
    this.newEpisodes = false,
  });

  final String title;
  final List<Fragment$SeasonListEpisode> episodes;
  final bool newEpisodes;
  final String id;
}
