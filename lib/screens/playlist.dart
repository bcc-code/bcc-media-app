import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql/client.dart';
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
    final initialFuture = useMemoized(
      () => _loadAllItems(ref.read(bccmGraphQLProvider), id),
      [id],
    );
    final playlistFuture = useState(initialFuture);
    useEffect(() {
      playlistFuture.value = initialFuture;
      return null;
    }, [initialFuture]);
    final snapshot = useFuture(playlistFuture.value);

    Future<void> refresh() async {
      final next = _loadAllItems(ref.read(bccmGraphQLProvider), id);
      playlistFuture.value = next;
      await next;
    }

    if (snapshot.data == null && snapshot.connectionState == ConnectionState.waiting) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final loaded = snapshot.data;
    if (loaded == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Playlist not found')),
      );
    }

    final playlist = loaded.playlist;
    final items = loaded.items;
    final episodes = items.whereType<Query$GetPlaylist$playlist$items$items$$Episode>().toList();
    final totalSeconds = episodes.fold<int>(0, (sum, e) => sum + e.duration);

    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                children: [
                  _Cover(imageUrl: playlist.image),
                  const SizedBox(height: 24),
                  Text(
                    playlist.title,
                    style: design.textStyles.title1,
                    textAlign: TextAlign.center,
                  ),
                  if (playlist.description != null && playlist.description!.isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Text(
                      playlist.description!,
                      style: design.textStyles.body2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: 6),
                  Text(
                    _formatSubtitle(loaded.total, totalSeconds),
                    style: design.textStyles.caption1.copyWith(color: design.colors.label3),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: design.buttons.large(
                      labelText: 'Shuffle',
                      variant: ButtonVariant.primary,
                      image: SvgPicture.string(
                        SvgIcons.play,
                        height: 20,
                        colorFilter: ColorFilter.mode(design.colors.onTint, BlendMode.srcIn),
                      ),
                      disabled: episodes.isEmpty,
                      onPressed: () => _shuffle(ref, episodes),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.separated(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final item = items[i];
              VoidCallback onTap;
              if (item is Query$GetPlaylist$playlist$items$items$$Episode) {
                onTap = () => _playEpisode(ref, item, episodes);
              } else if (item is Query$GetPlaylist$playlist$items$items$$Short) {
                onTap = () => context.router.push(ShortScreenRoute(id: item.id));
              } else {
                onTap = () {};
              }
              return _PlaylistItemRow(item: item, onTap: onTap);
            },
            separatorBuilder: (context, _) => Divider(
              height: 1,
              thickness: 1,
              color: design.colors.separatorOnLight,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
        ),
      ),
    );
  }

  String? _currentVideoLanguageCode(WidgetRef ref) {
    return ref.read(primaryPlayerProvider)?.currentMediaItem?.metadata?.extras?['videoLanguage']?.toString();
  }

  Future<void> _playEpisode(
    WidgetRef ref,
    Query$GetPlaylist$playlist$items$items$$Episode tapped,
    List<Query$GetPlaylist$playlist$items$items$$Episode> episodes,
  ) async {
    final playerId = ref.read(primaryPlayerProvider)?.playerId;
    if (playerId == null) return;
    final playbackService = ref.read(playbackServiceProvider);
    final videoLanguageCode = _currentVideoLanguageCode(ref);

    final tappedIndex = episodes.indexWhere((e) => e.id == tapped.id);
    final nextUp = tappedIndex >= 0 ? episodes.skip(tappedIndex + 1) : episodes;
    final nextUpMediaItems = nextUp.map((e) => playbackService.mapEpisode(e, playlistId: id, videoLanguageCode: videoLanguageCode)).toList();

    await BccmPlayerController.primary.queue.setShuffleEnabled(false);
    await BccmPlayerController.primary.queue.setNextUp(nextUpMediaItems);

    await playbackService.playEpisode(
      playerId: playerId,
      episode: tapped,
      autoplay: true,
      playlistId: id,
      videoLanguageCode: videoLanguageCode,
    );
  }

  Future<void> _shuffle(WidgetRef ref, List<Query$GetPlaylist$playlist$items$items$$Episode> episodes) async {
    if (episodes.isEmpty) return;
    final playerId = ref.read(primaryPlayerProvider)?.playerId;
    if (playerId == null) return;
    final playbackService = ref.read(playbackServiceProvider);
    final videoLanguageCode = _currentVideoLanguageCode(ref);

    final shuffled = [...episodes]..shuffle();
    final pick = shuffled.first;
    final rest = shuffled.skip(1).map((e) => playbackService.mapEpisode(e, playlistId: id, videoLanguageCode: videoLanguageCode)).toList();

    await BccmPlayerController.primary.queue.setShuffleEnabled(true);
    await BccmPlayerController.primary.queue.setNextUp(rest);

    await playbackService.playEpisode(
      playerId: playerId,
      episode: pick,
      autoplay: true,
      playlistId: id,
      videoLanguageCode: videoLanguageCode,
    );
  }

  static Future<_LoadedPlaylist?> _loadAllItems(GraphQLClient client, String id) async {
    Future<Query$GetPlaylist$playlist?> fetchPage(String? cursor) async {
      final res = await client.query$GetPlaylist(
        Options$Query$GetPlaylist(
          variables: Variables$Query$GetPlaylist(id: id, first: 100, cursor: cursor),
        ),
      );
      return res.parsedData?.playlist;
    }

    final first = await fetchPage(null);
    if (first == null) return null;

    final items = [...first.items.items];
    String? cursor = first.items.hasNext ? first.items.nextCursor : null;
    while (cursor != null && items.length < 5000) {
      final next = await fetchPage(cursor);
      if (next == null) break;
      items.addAll(next.items.items);
      cursor = next.items.hasNext ? next.items.nextCursor : null;
    }

    return _LoadedPlaylist(playlist: first, items: items, total: first.items.total);
  }

  static String _formatSubtitle(int itemCount, int totalSeconds) {
    final parts = <String>['$itemCount items'];
    if (totalSeconds > 0) {
      final hours = totalSeconds ~/ 3600;
      final minutes = (totalSeconds % 3600) ~/ 60;
      if (hours > 0) {
        parts.add('${hours}h ${minutes}m');
      } else {
        parts.add('${minutes}m');
      }
    }
    return parts.join('  •  ');
  }
}

class _LoadedPlaylist {
  _LoadedPlaylist({required this.playlist, required this.items, required this.total});
  final Query$GetPlaylist$playlist playlist;
  final List<Query$GetPlaylist$playlist$items$items> items;
  final int total;
}

class _Cover extends StatelessWidget {
  const _Cover({this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(120),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 200,
          height: 200,
          child: imageUrl != null ? simpleFadeInImage(url: imageUrl!) : Container(color: design.colors.background2),
        ),
      ),
    );
  }
}

class _PlaylistItemRow extends ConsumerWidget {
  const _PlaylistItemRow({required this.item, required this.onTap});

  final Query$GetPlaylist$playlist$items$items item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    String title;
    String? subtitle;
    String itemId;

    final i = item;
    if (i is Query$GetPlaylist$playlist$items$items$$Episode) {
      itemId = i.id;
      title = i.title;
      final songNames = i.songs.map((s) => s.title).join(', ');
      final contributorNames = i.contributors.map((c) => c.person.name).join(', ');
      final combined = '$songNames $contributorNames'.trim();
      subtitle = combined.isNotEmpty ? combined : null;
    } else if (i is Query$GetPlaylist$playlist$items$items$$Short) {
      itemId = i.id;
      title = i.title;
      subtitle = 'Short';
    } else {
      return const SizedBox.shrink();
    }

    final playingId = ref.watch(
      primaryPlayerProvider.select((p) => p?.currentMediaItem?.metadata?.extras?['id']?.toString()),
    );
    final isPlaying = playingId == itemId;
    final titleColor = isPlaying ? design.colors.tint1 : design.colors.label1;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isPlaying) ...[
                  SvgPicture.string(
                    SvgIcons.audioPlaying,
                    height: 10,
                    colorFilter: ColorFilter.mode(design.colors.tint1, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 6),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: design.textStyles.title3.copyWith(color: titleColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: design.textStyles.caption1.copyWith(color: design.colors.label3),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
