import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../graphql/queries/calendar_episode_entries.graphql.dart';
import '../../../graphql/queries/page.graphql.dart';
import '../../../graphql/schema/pages.graphql.dart';
import '../../../helpers/extensions.dart';
import '../../../models/analytics/sections.dart';
import '../../../models/episode_thumbnail_data.dart';
import '../../../providers/todays_calendar_entries.dart';
import '../../grid_row.dart';
import '../../section_item_click_wrapper.dart';
import 'thumbnail_grid_episode.dart';
import 'thumbnail_grid_show.dart';

class ThumbnailGrid extends ConsumerWidget {
  const ThumbnailGrid({
    super.key,
    required this.gridSize,
    this.aspectRatio = 16 / 9,
    required this.sectionItems,
    this.showSecondaryTitle = true,
  });

  final Enum$GridSectionSize gridSize;
  final List<Fragment$GridSectionItem> sectionItems;
  final bool showSecondaryTitle;
  final double aspectRatio;

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
    final columnCount = getColumnCount(context);
    Fragment$CalendarEntryEpisode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    final items = sectionItems
        .where((element) => element.item is Fragment$GridSectionItem$item$$Episode || element.item is Fragment$GridSectionItem$item$$Show)
        .toList();
    final rowCount = (items.length / columnCount).ceil();

    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rowCount,
      itemBuilder: (context, rowIndex) {
        final firstIndex = rowIndex * columnCount;
        final rowItems = firstIndex + columnCount <= items.length ? items.sublist(firstIndex, firstIndex + columnCount) : items.sublist(firstIndex);
        return GridRow(
          margin: const EdgeInsets.symmetric(vertical: 12),
          items: rowItems.asMap().entries.map<Widget>((kv) {
            return SectionItemClickWrapper(
              item: kv.value.item,
              analytics: SectionItemAnalytics(id: kv.value.id, position: kv.key, type: kv.value.$__typename, name: kv.value.title),
              child: getItemWidget(kv.value, curLiveEpisode),
            );
          }).toList(),
          columnCount: columnCount,
        );
      },
    );
  }
}
