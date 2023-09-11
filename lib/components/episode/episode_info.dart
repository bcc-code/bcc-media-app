import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/badges/feature_badge.dart';
import 'package:brunstadtv_app/components/episode/episode_download_sheet.dart';
import 'package:brunstadtv_app/components/misc/parental_gate.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/queries/my_list.graphql.dart';
import '../../helpers/event_bus.dart';
import '../../models/events/my_list_changed.dart';
import '../../router/router.gr.dart';
import '../../theme/design_system/design_system.dart';
import '../misc/text_collapsible.dart';

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
      // ignore: exhaustive_keys
    }, [episode.id, episode.inMyList]);

    void toggleInMyList() async {
      final previousValue = inMyList.value ?? false;
      Future? myListUpdateFuture;
      if (previousValue) {
        myListUpdateFuture = ref.read(gqlClientProvider).mutate$removeEntryFromMyList(Options$Mutation$removeEntryFromMyList(
              variables: Variables$Mutation$removeEntryFromMyList(entryId: episode.uuid),
            ));
      } else {
        myListUpdateFuture = ref.read(gqlClientProvider).mutate$addEpisodeToMyList(Options$Mutation$addEpisodeToMyList(
              variables: Variables$Mutation$addEpisodeToMyList(episodeId: episode.id),
            ));
      }
      inMyList.value = !previousValue;
      await myListUpdateFuture;
      globalEventBus.fire(MyListChangedEvent());
    }

    final inMyListValue = inMyList.value;
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
                      if (ref.read(authStateProvider.select((value) => value.auth0AccessToken != null)) && inMyListValue != null)
                        GestureDetector(
                          onTap: toggleInMyList,
                          behavior: HitTestBehavior.opaque,
                          child: FocusableActionDetector(
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, left: 6, right: 6),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 150),
                                child: SvgPicture.string(key: ValueKey(inMyListValue), inMyListValue ? SvgIcons.heartFilled : SvgIcons.heart),
                              ),
                            ),
                          ),
                        ),
                      if (ref.read(featureFlagsProvider).download) _DownloadButton(episode: episode),
                      if (ref.read(featureFlagsProvider).shareVideoButton)
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
                        GestureDetector(
                          onTap: () => context.pushRoute(EpisodeScreenRoute(episodeId: episode.id)),
                          child: FocusableActionDetector(
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            child: Center(
                              child: Text(episode.season!.$show.title, style: design.textStyles.caption1.copyWith(color: design.colors.tint1)),
                            ),
                          ),
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
}

class _DownloadButton extends StatelessWidget {
  const _DownloadButton({
    required this.episode,
  });

  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!await checkParentalGate(context)) {
          return;
        }
        if (!context.mounted) return;
        showModalBottomSheet(
          useRootNavigator: true,
          context: context,
          builder: (ctx) => EpisodeDownloadSheet(
            episode: episode,
            parentContext: context,
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: FocusableActionDetector(
        mouseCursor: MaterialStateMouseCursor.clickable,
        child: Padding(
          padding: const EdgeInsets.only(top: 4, left: 6, right: 6),
          child: SvgPicture.string(SvgIcons.download),
        ),
      ),
    );
  }
}
