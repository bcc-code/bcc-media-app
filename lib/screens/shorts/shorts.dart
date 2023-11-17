import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:video_player/video_player.dart';

@RoutePage<void>()
class ShortsScreen extends HookConsumerWidget {
  const ShortsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final getShortsStartingEpisode = useQuery$getShortsStartingEpisode(Options$Query$getShortsStartingEpisode(
      cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
      fetchPolicy: FetchPolicy.networkOnly,
    ));
    final startingId = getShortsStartingEpisode.result.parsedData?.playlist.items.items.firstOrNull?.id;
    final shortsFuture = useMemoized(() {
      if (startingId == null) return null;
      return ref.watch(gqlClientProvider).query$getShortsFromStartingEpisode(
            Options$Query$getShortsFromStartingEpisode(
              variables: Variables$Query$getShortsFromStartingEpisode(id: startingId),
              cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
              fetchPolicy: FetchPolicy.networkOnly,
            ),
          );
    }, [startingId]);
    final shortsSnapshot = useFuture(shortsFuture);
    final streams = shortsSnapshot.data?.parsedData?.episode.next.whereType<Fragment$ShortsEpisode>();

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

    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) async {
          if (details.primaryVelocity == 0) return;
          if (details.primaryVelocity! > 0) {
            if (currentIndex.value > 0) {
              currentIndex.value--;
            }
          } else {
            final last = (streams?.length ?? 0) - 1;
            if (currentIndex.value == last) {
              currentIndex.value = 0;
              final thing = await getShortsStartingEpisode.fetchMore(
                FetchMoreOptions(
                  variables: {
                    'something': Random().nextInt(12),
                  },
                  updateQuery: (a, b) {
                    return b;
                  },
                ),
              );
            } else if (currentIndex.value < last) {
              currentIndex.value++;
            }
          }
        },
        child: Stack(
          children: [
            if (currentController != null) VideoView(controller: currentController),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: Container(
                  height: 40,
                  child: CustomBackButton(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.6),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (currentController != null) {
                              if (currentController.value.isPlaying) {
                                currentController.pause();
                              } else {
                                currentController.play();
                              }
                            }
                          },
                          child: isPlaying == true ? SvgPicture.string(SvgIcons.pause, width: 38, height: 38) : SvgPicture.string(SvgIcons.play),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
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
                          child: SvgPicture.string(SvgIcons.chevronRight, width: 32, height: 32),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
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
            child: Transform.scale(
              scale: 1.3,
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
