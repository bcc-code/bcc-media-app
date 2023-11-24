import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/misc/collapsable_markdown.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/my_list.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/helpers/share_extension/share_extension.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
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

    return GestureDetector(
      onTap: () async {
        if (videoController == null) {
          return;
        }
        if (videoController!.value.isPlaying) {
          videoController!.pause();
        } else {
          videoController!.play();
        }

        playIconAnimation.value = 1.0;
        await Future.delayed(500.ms);
        playIconAnimation.reverse(from: 1.0);
      },
      child: Stack(
        children: [
          if (videoController != null) VideoView(controller: videoController!),
          FadeTransition(
            opacity: CurvedAnimation(parent: playIconAnimation, curve: Curves.easeInOut, reverseCurve: Curves.easeOut),
            child: Center(
              child: isPlaying == false
                  ? SvgPicture.string(SvgIcons.pause, width: 52, height: 52)
                  : SvgPicture.string(SvgIcons.play, width: 52, height: 52),
            ),
          ),
          if (short == null || !isInitialized)
            Positioned.fill(
              child: Stack(
                children: [
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
            )
          else ...[
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ShortInfo(title: short!.title, description: short!.description),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ShortActions(
                          short: short!,
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
          ]
        ],
      ),
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

  final Fragment$Short short;
  final void Function(bool p1) onMuteRequested;
  final bool muted;
  final VideoPlayerController? videoController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final inMyList = useState(short.inMyList);
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
              if (inMyList.value) {
                ref.read(gqlClientProvider).mutate$removeEntryFromMyList(
                      Options$Mutation$removeEntryFromMyList(
                        variables: Variables$Mutation$removeEntryFromMyList(
                          entryId: short.id,
                        ),
                      ),
                    );
              } else {
                ref.read(gqlClientProvider).mutate$addShortToMyList(
                      Options$Mutation$addShortToMyList(
                        variables: Variables$Mutation$addShortToMyList(
                          shortId: short.id,
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
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: design.buttons.large(
            variant: ButtonVariant.secondary,
            onPressed: () async {
              final shortUrl = 'https://app.bcc.media/shorts/${short.id}';
              await Share().shareUrl(
                shortUrl,
                title: short.title,
                sharePositionOrigin: iPadSharePositionOrigin(context),
              );
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
          variant: ButtonVariant.secondary,
          onPressed: () {
            final ep = short.source?.item.asOrNull<Fragment$Short$source$item$$Episode>();
            if (ep == null) return;
            final sourcePosition = short.source?.start?.round() ?? 0;
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
