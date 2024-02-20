import 'package:brunstadtv_app/components/thumbnails/slider/thumbnail_slider_short.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:bccm_core/platform.dart';

import '../../../../models/breakpoints.dart';
import '../../../../models/episode_thumbnail_data.dart';
import '../../../../providers/todays_calendar_entries.dart';
import 'package:bccm_core/bccm_core.dart';
import '../../../thumbnails/slider/thumbnail_slider_episode.dart';
import '../../../thumbnails/slider/thumbnail_slider_show.dart';
import '../../../misc/horizontal_slider.dart';
import '../section_item_click_wrapper.dart';

class ThumbnailSliderSize {
  final Size imageSize;

  ThumbnailSliderSize operator *(double factor) => ThumbnailSliderSize(imageSize: imageSize * factor);

  ThumbnailSliderSize({required this.imageSize, double? sectionHeight});
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
        sliderSize = ThumbnailSliderSize(imageSize: const Size(240, 146));
        break;
      case Enum$SectionSize.small:
      default:
        sliderSize = ThumbnailSliderSize(imageSize: const Size(140, 80));
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
        sliderSize = ThumbnailSliderSize(imageSize: const Size(230, 340));
        break;
      case Enum$SectionSize.small:
      default:
        sliderSize = ThumbnailSliderSize(imageSize: const Size(140, 208));
        break;
    }
    return ItemSectionThumbnailSlider(
      data: data,
      sliderSize: sliderSize,
      displaySeasonEpisodeCountsForShows: false,
    );
  }

  EpisodeThumbnailData? getEpisodeThumbnailData(Fragment$ItemSectionItem item) {
    if (item.image == null) {
      return null;
    }
    final episode = item.item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
    if (episode != null) {
      return EpisodeThumbnailData(
        title: item.title,
        duration: episode.duration,
        image: item.image,
        locked: episode.locked,
        progress: episode.progress,
        publishDate: episode.publishDate,
      );
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

    final factor = ResponsiveValue(
      context,
      defaultValue: 1.0,
      conditionalValues: [
        Condition.equals(name: BP.sm, value: 1.0),
        Condition.equals(name: BP.md, value: 1.5),
        Condition.equals(name: BP.lg, value: 1.7),
        Condition.equals(name: BP.xl, value: 2.0),
        Condition.largerThan(name: BP.xl, value: 2.5),
      ],
    ).value!;

    final responsiveSliderSize = sliderSize * factor;

    const paddingForTitle = 52;

    final items = data.items.items.toList();

    final hideTitle = items.every((item) => item.item is Fragment$ItemSectionItem$item$$Short);

    return HorizontalSlider(
      itemWidth: responsiveSliderSize.imageSize.width,
      height: responsiveSliderSize.imageSize.height + (hideTitle ? 24 : 24 + paddingForTitle),
      clipBehaviour: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16, vertical: 12),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        final episodeThumbnailData = getEpisodeThumbnailData(item);
        final showItem = item.item.asOrNull<Fragment$ItemSectionItem$item$$Show>();
        final shortItem = item.item.asOrNull<Fragment$ItemSectionItem$item$$Short>();
        Widget? sectionItemWidget;
        if (showItem != null) {
          sectionItemWidget = ThumbnailSliderShow(
            sectionItem: item,
            show: showItem,
            imageSize: responsiveSliderSize.imageSize,
            showSeasonEpisodeCounts: displaySeasonEpisodeCountsForShows,
          );
        } else if (shortItem != null && item.image != null) {
          sectionItemWidget = ThumbnailSliderShort(
            image: item.image!,
            imageSize: responsiveSliderSize.imageSize,
          );
        } else if (episodeThumbnailData != null) {
          sectionItemWidget = ThumbnailSliderEpisode(
            episode: episodeThumbnailData,
            imageSize: responsiveSliderSize.imageSize,
            showSecondaryTitle: data.metadata?.secondaryTitles ?? true,
            isLive: item.id == curLiveEpisode?.id,
          );
        }
        if (sectionItemWidget == null) {
          return const SizedBox.shrink();
        }
        return SectionItemClickWrapper(
          item: item.item,
          analytics: SectionItemAnalytics(id: item.id, position: index, type: item.$__typename, name: item.title),
          collectionId: data.metadata?.useContext == true && data.metadata?.collectionId != null ? data.metadata!.collectionId : null,
          child: sectionItemWidget,
        );
      },
    );
  }
}
