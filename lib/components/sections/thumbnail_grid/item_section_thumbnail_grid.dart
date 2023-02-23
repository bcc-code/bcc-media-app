import 'package:brunstadtv_app/components/section_item_click_wrapper.dart';
import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../graphql/queries/calendar_episode_entries.graphql.dart';
import '../../../graphql/queries/page.graphql.dart';
import '../../../graphql/schema/pages.graphql.dart';
import '../../../theme/bccm_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/todays_calendar_entries.dart';
import '../../../theme/bccm_typography.dart';
import '../../../helpers/utils.dart';
import '../../grid_row.dart';
import '../thumbnail/show_thumbnail.dart';
import 'thumbnail_grid_episode.dart';
import 'thumbnail_grid_show.dart';

class ItemSectionThumbnailGrid extends StatelessWidget {
  final Fragment$GridSection data;
  final double aspectRatio;
  final bool showSecondaryTitle;

  const ItemSectionThumbnailGrid({
    required this.data,
    required this.aspectRatio,
    required this.showSecondaryTitle,
    super.key,
  });

  factory ItemSectionThumbnailGrid.fromDefaultGridSection(Fragment$Section$$DefaultGridSection data) {
    return ItemSectionThumbnailGrid(
      data: data,
      showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
      aspectRatio: 16 / 9,
    );
  }

  factory ItemSectionThumbnailGrid.fromPosterGridSection(Fragment$Section$$PosterGridSection data) {
    return ItemSectionThumbnailGrid(
      data: data,
      showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
      aspectRatio: 0.67,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: GridSectionList(
        gridSize: data.gridSize,
        sectionItems: data.items.items,
        showSecondaryTitle: showSecondaryTitle,
      ),
    );
  }
}

class GridSectionList extends ConsumerWidget {
  const GridSectionList({
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

  int getColumnCount() {
    switch (gridSize) {
      case Enum$GridSectionSize.half:
      default:
        return 2;
    }
  }

  Widget getItemWidget(Fragment$GridSectionItem sectionItem, Fragment$Episode? curLiveEpisode) {
    var episode = sectionItem.item.asOrNull<Fragment$GridSectionItem$item$$Episode>();
    if (episode != null) {
      return ThumbnailGridEpisode(
        sectionItem: sectionItem,
        episode: episode,
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
    final columnCount = getColumnCount();
    Fragment$Episode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    final items = sectionItems
        .where((element) => element.item is Fragment$GridSectionItem$item$$Episode || element.item is Fragment$GridSectionItem$item$$Show)
        .toList();
    final rowSize = (items.length / columnCount).ceil();

    final rows = List<GridRow>.generate(rowSize, (rowIndex) {
      final firstIndex = rowIndex * columnCount;
      final subList = firstIndex + columnCount <= items.length ? items.sublist(firstIndex, firstIndex + columnCount) : items.sublist(firstIndex);
      return GridRow(
        margin: const EdgeInsets.symmetric(vertical: 12),
        items: subList.asMap().entries.map<Widget>((kv) {
          return SectionItemClickWrapper(
            item: kv.value.item,
            analytics: SectionItemAnalytics(id: kv.value.id, position: kv.key, type: kv.value.$__typename, name: kv.value.title),
            child: getItemWidget(kv.value, curLiveEpisode),
          );
        }).toList(),
        columnCount: columnCount,
      );
    });
    return ListView.builder(
        primary: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: rows.length,
        itemBuilder: (context, index) => rows[index]);
  }
}
