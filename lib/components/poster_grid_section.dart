import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/bordered_image_container.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';
import '../graphql/schema/pages.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../router/router.gr.dart';
import '../services/utils.dart';
import 'feature_badge.dart';
import 'episode_duration.dart';
import 'grid_row.dart';
import 'watch_progress_indicator.dart';
import 'watched_badge.dart';

const posterAspectRatio = 0.67;

const Map<Enum$GridSectionSize, int> _columnSize = {
  Enum$GridSectionSize.half: 2,
};

class PosterGridSection extends StatelessWidget {
  final Fragment$Section$$PosterGridSection data;

  const PosterGridSection(this.data, {super.key});

  Widget getItemWidget(
      Fragment$Section$$PosterGridSection$items$items sectionItem) {
    if (sectionItem.item
        is Fragment$Section$$PosterGridSection$items$items$item$$Episode) {
      return _GridEpisodeItem(sectionItem);
    } else if (sectionItem.item
        is Fragment$Section$$PosterGridSection$items$items$item$$Show) {
      return _GridShowItem(sectionItem);
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final sectionItems = data.items.items;
    final colSize =
        _columnSize[data.gridSize] ?? _columnSize[Enum$GridSectionSize.half]!;
    final rowSize = (sectionItems.length / colSize).ceil();

    final rows = List<GridRow>.generate(rowSize, (rowIndex) {
      final firstIndex = rowIndex * colSize;
      final subList = firstIndex + colSize <= sectionItems.length
          ? sectionItems.sublist(firstIndex, firstIndex + colSize)
          : sectionItems.sublist(firstIndex);
      return GridRow(
        items: subList.map(getItemWidget).toList(),
        colSize: colSize,
      );
    });

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.title != null)
            Container(
              padding: const EdgeInsets.only(
                top: 19,
                bottom: 5,
              ),
              child: Text(
                data.title!,
                style: BtvTextStyles.title2,
              ),
            ),
          ...rows
        ],
      ),
    );
  }
}

class _GridEpisodeItem extends StatelessWidget {
  final Fragment$Section$$PosterGridSection$items$items sectionItem;
  final Fragment$Section$$PosterGridSection$items$items$item$$Episode episode;

  // TODO: Remove these temp variables
  bool watched = false;
  bool isLive = false;
  bool isNewItem = false;
  bool showWatchProgressIndicator = false;

  _GridEpisodeItem(this.sectionItem)
      : episode = sectionItem.item
            as Fragment$Section$$PosterGridSection$items$items$item$$Episode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router
          .navigate(EpisodeScreenRoute(episodeId: sectionItem.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionItemImage,
          Row(
            children: [
              if (episode.season != null)
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: Text(
                      episode.season!.$show.title.replaceAll(' ', '\u{000A0}'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: BtvTextStyles.caption2
                          .copyWith(color: BtvColors.tint1),
                    ),
                  ),
                ),
              if (episode.season != null)
                Text(
                  'S${episode.season!.number}:E${episode.number}',
                  style: BtvTextStyles.caption2,
                ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              sectionItem.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
            ),
          ),
        ],
      ),
    );
  }

  Widget get sectionItemImage {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: posterAspectRatio,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BorderedImageContainer(
              image: sectionItem.image != null
                  ? NetworkImage(sectionItem.image!)
                  : null,
            ),
            if (isComingSoon(episode.productionDate))
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Wait.png'),
                  ),
                ),
              ),
            showWatchProgressIndicator
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 4, bottom: 4, right: 4),
                      child: WatchProgressIndicator(
                          totalDuration: episode.duration, watchedDuration: 10),
                    ),
                  )
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 12,
                      margin:
                          const EdgeInsets.only(right: 4, bottom: 4, left: 4),
                      child: Row(
                        children: [
                          if (watched) const WatchedBadge(),
                          const Spacer(),
                          EpisodeDuration(
                              duration: getFormattedDuration(episode.duration)),
                        ],
                      ),
                    ),
                  ),
            if (featuredTag != null)
              Positioned(
                top: -4,
                right: -4,
                child: featuredTag!,
              ),
          ],
        ),
      ),
    );
  }

  Widget? get featuredTag {
    if (isLive) {
      return const FeatureBadge(
        label: 'Live now',
        color: Color.fromRGBO(230, 60, 98, 1),
      );
    } else if (isComingSoon(episode.productionDate)) {
      return const FeatureBadge(
        label: 'Coming soon',
        color: Color.fromRGBO(29, 40, 56, 1),
      );
    } else if (isNewItem) {
      return const FeatureBadge(
        label: 'New',
        color: Color.fromRGBO(230, 60, 98, 1),
      );
    }
    return null;
  }
}

class _GridShowItem extends StatelessWidget {
  final Fragment$Section$$PosterGridSection$items$items sectionItem;
  final Fragment$Section$$PosterGridSection$items$items$item$$Show show;

  // TODO: Remove this
  bool hasNewEpisodes = false;

  _GridShowItem(this.sectionItem)
      : show = sectionItem.item
            as Fragment$Section$$PosterGridSection$items$items$item$$Show;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionItemImage,
        Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: Text(
            sectionItem.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
          ),
        ),
        Text(
          '${show.seasonCount} Seasons - ${show.episodeCount} Episodes',
          style: BtvTextStyles.caption2,
        )
      ],
    );
  }

  Widget get sectionItemImage {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: posterAspectRatio,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BorderedImageContainer(
              image: sectionItem.image != null
                  ? NetworkImage(sectionItem.image!)
                  : null,
            ),
            if (hasNewEpisodes)
              const Positioned(
                top: -4,
                right: -4,
                child: FeatureBadge(
                  label: 'New Episodes',
                  color: Color.fromRGBO(230, 60, 98, 1),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
