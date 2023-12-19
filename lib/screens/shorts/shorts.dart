import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/shorts/short_view.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/shorts/short_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

const kPlayerCount = 4;

@RoutePage<void>()
class ShortsScreen extends HookConsumerWidget {
  const ShortsScreen({
    super.key,
    this.preventScroll = false,
  });

  final bool preventScroll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gqlClient = ref.watch(bccmGraphQLProvider);
    final shorts = useState<List<Fragment$Short>>([]);
    final nextCursor = useState<String?>(null);
    final muted = useState(false);
    final currentIndex = useState(0);
    final isMounted = useIsMounted();
    final isFirstOpen = useState(true);

    fetchMore() async {
      final result = await gqlClient.query$getShorts(
        Options$Query$getShorts(
          variables: Variables$Query$getShorts(cursor: nextCursor.value, limit: 10),
        ),
      );
      if (!isMounted()) return result;

      nextCursor.value = result.parsedData?.shorts.nextCursor;
      final fetchedShorts = result.parsedData?.shorts.shorts;
      if (fetchedShorts == null) {
        debugPrint('SHRT: fetchMore: no shorts');
        return result;
      }

      shorts.value = [
        ...shorts.value,
        ...fetchedShorts,
      ];

      return result;
    }

    final fetchMoreFuture = useState<Future<QueryResult<Query$getShorts>>?>(null);

    final shortControllersState =
        useState<List<ShortController>>(useMemoized(() => List.unmodifiable(List.generate(kPlayerCount, (_) => ShortController(ref)))));
    final shortControllers = shortControllersState.value;

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

    preloadNextAndPreviousFor(int index) async {
      if (!isMounted()) return;
      final previous = index == 0 ? null : shorts.value.elementAtOrNull(index - 1);
      if (previous != null) {
        final previousControllerIndex = (index - 1) % kPlayerCount;
        final controller = shortControllers[previousControllerIndex];
        controller.setupShort(previous, false);
      }

      for (var i = 1; i < 3; i++) {
        final next = index == shorts.value.length - 1 ? null : shorts.value.elementAtOrNull(index + i);
        if (next != null) {
          final nextControllerIndex = (index + i) % kPlayerCount;
          final controller = shortControllers[nextControllerIndex];
          controller.setupShort(next, false);
        }
      }
    }

    final tabOpenAnimation = useAnimationController(
      duration: 500.ms,
      initialValue: 0,
    );
    final isTabActive = useIsTabActive(
      onChange: (active) {
        if (active) {
          debugPrint('SHRT: tab became active');
          if (isFirstOpen.value) {
            debugPrint('SHRT: tab became active for the first time, playing');
            final player = shortControllers[currentIndex.value % kPlayerCount].player;
            if (player.value.isInitialized) {
              shortControllers[currentIndex.value % kPlayerCount].player.play();
            }
            preloadNextAndPreviousFor(currentIndex.value);
            tabOpenAnimation.forward();
            isFirstOpen.value = false;
          }
          return;
        }
        debugPrint('SHRT: tab no longer active: pausing controllers');
        for (final c in shortControllers) {
          c.player.pause();
        }
      },
    );

    setupCurrentController(int index, {required bool preloadNext}) async {
      if (!isMounted()) return;
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

      if (currentIndex.value != index) {
        debugPrint('SHRT: setupCurrentController index: $index: index changed, aborting');
        return;
      }
      final controllerIndex = index % kPlayerCount;
      debugPrint('SHRT: preparing short ${currentShort.id}');
      final controller = shortControllers[controllerIndex];
      await controller.setupShort(currentShort, true);
      if (currentIndex.value != index || !context.mounted) return;

      if (preloadNext) {
        Future.delayed(500.ms, () {
          if (!isMounted()) return;
          if (currentIndex.value != index) {
            debugPrint('SHRT: setupCurrentController index: $index: index changed, aborting');
            return;
          }
          preloadNextAndPreviousFor(index);
        });
      }

      if ((controller.player.value.playbackPositionMs ?? 0) > 0) {
        await controller.player.seekTo(Duration.zero);
      }
      if (!isMounted() || currentIndex.value != index || !isTabActive() || !pageIsActive.value) return;
      await controller.player.play();
      debugPrint('SHRT: short started playing in ${controller.player.value.playerId}');
      if (currentIndex.value != index) return;
    }

    setCurrentIndex(int index, {bool preloadNext = true}) {
      if (!isMounted()) return;
      currentIndex.value = index;
      debugPrint('SHRT: setCurrentIndex: $index');
      Future.delayed(300.ms, () {
        if (currentIndex.value != index) {
          debugPrint('SHRT: setCurrentIndex: $index: index changed, aborting');
          return;
        }
        setupCurrentController(index, preloadNext: preloadNext);
      });
      if (currentIndex.value + 4 == shorts.value.length) {
        debugPrint('SHRT: fetching more: close to end');
        fetchMoreFuture.value = fetchMore();
      }
    }

    init() async {
      if (!isMounted()) return;
      if (shortControllersState.value.isEmpty) {
        shortControllersState.value = List.unmodifiable(List.generate(kPlayerCount, (_) => ShortController(ref)));
      }
      currentIndex.value = 0;
      debugPrint('SHRT: fetching more: init');
      fetchMoreFuture.value = fetchMore();
      await fetchMoreFuture.value;
      setCurrentIndex(0, preloadNext: false);
      debugPrint('SHRT: shorts initialized');
    }

    dispose() {
      for (var c in shortControllers) {
        c.dispose();
      }
      shortControllersState.value = [];
    }

    useEffect(() {
      init();
      return dispose;
    }, []);

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
                  () => shortController.player.value.currentMediaItem?.metadata?.extras?[MetadataExtraConstants.shortId],
                );
                var short = useListenableSelector(shorts, () => shorts.value.elementAtOrNull(index));
                final wrongShortInController = currentlyPlayingShort == null || currentlyPlayingShort != short?.id;

                return ShortView(
                  future: short == null ? fetchMoreFuture.value : null,
                  short: wrongShortInController ? null : short,
                  videoController: shortController.player,
                  muted: muted.value,
                  tabOpenAnimation: tabOpenAnimation,
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
