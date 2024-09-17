import 'package:brunstadtv_app/components/misc/horizontal_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../models/breakpoints.dart';

class ThumbnailSlider extends ConsumerWidget {
  final Widget Function(BuildContext context, int index, Size sliderSize) thumbnailBuilder;
  final bool displaySeasonEpisodeCountsForShows;
  final bool hideThumbnailTitles;
  final Size imageSize;
  final int itemsCount;

  const ThumbnailSlider({
    super.key,
    this.displaySeasonEpisodeCountsForShows = false,
    this.hideThumbnailTitles = false,
    required this.thumbnailBuilder,
    required this.itemsCount,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factor = ResponsiveValue(
      context,
      defaultValue: 1.0,
      conditionalValues: [
        const Condition.equals(name: BP.sm, value: 1.0),
        const Condition.equals(name: BP.md, value: 1.5),
        const Condition.equals(name: BP.lg, value: 1.7),
        const Condition.equals(name: BP.xl, value: 2.0),
        const Condition.largerThan(name: BP.xl, value: 2.5),
      ],
    ).value;

    final responsiveSize = imageSize * factor;

    const verticalPaddingForThumbnail = 12.0;
    const paddingForTitle = 52;

    return HorizontalSlider(
      height: responsiveSize.height + (verticalPaddingForThumbnail * 2) + (hideThumbnailTitles ? 0 : paddingForTitle),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: verticalPaddingForThumbnail),
      itemWidth: responsiveSize.width,
      itemBuilder: (context, index) => thumbnailBuilder(context, index, responsiveSize),
      clipBehaviour: Clip.none,
      itemCount: itemsCount,
    );
  }
}
