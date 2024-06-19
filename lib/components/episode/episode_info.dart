import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/badges/feature_badge.dart';
import 'package:brunstadtv_app/components/episode/episode_download_button.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/widget_keys.dart';
import 'package:brunstadtv_app/models/events.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/downloads.dart';
import '../../router/router.gr.dart';
import 'package:bccm_core/design_system.dart';
import '../misc/collapsable_markdown.dart';

class EpisodeInfo extends HookConsumerWidget {
  const EpisodeInfo(this.episode, {super.key, required this.onShareVideoTapped, this.extraChildren});

  final Query$FetchEpisode$episode episode;
  final void Function() onShareVideoTapped;
  final List<Widget>? extraChildren;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);

    final inMyList = useState(episode.inMyList);
    final showMyListButton = ref.read(authStateProvider.select((value) => value.isLoggedIn)) && inMyList.value != null;

    useEffect(() {
      inMyList.value = episode.inMyList;
      return null;
      // ignore: exhaustive_keys
    }, [episode.id, episode.inMyList]);

    void toggleInMyList() async {
      final previousValue = inMyList.value ?? false;
      Future? myListUpdateFuture;
      if (previousValue) {
        myListUpdateFuture = ref.read(bccmGraphQLProvider).mutate$removeEntryFromMyList(Options$Mutation$removeEntryFromMyList(
              variables: Variables$Mutation$removeEntryFromMyList(entryId: episode.uuid),
            ));
      } else {
        myListUpdateFuture = ref.read(bccmGraphQLProvider).mutate$addEpisodeToMyList(Options$Mutation$addEpisodeToMyList(
              variables: Variables$Mutation$addEpisodeToMyList(episodeId: episode.id),
            ));
      }
      inMyList.value = !previousValue;
      await myListUpdateFuture;
      globalEventBus.fire(MyListChangedEvent());
    }

    return Animate(
      effects: [
        FadeEffect(
          begin: 0,
          duration: 3000.ms,
          curve: Curves.easeOutExpo,
        ),
      ],
      child: Container(
        color: design.colors.background2,
        child: ClipRect(
          child: Animate(
            effects: [
              SlideEffect(
                begin: const Offset(0, 0.1),
                duration: 2000.ms,
                curve: Curves.easeOutExpo,
              ),
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Animate(
                        effects: [],
                        child: Text(
                          key: WidgetKeys.episodePageEpisodeTitle,
                          episode.title,
                          style: design.textStyles.title1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Animate(
                        effects: [],
                        child: Row(
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
                                  mouseCursor: WidgetStateMouseCursor.clickable,
                                  child: Center(
                                    child: Text(episode.season!.$show.title, style: design.textStyles.caption1.copyWith(color: design.colors.tint1)),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (episode.description.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CollapsableMarkdown(
                            text: episode.description,
                            style: design.textStyles.body2.copyWith(color: design.colors.label3),
                            maxLines: 2,
                          ),
                        ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (showMyListButton)
                            GestureDetector(
                              onTap: toggleInMyList,
                              behavior: HitTestBehavior.opaque,
                              child: FocusableActionDetector(
                                mouseCursor: WidgetStateMouseCursor.clickable,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4, right: 12),
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    switchInCurve: Curves.easeOutCirc,
                                    switchOutCurve: Curves.easeInCirc,
                                    child: inMyList.value == true
                                        ? SvgPicture.string(
                                            SvgIcons.heartFilled,
                                            key: ValueKey(inMyList.value),
                                            height: 24,
                                          )
                                        : SvgPicture.string(
                                            SvgIcons.heart,
                                            key: ValueKey(inMyList.value),
                                            height: 24,
                                            colorFilter: ColorFilter.mode(design.colors.tint1, BlendMode.srcIn),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          if (ref.read(featureFlagsProvider).shareVideoButton)
                            GestureDetector(
                              onTap: onShareVideoTapped,
                              behavior: HitTestBehavior.opaque,
                              child: FocusableActionDetector(
                                mouseCursor: WidgetStateMouseCursor.clickable,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4, left: showMyListButton ? 12 : 0, right: 12),
                                  child: SvgPicture.string(
                                    SvgIcons.share,
                                    colorFilter: ColorFilter.mode(design.colors.tint1, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                          const Spacer(),
                          if (ref.watch(downloadsEnabledProvider) && episode.streams.any((element) => element.downloadable))
                            EpisodeDownloadButton(episode: episode),
                        ],
                      ),
                      ...?extraChildren
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
