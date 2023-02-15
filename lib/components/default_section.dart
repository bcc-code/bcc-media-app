import 'package:brunstadtv_app/components/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/queries/calendar_episode_entries.graphql.dart';
import '../theme/bccm_colors.dart';
import '../theme/bccm_typography.dart';
import '../l10n/app_localizations.dart';
import '../providers/todays_calendar_entries.dart';
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

class DefaultSection extends ConsumerWidget {
  final Fragment$Section$$DefaultSection data;

  const DefaultSection(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$Episode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

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
        Widget? sectionItemWidget;
        if (item.item is Fragment$Section$$DefaultSection$items$items$item$$Episode) {
          sectionItemWidget = _DefaultEpisodeItem(
            sectionItem: item,
            size: data.size,
            showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
            isLive: (item.item as Fragment$ItemSectionItem$item$$Episode).id == curLiveEpisode?.id,
          );
        } else if (item.item is Fragment$Section$$DefaultSection$items$items$item$$Show) {
          sectionItemWidget = _DefaultShowItem(sectionItem: item, size: data.size);
        }
        if (sectionItemWidget == null) {
          return const SizedBox.shrink();
        }
        return SectionItemClickWrapper(
          item: item.item,
          analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
          child: sectionItemWidget,
        );
      },
    );
  }
}

class _DefaultEpisodeItem extends StatelessWidget {
  final Fragment$Section$$DefaultSection$items$items sectionItem;
  final Fragment$Section$$DefaultSection$items$items$item$$Episode episode;
  final bool showSecondaryTitle;
  final Enum$SectionSize size;
  final bool isLive;

  _DefaultEpisodeItem({
    required this.sectionItem,
    required this.size,
    required this.showSecondaryTitle,
    this.isLive = false,
  }) : episode = sectionItem.item as Fragment$Section$$DefaultSection$items$items$item$$Episode;

  bool get watched => episode.progress != null && episode.progress! > episode.duration * 0.9;

  final bool isNewItem = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize[size]!.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionItemImage(),
          if (showSecondaryTitle)
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
                          style: BccmTextStyles.caption2.copyWith(color: BccmColors.tint1),
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
            maxLines: 2,
            style: BccmTextStyles.caption1.copyWith(color: BccmColors.label1),
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
          episode.locked && !isLive
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
          if (getFeaturedTag(publishDate: episode.publishDate, locked: episode.locked, isLive: isLive) != null)
            Positioned(
              top: -4,
              right: -4,
              child: getFeaturedTag(publishDate: episode.publishDate, locked: episode.locked, isLive: isLive)!,
            ),
        ],
      ),
    );
  }
}

class _DefaultShowItem extends StatelessWidget {
  final Fragment$Section$$DefaultSection$items$items sectionItem;
  final Fragment$Section$$DefaultSection$items$items$item$$Show show;
  final Enum$SectionSize size;

  // TODO: Remove this
  final bool hasNewEpisodes = false;

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
              style: BccmTextStyles.caption1.copyWith(color: BccmColors.label1),
            ),
          ),
          Text(
            '${show.seasonCount} ${S.of(context).seasons} - ${show.episodeCount} ${S.of(context).episodes}',
            style: BccmTextStyles.caption2,
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
                color: BccmColors.tint2,
              ),
            ),
        ],
      ),
    );
  }
}
