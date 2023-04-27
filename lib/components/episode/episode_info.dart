import 'package:brunstadtv_app/components/feature_badge.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../text_collapsible.dart';

class EpisodeInfo extends StatelessWidget {
  const EpisodeInfo(this.episode, {super.key, required this.onShareVideoTapped, this.extraChildren});

  final Query$FetchEpisode$episode episode;
  final void Function() onShareVideoTapped;
  final List<Widget>? extraChildren;

  @override
  Widget build(BuildContext context) {
    const showEpisodeNumber = false;
    final episodeNumberFormatted = '${S.of(context).seasonLetter}${episode.season?.number}:${S.of(context).episodeLetter}${episode.number}';

    return Container(
      color: BccmColors.background2,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 800),
        alignment: Alignment.topCenter,
        curve: Curves.easeOutExpo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text(key: WidgetKeys.episodePageEpisodeTitle, episode.title, style: BccmTextStyles.title1)),
                      GestureDetector(
                        onTap: onShareVideoTapped,
                        behavior: HitTestBehavior.opaque,
                        child: FocusableActionDetector(
                          mouseCursor: MaterialStateMouseCursor.clickable,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4, left: 16),
                            child: SvgPicture.string(SvgIcons.share, color: BccmColors.label3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3, right: 4),
                        child: FeatureBadge(
                          label: getFormattedAgeRating(episode.ageRating),
                          color: BccmColors.background2,
                        ),
                      ),
                      if (episode.season?.$show.title != null)
                        Center(
                          child: Text(episode.season!.$show.title, style: BccmTextStyles.caption1.copyWith(color: BccmColors.tint1)),
                        ),
                      if (showEpisodeNumber)
                        Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(episodeNumberFormatted, style: BccmTextStyles.caption1.copyWith(color: BccmColors.label4)))
                    ],
                  ),
                  const SizedBox(height: 14.5),
                  if (episode.description.isNotEmpty)
                    TextCollapsible(
                      text: episode.description,
                      style: BccmTextStyles.body2.copyWith(color: BccmColors.label3),
                      maxLines: 2,
                    ),
                  ...?extraChildren
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
