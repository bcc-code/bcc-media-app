import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/study_progress.dart';
import 'package:brunstadtv_app/graphql/queries/studies.graphql.dart';
import 'package:brunstadtv_app/helpers/btv_gradients.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../env/env.dart';
import '../graphql/queries/search.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';
import '../services/utils.dart';
import 'bordered_image_container.dart';
import 'episode_duration.dart';
import 'watched_badge.dart';
import 'dart:math' as math;

part 'season_episode_list.freezed.dart';

class SeasonEpisodeList extends StatelessWidget {
  final String? title;
  final List<EpisodeListEpisodeData> items;
  final String? selectedId;

  const SeasonEpisodeList({super.key, this.title, this.selectedId, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Container(
            padding: const EdgeInsets.only(top: 12, right: 16, bottom: 8, left: 16),
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(
              title!,
              style: BtvTextStyles.title2,
            ),
          ),
        ...items.map((ep) => EpisodeListEpisode(data: ep))
      ],
    );
  }
}

@freezed
class EpisodeListEpisodeData with _$EpisodeListEpisodeData {
  const factory EpisodeListEpisodeData({
    required String episodeId,
    required String title,
    bool? highlighted,
    required String? image,
    int? seasonNumber,
    int? episodeNumber,
    Fragment$LessonProgressOverview? lessonProgressOverview,
    required String? publishDate,
    required String ageRating,
    required int duration,
  }) = _EpisodeListEpisode;
}

class EpisodeListEpisode extends StatelessWidget {
  final EpisodeListEpisodeData data;
  const EpisodeListEpisode({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final unavailable = isUnavailable(data.publishDate);
    final publishDateTime = data.publishDate != null ? DateTime.tryParse(data.publishDate!) : null;
    return IgnorePointer(
      ignoring: unavailable,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => context.navigateTo(EpisodeScreenRoute(episodeId: data.episodeId, autoplay: data.lessonProgressOverview == null)),
        child: Stack(
          children: [
            if (data.highlighted == true)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      border: const Border(left: BorderSide(color: BtvColors.tint2, width: 4)), color: BtvColors.tint2.withOpacity(0.1)),
                ),
              ),
            Container(
              height: 98,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      unavailable
                          ? Opacity(
                              opacity: 0.5,
                              child: BorderedImageContainer(width: 128, imageUrl: data.image),
                            )
                          : BorderedImageContainer(width: 128, imageUrl: data.image),
                      if (unavailable)
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/Wait.png'),
                              ),
                            ),
                          ),
                        )
                      else
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 12,
                            margin: const EdgeInsets.only(right: 4, bottom: 4, left: 4),
                            child: Row(
                              children: [
                                const Spacer(),
                                EpisodeDuration(duration: getFormattedDuration(data.duration)),
                              ],
                            ),
                          ),
                        )),
                      if (getFeaturedTag(publishDate: data.publishDate) != null)
                        Positioned(
                          top: -4,
                          right: -4,
                          child: getFeaturedTag(publishDate: data.publishDate)!,
                        ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Opacity(
                      opacity: unavailable ? 0.5 : 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                data.title,
                                style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (data.ageRating != 'A')
                                Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  height: 16,
                                  padding: const EdgeInsets.only(right: 4, bottom: 2, left: 4),
                                  decoration: BoxDecoration(
                                    color: BtvColors.background2,
                                    border: Border.all(
                                      width: 1,
                                      color: BtvColors.separatorOnLight,
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: Text(
                                    getFormattedAgeRating(data.ageRating),
                                    style: BtvTextStyles.caption2.copyWith(color: BtvColors.onTint, height: 1.1),
                                  ),
                                ),
                              if (unavailable && publishDateTime != null)
                                Expanded(
                                  child: Text(
                                    S.of(context).availableFrom(DateFormat(DateFormat.YEAR_MONTH_DAY).format(publishDateTime)),
                                    overflow: TextOverflow.fade,
                                    style: BtvTextStyles.caption2.copyWith(color: BtvColors.label3),
                                  ),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  if (Env.enableStudy && data.lessonProgressOverview != null && !unavailable)
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: BtvColors.separatorOnLight,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: LessonProgressTree(
                            completed: data.lessonProgressOverview!.progress.completed,
                            total: data.lessonProgressOverview!.progress.total,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
