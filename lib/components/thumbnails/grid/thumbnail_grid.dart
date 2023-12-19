import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bccm_core/api.dart';
import 'package:bccm_core/api.dart';
import 'package:bccm_core/bccm_core.dart';
import '../../../models/analytics/sections.dart';
import '../../../models/episode_thumbnail_data.dart';
import '../../../providers/todays_calendar_entries.dart';
import '../../misc/custom_grid_view.dart';
import '../../pages/sections/section_item_click_wrapper.dart';
import 'thumbnail_grid_episode.dart';
import 'thumbnail_grid_show.dart';

class ThumbnailGrid extends ConsumerWidget {
  const ThumbnailGrid({
    super.key,
    required this.gridSize,
    this.aspectRatio = 16 / 9,
    this.collectionId,
    required this.sectionItems,
    this.showSecondaryTitle = true,
  });

  final Enum$GridSectionSize gridSize;
  final List<Fragment$GridSectionItem> sectionItems;
  final bool showSecondaryTitle;
  final double aspectRatio;
  final String? collectionId;

  int getColumnCount(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    switch (gridSize) {
      case Enum$GridSectionSize.half:
      default:
        if (screenSize > 1920) return 6;
        if (screenSize > 1000) return 4;
        return 2;
    }
  }

  EpisodeThumbnailData? getEpisodeThumbnailData(Fragment$GridSectionItem item) {
    final episode = item.item.asOrNull<Fragment$GridSectionItem$item$$Episode>();
    if (episode == null) {
      return null;
    }
    return EpisodeThumbnailData(
      title: item.title,
      duration: episode.duration,
      image: item.image,
      locked: episode.locked,
      progress: episode.progress,
      publishDate: episode.publishDate,
      number: episode.number,
      showTitle: episode.season?.$show.title,
      seasonNumber: episode.season?.number,
    );
  }

  Widget getItemWidget(Fragment$GridSectionItem sectionItem, Fragment$CalendarEntryEpisode? curLiveEpisode) {
    final episodeThumbnailData = getEpisodeThumbnailData(sectionItem);
    if (episodeThumbnailData != null) {
      return ThumbnailGridEpisode(
        episode: getEpisodeThumbnailData(sectionItem)!,
        showSecondaryTitle: showSecondaryTitle,
        aspectRatio: aspectRatio,
        isLive: sectionItem.id == curLiveEpisode?.id,
      );
    }
    var show = sectionItem.item.asOrNull<Fragment$GridSectionItem$item$$Show>();
    if (show != null) {
      return ThumbnailGridShow(
        sectionItem: sectionItem,
        show: show,
        aspectRatio: aspectRatio,
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$CalendarEntryEpisode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    final items = sectionItems
        .where((element) => element.item is Fragment$GridSectionItem$item$$Episode || element.item is Fragment$GridSectionItem$item$$Show)
        .toList();

    return CustomGridView(
      padding: const EdgeInsets.only(top: 12),
      columnCount: getColumnCount(context),
      children: items.mapIndexed((index, item) {
        return SectionItemClickWrapper(
          item: item.item,
          collectionId: collectionId,
          analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
          child: getItemWidget(item, curLiveEpisode),
        );
      }).toList(),
    );
  }
}
