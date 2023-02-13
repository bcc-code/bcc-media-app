import 'package:brunstadtv_app/components/section_item_click_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/queries/calendar_episode_entries.graphql.dart';
import '../graphql/queries/page.graphql.dart';
import '../graphql/schema/pages.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import '../models/analytics/sections.dart';
import '../providers/todays_calendar_entries.dart';
import '../services/utils.dart';
import 'feature_badge.dart';
import 'episode_duration.dart';
import 'grid_row.dart';
import 'watch_progress_indicator.dart';
import 'watched_badge.dart';
import 'bordered_image_container.dart';

const posterAspectRatio = 0.67;

const Map<Enum$GridSectionSize, int> _columnSize = {
  Enum$GridSectionSize.half: 2,
};

class PosterGridSection extends ConsumerWidget {
  final Fragment$Section$$PosterGridSection data;

  const PosterGridSection(this.data, {super.key});

  Widget getItemWidget(
    Fragment$Section$$PosterGridSection$items$items sectionItem,
    Fragment$Episode? curLiveEpisode,
  ) {
    if (sectionItem.item is Fragment$Section$$PosterGridSection$items$items$item$$Episode) {
      return _GridEpisodeItem(
        sectionItem: sectionItem,
        showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
        isLive: sectionItem.id == curLiveEpisode?.id,
      );
    } else if (sectionItem.item is Fragment$Section$$PosterGridSection$items$items$item$$Show) {
      return _GridShowItem(sectionItem: sectionItem);
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$Episode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    final colSize = _columnSize[data.gridSize] ?? _columnSize[Enum$GridSectionSize.half]!;

    final items = data.items.items
        .where((element) =>
            element.item is Fragment$Section$$PosterGridSection$items$items$item$$Episode ||
            element.item is Fragment$Section$$PosterGridSection$items$items$item$$Show)
        .toList();

    final rowSize = (items.length / colSize).ceil();

    final rows = List<GridRow>.generate(rowSize, (rowIndex) {
      final firstIndex = rowIndex * colSize;
      final subList = firstIndex + colSize <= items.length ? items.sublist(firstIndex, firstIndex + colSize) : items.sublist(firstIndex);
      return GridRow(
        margin: const EdgeInsets.symmetric(vertical: 12),
        items: subList.asMap().entries.map((kv) {
          return SectionItemClickWrapper(
            item: kv.value.item,
            analytics: SectionItemAnalytics(id: kv.value.id, position: kv.key, type: kv.value.$__typename, name: kv.value.title),
            child: getItemWidget(kv.value, curLiveEpisode),
          );
        }).toList(),
        colSize: colSize,
      );
    });

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rows,
      ),
    );
  }
}

class _GridEpisodeItem extends StatelessWidget {
  final Fragment$Section$$PosterGridSection$items$items sectionItem;
  final Fragment$Section$$PosterGridSection$items$items$item$$Episode episode;
  final bool showSecondaryTitle;
  final bool isLive;

  bool get watched => episode.progress != null && episode.progress! > episode.duration * 0.9;
  bool isNewItem = false;

  _GridEpisodeItem({required this.sectionItem, required this.showSecondaryTitle, this.isLive = false})
      : episode = sectionItem.item as Fragment$Section$$PosterGridSection$items$items$item$$Episode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionItemImage(context),
        if (showSecondaryTitle)
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
                      style: BtvTextStyles.caption2.copyWith(color: BtvColors.tint1),
                    ),
                  ),
                ),
              if (episode.season != null)
                Text(
                  '${S.of(context).seasonLetter}${episode.season!.number}:${S.of(context).episodeLetter}${episode.number}',
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
    );
  }

  Widget sectionItemImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: posterAspectRatio,
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
      ),
    );
  }
}

class _GridShowItem extends StatelessWidget {
  final Fragment$Section$$PosterGridSection$items$items sectionItem;
  final Fragment$Section$$PosterGridSection$items$items$item$$Show show;

  // TODO: Remove this
  bool hasNewEpisodes = false;

  _GridShowItem({required this.sectionItem}) : show = sectionItem.item as Fragment$Section$$PosterGridSection$items$items$item$$Show;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionItemImage(context),
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
          '${show.seasonCount} ${S.of(context).seasons} - ${show.episodeCount} ${S.of(context).episodes}',
          style: BtvTextStyles.caption2,
        )
      ],
    );
  }

  Widget sectionItemImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: posterAspectRatio,
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
      ),
    );
  }
}
