import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';

import '../services/utils.dart';
import 'bordered_image_container.dart';
import 'episode_duration.dart';
import 'watch_progress_indicator.dart';
import 'watched_badge.dart';

class SectionEpisodeThumbnail extends StatelessWidget {
  SectionEpisodeThumbnail({
    super.key,
    required this.sectionItem,
    required this.imageSize,
    required this.isLive,
    required this.watched,
  }) : episode = sectionItem.item as Fragment$ItemSectionItem$item$$Episode;

  final Fragment$ItemSectionItem sectionItem;
  final Size imageSize;
  final bool isLive;
  final Fragment$ItemSectionItem$item$$Episode episode;
  final bool watched;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageSize.width,
      height: imageSize.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          episode.locked && !isLive
              ? Opacity(
                  opacity: 0.5,
                  child: BorderedImageContainer(imageUrl: sectionItem.image),
                )
              : BorderedImageContainer(imageUrl: sectionItem.image),
          if (episode.locked)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/Wait.png'),
                ),
              ),
            ),
          if (episode.progress != null && !watched)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 4, bottom: 4, right: 4),
                child: WatchProgressIndicator(totalDuration: episode.duration, watchedDuration: episode.progress!),
              ),
            )
          else if (!episode.locked)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 12,
                margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
                child: Row(
                  children: [
                    if (watched) const WatchedBadge(),
                    const Spacer(),
                    EpisodeDuration(duration: getFormattedDuration(episode.duration)),
                  ],
                ),
              ),
            ),
          if (getFeaturedTag(publishDate: episode.publishDate, locked: episode.locked, isLive: isLive) != null)
            Positioned(
              top: -4,
              right: -4,
              child: getFeaturedTag(publishDate: episode.publishDate, locked: episode.locked, isLive: isLive)!,
            ),
        ],
      ),
    );
  }
}
