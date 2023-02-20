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

const Map<Enum$SectionSize, Size> _defaultImageSize = {
  Enum$SectionSize.small: Size(140, 80),
  Enum$SectionSize.medium: Size(240, 146),
};

const Map<Enum$SectionSize, double> _defaultSliderHeight = {
  Enum$SectionSize.small: 156,
  Enum$SectionSize.medium: 222,
};

const Map<Enum$SectionSize, Size> _posterImageSize = {
  Enum$SectionSize.small: Size(140, 208),
  Enum$SectionSize.medium: Size(230, 340),
};

const Map<Enum$SectionSize, double> _posterSliderHeight = {
  Enum$SectionSize.small: 284,
  Enum$SectionSize.medium: 416,
};

class HorizontalSection extends ConsumerWidget {
  final Fragment$ItemSection data;

  const HorizontalSection(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$Episode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    Enum$SectionSize? size;
    Size? imageSize;
    double? sliderHeight;

    final defaultData = data.asOrNull<Fragment$Section$$DefaultSection>();
    final posterData = data.asOrNull<Fragment$Section$$PosterSection>();
    if (defaultData != null) {
      size = defaultData.size;
      imageSize = _defaultImageSize[size];
      sliderHeight = _defaultSliderHeight[size];
    } else if (posterData != null) {
      size = posterData.size;
      imageSize = _posterImageSize[size];
      sliderHeight = _posterSliderHeight[size];
    }

    if (size == null || size == Enum$SectionSize.$unknown || sliderHeight == null || imageSize == null) {
      return const SizedBox.shrink();
    }

    final items = data.items.items
        .where((element) => element.item is Fragment$ItemSectionItem$item$$Episode || element.item is Fragment$ItemSectionItem$item$$Show)
        .toList();
    return HorizontalSlider(
      height: sliderHeight,
      clipBehaviour: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        Widget? sectionItemWidget;
        if (item.item is Fragment$ItemSectionItem$item$$Episode) {
          sectionItemWidget = HorizontalSectionEpisode(
            sectionItem: item,
            imageSize: imageSize!,
            showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
            isLive: (item.item as Fragment$ItemSectionItem$item$$Episode).id == curLiveEpisode?.id,
          );
        } else if (item.item is Fragment$ItemSectionItem$item$$Show) {
          sectionItemWidget = HorizontalSectionShow(
            sectionItem: item,
            imageSize: imageSize!,
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
