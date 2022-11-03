import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/watch_progress_indicator.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../services/utils.dart';
import 'bordered_image_container.dart';
import 'horizontal_slider.dart';
import 'episode_duration.dart';
import 'watched_badge.dart';
import 'feature_badge.dart';
import '../graphql/schema/pages.graphql.dart';
import '../graphql/queries/page.graphql.dart';

const Map<Enum$SectionSize, Size> imageSize = {
  Enum$SectionSize.small: Size(140, 80),
  Enum$SectionSize.medium: Size(240, 146),
};

class DefaultSection extends StatelessWidget {
  final Fragment$Section$$DefaultSection data;

  const DefaultSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final items = data.items.items
        .where((element) =>
            element.item
                is Fragment$Section$$DefaultSection$items$items$item$$Episode ||
            element.item
                is Fragment$Section$$DefaultSection$items$items$item$$Show)
        .toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.title != null)
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 19,
              right: 16,
              bottom: 5,
            ),
            child: Text(
              data.title!,
              style: BtvTextStyles.title2,
            ),
          ),
        HorizontalSlider(
          height: data.size == Enum$SectionSize.small ? 156 : 222,
          clipBehaviour: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            var item = items[index];
            if (item.item
                is Fragment$Section$$DefaultSection$items$items$item$$Episode) {
              return _DefaultEpisodeItem(sectionItem: item, size: data.size);
            } else if (item.item
                is Fragment$Section$$DefaultSection$items$items$item$$Show) {
              return _DefaultShowItem(sectionItem: item, size: data.size);
            }
            // Theoretically impossible, see filter above.
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class _DefaultEpisodeItem extends StatelessWidget {
  final Fragment$Section$$DefaultSection$items$items sectionItem;
  final Fragment$Section$$DefaultSection$items$items$item$$Episode episode;
  final Enum$SectionSize size;

  _DefaultEpisodeItem({required this.sectionItem, required this.size})
      : episode = sectionItem.item
            as Fragment$Section$$DefaultSection$items$items$item$$Episode;

  // TODO: Remove these temp variables
  bool watched = false;

  bool isLive = false;

  bool isNewItem = false;

  bool showWatchProgressIndicator = false;

  @override
  Widget build(BuildContext context) {
    final productionDate = getFormattedProductionDate(episode.productionDate);
    return GestureDetector(
      onTap: () => context.router
          .navigate(EpisodeScreenRoute(episodeId: sectionItem.id)),
      child: SizedBox(
        width: imageSize[size]!.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionItemImage(),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: Row(
                children: [
                  if (episode.season != null)
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: Text(
                          episode.season!.$show.title
                              .replaceAll(' ', '\u{000A0}'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BtvTextStyles.caption2
                              .copyWith(color: BtvColors.tint1),
                        ),
                      ),
                    ),
                  if (productionDate != null)
                    Text(
                      productionDate,
                      style: BtvTextStyles.caption2,
                    ),
                ],
              ),
            ),
            Text(
              sectionItem.title,
              maxLines: 2,
              style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
            )
          ],
        ),
      ),
    );
  }

  Widget sectionItemImage() {
    // MEMORY ISSUES HERE
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageSize[size]!.width,
      height: imageSize[size]!.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BorderedImageContainer(imageUrl: sectionItem.image),
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
                    margin: const EdgeInsets.only(left: 4, bottom: 4, right: 4),
                    child: WatchProgressIndicator(
                        totalDuration: episode.duration, watchedDuration: 10),
                  ),
                )
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 12,
                    margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
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

class _DefaultShowItem extends StatelessWidget {
  final Fragment$Section$$DefaultSection$items$items sectionItem;
  final Fragment$Section$$DefaultSection$items$items$item$$Show show;
  Enum$SectionSize size;

  // TODO: Remove this
  bool hasNewEpisodes = true;

  _DefaultShowItem({required this.sectionItem, required this.size})
      : show = sectionItem.item
            as Fragment$Section$$DefaultSection$items$items$item$$Show;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize[size]!.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionItemImage(),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              sectionItem.title,
              style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
            ),
          ),
          Text(
            '${show.seasonCount} Seasons - ${show.episodeCount} Episodes',
            style: BtvTextStyles.caption2,
          )
        ],
      ),
    );
  }

  Widget sectionItemImage() {
    // Memory issue here?
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageSize[size]!.width,
      height: imageSize[size]!.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BorderedImageContainer(imageUrl: sectionItem.image),
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
    );
  }
}
