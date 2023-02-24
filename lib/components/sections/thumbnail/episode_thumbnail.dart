import 'package:flutter/material.dart';

import '../../../models/episode_thumbnail_data.dart';
import '../../../services/utils.dart';
import '../../bordered_image_container.dart';
import '../../episode_duration.dart';
import '../../watch_progress_indicator.dart';
import '../../watched_badge.dart';

class EpisodeThumbnail extends StatelessWidget {
  final EpisodeThumbnailData episode;
  final double imageWidth;
  final double imageHeight;
  final bool isLive;

  const EpisodeThumbnail({
    super.key,
    required this.episode,
    required this.imageWidth,
    required this.imageHeight,
    this.isLive = false,
  });

  factory EpisodeThumbnail.withSize({
    required EpisodeThumbnailData episode,
    required Size imageSize,
    bool isLive = false,
  }) {
    return EpisodeThumbnail(
      episode: episode,
      imageWidth: imageSize.width,
      imageHeight: imageSize.height,
      isLive: isLive,
    );
  }

  factory EpisodeThumbnail.withWidth({
    required EpisodeThumbnailData episode,
    required double imageWidth,
    required double aspectRatio,
    bool isLive = false,
  }) {
    return EpisodeThumbnail(
      imageWidth: imageWidth,
      imageHeight: imageWidth / aspectRatio,
      isLive: isLive,
      episode: episode,
    );
  }

  bool get watched => episode.progress != null && episode.progress! > episode.duration * 0.9;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: imageWidth,
      height: imageHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          episode.locked && !isLive
              ? Opacity(
                  opacity: 0.5,
                  child: BorderedImageContainer(imageUrl: episode.image),
                )
              : BorderedImageContainer(imageUrl: episode.image),
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
