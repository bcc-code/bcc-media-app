import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/bmm.dart';
import 'package:brunstadtv_app/components/misc/horizontal_slider.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';

@RoutePage<void>()
class AudioScreen extends HookConsumerWidget {
  const AudioScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discover = ref.watch(bmmDiscoverProvider);

    useOnInit(() {
      ref.invalidate(bmmDiscoverProvider);
    });

    return Scaffold(
      body: discover.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(bmmDiscoverProvider);
            },
            child: CustomScrollView(
              slivers: [
                SliverSafeArea(
                  sliver: SliverPadding(
                    padding: const EdgeInsets.only(top: 16),
                    sliver: BmmDiscoveryRenderer(
                      documents: data.data!,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (err, stack) {
          return ErrorGeneric(
            details: err.toString(),
          );
        },
      ),
    );
  }
}

enum DiscoverGroupType {
  horizontal,
  unknown,
}

class DiscoverGroup {
  final DiscoverGroupType type;
  final List<IAllDocumentModels> documents;
  const DiscoverGroup(this.type, this.documents);
}

class BmmDiscoveryRenderer extends HookConsumerWidget {
  const BmmDiscoveryRenderer({super.key, required this.documents});

  final BuiltList<IAllDocumentModels> documents;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = useMemoized(() {
      // list of (bool isTileGroup, BuiltList<IAllDocumentModels> documents)
      var groups = <DiscoverGroup>[];
      var currentGroup = <IAllDocumentModels>[];
      DiscoverGroupType currentType = DiscoverGroupType.unknown;
      for (var document in documents) {
        final isTile = document.oneOf.isType(TileModel);
        final isPodcast = document.oneOf.isType(PodcastModel);
        final isPlaylist = document.oneOf.isType(PlaylistModel);
        if (isTile || isPodcast || isPlaylist) {
          if (currentType != DiscoverGroupType.horizontal) {
            // End of previous group
            if (currentGroup.isNotEmpty) {
              groups.add(DiscoverGroup(currentType, currentGroup));
              currentGroup = [];
            }
            currentType = DiscoverGroupType.horizontal;
          }
          currentGroup.add(document);
        } else {
          if (currentType != DiscoverGroupType.unknown) {
            // End of previous group
            if (currentGroup.isNotEmpty) {
              groups.add(DiscoverGroup(currentType, currentGroup));
              currentGroup = [];
            }
            currentType = DiscoverGroupType.unknown;
          }
          currentGroup.add(document);
        }
      }
      if (currentGroup.isNotEmpty) {
        groups.add(DiscoverGroup(currentType, currentGroup));
      }
      return groups;
    }, [documents]);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final group = groups[index];
          if (group.type == DiscoverGroupType.horizontal) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: HorizontalSlider(
                height: group.documents.any((e) => e.oneOf.isType(TileModel)) ? 230 : 200,
                itemCount: group.documents.length,
                itemBuilder: (context, index) {
                  return BmmDocumentRenderer(group.documents[index]);
                },
              ),
            );
          }
          return Column(
            children: [
              ...group.documents.map((e) => BmmDocumentRenderer(e)),
            ],
          );
        },
        childCount: groups.length,
      ),
    );
  }
}

class BmmDocumentRenderer extends HookConsumerWidget {
  const BmmDocumentRenderer(this.document, {super.key});

  final IAllDocumentModels document;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tile = document.oneOf.value.asOrNull<TileModel>();
    if (tile != null) {
      return TileRenderer(tile);
    }
    final podcast = document.oneOf.value.asOrNull<PodcastModel>();
    if (podcast != null) {
      return CoverRenderer(title: podcast.title, coverUrl: podcast.cover);
    }

    final playlist = document.oneOf.value.asOrNull<PlaylistModel>();
    if (playlist != null) {
      return CoverRenderer(title: playlist.title, coverUrl: playlist.cover);
    }

    return const SizedBox.shrink();
  }
}

class TileRenderer extends HookConsumerWidget {
  const TileRenderer(
    this.tile, {
    super.key,
  });

  final TileModel tile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final track = tile.track;
    final file = track?.media?.firstOrNull?.files?.firstOrNull;
    if (track == null || file == null) {
      return const SizedBox.shrink();
    }
    final bmmApi = ref.read(bmmApiProvider);
    final coverUrl = bmmApi.protectedUrl(tile.coverUrl);
    final design = DesignSystem.of(context);
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: tile.backgroundColor != null ? getColorFromHex(tile.backgroundColor!) : design.colors.onTint,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: AspectRatio(
                aspectRatio: 1,
                child: coverUrl != null ? simpleFadeInImage(url: coverUrl) : null,
              ),
            ),
          ),
          const Spacer(),
          if (tile.title != null)
            Text(
              tile.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: design.textStyles.caption1.copyWith(
                color: const Color.fromARGB(255, 52, 52, 52),
              ),
            ),
          if (tile.label != null)
            Text(
              tile.label!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: design.textStyles.button2.copyWith(
                color: const Color.fromARGB(255, 52, 52, 52),
              ),
            ),
          GestureDetector(
            onTap: () {
              final mediaItem = toMediaItem(track, bmmApi);
              if (mediaItem == null) {
                throw Exception('Media item is null');
              }
              BccmPlayerController.primary.replaceCurrentMediaItem(mediaItem);
              final playlistTracks = ref.read(bmmDefaultPlaylistProvider).asData?.valueOrNull;
              if (playlistTracks != null) {
                BccmPlayerController.primary.queue.setNextUp(playlistTracks.map((e) => toMediaItem(e, bmmApi)).whereNotNull().toList());
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: design.colors.background1,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(2),
                child: SvgPicture.string(
                  height: 24,
                  SvgIcons.playSmall,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CoverRenderer extends HookConsumerWidget {
  const CoverRenderer({
    super.key,
    this.coverUrl,
    this.title,
  });

  final String? coverUrl;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmmApi = ref.read(bmmApiProvider);
    final coverUrl = bmmApi.protectedUrl(this.coverUrl);
    final design = DesignSystem.of(context);
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          if (coverUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 1,
                child: simpleFadeInImage(url: coverUrl),
              ),
            ),
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: design.textStyles.body2.copyWith(color: design.colors.onTint),
              ),
            ),
        ],
      ),
    );
  }
}

MediaItem? toMediaItem(TrackModel track, BmmApiWrapper bmmApi) {
  final file = track.media?.firstOrNull?.files?.firstOrNull;
  if (file == null) {
    return null;
  }
  final cover = track.cover ?? track.meta.attachedPicture;
  return MediaItem(
    url: bmmApi.protectedUrl(file.url),
    mimeType: file.mimeType,
    metadata: MediaMetadata(
      title: track.title,
      artist: track.meta.artist != null && track.meta.artist!.isNotEmpty ? track.meta.artist : track.meta.album,
      artworkUri: cover != null ? bmmApi.protectedUrl(cover) : null,
      durationMs: file.duration?.toDouble() ?? 0 * 1000,
      extras: {
        'type': track.type.name,
        'npaw.content.type': 'audio',
        'npaw.content.id': track.id.toString(),
      },
    ),
  );
}
