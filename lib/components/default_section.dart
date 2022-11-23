import 'package:brunstadtv_app/components/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import '../services/utils.dart';
import 'bordered_image_container.dart';
import 'horizontal_slider.dart';
import 'episode_duration.dart';
import 'watched_badge.dart';
import 'feature_badge.dart';
import 'watch_progress_indicator.dart';
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
            element.item is Fragment$Section$$DefaultSection$items$items$item$$Episode ||
            element.item is Fragment$Section$$DefaultSection$items$items$item$$Show)
        .toList();
    return HorizontalSlider(
      height: data.size == Enum$SectionSize.small ? 156 : 222,
      clipBehaviour: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        Widget? widget;
        if (item.item is Fragment$Section$$DefaultSection$items$items$item$$Episode) {
          widget = _DefaultEpisodeItem(sectionItem: item, size: data.size);
        } else if (item.item is Fragment$Section$$DefaultSection$items$items$item$$Show) {
          widget = _DefaultShowItem(sectionItem: item, size: data.size);
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

class _DefaultEpisodeItem extends StatelessWidget {
  final Fragment$Section$$DefaultSection$items$items sectionItem;
  final Fragment$Section$$DefaultSection$items$items$item$$Episode episode;
  final Enum$SectionSize size;

  _DefaultEpisodeItem({required this.sectionItem, required this.size})
      : episode = sectionItem.item as Fragment$Section$$DefaultSection$items$items$item$$Episode;

  bool get watched => episode.progress != null && episode.progress! > episode.duration * 0.9;

  bool isLive = false;

  bool isNewItem = false;

  @override
  Widget build(BuildContext context) {
    final productionDate = getFormattedProductionDate(episode.productionDate);
    return SizedBox(
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
                        episode.season!.$show.title.replaceAll(' ', '\u{000A0}'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BtvTextStyles.caption2.copyWith(color: BtvColors.tint1),
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
    );
  }

  Widget sectionItemImage() {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageSize[size]!.width,
      height: imageSize[size]!.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          isComingSoon(episode.availableFrom)
              ? Opacity(
                  opacity: 0.5,
                  child: BorderedImageContainer(imageUrl: sectionItem.image),
                )
              : BorderedImageContainer(imageUrl: sectionItem.image),
          if (isComingSoon(episode.availableFrom))
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/Wait.png'),
                ),
              ),
            ),
          episode.progress != null && !watched
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(left: 4, bottom: 4, right: 4),
                    child: WatchProgressIndicator(totalDuration: episode.duration, watchedDuration: episode.progress!),
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
                        EpisodeDuration(duration: getFormattedDuration(episode.duration)),
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
        color: BtvColors.tint2,
      );
    } else if (isComingSoon(episode.availableFrom)) {
      return const FeatureBadge(
        label: 'Coming soon',
        color: BtvColors.background2,
      );
    } else if (isNewItem) {
      return const FeatureBadge(
        label: 'New',
        color: BtvColors.tint2,
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
  bool hasNewEpisodes = false;

  _DefaultShowItem({required this.sectionItem, required this.size})
      : show = sectionItem.item as Fragment$Section$$DefaultSection$items$items$item$$Show;

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
            '${show.seasonCount} ${S.of(context).seasons} - ${show.episodeCount} ${S.of(context).episodes}',
            style: BtvTextStyles.caption2,
          )
        ],
      ),
    );
  }

  Widget sectionItemImage() {
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
