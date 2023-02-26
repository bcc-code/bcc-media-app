import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/study_progress.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/studies.graphql.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../env/env.dart';
import '../theme/bccm_colors.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';
import '../services/utils.dart';
import 'bordered_image_container.dart';
import 'episode_duration.dart';

part 'season_episode_list.freezed.dart';

class SeasonEpisodeList extends StatelessWidget {
  final String? title;
  final List<SeasonEpisodeListEpisodeData> items;
  final String? selectedId;
  final void Function(String id) onEpisodeTap;

  const SeasonEpisodeList({super.key, this.title, this.selectedId, required this.items, required this.onEpisodeTap});

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
              style: BccmTextStyles.title2,
            ),
          ),
        ...items.map(
          (ep) => IgnorePointer(
            ignoring: ep.episode.locked,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                onEpisodeTap(ep.episode.id);
              },
              child: _Episode(data: ep),
            ),
          ),
        )
      ],
    );
  }
}

@freezed
class SeasonEpisodeListEpisodeData with _$SeasonEpisodeListEpisodeData {
  const factory SeasonEpisodeListEpisodeData({
    required Fragment$SeasonListEpisode episode,
    int? seasonNumber,
    Fragment$LessonProgressOverview? lessonProgressOverview,
    bool? highlighted,
  }) = _SeasonEpisodeListEpisodeData;
}

class _Episode extends StatelessWidget {
  final SeasonEpisodeListEpisodeData data;
  const _Episode({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final publishDateTime = DateTime.tryParse(data.episode.publishDate);
    return Stack(
      children: [
        if (data.highlighted == true)
          Positioned.fill(
            child: Container(
              decoration:
                  BoxDecoration(border: const Border(left: BorderSide(color: BccmColors.tint2, width: 4)), color: BccmColors.tint2.withOpacity(0.1)),
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
                  data.episode.locked
                      ? Opacity(
                          opacity: 0.5,
                          child: BorderedImageContainer(width: 128, imageUrl: data.episode.image),
                        )
                      : BorderedImageContainer(width: 128, imageUrl: data.episode.image),
                  if (data.episode.locked)
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
                            EpisodeDuration(duration: getFormattedDuration(data.episode.duration)),
                          ],
                        ),
                      ),
                    )),
                  if (getFeaturedTag(publishDate: data.episode.publishDate, locked: data.episode.locked) != null)
                    Positioned(
                      top: -4,
                      right: -4,
                      child: getFeaturedTag(publishDate: data.episode.publishDate, locked: data.episode.locked)!,
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Opacity(
                  opacity: data.episode.locked ? 0.5 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            data.episode.title,
                            style: BccmTextStyles.caption1.copyWith(color: BccmColors.label1),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (data.episode.ageRating != 'A')
                            Container(
                              margin: const EdgeInsets.only(right: 6),
                              height: 16,
                              padding: const EdgeInsets.only(right: 4, bottom: 2, left: 4),
                              decoration: BoxDecoration(
                                color: BccmColors.background2,
                                border: Border.all(
                                  width: 1,
                                  color: BccmColors.separatorOnLight,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Text(
                                getFormattedAgeRating(data.episode.ageRating),
                                style: BccmTextStyles.caption2.copyWith(color: BccmColors.onTint, height: 1.1),
                              ),
                            ),
                          if (data.episode.locked && publishDateTime != null)
                            Expanded(
                              child: Text(
                                S.of(context).availableFrom(DateFormat(DateFormat.YEAR_MONTH_DAY).format(publishDateTime)),
                                overflow: TextOverflow.fade,
                                style: BccmTextStyles.caption2.copyWith(color: BccmColors.label3),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              if (Env.enableStudy && data.lessonProgressOverview != null && !data.episode.locked)
                Opacity(
                  opacity: data.lessonProgressOverview!.locked ? 0.2 : 1,
                  child: Container(
                    padding: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: BccmColors.separatorOnLight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: LessonProgressTree(
                          completed: data.lessonProgressOverview!.progress.completed,
                          total: data.lessonProgressOverview!.progress.total,
                          outerStrokeWidth: 2,
                          innerStrokeWidth: 1.7,
                          arcToTreePadding: 7,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
