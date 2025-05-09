import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/analytics.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/notification_prompt.dart';
import 'package:kids/components/thumbnails/posters/playlist_poster_large.dart';
import 'package:kids/components/thumbnails/posters/poster_large.dart';
import 'package:kids/router/router.gr.dart';
import 'package:kids/screens/show.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PosterSection extends HookConsumerWidget {
  final Fragment$Section$$PosterSection data;

  const PosterSection(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bp = ResponsiveBreakpoints.of(context);
    final double sectionSpacing = bp.smallerThan(TABLET) ? 20 : 28;
    final widgets = useState<List<Widget>>([]);

    useEffect(() {
      widgets.value = data.items.items.asMap().entries.map((kv) {
        final item = kv.value;
        return SizedBox(
          child: SectionItemAnalytics(
            data: SectionItemAnalyticsData(position: kv.key, id: item.id, type: item.item.$__typename, name: item.title),
            builder: (context) {
              final playlistItem = item.item.asOrNull<Fragment$Section$$PosterSection$items$items$item$$Playlist>();
              if (playlistItem != null) {
                return PlaylistPosterLarge.fromItem(
                  item: playlistItem,
                  onPressed: () => ref.read(analyticsProvider).sectionItemClicked(context),
                  onPlayPressed: () async {
                    final episodeIds = await ref.read(bccmGraphQLProvider).query$GetManyEpisodeIdsForPlaylist(
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
                    final result = await ref.read(bccmGraphQLProvider).query$getDefaultEpisodeForShow(
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
        );
      }).toList();
    }, [data.items.items]);

    // Notification prompt
    final notificationPromptEnabled = ref.watch(featureFlagsProvider.select((flags) => flags.kidsNotificationPrompt));
    final notificationPromptPosition = ref.watch(featureFlagsProvider.select((flags) => flags.kidsNotificationPromptPosition));
    final previousNotificationPromptPosition = useState<int?>(null);
    useEffect(() {
      if (!notificationPromptEnabled) return;
      if (notificationPromptPosition == null) return;

      final prevPos = previousNotificationPromptPosition.value;
      if (prevPos != notificationPromptPosition) {
        if (prevPos != null) {
          widgets.value = List.from(widgets.value)..removeAt(prevPos);
        }

        final lastDismissedAt = ref.read(sharedPreferencesProvider).getInt(PrefKeys.notificationPromptLastDismissedAt);
        if (lastDismissedAt != null) {
          if (DateTime.now().millisecondsSinceEpoch - lastDismissedAt > 60 * 1000) {
            widgets.value = List.from(widgets.value)
              ..insert(notificationPromptPosition, SizedBox(
                child: NotificationPrompt(
                  onDismiss: () {
                    widgets.value = List.from(widgets.value)..removeAt(notificationPromptPosition);
                  },
                ),
              ));
          }
          return;
        }

        widgets.value = List.from(widgets.value)
          ..insert(notificationPromptPosition, SizedBox(
            child: NotificationPrompt(
              onDismiss: () {
                widgets.value = List.from(widgets.value)..removeAt(notificationPromptPosition);
              },
            ),
          ));
      }

      previousNotificationPromptPosition.value = notificationPromptPosition;
    }, [notificationPromptEnabled, notificationPromptPosition]);

    final items = useValueListenable(widgets);

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: sectionSpacing,
      children: items
          .animate(interval: 50.ms)
          .slideX(begin: 1, curve: Curves.easeOutExpo, duration: 2000.ms)
          .scale(begin: const Offset(0.8, 0.8))
          .rotate(begin: 0.03)
          .fadeIn(),
    );
  }
}
