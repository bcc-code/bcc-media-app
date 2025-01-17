import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/thumbnails/slider/thumbnail_slider.dart';
import 'package:brunstadtv_app/components/thumbnails/slider/thumbnail_slider_short.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/episode_thumbnail_data.dart';
import '../../../../providers/todays_calendar_entries.dart';
import '../../../thumbnails/slider/thumbnail_slider_episode.dart';
import '../../../thumbnails/slider/thumbnail_slider_show.dart';
import '../section_item_click_wrapper.dart';

class ItemSectionThumbnailSlider extends ConsumerWidget {
  final Fragment$ItemSection data;
  final Size imageSize;
  final bool displaySeasonEpisodeCountsForShows;

  const ItemSectionThumbnailSlider({
    required this.data,
    required this.imageSize,
    required this.displaySeasonEpisodeCountsForShows,
    super.key,
  });

  factory ItemSectionThumbnailSlider.fromDefaultSection(Fragment$Section$$DefaultSection data) {
    Size imageSize;
    switch (data.size) {
      case Enum$SectionSize.medium:
        imageSize = const Size(240, 146);
        break;
      case Enum$SectionSize.small:
      default:
        imageSize = const Size(140, 80);
        break;
    }
    return ItemSectionThumbnailSlider(
      data: data,
      imageSize: imageSize,
      displaySeasonEpisodeCountsForShows: true,
    );
  }

  factory ItemSectionThumbnailSlider.fromPosterSection(Fragment$Section$$PosterSection data) {
    Size imageSize;
    switch (data.size) {
      case Enum$SectionSize.medium:
        imageSize = const Size(230, 340);
        break;
      case Enum$SectionSize.small:
      default:
        imageSize = const Size(140, 208);
        break;
    }
    return ItemSectionThumbnailSlider(
      data: data,
      imageSize: imageSize,
      displaySeasonEpisodeCountsForShows: false,
    );
  }

  EpisodeThumbnailData? getEpisodeThumbnailData(Fragment$ItemSectionItem item) {
    final episode = item.item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
    if (episode != null) {
      return EpisodeThumbnailData.fromFragment(episode);
    }
    return EpisodeThumbnailData(
      title: item.title,
      image: item.image,
      locked: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$CalendarEntryEpisode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    final items = data.items.items.toList();
    final hideTitle = items.every((item) => item.item is Fragment$ItemSectionItem$item$$Short);

    return ThumbnailSlider(
      itemsCount: items.length,
      imageSize: imageSize,
      hideThumbnailTitles: hideTitle,
      displaySeasonEpisodeCountsForShows: displaySeasonEpisodeCountsForShows,
      thumbnailBuilder: (context, index, responsiveSize) {
        final item = items[index];
        final episodeThumbnailData = getEpisodeThumbnailData(item);
        final showItem = item.item.asOrNull<Fragment$ItemSectionItem$item$$Show>();
        final shortItem = item.item.asOrNull<Fragment$ItemSectionItem$item$$Short>();
        Widget? sectionItemWidget;
        if (showItem != null) {
          sectionItemWidget = ThumbnailSliderShow(
            sectionItem: item,
            show: showItem,
            imageSize: responsiveSize,
            showSeasonEpisodeCounts: displaySeasonEpisodeCountsForShows,
          );
        } else if (shortItem != null && item.image != null) {
          sectionItemWidget = ThumbnailSliderShort(
            image: item.image!,
            imageSize: responsiveSize,
          );
        } else if (episodeThumbnailData != null) {
          sectionItemWidget = ThumbnailSliderEpisode(
            episode: episodeThumbnailData,
            imageSize: responsiveSize,
            showSecondaryTitle: data.metadata?.secondaryTitles ?? false,
            isLive: item.id == curLiveEpisode?.id,
          );
        }
        if (sectionItemWidget == null) {
          return const SizedBox.shrink();
        }
        return SectionItemClickWrapper(
          item: item.item,
          analytics: SectionItemAnalyticsData(id: item.id, position: index, type: item.$__typename, name: item.title),
          collectionId: data.metadata?.useContext == true && data.metadata?.collectionId != null ? data.metadata!.collectionId : null,
          child: sectionItemWidget,
        );
      },
    );
  }
}
