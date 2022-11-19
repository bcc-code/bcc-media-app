import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../graphql/queries/search.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/utils.dart';
import '../l10n/app_localizations.dart';
import '../services/utils.dart';
import 'bordered_image_container.dart';
import 'episode_duration.dart';
import 'watched_badge.dart';

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
    String? image,
    int? seasonNumber,
    int? episodeNumber,
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
    final secondaryTitle = '${S.of(context).episode} ${data.episodeNumber}';
    final tertiaryTitle =
        data.episodeNumber != null ? '${S.of(context).seasonLetter}${data.seasonNumber}:${S.of(context).episodeLetter}${data.episodeNumber}' : null;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.navigateTo(EpisodeScreenRoute(episodeId: data.episodeId, autoplay: true)),
      child: Stack(
        children: [
          if (data.highlighted == true)
            Positioned.fill(
              child: Container(
                decoration:
                    BoxDecoration(border: const Border(left: BorderSide(color: BtvColors.tint2, width: 4)), color: BtvColors.tint2.withOpacity(0.1)),
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
                    BorderedImageContainer(width: 128, imageUrl: data.image),
                    /* isComingSoon(episode.availableFrom)
                        ? Opacity(
                            opacity: 0.5,
                            child:
                                BorderedImageContainer(imageUrl: sectionItem.image),
                          )
                        : BorderedImageContainer(imageUrl: sectionItem.image),
                    if (isComingSoon(episode.availableFrom))
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/Wait.png'),
                          ),
                        ),
                      ), */
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
                    /* if (featuredTag != null)
                      Positioned(
                        top: -4,
                        right: -4,
                        child: featuredTag!,
                      ), */
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.episodeNumber != null)
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(text: secondaryTitle, style: BtvTextStyles.caption2.copyWith(color: BtvColors.tint1)),
                            const WidgetSpan(child: SizedBox(width: 4)),
                            TextSpan(text: tertiaryTitle, style: BtvTextStyles.caption1)
                          ])),
                        ),
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
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
