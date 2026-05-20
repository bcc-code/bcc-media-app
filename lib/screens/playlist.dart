import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/plugins/riverpod.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              variables: Variables$Query$GetPlaylist(id: id, first: 1000),
            ),
          ),
      [id],
    );
    final snapshot = useFuture(playlistFuture);

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final playlist = snapshot.data?.parsedData?.playlist;
    if (playlist == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Playlist not found')),
      );
    }

    final items = playlist.items.items;
    final episodes = items.whereType<Query$GetPlaylist$playlist$items$items$$Episode>().toList();
    final totalSeconds = episodes.fold<int>(0, (sum, e) => sum + e.duration);

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
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
                    _formatSubtitle(playlist.items.total, totalSeconds),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => _PlaylistItemRow(item: items[i]),
              childCount: items.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Future<void> _shuffle(WidgetRef ref, List<Query$GetPlaylist$playlist$items$items$$Episode> episodes) async {
    if (episodes.isEmpty) return;
    final pick = episodes[Random().nextInt(episodes.length)];
    final episode = await ref.read(apiProvider).fetchEpisode(pick.id);
    if (episode == null) return;
    final playerId = ref.read(primaryPlayerProvider)?.playerId;
    if (playerId == null) return;
    await ref.read(playbackServiceProvider).playEpisode(
          playerId: playerId,
          episode: episode,
          autoplay: true,
        );
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
  const _PlaylistItemRow({required this.item});

  final Query$GetPlaylist$playlist$items$items item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    String title;
    String? subtitle;
    String itemId;
    VoidCallback onTap;

    final i = item;
    if (i is Query$GetPlaylist$playlist$items$items$$Episode) {
      itemId = i.id;
      title = i.title;
      final songNames = i.songs.map((s) => s.title).join(', ');
      final contributorNames = i.contributors.map((c) => c.person.name).join(', ');
      final combined = '$songNames $contributorNames'.trim();
      subtitle = combined.isNotEmpty ? combined : null;
      onTap = () async {
        final episode = await ref.read(apiProvider).fetchEpisode(i.id);
        if (episode == null) return;
        final playerId = ref.read(primaryPlayerProvider)?.playerId;
        if (playerId == null) return;
        await ref.read(playbackServiceProvider).playEpisode(
              playerId: playerId,
              episode: episode,
              autoplay: true,
            );
      };
    } else if (i is Query$GetPlaylist$playlist$items$items$$Short) {
      itemId = i.id;
      title = i.title;
      subtitle = 'Short';
      onTap = () => context.router.push(ShortScreenRoute(id: i.id));
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
