import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bmm_api/bmm_api.dart';
import 'package:brunstadtv_app/api/bmm.dart';
import 'package:brunstadtv_app/components/misc/horizontal_slider.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AudioScreen extends HookConsumerWidget {
  const AudioScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discover = ref.watch(bmmDiscoverProvider);
    ref.read(bmmDefaultPlaylistProvider);

    useOnInit(() {
      ref.invalidate(bmmDiscoverProvider);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const CustomBackButton(),
        leadingWidth: 92,
      ),
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
      var groups = <DiscoverGroup>[];
      var currentGroup = <IAllDocumentModels>[];
      DiscoverGroupType currentType = DiscoverGroupType.unknown;
      for (var document in documents) {
        final isTile = document.oneOf.isType(TileModel);
        final isPlaylist = document.oneOf.isType(PlaylistModel);
        final isAlbum = document.oneOf.isType(AlbumModel);
        final isPodcast = document.oneOf.isType(PodcastModel);
        if (isTile || isPlaylist || isAlbum || isPodcast) {
          if (currentType != DiscoverGroupType.horizontal) {
            if (currentGroup.isNotEmpty) {
              groups.add(DiscoverGroup(currentType, currentGroup));
              currentGroup = [];
            }
            currentType = DiscoverGroupType.horizontal;
          }
          currentGroup.add(document);
        } else {
          if (currentType != DiscoverGroupType.unknown) {
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
            return HorizontalSlider(
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: group.documents.any((e) => e.oneOf.isType(TileModel)) ? 260 : 200,
              gap: 8,
              itemCount: group.documents.length,
              itemBuilder: (context, index) {
                return BmmDocumentRenderer(group.documents[index]);
              },
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
    final streak = document.oneOf.value.asOrNull<CurrentWeeksStreakVm>();
    if (streak != null) {
      return StreakRenderer(streak);
    }

    final sectionHeader = document.oneOf.value.asOrNull<SectionHeaderModel>();
    if (sectionHeader != null) {
      return SectionHeaderRenderer(sectionHeader);
    }

    final tile = document.oneOf.value.asOrNull<TileModel>();
    if (tile != null) {
      return TileRenderer(tile);
    }

    final playlist = document.oneOf.value.asOrNull<PlaylistModel>();
    if (playlist != null) {
      return PlaylistRenderer(playlist);
    }

    final album = document.oneOf.value.asOrNull<AlbumModel>();
    if (album != null) {
      return AlbumRenderer(album);
    }

    final track = document.oneOf.value.asOrNull<TrackModel>();
    if (track != null) {
      return TrackRenderer(track);
    }

    final podcast = document.oneOf.value.asOrNull<PodcastModel>();
    if (podcast != null) {
      return PodcastRenderer(podcast);
    }

    final contributor = document.oneOf.value.asOrNull<ContributorModel>();
    if (contributor != null) {
      return ContributorRenderer(contributor);
    }

    return Text(document.oneOf.value.toString());
  }
}

class PlaylistRenderer extends HookConsumerWidget {
  const PlaylistRenderer(
    this.playlist, {
    super.key,
  });

  final PlaylistModel playlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlaylistId = useListenableSelector(BccmPlayerController.primary, () {
      return BccmPlayerController.primary.value.currentMediaItem?.metadata?.extras?['playlist.id'];
    });
    return GestureDetector(
      onTap: () async {
        final bmmApi = ref.read(bmmApiProvider);
        final res = await bmmApi.getPlaylistApi().playlistIdTrackGet(id: playlist.id);
        final tracks = res.data;
        if (tracks != null) {
          setTracksAsNextUp(BccmPlayerController.primary, bmmApi, tracks, extras: {
            'playlist.id': playlist.id.toString(),
          });
          BccmPlayerController.primary.queue.skipToNext();
        }
      },
      child: Stack(
        children: [
          CoverRenderer(
            title: playlist.title,
            coverUrl: playlist.cover,
          ),
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: 500.ms,
              child: currentPlaylistId == playlist.id.toString()
                  ? Container(
                      color: Colors.white.withOpacity(0.1),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumRenderer extends HookConsumerWidget {
  const AlbumRenderer(
    this.album, {
    super.key,
  });

  final AlbumModel album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAlbumId = useListenableSelector(BccmPlayerController.primary, () {
      return BccmPlayerController.primary.value.currentMediaItem?.metadata?.extras?['album.id'];
    });
    return GestureDetector(
      onTap: () async {},
      child: Stack(
        children: [
          CoverRenderer(
            title: album.title,
            coverUrl: album.cover,
          ),
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: 500.ms,
              child: currentAlbumId == album.id.toString()
                  ? Container(
                      color: Colors.white.withOpacity(0.1),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
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

    play() {
      final mediaItem = toMediaItem(track, bmmApi);
      if (mediaItem == null) {
        throw Exception('Media item is null');
      }
      BccmPlayerController.primary.replaceCurrentMediaItem(mediaItem);
      final playlistTracks = ref.read(bmmDefaultPlaylistProvider).asData?.valueOrNull;
      if (playlistTracks != null) {
        setTracksAsNextUp(BccmPlayerController.primary, bmmApi, playlistTracks);
      }
    }

    return GestureDetector(
      onTap: () => play(),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: tile.backgroundColor != null ? getColorFromHex(tile.backgroundColor!) : design.colors.onTint,
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FractionallySizedBox(
                widthFactor: 0.6,
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
                style: design.textStyles.title3.copyWith(
                  color: const Color.fromARGB(255, 52, 52, 52),
                ),
              ),
            GestureDetector(
              onTap: play,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: design.colors.background1,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.string(
                    height: 20,
                    SvgIcons.playSmall,
                  ),
                ),
              ),
            )
          ],
        ),
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
    return SizedBox(
      width: 150,
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
                style: design.textStyles.caption1.copyWith(color: design.colors.onTint),
              ),
            ),
        ],
      ),
    );
  }
}

final List<DayOfWeek> weekDays = [
  DayOfWeek.monday,
  DayOfWeek.tuesday,
  DayOfWeek.wednesday,
  DayOfWeek.thursday,
  DayOfWeek.friday,
];

class StreakRenderer extends HookConsumerWidget {
  const StreakRenderer(
    this.streak, {
    super.key,
  });

  final CurrentWeeksStreakVm streak;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);

    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your streak this week', style: design.textStyles.title3),
              Text('${streak.daysInARow} days in a row'),
            ],
          ),
          Expanded(
            child: Wrap(
              spacing: 20,
              alignment: WrapAlignment.end,
              children: weekDays
                  .mapIndexed(
                    (index, day) => Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorForStreakDay(streak, day),
                        border: Border.all(color: design.colors.separator2, width: 2),
                        boxShadow: [
                          if (streak.dayOfTheWeek == day)
                            BoxShadow(
                              color: design.colors.separator2.withAlpha(40),
                              offset: const Offset(0, 0),
                              spreadRadius: 6,
                              blurRadius: 0,
                              blurStyle: BlurStyle.outer,
                            ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class SectionHeaderRenderer extends HookConsumerWidget {
  const SectionHeaderRenderer(
    this.sectionHeader, {
    super.key,
  });

  final SectionHeaderModel sectionHeader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 24),
      child: Text(sectionHeader.title!, style: design.textStyles.headline2),
    );
  }
}

class TrackRenderer extends HookConsumerWidget {
  const TrackRenderer(
    this.track, {
    super.key,
  });

  final TrackModel track;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bmmApi = ref.read(bmmApiProvider);
    final coverUrl = bmmApi.protectedUrl(track.meta.attachedPicture);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (coverUrl != null)
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: simpleFadeInImage(url: coverUrl),
                ),
              ),
            ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  track.title != '' ? track.title! : track.meta.artist!,
                  style: design.textStyles.title3,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (track.title != '') Text(track.meta.artist ?? '', style: design.textStyles.body2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContributorRenderer extends HookConsumerWidget {
  const ContributorRenderer(
    this.contributor, {
    super.key,
  });

  final ContributorModel contributor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final bmmApi = ref.read(bmmApiProvider);
    final coverUrl = bmmApi.protectedUrl(contributor.cover);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (coverUrl != null)
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: simpleFadeInImage(url: coverUrl),
                ),
              ),
            ),
          const SizedBox(width: 16),
          Text(
            contributor.name ?? '',
            style: design.textStyles.title3,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

class PodcastRenderer extends HookConsumerWidget {
  const PodcastRenderer(
    this.podcast, {
    super.key,
  });

  final PodcastModel podcast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {},
      child: Stack(
        children: [
          CoverRenderer(
            title: podcast.title,
            coverUrl: podcast.cover,
          ),
        ],
      ),
    );
  }
}

MediaItem? toMediaItem(
  TrackModel track,
  BmmApiWrapper bmmApi, {
  Map<String, String>? extras = const {},
}) {
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
        ...?extras,
      },
    ),
  );
}

void setTracksAsNextUp(BccmPlayerController player, BmmApiWrapper bmmApi, BuiltList<TrackModel> tracks, {Map<String, String>? extras}) {
  player.queue.setShuffleEnabled(true);
  player.queue.setNextUp(
    tracks.map((e) => toMediaItem(e, bmmApi, extras: extras)).whereNotNull().toList(),
  );
}

Color colorForStreakDay(CurrentWeeksStreakVm streak, DayOfWeek day) {
  final days = [
    streak.monday,
    streak.tuesday,
    streak.wednesday,
    streak.thursday,
    streak.friday,
  ];

  if (streak.dayOfTheWeek == day) {
    return Colors.white;
  }

  final index = weekDays.indexOf(day);
  if (days[index] != null && days[index]! == true) {
    return Colors.white30;
  }

  return Colors.transparent;
}
