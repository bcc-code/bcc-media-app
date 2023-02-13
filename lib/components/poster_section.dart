import 'package:brunstadtv_app/components/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../helpers/utils.dart';
import '../graphql/queries/page.graphql.dart';
import '../graphql/schema/pages.graphql.dart';
import '../services/utils.dart';
import 'bordered_image_container.dart';
import 'horizontal_slider.dart';
import 'feature_badge.dart';
import 'episode_duration.dart';
import 'watch_progress_indicator.dart';
import 'watched_badge.dart';

const Map<Enum$SectionSize, Size> imageSize = {
  Enum$SectionSize.small: Size(140, 208),
  Enum$SectionSize.medium: Size(230, 340),
};
const Map<Enum$SectionSize, double> sliderHeight = {
  Enum$SectionSize.small: 284,
  Enum$SectionSize.medium: 400,
};

class PosterSection extends StatelessWidget {
  final Fragment$Section$$PosterSection data;

  const PosterSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    if (data.size == Enum$SectionSize.$unknown) {
      return const SizedBox.shrink();
    }
    var items = data.items.items
        .where((element) =>
            element.item is Fragment$Section$$PosterSection$items$items$item$$Episode ||
            element.item is Fragment$Section$$PosterSection$items$items$item$$Show)
        .toList();
    return HorizontalSlider(
      height: sliderHeight[data.size]!,
      clipBehaviour: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        Widget? widget;
        if (item.item is Fragment$Section$$PosterSection$items$items$item$$Episode) {
          widget = _PosterEpisodeItem(
            sectionItem: item,
            size: data.size,
            showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
          );
        } else if (item.item is Fragment$Section$$PosterSection$items$items$item$$Show) {
          widget = _PosterShowItem(sectionItem: item, size: data.size);
        }
        if (widget == null) {
          return const SizedBox.shrink();
        }
        return SectionItemClickWrapper(
          item: item.item,
          analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
          child: widget,
        );
      },
    );
  }
}

class _PosterEpisodeItem extends StatelessWidget {
  final Fragment$Section$$PosterSection$items$items sectionItem;
  final Fragment$Section$$PosterSection$items$items$item$$Episode episode;
  final bool showSecondaryTitle;
  final Enum$SectionSize size;

  bool get watched => episode.progress != null && episode.progress! > episode.duration * 0.9;
  final bool isLive = false;
  final bool isNewItem = false;

  _PosterEpisodeItem({
    required this.sectionItem,
    required this.size,
    required this.showSecondaryTitle,
  }) : episode = sectionItem.item as Fragment$Section$$PosterSection$items$items$item$$Episode;

  @override
  Widget build(BuildContext context) {
    final productionDate = getFormattedProductionDate(episode.productionDate);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: imageSize[size]!.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionItemImage(context),
          if (showSecondaryTitle)
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: Row(
                children: [
                  if (episode.season != null)
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: Text(
                          episode.season!.$show.title.replaceAll(' ', '\u{000A0}'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BtvTextStyles.caption2.copyWith(color: BtvColors.tint1),
                        ),
                      ),
                    ),
                  /* if (productionDate != null)
                  Text(
                    productionDate,
                    style: BtvTextStyles.caption2,
                  ), */
                ],
              ),
            ),
          Text(
            sectionItem.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
          )
        ],
      ),
    );
  }

  Widget sectionItemImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageSize[size]!.width,
      height: imageSize[size]!.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          episode.locked
              ? Opacity(
                  opacity: 0.5,
                  child: BorderedImageContainer(imageUrl: sectionItem.image),
                )
              : BorderedImageContainer(imageUrl: sectionItem.image),
          if (episode.locked)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/Wait.png'),
                ),
              ),
            ),
          if (episode.progress != null && !watched)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 4, bottom: 4, right: 4),
                child: WatchProgressIndicator(totalDuration: episode.duration, watchedDuration: episode.progress!),
              ),
            )
          else if (!episode.locked)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 12,
                margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
                child: Row(
                  children: [
                    if (watched) const WatchedBadge(),
                    const Spacer(),
                    EpisodeDuration(duration: getFormattedDuration(episode.duration)),
                  ],
                ),
              ),
            ),
          if (getFeaturedTag(publishDate: episode.publishDate, locked: episode.locked) != null)
            Positioned(
              top: -4,
              right: -4,
              child: getFeaturedTag(publishDate: episode.publishDate, locked: episode.locked)!,
            ),
        ],
      ),
    );
  }
}

class _PosterShowItem extends StatelessWidget {
  final Fragment$Section$$PosterSection$items$items sectionItem;
  final Fragment$Section$$PosterSection$items$items$item$$Show show;
  final Enum$SectionSize size;

  bool hasNewEpisodes = false;

  _PosterShowItem({
    required this.sectionItem,
    required this.size,
  }) : show = sectionItem.item as Fragment$Section$$PosterSection$items$items$item$$Show;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: imageSize[size]!.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionItemImage(context),
          Text(
            sectionItem.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
          )
        ],
      ),
    );
  }

  Widget sectionItemImage(BuildContext context) {
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
                color: BtvColors.tint2,
              ),
            ),
        ],
      ),
    );
  }
}
