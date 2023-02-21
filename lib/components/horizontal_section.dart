import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/schema/pages.graphql.dart';
import '../graphql/queries/calendar_episode_entries.graphql.dart';
import '../graphql/queries/page.graphql.dart';

import '../providers/todays_calendar_entries.dart';
import '../helpers/utils.dart';
import '../models/analytics/sections.dart';
import 'horizontal_section_episode.dart';
import 'horizontal_section_show.dart';
import 'horizontal_slider.dart';
import 'section_item_click_wrapper.dart';

class _HorizontalSectionSize {
  final Size imageSize;
  final double sectionHeight;

  const _HorizontalSectionSize({required this.imageSize, required this.sectionHeight});
}

const Map<Enum$SectionSize, _HorizontalSectionSize> _defaultSectionSize = {
  Enum$SectionSize.small: _HorizontalSectionSize(imageSize: Size(140, 80), sectionHeight: 156),
  Enum$SectionSize.medium: _HorizontalSectionSize(imageSize: Size(240, 146), sectionHeight: 222),
};

const Map<Enum$SectionSize, _HorizontalSectionSize> _posterSectionSize = {
  Enum$SectionSize.small: _HorizontalSectionSize(imageSize: Size(140, 208), sectionHeight: 284),
  Enum$SectionSize.medium: _HorizontalSectionSize(imageSize: Size(230, 340), sectionHeight: 416),
};

class HorizontalSection extends ConsumerWidget {
  final Fragment$ItemSection data;

  const HorizontalSection(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$Episode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    _HorizontalSectionSize? sectionSize;

    final defaultData = data.asOrNull<Fragment$Section$$DefaultSection>();
    final posterData = data.asOrNull<Fragment$Section$$PosterSection>();
    if (defaultData != null) {
      sectionSize = _defaultSectionSize[defaultData.size];
    } else if (posterData != null) {
      sectionSize = _posterSectionSize[posterData.size];
    }

    if (sectionSize == null) {
      return const SizedBox.shrink();
    }

    final items = data.items.items
        .where((element) => element.item is Fragment$ItemSectionItem$item$$Episode || element.item is Fragment$ItemSectionItem$item$$Show)
        .toList();
    return HorizontalSlider(
      height: sectionSize.sectionHeight,
      clipBehaviour: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        final episodeItem = item.item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
        final showItem = item.item.asOrNull<Fragment$ItemSectionItem$item$$Show>();
        Widget? sectionItemWidget;
        if (episodeItem != null) {
          sectionItemWidget = HorizontalSectionEpisode(
            sectionItem: item,
            episode: episodeItem,
            imageSize: sectionSize!.imageSize,
            showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
            isLive: episodeItem.id == curLiveEpisode?.id,
          );
        } else if (showItem != null) {
          sectionItemWidget = HorizontalSectionShow(
            sectionItem: item,
            show: showItem,
            imageSize: sectionSize!.imageSize,
            showEpisodeCounts: defaultData != null,
          );
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
