import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/providers/graphql.dart';
import 'package:bccm_core/api.dart';
import 'package:brunstadtv_app/helpers/analytics.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids/components/thumbnails/posters/playlist_poster_large.dart';
import 'package:kids/components/thumbnails/posters/poster_large.dart';
import 'package:kids/router/router.gr.dart';
import 'package:kids/screens/show.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PosterSection extends ConsumerWidget {
  final Fragment$Section$$PosterSection data;

  const PosterSection(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bp = ResponsiveBreakpoints.of(context);
    final double sectionSpacing = bp.smallerThan(TABLET) ? 20 : 28;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: data.items.items
          .asMap()
          .entries
          .map(
            (kv) {
              final item = kv.value;
              return SizedBox(
                child: Padding(
                  padding: kv.key == data.items.items.length - 1 ? EdgeInsets.zero : EdgeInsets.only(right: sectionSpacing),
                  child: InheritedData<SectionItemAnalytics>(
                    inheritedData: SectionItemAnalytics(position: kv.key, id: item.id, type: item.item.$__typename, name: item.title),
                    child: (context) {
                      final playlistItem = item.item.asOrNull<Fragment$Section$$PosterSection$items$items$item$$Playlist>();
                      if (playlistItem != null) {
                        return PlaylistPosterLarge.fromItem(
                          item: playlistItem,
                          onPressed: () => ref.read(analyticsProvider).sectionItemClicked(context),
                          onPlayPressed: () async {
                            final episodeIds = await ref.read(gqlClientProvider).query$GetManyEpisodeIdsForPlaylist(
                                  Options$Query$GetManyEpisodeIdsForPlaylist(
                                    variables: Variables$Query$GetManyEpisodeIdsForPlaylist(id: item.id),
                                  ),
                                );
                            if (!context.mounted) return;
                            final items = episodeIds.parsedData?.playlist.items.items
                                .whereType<Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode>()
                                .toList();
                            if (items != null) {
                              final randomEpisode = items[Random().nextInt(items.length)];
                              context.router.push(
                                EpisodeScreenRoute(id: randomEpisode.id, cursor: randomEpisode.cursor),
                              );
                            }
                          },
                        );
                      }
                      final showItem = item.item.asOrNull<Fragment$Section$$PosterSection$items$items$item$$Show>();
                      if (showItem != null) {
                        final publishDate = DateTime.tryParse(showItem.seasons.items.firstOrNull?.episodes.items.firstOrNull?.publishDate ?? '');
                        return PosterLarge(
                          image: item.image,
                          hasNewEpisodes: publishDate != null ? DateTime.now().difference(publishDate).inDays <= 7 : false,
                          onPressed: () => ref.read(analyticsProvider).sectionItemClicked(context),
                          onPlayPressed: () async {
                            final result = await ref.read(gqlClientProvider).query$getDefaultEpisodeForShow(
                                  Options$Query$getDefaultEpisodeForShow(
                                    variables: Variables$Query$getDefaultEpisodeForShow(showId: item.id),
                                  ),
                                );
                            if (!context.mounted) return;
                            final episodeId = result.parsedData?.$show.defaultEpisode.id;
                            if (episodeId != null) {
                              context.router.push(
                                EpisodeScreenRoute(id: episodeId),
                              );
                            }
                          },
                          routeSettings: RouteSettings(
                            name: analyticsNameForRouteName(context, ShowScreenRoute.name) ?? ShowScreenRoute.name,
                            arguments: ShowScreenRouteArgs(showId: showItem.id),
                          ),
                          openBuilder: (context, close) {
                            final args = ModalRoute.of(context)!.settings.arguments.asOrNull<ShowScreenRouteArgs>();
                            if (args != null) {
                              return ShowScreen(showId: args.showId);
                            }
                            return const SizedBox.shrink();
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              );
            },
          )
          .toList()
          .animate(interval: 50.ms)
          .slideX(begin: 1, curve: Curves.easeOutExpo, duration: 2000.ms)
          .scale(begin: const Offset(0.8, 0.8))
          .rotate(begin: 0.03)
          .fadeIn(),
    );
  }
}
