import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/badges/icon_badge.dart';
import 'package:brunstadtv_app/components/misc/collapsable_markdown.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/my_list.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/helpers/share_extension/share_extension.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/analytics/content_shared.dart';
import 'package:brunstadtv_app/models/analytics/misc.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_video_progress/smooth_video_progress.dart';
import 'package:video_player/video_player.dart';

class ShortView extends HookConsumerWidget {
  const ShortView({
    super.key,
    required this.short,
    required this.future,
    required this.videoController,
    required this.muted,
    required this.onMuteRequested,
  });

  final Fragment$Short? short;
  final Future<QueryResult<Query$getShorts>>? future;
  final VideoPlayerController? videoController;
  final bool muted;
  final void Function(bool) onMuteRequested;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);

    final isPlaying = useListenableSelector(Listenable.merge([videoController]), () => videoController?.value.isPlaying);
    final isInitialized = useListenableSelector(Listenable.merge([videoController]), () => videoController?.value.isInitialized ?? false);
    final playIconAnimation = useAnimationController(duration: 1000.ms);
    final loadingAnimation = useAnimationController(duration: 1000.ms);
    final dragLeftMostPosition = useRef<double?>(null);
    final dragRightMostPosition = useRef<double?>(null);
    return GestureDetector(
      onLongPress: () {
        debugPrint('SHRT: longpress');
        ref.read(analyticsProvider).interaction(InteractionEvent(
              interaction: 'long-press',
              pageCode: 'shorts',
              contextElementType: 'short',
              contextElementId: short?.id,
            ));
      },
      onHorizontalDragStart: (details) {
        dragLeftMostPosition.value = details.globalPosition.dx;
        dragRightMostPosition.value = details.globalPosition.dx;
      },
      onHorizontalDragCancel: () {
        dragLeftMostPosition.value = null;
        dragRightMostPosition.value = null;
      },
      onHorizontalDragEnd: (details) {
        if (dragLeftMostPosition.value == null || dragRightMostPosition.value == null) {
          dragLeftMostPosition.value = null;
          dragRightMostPosition.value = null;
          return;
        }
        final dragDistance = dragRightMostPosition.value! - dragLeftMostPosition.value!;

        debugPrint('SHRT: dragDistance: $dragDistance');

        if (dragDistance > 40) {
          debugPrint('SHRT: sending drag interaction: $dragDistance');
          ref.read(analyticsProvider).interaction(InteractionEvent(
                interaction: 'horizontal-drag',
                pageCode: 'shorts',
                contextElementType: 'short',
                contextElementId: short?.id,
                meta: {
                  'distance': dragDistance,
                },
              ));
        }
      },
      onHorizontalDragUpdate: (details) {
        if (dragLeftMostPosition.value == null || dragRightMostPosition.value == null) {
          return;
        }
        if (details.globalPosition.dx < dragLeftMostPosition.value!) {
          dragLeftMostPosition.value = details.globalPosition.dx;
        }
        if (details.globalPosition.dx > dragRightMostPosition.value!) {
          dragRightMostPosition.value = details.globalPosition.dx;
        }
      },
      onTap: () async {
        if (videoController == null) {
          return;
        }
        if (videoController!.value.isPlaying) {
          videoController!.pause();
          ref.read(analyticsProvider).interaction(InteractionEvent(
                interaction: 'pause',
                pageCode: 'shorts',
                contextElementType: 'short',
                contextElementId: short?.id,
              ));
        } else {
          videoController!.play();
          ref.read(analyticsProvider).interaction(InteractionEvent(
                interaction: 'play',
                pageCode: 'shorts',
                contextElementType: 'short',
                contextElementId: short?.id,
              ));
        }

        playIconAnimation.value = 1.0;
        await Future.delayed(500.ms);
        playIconAnimation.reverse(from: 1.0);
      },
      child: Stack(
        children: [
          if (videoController != null && isInitialized) VideoView(controller: videoController!),
          FadeTransition(
            opacity: CurvedAnimation(parent: playIconAnimation, curve: Curves.easeInOut, reverseCurve: Curves.easeOut),
            child: Center(
              child: isPlaying == false
                  ? SvgPicture.string(SvgIcons.pause, width: 52, height: 52)
                  : SvgPicture.string(SvgIcons.play, width: 52, height: 52),
            ),
          ),
          if (short == null || !isInitialized || videoController == null)
            Positioned.fill(
              child: Stack(
                children: [
                  Container(color: design.colors.background1),
                  Animate(
                    controller: loadingAnimation,
                    onPlay: (c) => c.repeat(),
                    effects: [
                      ShimmerEffect(
                        duration: 1000.ms,
                        color: design.colors.background2,
                      ),
                    ],
                    child: Container(color: design.colors.background1),
                  ),
                  const Center(child: LoadingIndicator()),
                ],
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
                    design.colors.background1.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (short != null) ShortInfo(title: short!.title, description: short!.description),
                              const SizedBox(height: 8),
                              Disclaimers(short: short),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: ShortActions(
                            short: short,
                            onMuteRequested: onMuteRequested,
                            muted: muted,
                            videoController: videoController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _Timeline(videoController: videoController)
            ],
          ),
        ],
      ),
    );
  }
}

class _Timeline extends HookWidget {
  const _Timeline({
    super.key,
    required this.videoController,
  });

  final VideoPlayerController? videoController;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 4,
          child: LayoutBuilder(builder: (context, constraints) {
            return Align(
              alignment: Alignment.bottomLeft,
              child: videoController == null
                  ? const SizedBox.shrink()
                  : SmoothVideoProgress(
                      controller: videoController!,
                      builder: (context, position, duration, child) {
                        if (duration.inMilliseconds == 0) {
                          return const SizedBox.shrink();
                        }
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: [
                                design.colors.separatorOnLight,
                                design.colors.separatorOnLight,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          width: constraints.maxWidth * clampDouble(position.inMilliseconds / duration.inMilliseconds, 0, 1),
                        );
                      }),
            );
          }),
        ),
      ],
    );
  }
}

class Disclaimers extends ConsumerWidget {
  const Disclaimers({
    super.key,
    required this.short,
  });

  final Fragment$Short? short;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final showAutoGenerated = ref.watch(featureFlagsProvider.select((value) => !value.shortsHideAutoGenerated));
    final showBeta = ref.watch(featureFlagsProvider.select((value) => !value.shortsHideBeta));
    return Row(
      children: [
        if (showAutoGenerated)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              ref.read(analyticsProvider).interaction(InteractionEvent(
                    interaction: 'pressed-auto-generated',
                    pageCode: 'shorts',
                    contextElementType: 'short',
                    contextElementId: short?.id,
                  ));
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Row(
                          children: [
                            SvgPicture.string(
                              SvgIcons.magic,
                              height: 24,
                              colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8),
                            Text(S.of(context).autoGenerated, style: design.textStyles.title3),
                          ],
                        ),
                        content: Text(S.of(context).shortsAiDisclaimer, style: design.textStyles.body2.copyWith(color: design.colors.label1)),
                      ));
            },
            child: SizedBox(
              height: 20,
              child: FittedBox(
                child: IconBadge(
                  color: design.colors.background1,
                  disableIconPadding: true,
                  iconHeight: 16,
                  icon: SvgPicture.string(
                    SvgIcons.magic,
                    colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                  ),
                  label: S.of(context).autoGenerated,
                ),
              ),
            ),
          ),
        if (showAutoGenerated) const SizedBox(width: 8),
        if (showBeta)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              ref.read(analyticsProvider).interaction(InteractionEvent(
                    interaction: 'pressed-beta',
                    pageCode: 'shorts',
                    contextElementType: 'short',
                    contextElementId: short?.id,
                  ));
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Row(
                    children: [
                      SvgPicture.string(
                        SvgIcons.magic,
                        height: 24,
                        colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 8),
                      Text(S.of(context).beta, style: design.textStyles.title3),
                    ],
                  ),
                  content: Text(S.of(context).betaExplanation, style: design.textStyles.body2.copyWith(color: design.colors.label1)),
                ),
              );
            },
            child: SizedBox(
              height: 20,
              child: FittedBox(
                child: IconBadge(
                  color: design.colors.background1,
                  disableIconPadding: true,
                  iconHeight: 16,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 2),
                    child: SvgPicture.string(
                      SvgIcons.infoCircle,
                      colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                    ),
                  ),
                  label: 'Beta',
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class ShortInfo extends StatelessWidget {
  const ShortInfo({
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title?.isNotEmpty == true)
            Text(
              title!,
              style: design.textStyles.body1.copyWith(color: design.colors.label1),
              textAlign: TextAlign.left,
            ),
          if (description?.isNotEmpty == true)
            CollapsableMarkdown(
              text: description!,
              style: design.textStyles.body2.copyWith(color: design.colors.label3),
              maxLines: 2,
            ),
        ], //.animate(interval: 100.ms).slideY(begin: 3, curve: Curves.easeOutExpo, duration: 1000.ms).fadeIn(),
      ),
    );
  }
}

class ShortActions extends HookConsumerWidget {
  const ShortActions({
    super.key,
    required this.short,
    required this.onMuteRequested,
    required this.muted,
    required this.videoController,
  });

  final Fragment$Short? short;
  final void Function(bool p1) onMuteRequested;
  final bool muted;
  final VideoPlayerController? videoController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final inMyList = useState(short?.inMyList ?? false);
    useEffect(() {
      if (short == null) {
        inMyList.value = false;
        return;
      }
      inMyList.value = short!.inMyList;
    }, [short]);
    final shortsSourceButtonPrimary = ref.watch(featureFlagsProvider.select((f) => f.shortsSourceButtonPrimary));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: design.buttons.large(
            variant: ButtonVariant.secondary,
            onPressed: () {
              if (short == null) return;
              ref.read(analyticsProvider).interaction(InteractionEvent(
                    interaction: 'favorite',
                    pageCode: 'shorts',
                    contextElementType: 'short',
                    contextElementId: short!.id,
                  ));
              if (inMyList.value) {
                ref.read(gqlClientProvider).mutate$removeEntryFromMyList(
                      Options$Mutation$removeEntryFromMyList(
                        variables: Variables$Mutation$removeEntryFromMyList(
                          entryId: short!.id,
                        ),
                      ),
                    );
              } else {
                ref.read(gqlClientProvider).mutate$addShortToMyList(
                      Options$Mutation$addShortToMyList(
                        variables: Variables$Mutation$addShortToMyList(
                          shortId: short!.id,
                        ),
                      ),
                    );
              }
              inMyList.value = !inMyList.value;
            },
            imagePosition: ButtonImagePosition.right,
            image: inMyList.value
                ? SvgPicture.string(
                    SvgIcons.heartFilled,
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                  )
                : SvgPicture.string(
                    SvgIcons.heart,
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                  ),
          ),
        ),
        if (ref.watch(featureFlagsProvider.select((value) => value.shortsSharing)))
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: design.buttons.large(
              variant: ButtonVariant.secondary,
              onPressed: () async {
                ref.read(analyticsProvider).interaction(InteractionEvent(
                      interaction: 'share',
                      pageCode: 'shorts',
                      contextElementType: 'short',
                      contextElementId: short?.id,
                    ));
                if (short == null) return;
                final shortUrl = 'https://app.bcc.media/shorts/${short!.id}';
                await Share().shareUrl(
                  shortUrl,
                  title: short!.title,
                  sharePositionOrigin: iPadSharePositionOrigin(context),
                );
                ref.read(analyticsProvider).contentShared(ContentSharedEvent(
                      elementId: short!.id,
                      elementType: 'short',
                      pageCode: 'shorts',
                      position: null,
                    ));
              },
              imagePosition: ButtonImagePosition.right,
              image: SvgPicture.string(
                SvgIcons.share,
                width: 32,
                height: 32,
                colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: design.buttons.large(
            variant: ButtonVariant.secondary,
            onPressed: () {
              onMuteRequested(!muted);
              ref.read(analyticsProvider).interaction(InteractionEvent(
                    interaction: muted ? 'unmute' : 'mute',
                    pageCode: 'shorts',
                    contextElementType: 'short',
                    contextElementId: short?.id,
                  ));
            },
            imagePosition: ButtonImagePosition.right,
            image: SvgPicture.string(
              muted ? SvgIcons.volumeMuted : SvgIcons.volume,
              width: 32,
              height: 32,
              colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
            ),
          ),
        ),
        design.buttons.large(
          variant: shortsSourceButtonPrimary ? ButtonVariant.primary : ButtonVariant.secondary,
          onPressed: () {
            ref.read(analyticsProvider).interaction(InteractionEvent(
                  interaction: 'open-source',
                  pageCode: 'shorts',
                  contextElementType: 'short',
                  contextElementId: short?.id,
                ));
            final ep = short?.source?.item.asOrNull<Fragment$Short$source$item$$Episode>();
            if (ep == null) return;
            final sourcePosition = short?.source?.start?.round() ?? 0;
            final shortPosition = videoController?.value.position.inSeconds ?? 0;
            context.router.navigate(
              EpisodeScreenRoute(
                episodeId: ep.id,
                autoplay: true,
                queryParamStartPosition: sourcePosition + shortPosition,
              ),
            );
            videoController?.pause();
          },
          imagePosition: ButtonImagePosition.right,
          image: SvgPicture.string(
            SvgIcons.chevronRight,
            width: 32,
            height: 32,
            colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
          ),
        ),
      ], //.animate(interval: 100.ms).slideY(begin: 1, curve: Curves.easeOutExpo, duration: 1000.ms).fadeIn(),
    );
  }
}

class VideoView extends HookWidget {
  const VideoView({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    final aspectRatio = useListenableSelector(Listenable.merge([controller]), () => controller.value.aspectRatio);

    return ClipRect(
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(color: Colors.black),
            OverflowBox(
              maxWidth: double.infinity,
              minHeight: constraints.maxHeight,
              maxHeight: constraints.maxHeight,
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: controller.value.isInitialized ? VideoPlayer(controller) : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
