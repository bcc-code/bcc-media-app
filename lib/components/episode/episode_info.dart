import 'package:brunstadtv_app/components/feature_badge.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/brunstadtv.dart';
import '../../theme/design_system/design_system.dart';
import '../text_collapsible.dart';

class EpisodeInfo extends HookConsumerWidget {
  const EpisodeInfo(this.episode, {super.key, required this.onShareVideoTapped, this.extraChildren});

  final Query$FetchEpisode$episode episode;
  final void Function() onShareVideoTapped;
  final List<Widget>? extraChildren;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const showEpisodeNumber = false;
    final episodeNumberFormatted = '${S.of(context).seasonLetter}${episode.season?.number}:${S.of(context).episodeLetter}${episode.number}';
    final design = DesignSystem.of(context);

    final inMyList = useState(episode.inMyList);

    useEffect(() {
      inMyList.value = episode.inMyList;
      return null;
    }, [episode.id]);

    return Container(
      color: design.colors.background2,
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
                      Expanded(child: Text(key: WidgetKeys.episodePageEpisodeTitle, episode.title, style: design.textStyles.title1)),
                      GestureDetector(
                        onTap: () => toggleInMyList(ref, inMyList),
                        behavior: HitTestBehavior.opaque,
                        child: FocusableActionDetector(
                          mouseCursor: MaterialStateMouseCursor.clickable,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4, left: 6, right: 6),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 150),
                              child: SvgPicture.string(key: ValueKey(inMyList.value), inMyList.value ? SvgIcons.heartFilled : SvgIcons.heart),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onShareVideoTapped,
                        behavior: HitTestBehavior.opaque,
                        child: FocusableActionDetector(
                          mouseCursor: MaterialStateMouseCursor.clickable,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4, left: 6, right: 6),
                            child: SvgPicture.string(SvgIcons.share),
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
                          color: design.colors.background2,
                        ),
                      ),
                      if (episode.season?.$show.title != null)
                        Center(
                          child: Text(episode.season!.$show.title, style: design.textStyles.caption1.copyWith(color: design.colors.tint1)),
                        ),
                      if (showEpisodeNumber)
                        Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(episodeNumberFormatted, style: design.textStyles.caption1.copyWith(color: design.colors.label4)))
                    ],
                  ),
                  const SizedBox(height: 14.5),
                  if (episode.description.isNotEmpty)
                    TextCollapsible(
                      text: episode.description,
                      style: design.textStyles.body2.copyWith(color: design.colors.label3),
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

  toggleInMyList(WidgetRef ref, ValueNotifier inMyList) {
    final api = ref.read(apiProvider);
    if (inMyList.value) {
      api.removeEntryFromMyList(episode.uuid);
    } else {
      api.addEpisodeToMyList(episode.id);
    }
    inMyList.value = !inMyList.value;
  }
}
