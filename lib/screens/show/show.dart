import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/episode/list/season_episode_list.dart';
import 'package:brunstadtv_app/components/misc/collapsable_markdown.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/pages/sections/section_with_header.dart';
import 'package:brunstadtv_app/components/status/error_adaptive.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:brunstadtv_app/components/thumbnails/slider/thumbnail_slider.dart';
import 'package:brunstadtv_app/components/thumbnails/slider/thumbnail_slider_episode.dart';
import 'package:brunstadtv_app/helpers/episode_state.dart';
import 'package:brunstadtv_app/helpers/insets.dart';
import 'package:brunstadtv_app/helpers/share_extension/share_extension.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/models/episode_thumbnail_data.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/theme/design_system/bccmedia/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

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

      final showParsedData = show.parsedData;
      if (showParsedData == null) throw Exception('No show data found');

      final futures = showParsedData.$show.seasons.items.map((season) async {
        final List<Fragment$SeasonListEpisode> episodes;
        final hasNewEpisodes = seasonHasNewEpisodes(season);

        if (hasNewEpisodes) {
          final result = await gqlClient.query$GetSeasonEpisodes(
            Options$Query$GetSeasonEpisodes(
              variables: Variables$Query$GetSeasonEpisodes(
                id: season.id,
                dir: 'desc',
              ),
            ),
          );

          final seasonParsedData = result.parsedData;
          if (seasonParsedData == null) throw Exception('No season data found');

          episodes = seasonParsedData.season.episodes.items;
        } else {
          episodes = season.episodes.items;
        }

        return ShowScreenSeason(
          id: season.id,
          title: season.title,
          episodes: episodes,
          newEpisodes: hasNewEpisodes,
        );
      });

      seasons.value = await Future.wait(futures);

      return show;
    }

    final design = BccMediaDesignSystem();

    final showFuture = useState(useMemoized(getShow));
    final showSnapshot = useFuture(showFuture.value);
    final showSnapshotData = showSnapshot.data?.parsedData?.$show;

    return Scaffold(
      appBar: ScreenInsetAppBar(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leadingWidth: 92,
          leading: const CustomBackButton(),
          title: Text(showSnapshotData?.title ?? '').animate().slideX(begin: -0.1, curve: Curves.easeOutExpo, duration: 3000.ms).fade(),
          actions: [
            GestureDetector(
              onTap: () {
                Share().shareUrl(
                  'https://app.bcc.media/show/$showId',
                  sharePositionOrigin: iPadSharePositionOrigin(context),
                );
                ref.read(analyticsProvider).contentShared(
                      ContentSharedEvent(
                        pageCode: 'show',
                        elementType: 'show',
                        elementId: showId,
                      ),
                    );
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: SvgPicture.string(
                  SvgIcons.share,
                  colorFilter: ColorFilter.mode(design.colors.tint1, BlendMode.srcIn),
                ),
              ),
            ),
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
      body: showSnapshot.connectionState == ConnectionState.waiting
          ? const LoadingGeneric()
          : SizedBox.expand(
              child: RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                onRefresh: () async {
                  showFuture.value = getShow();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimateList(
                      effects: [
                        MoveEffect(
                          begin: const Offset(0, 15),
                          duration: 1500.ms,
                          curve: Curves.easeOutExpo,
                        ),
                        FadeEffect(
                          begin: 0.0,
                          duration: 1500.ms,
                          curve: Curves.easeOutExpo,
                        ),
                      ],
                      interval: 100.ms,
                      children: [
                        if (showSnapshotData != null) ...[
                          if (showSnapshotData.image != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: simpleFadeInImage(
                                  url: showSnapshotData.image!,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(showSnapshotData.title, style: design.textStyles.headline2),
                                const SizedBox(height: 6),
                                CollapsableMarkdown(
                                  text: showSnapshotData.description,
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                          if (seasons.value.isNotEmpty)
                            for (final (seasonIndex, season) in seasons.value.indexed)
                              SectionWithHeader(
                                title: season.title,
                                child: season.newEpisodes && seasons.value.where((s) => s.newEpisodes).length == 1
                                    ? SeasonEpisodeList(
                                        items: season.episodes.map((episode) => SeasonEpisodeListEpisodeData(episode: episode)).toList(),
                                        onEpisodeTap: (episodeIndex, episodeId) {
                                          context.router.push(EpisodeScreenRoute(episodeId: episodeId));
                                          ref.read(analyticsProvider).sectionItemClicked(
                                                context,
                                                sectionAnalyticsOverride: SectionAnalyticsData(
                                                  id: 'ShowSeason-${season.id}',
                                                  type: 'ShowSeasonEpisodeList',
                                                  position: seasonIndex,
                                                  pageCode: 'show',
                                                  meta: {
                                                    'showId': showId,
                                                    'seasonId': season.id,
                                                  },
                                                ),
                                                itemAnalyticsOverride: SectionItemAnalyticsData(
                                                  position: episodeIndex,
                                                  type: 'Episode',
                                                  id: episodeId,
                                                ),
                                              );
                                        },
                                      )
                                    : ThumbnailSlider(
                                        itemsCount: season.episodes.length,
                                        imageSize: const Size(140, 80),
                                        thumbnailBuilder: (context, episodeIndex, responsiveSize) {
                                          final episode = season.episodes[episodeIndex];
                                          return GestureDetector(
                                            onTap: () {
                                              if (episode.locked) return;

                                              context.router.push(EpisodeScreenRoute(episodeId: episode.id));
                                              ref.read(analyticsProvider).sectionItemClicked(
                                                    context,
                                                    sectionAnalyticsOverride: SectionAnalyticsData(
                                                      id: 'ShowSeason-${season.id}',
                                                      type: 'ShowSeasonEpisodeSlider',
                                                      position: seasonIndex,
                                                      pageCode: 'show',
                                                      meta: {
                                                        'showId': showId,
                                                        'seasonId': season.id,
                                                      },
                                                    ),
                                                    itemAnalyticsOverride: SectionItemAnalyticsData(
                                                      position: episodeIndex,
                                                      type: 'Episode',
                                                      id: episode.id,
                                                    ),
                                                  );
                                            },
                                            child: ThumbnailSliderEpisode(
                                              episode: EpisodeThumbnailData.fromFragment(episode),
                                              imageSize: responsiveSize,
                                              showSecondaryTitle: false,
                                            ),
                                          );
                                        },
                                      ),
                              )
                        ] else
                          ErrorAdaptive(
                            exception: showSnapshot.data?.exception,
                            onRetry: () {
                              showFuture.value = getShow();
                            },
                          )
                      ],
                    ),
                  ),
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
