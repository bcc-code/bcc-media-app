import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../graphql/schema/pages.graphql.dart';
import '../../../graphql/queries/calendar_episode_entries.graphql.dart';
import '../../../graphql/queries/page.graphql.dart';

import '../../../models/episode_thumbnail_data.dart';
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

  ThumbnailSliderSize operator *(double factor) => ThumbnailSliderSize(
        imageSize: imageSize * factor,
        sectionHeight: sectionHeight * factor,
      );

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
        sliderSize = ThumbnailSliderSize(
          imageSize: const Size(240, 146) * (kIsWeb ? 2 : 1),
          sectionHeight: 222 * (kIsWeb ? 2 : 1),
        );
        break;
      case Enum$SectionSize.small:
      default:
        sliderSize = ThumbnailSliderSize(
          imageSize: const Size(140, 80) * (kIsWeb ? 2 : 1),
          sectionHeight: 156 * (kIsWeb ? 2 : 1),
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
        sliderSize = ThumbnailSliderSize(
          imageSize: const Size(230, 340) * (kIsWeb ? 2 : 1),
          sectionHeight: 416 * (kIsWeb ? 2 : 1),
        );
        break;
      case Enum$SectionSize.small:
      default:
        sliderSize = ThumbnailSliderSize(
          imageSize: const Size(140, 208) * (kIsWeb ? 2 : 1),
          sectionHeight: 284 * (kIsWeb ? 2 : 1),
        );
        break;
    }
    return ItemSectionThumbnailSlider(
      data: data,
      sliderSize: sliderSize,
      displaySeasonEpisodeCountsForShows: false,
    );
  }

  EpisodeThumbnailData? getEpisodeThumbnailData(Fragment$ItemSectionItem item) {
    final episode = item.item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
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
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$CalendarEntryEpisode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    final items = data.items.items
        .where((element) => element.item is Fragment$ItemSectionItem$item$$Episode || element.item is Fragment$ItemSectionItem$item$$Show)
        .toList();
    return HorizontalSlider(
      itemWidth: sliderSize.imageSize.width,
      height: sliderSize.sectionHeight,
      clipBehaviour: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        final episodeThumbnailData = getEpisodeThumbnailData(item);
        final showItem = item.item.asOrNull<Fragment$ItemSectionItem$item$$Show>();
        Widget? sectionItemWidget;
        if (episodeThumbnailData != null) {
          sectionItemWidget = ThumbnailSliderEpisode(
            episode: episodeThumbnailData,
            imageSize: sliderSize.imageSize,
            showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
            isLive: item.id == curLiveEpisode?.id,
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
