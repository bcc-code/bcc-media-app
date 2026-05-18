import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/episode/list/episode_list_episode.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PlaylistScreen extends HookConsumerWidget {
  const PlaylistScreen({
    super.key,
    @PathParam() required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final playlistFuture = useMemoized(
      () => ref.read(bccmGraphQLProvider).query$GetPlaylist(
            Options$Query$GetPlaylist(
              variables: Variables$Query$GetPlaylist(id: id, first: 100),
            ),
          ),
      [id],
    );
    final snapshot = useFuture(playlistFuture);

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Scaffold(body: Center(child: LoadingIndicator()));
    }

    final playlist = snapshot.data?.parsedData?.playlist;
    if (playlist == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Playlist not found')),
      );
    }

    final items = playlist.items.items;

    return Scaffold(
      appBar: AppBar(title: Text(playlist.title)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: design.colors.separatorOnLight)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  if (playlist.image != null)
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: simpleFadeInImage(url: playlist.image!),
                      ),
                    ),
                  Text(
                    playlist.title,
                    style: design.textStyles.headline2,
                    textAlign: TextAlign.center,
                  ),
                  if (playlist.description != null && playlist.description!.isNotEmpty)
                    Text(
                      playlist.description!,
                      style: design.textStyles.body2,
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text('${playlist.items.total} items', style: design.textStyles.caption1),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => _PlaylistItemRow(item: items[i]),
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlaylistItemRow extends StatelessWidget {
  const _PlaylistItemRow({required this.item});

  final Query$GetPlaylist$playlist$items$items item;

  @override
  Widget build(BuildContext context) {
    final i = item;
    if (i is Query$GetPlaylist$playlist$items$items$$Episode) {
      return InkWell(
        onTap: () => context.navigateTo(EpisodeScreenRoute(episodeId: i.id)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: EpisodeListEpisode(
            id: i.id,
            title: i.title,
            image: i.image,
            ageRating: i.ageRating,
            duration: i.duration,
            locked: i.locked,
            progress: i.progress,
            publishDate: i.publishDate,
            showTitle: i.season?.$show.title,
          ),
        ),
      );
    }
    if (i is Query$GetPlaylist$playlist$items$items$$Short) {
      final design = DesignSystem.of(context);
      return InkWell(
        onTap: () => context.navigateTo(ShortScreenRoute(id: i.id)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              if (i.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 60,
                    height: 80,
                    child: simpleFadeInImage(url: i.image!),
                  ),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(i.title, style: design.textStyles.caption1),
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
