import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/shorts/short_view.dart';
import 'package:brunstadtv_app/components/status/error_adaptive.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:brunstadtv_app/helpers/shorts/short_controller.dart';
import 'package:brunstadtv_app/providers/performance_class_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:universal_io/io.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class ShortScrollView extends HookConsumerWidget {
  const ShortScrollView({
    super.key,
    this.initialShortId,
  });

  final String? initialShortId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gqlClient = ref.watch(bccmGraphQLProvider);
    final shorts = useState<List<Fragment$Short>>([]);
    final nextCursor = useState<String?>(null);
    final muted = useState(false);
    final currentIndex = useState(0);
    final playerCount = useMemoized(() {
      final performanceClass = ref.read(androidPerformanceClassProvider).valueOrNull;
      if (Platform.isAndroid) {
        return performanceClass != null && performanceClass >= 12 ? 4 : 2;
      }
      return 4;
    }, []);

    fetchMore() async {
      final result = await gqlClient.query$getShorts(
        Options$Query$getShorts(
          variables: Variables$Query$getShorts(
            cursor: nextCursor.value,
            limit: 10,
            initialShortId: initialShortId,
          ),
          errorPolicy: initialShortId != null ? ErrorPolicy.none : ErrorPolicy.all,
        ),
      );
      if (!context.mounted) return result;

      nextCursor.value = result.parsedData?.shorts.nextCursor;
      final fetchedShorts = result.parsedData?.shorts.shorts;
      if (fetchedShorts == null) {
        return result;
      }

      shorts.value = [
        ...shorts.value,
        ...fetchedShorts,
      ];

      return result;
    }

    final fetchMoreFuture = useState<Future<QueryResult<Query$getShorts>>?>(null);
    final fetchMoreSnapshot = useFuture(fetchMoreFuture.value);

    final shortControllersState = useState<List<ShortController>>(
      useMemoized(
        () => List.unmodifiable(
          List.generate(
            playerCount,
            (_) => ShortController(ref),
          ),
        ),
      ),
    );
    final shortControllers = shortControllersState.value;

    final router = context.watchRouter;

    useOnAppLifecycleStateChange((previous, current) {
      if (current == AppLifecycleState.inactive) {
        for (final c in shortControllers) {
          c.player.pause();
        }
        WakelockPlus.disable();
      } else {
        WakelockPlus.enable();
      }
    });

    preloadNextAndPreviousFor(int index) async {
      if (!context.mounted) return;
      if (playerCount == 1) {
        debugPrint('SHRT: Player count is 1, not preloading next+previous');
        return;
      }

      final ignorePrevious = playerCount == 2;
      final nextPlayers = ignorePrevious ? 2 : playerCount - 1;
      for (var i = 1; i < nextPlayers; i++) {
        final next = index == shorts.value.length - 1 ? null : shorts.value.elementAtOrNull(index + i);
        if (next != null) {
          final nextControllerIndex = (index + i) % playerCount;
          final controller = shortControllers[nextControllerIndex];
          controller.setupShort(next);
        }
      }

      if (ignorePrevious) {
        debugPrint('SHRT: Not preloading previous');
        return;
      }

      final previous = index == 0 ? null : shorts.value.elementAtOrNull(index - 1);
      if (previous != null) {
        final previousControllerIndex = (index - 1) % playerCount;
        final controller = shortControllers[previousControllerIndex];
        controller.setupShort(previous);
      }
    }

    final tabOpenAnimation = useAnimationController(
      duration: 500.ms,
      initialValue: 0,
    );

    final isRouteActive = useIsRouteActive();
    final isRouteActiveRef = useRef(isRouteActive);
    final wasActive = useRef(false);

    useEffect(() {
      isRouteActiveRef.value = isRouteActive;
      if (isRouteActive) {
        debugPrint('SHRT: shorts view became active, playing');
        final player = shortControllers[currentIndex.value % playerCount].player;
        if (player.value.isInitialized) {
          shortControllers[currentIndex.value % playerCount].player.play();
        }
        preloadNextAndPreviousFor(currentIndex.value);
        tabOpenAnimation.forward();
        WakelockPlus.enable();
      } else if (wasActive.value) {
        debugPrint('SHRT: shorts view no longer active: pausing controllers');
        for (final c in shortControllers) {
          c.player.pause();
        }
        WakelockPlus.disable();
      }
      wasActive.value = isRouteActive;
    }, [isRouteActive]);

    bool okToAutoplay() => context.mounted && isRouteActiveRef.value && router.topMatch == context.routeData.route;

    setupCurrentController(int index, {required bool preloadNext}) async {
      if (!context.mounted) return;
      final previousIndex = (index - 1) % playerCount;
      final nextIndex = (index + 1) % playerCount;
      shortControllers[previousIndex].player.pause();
      shortControllers[nextIndex].player.pause();

      var currentShort = shorts.value.elementAtOrNull(index);
      if (currentShort == null) {
        await fetchMoreFuture.value;
        if (!context.mounted) return;
        currentShort = shorts.value.elementAtOrNull(index);
      }
      if (currentShort == null) {
        return;
      }

      gqlClient.mutate$setShortProgress(
        Options$Mutation$setShortProgress(
          variables: Variables$Mutation$setShortProgress(
            id: currentShort.id,
            progress: 0,
          ),
        ),
      );

      if (currentIndex.value != index) {
        return;
      }
      final controllerIndex = index % playerCount;
      debugPrint('SHRT: preparing short ${currentShort.id}');
      final controller = shortControllers[controllerIndex];
      await controller.setupShort(currentShort);
      if (currentIndex.value != index || !context.mounted) return;

      if (preloadNext) {
        Future.delayed(500.ms, () {
          if (!context.mounted) return;
          if (currentIndex.value != index) {
            return;
          }
          preloadNextAndPreviousFor(index);
        });
      }

      if ((controller.player.value.playbackPositionMs ?? 0) > 0) {
        await controller.player.seekTo(Duration.zero);
      }
      if (!okToAutoplay() || currentIndex.value != index) return;
      await controller.player.play();
      if (currentIndex.value != index) return;
    }

    setCurrentIndex(int index, {bool preloadNext = true}) {
      if (!context.mounted) return;
      currentIndex.value = index;
      for (var i = 0; i < shortControllers.length; i++) {
        shortControllers[i].isCurrent = i == index % shortControllers.length;
      }
      Future.delayed(300.ms, () {
        if (currentIndex.value != index) {
          return;
        }
        setupCurrentController(index, preloadNext: preloadNext);
      });
      if (currentIndex.value + 4 == shorts.value.length) {
        fetchMoreFuture.value = fetchMore();
      }
    }

    init() async {
      if (!context.mounted) return;
      if (shortControllersState.value.isEmpty) {
        shortControllersState.value = List.unmodifiable(List.generate(playerCount, (_) => ShortController(ref)));
      }
      currentIndex.value = 0;
      fetchMoreFuture.value = fetchMore();
      await fetchMoreFuture.value;
      setCurrentIndex(0, preloadNext: false);
    }

    dispose() {
      for (var c in shortControllers) {
        c.dispose();
      }
    }

    useEffect(() {
      init();
      return dispose;
    }, []);

    if ((fetchMoreSnapshot.hasError || fetchMoreSnapshot.data?.exception != null) && shorts.value.isEmpty) {
      return ErrorAdaptive(
        onRetry: () {
          fetchMoreFuture.value = fetchMore();
        },
        exception: fetchMoreSnapshot.data?.exception,
      );
    }

    return PreloadPageView.builder(
      scrollDirection: Axis.vertical,
      preloadPagesCount: playerCount > 1 ? 1 : 0,
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
      itemBuilder: (context, index) {
        if (!isRouteActive) {
          return const SizedBox();
        }

        return HookBuilder(builder: (context) {
          final shortController = shortControllers[index % playerCount];
          final currentlyPlayingShort = useListenableSelector(
            shortController.player,
            () => shortController.player.value.currentMediaItem?.metadata?.extras?[MetadataExtraConstants.shortId],
          );
          var short = useListenableSelector(shorts, () => shorts.value.elementAtOrNull(index));
          final wrongShortInController = currentlyPlayingShort == null || currentlyPlayingShort != short?.id;

          return ShortView(
            future: short == null ? fetchMoreFuture.value : null,
            short: wrongShortInController ? null : short,
            shortController: shortController,
            muted: muted.value,
            tabOpenAnimation: tabOpenAnimation,
            onReloadRequested: () async {
              if (short == null) return;
              await shortController.setupShort(short, forceReload: true);
              if (currentIndex.value == index) {
                if (!okToAutoplay()) return;
                await shortController.player.play();
              }
            },
            onMuteRequested: (value) {
              muted.value = value;
              for (final c in shortControllers) {
                c.player.setVolume(muted.value ? 0 : 1);
              }
            },
          );
        });
      },
    );
  }
}

class _CustomPageViewScrollPhysics extends ScrollPhysics {
  const _CustomPageViewScrollPhysics({super.parent});

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
