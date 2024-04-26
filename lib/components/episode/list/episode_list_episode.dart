import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bccm_core/platform.dart';
import '../../../models/episode_thumbnail_data.dart';
import 'package:bccm_core/design_system.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/todays_calendar_entries.dart';
import '../../thumbnails/episode_thumbnail.dart';

class EpisodeListEpisode extends ConsumerWidget {
  const EpisodeListEpisode({
    super.key,
    required this.id,
    required this.title,
    this.image,
    this.showTitle,
    required this.ageRating,
    required this.duration,
    this.showSecondaryTitle = true,
    this.locked = false,
    this.progress,
    this.publishDate,
  });
  final String id;
  final String title;
  final String? image;
  final String? showTitle;
  final String ageRating;
  final int duration;
  final bool showSecondaryTitle;
  final bool locked;
  final int? progress;
  final String? publishDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Fragment$CalendarEntryEpisode? curLiveEpisode = ref.watch(currentLiveEpisodeProvider)?.episode;

    final design = DesignSystem.of(context);
    return Container(
      height: 98,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: EpisodeThumbnail.withWidth(
              episode: EpisodeThumbnailData(
                title: title,
                progress: progress,
                duration: duration,
                locked: locked,
                image: image,
                publishDate: publishDate,
              ),
              imageWidth: 128,
              aspectRatio: 16 / 9,
              isLive: curLiveEpisode?.id == id,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showSecondaryTitle && showTitle != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      showTitle!,
                      style: design.textStyles.caption2.copyWith(color: design.colors.tint1),
                    ),
                  ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      title,
                      style: design.textStyles.caption1.copyWith(color: design.colors.label1),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (ageRating != 'A')
                      Container(
                        margin: const EdgeInsets.only(right: 6),
                        height: 16,
                        padding: const EdgeInsets.only(right: 4, bottom: 2, left: 4),
                        decoration: BoxDecoration(
                          color: design.colors.background2,
                          border: Border.all(
                            width: 1,
                            color: design.colors.separatorOnLight,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          getFormattedAgeRating(ageRating),
                          style: design.textStyles.caption2.copyWith(color: design.colors.onTint, height: 1.1),
                        ),
                      ),
                    Text(
                      '${Duration(seconds: duration).inMinutes} ${S.of(context).minutesShort}',
                      style: design.textStyles.caption2.copyWith(color: design.colors.label3),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
