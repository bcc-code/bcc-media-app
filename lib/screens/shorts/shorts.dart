import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

@RoutePage<void>()
class ShortsScreen extends HookWidget {
  const ShortsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    final shortsQuery = useQuery$getShorts();
    final streams = shortsQuery.result.parsedData?.playlist.items.items.whereType<Fragment$PlayableEpisode>();

    final controllers = useMemoized<List<VideoPlayerController>>(() => []);

    useEffect(() {
      if (streams == null) return;
      for (var stream in streams) {
        final url = stream.streams.getBestStreamUrl();
        final uri = Uri.tryParse(url);
        if (uri == null) continue;
        controllers.add(VideoPlayerController.networkUrl(uri));
      }
    }, [streams]);

    useEffect(
      () => () {
        for (var element in controllers) {
          element.dispose();
        }
        controllers.clear();
      },
      [],
    );

    final currentIndex = useState(0);
    final currentController = controllers.elementAtOrNull(currentIndex.value);

    useEffect(() {
      () async {
        if (currentController == null) return;
        await currentController.initialize();
        debugPrint('value $currentController?.value');
        final duration = currentController.value.duration.inSeconds > 0
            ? currentController.value.duration.inSeconds
            : streams?.elementAt(currentIndex.value).duration ?? 0;
        final sec = (duration / 4).round();
        debugPrint('sec $sec of $duration');
        await currentController.seekTo(Duration(seconds: sec));
        debugPrint('done');

        currentController.play();
      }();

      return () {
        currentController?.pause();
      };
    }, [currentController]);

    debugPrint('currentController ${currentController}');

    debugPrint('$streams');
    debugPrint('$controllers');

    final isPlaying = useListenableSelector(Listenable.merge([currentController]), () => currentController?.value.isPlaying);
    final playIconAnimation = useAnimationController(duration: 1000.ms);

    final muted = useListenableSelector(Listenable.merge([currentController]), () => currentController?.value.volume == 0);

    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          if (currentController == null) {
            return;
          }
          if (currentController.value.isPlaying) {
            currentController.pause();
          } else {
            currentController.play();
          }

          playIconAnimation.value = 1.0;
          await Future.delayed(500.ms);
          playIconAnimation.reverse(from: 1.0);
        },
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity == 0) return;
          if (details.primaryVelocity! > 0) {
            if (currentIndex.value > 0) {
              currentIndex.value--;
            }
          } else {
            final last = (streams?.length ?? 0) - 1;
            if (currentIndex.value == last) {
              currentIndex.value = 0;
            } else if (currentIndex.value < last) {
              currentIndex.value++;
            }
          }
        },
        child: Stack(
          children: [
            if (currentController != null) VideoView(controller: currentController),
            const Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: SizedBox(
                  height: 40,
                  child: CustomBackButton(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: CurvedAnimation(parent: playIconAnimation, curve: Curves.easeInOut, reverseCurve: Curves.easeOut),
              child: Center(
                child: isPlaying == false
                    ? SvgPicture.string(SvgIcons.pause, width: 52, height: 52)
                    : SvgPicture.string(SvgIcons.play, width: 52, height: 52),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 500,
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: SafeArea(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Intervjuer', style: design.textStyles.title1.copyWith(color: design.colors.label1)),
                          Text('Magazine 11. November', style: design.textStyles.body2.copyWith(color: design.colors.label1)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24, right: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      design.buttons.large(
                        variant: ButtonVariant.secondary,
                        onPressed: () {},
                        imagePosition: ButtonImagePosition.right,
                        image: SvgPicture.string(
                          SvgIcons.heart,
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(height: 12),
                      design.buttons.large(
                        variant: ButtonVariant.secondary,
                        onPressed: () {
                          // share
                        },
                        imagePosition: ButtonImagePosition.right,
                        image: SvgPicture.string(
                          SvgIcons.share,
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(height: 12),
                      design.buttons.large(
                        variant: ButtonVariant.secondary,
                        onPressed: () {
                          currentController?.setVolume(muted ? 1 : 0);
                        },
                        imagePosition: ButtonImagePosition.right,
                        image: SvgPicture.string(
                          muted ? SvgIcons.volumeMuted : SvgIcons.volume,
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(height: 12),
                      design.buttons.large(
                        variant: ButtonVariant.secondary,
                        onPressed: () {
                          final ep = streams?.elementAtOrNull(currentIndex.value);
                          if (ep == null) return;
                          context.router.navigate(
                            EpisodeScreenRoute(
                              episodeId: ep.id,
                              autoplay: true,
                              queryParamStartPosition: currentController?.value.position.inSeconds,
                            ),
                          );
                          currentController?.pause();
                        },
                        imagePosition: ButtonImagePosition.right,
                        image: SvgPicture.string(
                          SvgIcons.chevronRight,
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Container(color: Colors.black),
          OverflowBox(
            maxWidth: double.infinity,
            minHeight: constraints.maxHeight,
            maxHeight: constraints.maxHeight,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 40, sigmaX: 40),
              child: Container(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(150, 0),
              child: Transform.scale(
                scale: 3.5,
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
