import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/bordered_image_container.dart';
import 'package:flutter/material.dart';

import '../../graphql/queries/page.graphql.dart';
import '../../graphql/schema/pages.graphql.dart';
import '../../router/router.gr.dart';
import '../../services/utils.dart';
import 'feature_tag.dart';
import 'episode_duration.dart';
import 'watch_progress_indicator.dart';
import 'watched.dart';

const Map<Enum$GridSectionSize, int> columnSize = {
  Enum$GridSectionSize.half: 2,
};

class DefaultGridSection extends StatelessWidget {
  final Fragment$Section$$DefaultGridSection data;

  const DefaultGridSection(this.data, {super.key});

  Widget getItemWidget(
      Fragment$Section$$DefaultGridSection$items$items sectionItem) {
    if (sectionItem.item
        is Fragment$Section$$DefaultGridSection$items$items$item$$Episode) {
      return _GridEpisodeItem(sectionItem);
    } else if (sectionItem.item
        is Fragment$Section$$DefaultGridSection$items$items$item$$Show) {
      return _GridShowItem(sectionItem);
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final sectionItems = data.items.items;
    final colSize = columnSize[data.gridSize]!;
    final rowSize = (sectionItems.length / colSize).ceil();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List<_GridRow>.generate(rowSize, (rowIndex) {
          final firstIndex = rowIndex * colSize;
          final subList = firstIndex + colSize <= sectionItems.length
              ? sectionItems.sublist(firstIndex, firstIndex + colSize)
              : sectionItems.sublist(firstIndex);
          return _GridRow(
            items: subList.map(getItemWidget).toList(),
            colSize: colSize,
          );
        }),
      ),
    );
  }
}

class _GridEpisodeItem extends StatelessWidget {
  final Fragment$Section$$DefaultGridSection$items$items sectionItem;
  final Fragment$Section$$DefaultGridSection$items$items$item$$Episode episode;

  // TODO: Remove these temp variables
  bool watched = false;
  bool isLive = false;
  bool isNewItem = false;
  bool showWatchProgressIndicator = false;

  _GridEpisodeItem(this.sectionItem)
      : episode = sectionItem.item
            as Fragment$Section$$DefaultGridSection$items$items$item$$Episode;

  bool get showFeaturedTag => isLive || isNewItem || isComingSoon;

  bool get isComingSoon {
    if (episode.productionDate == null) {
      return false;
    }
    return DateTime.now().isBefore(DateTime.parse(episode.productionDate!));
  }

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
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(110, 176, 230, 1),
                      ),
                    ),
                  ),
                ),
              if (episode.season != null)
                Text(
                  'S${episode.season!.number}:E${episode.number}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(112, 124, 142, 1),
                  ),
                ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              sectionItem.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
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
        aspectRatio: 16 / 9,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BorderedImageContainer(
              image: sectionItem.image != null
                  ? NetworkImage(sectionItem.image!)
                  : null,
            ),
            if (isComingSoon)
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
                          if (watched) const Watched(),
                          const Spacer(),
                          EpisodeDuration(
                              duration: getFormattedDuration(episode.duration)),
                        ],
                      ),
                    ),
                  ),
            if (showFeaturedTag)
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
      return const FeatureTag(
        label: 'Live now',
        color: Color.fromRGBO(230, 60, 98, 1),
      );
    } else if (isComingSoon) {
      return const FeatureTag(
        label: 'Coming soon',
        color: Color.fromRGBO(29, 40, 56, 1),
      );
    } else if (isNewItem) {
      return const FeatureTag(
        label: 'New',
        color: Color.fromRGBO(230, 60, 98, 1),
      );
    }
    return null;
  }
}

class _GridShowItem extends StatelessWidget {
  final Fragment$Section$$DefaultGridSection$items$items sectionItem;
  final Fragment$Section$$DefaultGridSection$items$items$item$$Show show;

  // TODO: Remove this
  bool hasNewEpisodes = false;

  _GridShowItem(this.sectionItem)
      : show = sectionItem.item
            as Fragment$Section$$DefaultGridSection$items$items$item$$Show;

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
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          '${show.seasonCount} Seasons - ${show.episodeCount} Episodes',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(112, 124, 142, 1),
          ),
        )
      ],
    );
  }

  Widget get sectionItemImage {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 16 / 9,
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
                child: FeatureTag(
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

class _GridRow extends StatelessWidget {
  final int colSize;
  final List<Widget> items;

  const _GridRow({required this.items, required this.colSize});

  List<Widget> get spacedItems {
    if (items.length < colSize) {
      items.addAll(
        List<Container>.generate(
            colSize - items.length, (index) => Container()),
      );
    }

    final newItems = <Widget>[];
    for (var item in items) {
      newItems.add(Expanded(child: item));
      if (item != items.last) {
        newItems.add(const SizedBox(width: 16));
      }
    }
    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: spacedItems,
      ),
    );
  }
}
