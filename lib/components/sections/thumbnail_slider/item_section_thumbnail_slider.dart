import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../graphql/schema/pages.graphql.dart';
import '../../../graphql/queries/calendar_episode_entries.graphql.dart';
import '../../../graphql/queries/page.graphql.dart';

import '../../../providers/todays_calendar_entries.dart';
import '../../../helpers/extensions.dart';
import '../../../models/analytics/sections.dart';
import 'thumbnail_slider_episode.dart';
import 'thumbnail_slider_show.dart';
import '../../horizontal_slider.dart';
import '../../section_item_click_wrapper.dart';

class ThumbnailSliderSize {
  final Size imageSize;
  final double sectionHeight;

  const ThumbnailSliderSize({required this.imageSize, required this.sectionHeight});
}

class ItemSectionThumbnailSlider extends ConsumerWidget {
  final Fragment$ItemSection data;
  final ThumbnailSliderSize sliderSize;
  final bool displaySeasonEpisodeCountsForShows;

  const ItemSectionThumbnailSlider({
    required this.data,
    required this.sliderSize,
    required this.displaySeasonEpisodeCountsForShows,
    super.key,
  });

  factory ItemSectionThumbnailSlider.fromDefaultSection(Fragment$Section$$DefaultSection data) {
    ThumbnailSliderSize sliderSize;
    switch (data.size) {
      case Enum$SectionSize.medium:
        sliderSize = const ThumbnailSliderSize(
          imageSize: Size(240, 146),
          sectionHeight: 222,
        );
        break;
      case Enum$SectionSize.small:
      default:
        sliderSize = const ThumbnailSliderSize(
          imageSize: Size(140, 80),
          sectionHeight: 156,
        );
        break;
    }
    return ItemSectionThumbnailSlider(
      data: data,
      sliderSize: sliderSize,
      displaySeasonEpisodeCountsForShows: true,
    );
  }

  factory ItemSectionThumbnailSlider.fromPosterSection(Fragment$Section$$PosterSection data) {
    ThumbnailSliderSize sliderSize;
    switch (data.size) {
      case Enum$SectionSize.medium:
        sliderSize = const ThumbnailSliderSize(
          imageSize: Size(230, 340),
          sectionHeight: 416,
        );
        break;
      case Enum$SectionSize.small:
      default:
        sliderSize = const ThumbnailSliderSize(
          imageSize: Size(140, 208),
          sectionHeight: 284,
        );
        break;
    }
    return ItemSectionThumbnailSlider(
      data: data,
      sliderSize: sliderSize,
      displaySeasonEpisodeCountsForShows: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$Episode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    final items = data.items.items
        .where((element) => element.item is Fragment$ItemSectionItem$item$$Episode || element.item is Fragment$ItemSectionItem$item$$Show)
        .toList();
    return HorizontalSlider(
      height: sliderSize.sectionHeight,
      clipBehaviour: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        final episodeItem = item.item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
        final showItem = item.item.asOrNull<Fragment$ItemSectionItem$item$$Show>();
        Widget? sectionItemWidget;
        if (episodeItem != null) {
          sectionItemWidget = ThumbnailSliderEpisode(
            sectionItem: item,
            episode: episodeItem,
            imageSize: sliderSize.imageSize,
            showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
            isLive: episodeItem.id == curLiveEpisode?.id,
          );
        } else if (showItem != null) {
          sectionItemWidget = ThumbnailSliderShow(
            sectionItem: item,
            show: showItem,
            imageSize: sliderSize.imageSize,
            showSeasonEpisodeCounts: displaySeasonEpisodeCountsForShows,
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
