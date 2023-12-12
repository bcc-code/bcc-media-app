import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/shorts/short_view.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/helpers/debouncer.dart';
import 'package:brunstadtv_app/helpers/hooks/use_route_aware.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/models/analytics/misc.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:universal_io/io.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

const kPlayerCount = 4;

class ShortController {
  late final BccmPlayerController player;
  ShortController() {
    player = BccmPlayerController.empty(bufferMode: BufferMode.fastStartShortForm);
    player.initialize().then((_) {
      if (!Platform.isAndroid) return;
      player.switchToVideoTexture().then((t) {
        _texture = t;
      });
    });
  }

  Future<void>? currentSetupFuture;
  Fragment$Short? short;
  BccmTexture? _texture;
  int replayCount = 0;

  void dispose() {
    player.dispose();
    _texture?.dispose();
  }
}

@RoutePage<void>()
class ShortScreen extends StatelessWidget {
  const ShortScreen({
    super.key,
    @PathParam() required this.id,
    @QueryParam() this.preventScroll = true,
  });

  final String id;
  final bool preventScroll;

  @override
  Widget build(BuildContext context) {
    return ShortsScreen(id: id, preventScroll: preventScroll);
  }
}

@RoutePage<void>()
class ShortsScreen extends HookConsumerWidget {
  const ShortsScreen({
    super.key,
    this.id,
    this.preventScroll = false,
  });

  final String? id;
  final bool preventScroll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gqlClient = ref.watch(gqlClientProvider);
    final shorts = useState<List<Fragment$Short>>([]);
    final nextCursor = useState<String?>(null);
    final muted = useState(false);
    final currentIndex = useState(0);
    final isMounted = useIsMounted();
    final progressDebouncer = useMemoized(() => Debouncer(milliseconds: 1000), []);
    final isFirstLoad = useState(true);

    debugPrint('SHRT: Short deeplink: $id');

    final deepLinkShortFuture = useMemoized(
      () => id == null ? null : gqlClient.query$getShort(Options$Query$getShort(variables: Variables$Query$getShort(id: id!))),
      [id],
    );
    final deepLinkShortSnapshot = useFuture(deepLinkShortFuture);

    fetchMore() async {
      final result = await gqlClient.query$getShorts(
        Options$Query$getShorts(
          variables: Variables$Query$getShorts(cursor: nextCursor.value, limit: 10),
        ),
      );
      if (!isMounted()) return result;

      nextCursor.value = result.parsedData?.shorts.nextCursor;
      shorts.value = [
        ...shorts.value,
        ...result.parsedData?.shorts.shorts ?? [],
      ];

      return result;
    }

    final fetchMoreFuture = useState<Future<QueryResult<Query$getShorts>>?>(null);

    final shortControllers = useMemoized<List<ShortController>>(
      () => List.unmodifiable(List.generate(4, (_) => ShortController())),
    );

    final router = context.watchRouter;
    final pageIsActive = useState(true);

    useOnAppLifecycleStateChange((previous, current) {
      if (current == AppLifecycleState.inactive) {
        debugPrint('SHRT: app inactive: pausing controllers');
        for (final c in shortControllers) {
          c.player.pause();
        }
        WakelockPlus.disable();
      } else {
        WakelockPlus.enable();
      }
    });

    useEffect(() {
      void listener() {
        final previousValue = pageIsActive.value;
        final newValue = router.currentSegments.any((r) => r.name == context.routeData.name);
        if (previousValue && !newValue) {
          debugPrint('SHRT: page no longer active, pausing controllers');
          for (final c in shortControllers) {
            c.player.pause();
          }
          WakelockPlus.disable();
        } else if (!previousValue && newValue) {
          debugPrint('SHRT: page became active');
          WakelockPlus.enable();
        }
        pageIsActive.value = newValue;
      }

      router.addListener(listener);
      return () => router.removeListener(listener);
    });

    final isTabActive = useIsTabActive(
      onChange: (active) {
        if (active) return;
        debugPrint('SHRT: tab no longer active: pausing controllers');
        for (final c in shortControllers) {
          c.player.pause();
        }
      },
    );

    setupVideo(int controllerIndex, Fragment$Short short, bool current) async {
      final controller = shortControllers[controllerIndex];

      if (controller.short?.id == short.id) {
        debugPrint('SHRT: controller already configured for index $controllerIndex');
        await controller.currentSetupFuture;
        return;
      }
      controller.short = short;
      final f = controller.currentSetupFuture = () async {
        debugPrint('SHRT: initializing controller for index $controllerIndex, current: $current');
        final url = short.streams.getBestStreamUrl();
        final uri = Uri.tryParse(url);
        if (uri == null) {
          debugPrint('SHRT: invalid url: $url');
          // shorts.value.removeWhere((element) => element.id == short.id);
          return;
        }

        if (!context.mounted) return;
        await controller.player.replaceCurrentMediaItem(
          MediaItem(
            url: url,
            metadata: MediaMetadata(
              title: short.title,
              artist: S.of(context).shortsTab,
              extras: {
                'shortId': short.id,
                'npaw.content.id': short.id,
                'npaw.content.type': 'short',
              },
            ),
          ),
          autoplay: false,
        );
        debugPrint("${controller.player.value.playerId} done with replaceCurrentMediaItem");
        if (!context.mounted) return;

        controller.player.setMixWithOthers(true);
        controller.player.setRepeatMode(RepeatMode.one);
        controller.player.setVolume(muted.value ? 0 : 1);
      }();

      await f;

      var previousPosition = 0;
      var initialSent = false;
      var wasPlaying = controller.player.value.playbackState == PlaybackState.playing;
      var mightLoopSoon = false;

      /*  controller.addListener(() {
        if (!isMounted()) return;
        final value = controller.value;
        final gqlClient = ref.read(gqlClientProvider);
        final playbackSeconds = (value.playbackPositionMs ?? 0.0) / 1000;
        if (value.playbackState == PlaybackState.playing) {
          progressDebouncer.run(() {
            gqlClient.mutate$setShortProgress(
              Options$Mutation$setShortProgress(
                variables: Variables$Mutation$setShortProgress(
                  id: short.id,
                  progress: playbackSeconds,
                ),
              ),
            );
          });
        }
        ref.read(analyticsProvider).heyJustHereToTellYouIBelieveTheSessionIsStillAlive();

        if (!mightLoopSoon && value.position.inSeconds > value.duration.inSeconds - 2) {
          mightLoopSoon = true;
        }

        if (mightLoopSoon && value.position.inSeconds < 2 && previousPosition > value.position.inSeconds) {
          // looped
          debugPrint(
              'SHRT: listener y - short ${short.id} looped. Sending stop for play ${pair.replayCount} and start for play ${pair.replayCount + 1}');
          ref.read(analyticsProvider).shortStopped(ShortStoppedEvent(
                shortId: short.id,
                shortTitle: short.title,
                positionFraction: previousPosition / max(1, value.duration.inSeconds),
                positionSeconds: previousPosition,
                replayCount: pair.replayCount,
              ));
          pair.replayCount++;
          ref.read(analyticsProvider).shortStarted(
                ShortStartedEvent(
                  shortId: short.id,
                  shortTitle: short.title,
                  replayCount: pair.replayCount,
                  resumed: false,
                  positionFraction: 0,
                  positionSeconds: 0,
                ),
              );
          mightLoopSoon = false;
        }
        previousPosition = value.position.inSeconds;

        // We ignore start/stop analytics on the first second of playback because of glitches in the player
        if (value.position.inSeconds > 1 && wasPlaying != value.isPlaying) {
          if (value.isPlaying) {
            // started
            debugPrint('SHRT: listener y - short ${short.id} started. Sending start for play ${pair.replayCount}');
            ref.read(analyticsProvider).shortStarted(
                  ShortStartedEvent(
                    shortId: short.id,
                    shortTitle: short.title,
                    replayCount: pair.replayCount,
                    resumed: !initialSent,
                    positionFraction: value.position.inSeconds / max(1, value.duration.inSeconds),
                    positionSeconds: value.position.inSeconds,
                  ),
                );
            initialSent = true;
          } else {
            debugPrint('SHRT: listener y - short ${short.id} paused/stopped. Sending stop for play ${pair.replayCount}');
            ref.read(analyticsProvider).shortStopped(ShortStoppedEvent(
                  shortId: short.id,
                  shortTitle: short.title,
                  positionFraction: value.position.inSeconds / value.duration.inSeconds,
                  positionSeconds: value.position.inSeconds,
                  replayCount: pair.replayCount,
                ));
          }

          debugPrint('SHRT: listener - short ${short.id} playing changed from $wasPlaying to ${value.isPlaying}');
          wasPlaying = value.isPlaying;
        }
      }); */
    }

    setupNextAndPreviousControllersForIndex(int index) async {
      if (!isMounted()) return;
      final previous = index == 0 ? null : shorts.value.elementAtOrNull(index - 1);
      if (previous != null) {
        final previousControllerIndex = (index - 1) % kPlayerCount;
        setupVideo(previousControllerIndex, previous, false);
      }

      for (var i = 1; i < 3; i++) {
        final next = index == shorts.value.length - 1 ? null : shorts.value.elementAtOrNull(index + i);
        if (next != null) {
          final nextControllerIndex = (index + i) % kPlayerCount;
          setupVideo(nextControllerIndex, next, false);
        }
      }
    }

    setupCurrentController() async {
      if (!isMounted()) return;
      final index = currentIndex.value;
      final previousIndex = (index - 1) % kPlayerCount;
      final nextIndex = (index + 1) % kPlayerCount;
      shortControllers[previousIndex].player.pause();
      shortControllers[nextIndex].player.pause();

      debugPrint('SHRT: setupCurrentController index: $index');
      var currentShort = shorts.value.elementAtOrNull(index);
      if (currentShort == null) {
        debugPrint('SHRT: no short for index $index, waiting for fetchMoreFuture');
        await fetchMoreFuture.value;
        if (!context.mounted) return;
        currentShort = shorts.value.elementAtOrNull(index);
      }
      if (currentShort == null) {
        debugPrint('SHRT: no short for index $index');
        return;
      }
      if (currentIndex.value != index) {
        debugPrint('SHRT: setupCurrentController index: $index: index changed, aborting');
        return;
      }

      gqlClient
          .mutate$setShortProgress(
            Options$Mutation$setShortProgress(
              variables: Variables$Mutation$setShortProgress(
                id: currentShort.id,
                progress: 0,
              ),
            ),
          )
          .then((_) => debugPrint('SHRT: short set progress to 0'));

      final controllerIndex = index % kPlayerCount;
      debugPrint('SHRT: short ${currentShort.id} url: ${currentShort.streams.getBestStreamUrl()}');
      await setupVideo(controllerIndex, currentShort, true);
      if (currentIndex.value != index || !context.mounted) return;

      final controller = shortControllers[controllerIndex];
      final delay = isFirstLoad.value ? 1500.ms : 500.ms;
      isFirstLoad.value = false;
      Future.delayed(delay, () {
        if (!isMounted()) return;
        if (currentIndex.value != index) {
          debugPrint('SHRT: setupCurrentController index: $index: index changed, aborting');
          return;
        }
        setupNextAndPreviousControllersForIndex(index);
      });

      if ((controller.player.value.playbackPositionMs ?? 0) > 0) {
        await controller.player.seekTo(Duration.zero);
      }
      if (!isMounted() || currentIndex.value != index || !isTabActive() || !pageIsActive.value) return;
      await controller.player.play();
      debugPrint('SHRT: short started playing in ${controller.player.value.playerId}');
      if (currentIndex.value != index) return;
    }

    setCurrentIndex(int index) {
      if (!isMounted()) return;
      currentIndex.value = index;
      debugPrint('SHRT: setCurrentIndex: $index');
      Future.delayed(300.ms, () {
        if (currentIndex.value != index) {
          debugPrint('SHRT: setCurrentIndex: $index: index changed, aborting');
          return;
        }
        setupCurrentController();
      });
      if (currentIndex.value + 4 == shorts.value.length) {
        debugPrint('SHRT: fetching more: close to end');
        fetchMoreFuture.value = fetchMore();
      }
    }

    init() async {
      if (!isMounted()) return;
      currentIndex.value = 0;
      final short = (await deepLinkShortFuture)?.parsedData?.short;
      if (short != null) {
        shorts.value = [short];
      }
      debugPrint('SHRT: fetching more: init');
      fetchMoreFuture.value = fetchMore();
      await fetchMoreFuture.value;
      setCurrentIndex(0);
      debugPrint('SHRT: shorts initialized');
    }

    dispose() {
      for (var c in shortControllers) {
        c.dispose();
      }
    }

    useEffect(() {
      init();
      return dispose;
    }, [id]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          PreloadPageView.builder(
            scrollDirection: Axis.vertical,
            preloadPagesCount: 1,
            onPageChanged: (index) {
              final previous = shorts.value.elementAtOrNull(currentIndex.value)?.id;
              debugPrint('SHRT: nav $previous -> ${shorts.value.elementAtOrNull(index)?.id}');
              if (index == currentIndex.value) return;
              ref.read(analyticsProvider).interaction(InteractionEvent(
                    interaction: index > currentIndex.value ? 'swipe-next' : 'swipe-previous',
                    pageCode: 'shorts',
                    contextElementType: 'short',
                    contextElementId: previous,
                    meta: {
                      'nextShortId': shorts.value.elementAtOrNull(index)?.id,
                    },
                  ));
              setCurrentIndex(index);
            },
            physics: const _CustomPageViewScrollPhysics(),
            itemCount: preventScroll ? 1 : null,
            itemBuilder: (context, index) {
              return HookBuilder(builder: (context) {
                // Say index == 2 and we want to have a bool indicating that we

                final shortController = shortControllers[index % kPlayerCount];
                final currentlyPlayingShort = useListenableSelector(
                  shortController.player,
                  () => shortController.player.value.currentMediaItem?.metadata?.extras?['shortId'],
                );
                var short = useListenableSelector(shorts, () => shorts.value.elementAtOrNull(index));
                final wrongShortInController = currentlyPlayingShort == null || currentlyPlayingShort != short?.id;

                return ShortView(
                  future: short == null ? fetchMoreFuture.value : null,
                  short: wrongShortInController ? null : short,
                  videoController: shortController.player,
                  muted: muted.value,
                  onMuteRequested: (value) {
                    muted.value = value;
                    for (final c in shortControllers) {
                      c.player.setVolume(muted.value ? 0 : 1);
                    }
                  },
                );
              });
            },
          ),
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
        ],
      ),
    );
  }
}

class _CustomPageViewScrollPhysics extends ScrollPhysics {
  const _CustomPageViewScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  _CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 100,
        stiffness: 1,
        damping: 1,
      );
}
