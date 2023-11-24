import 'package:async/async.dart';
import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/shorts/short_view.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/helpers/debouncer.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class ShortsVideoController {
  ShortsVideoController({
    required this.controller,
    required this.short,
  });

  final VideoPlayerController controller;
  final Fragment$Short short;
}

@RoutePage<void>()
class ShortsScreen extends HookConsumerWidget {
  const ShortsScreen({
    super.key,
    @PathParam() this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final gqlClient = ref.watch(gqlClientProvider);
    final shorts = useState<List<Fragment$Short>>([]);
    final nextCursor = useState<String?>(null);
    final muted = useState(false);
    final pageController = usePageController();
    final currentIndex = useState(0);
    final isMounted = useIsMounted();
    final progressDebouncer = useMemoized(() => Debouncer(milliseconds: 1000), []);

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

    final shortControllerPairs = useMemoized<List<ValueNotifier<ShortsVideoController?>>>(
      () => List.unmodifiable(List.generate(3, (_) => ValueNotifier<ShortsVideoController?>(null))),
    );
    for (final l in shortControllerPairs) {
      //ignore: nested_hooks
      useListenable(l);
    }

    initializeController(int index, Fragment$Short short) async {
      final existing = shortControllerPairs[index].value;
      if (existing != null && existing.short.id == short.id) {
        debugPrint('SHRT: controller for index $index already initialized, pausing');
        existing.controller.pause();
        return;
      } else if (existing != null) {
        debugPrint('SHRT: disposing controller for index $index');
        existing.controller.pause();
        existing.controller.dispose();
        shortControllerPairs[index].value = null;
      }

      debugPrint('SHRT: initializing controller for index $index');
      final url = short.streams.getBestStreamUrl();
      final uri = Uri.tryParse(url);
      if (uri == null) {
        debugPrint('SHRT: invalid url: $url');
        // shorts.value.removeWhere((element) => element.id == short.id);
        return;
      }
      final controller = VideoPlayerController.networkUrl(uri, videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
      shortControllerPairs[index].value = ShortsVideoController(controller: controller, short: short);
      await controller.initialize();
      controller.setLooping(true);
      controller.setVolume(muted.value ? 0 : 1);

      controller.addListener(() {
        if (!isMounted()) return;
        final gqlClient = ref.read(gqlClientProvider);
        progressDebouncer.run(() {
          gqlClient.mutate$setShortProgress(
            Options$Mutation$setShortProgress(
              variables: Variables$Mutation$setShortProgress(
                id: short.id,
                progress: controller.value.position.inSeconds.toDouble(),
              ),
            ),
          );
        });
      });
    }

    setupNextAndPreviousControllersForIndex(int index) async {
      if (!isMounted()) return;
      final previous = index == 0 ? null : shorts.value.elementAtOrNull(index - 1);
      if (previous != null) {
        final previousControllerIndex = (index - 1) % 3;
        initializeController(previousControllerIndex, previous);
      }

      final next = index == shorts.value.length - 1 ? null : shorts.value.elementAtOrNull(index + 1);
      if (next != null) {
        final nextControllerIndex = (index + 1) % 3;
        initializeController(nextControllerIndex, next);
      }
    }

    setupCurrentController() async {
      if (!isMounted()) return;
      final index = currentIndex.value;
      final previousIndex = (index - 1) % 3;
      final nextIndex = (index + 1) % 3;
      shortControllerPairs[previousIndex].value?.controller.pause();
      shortControllerPairs[nextIndex].value?.controller.pause();

      debugPrint('SHRT: setupCurrentController index: $index');
      final currentShort = shorts.value.elementAtOrNull(index);
      if (currentShort == null) {
        debugPrint('SHRT: no short for index $index');
        return;
      }
      final controllerIndex = index % 3;
      await initializeController(controllerIndex, currentShort);
      final controller = shortControllerPairs[controllerIndex].value;
      if (controller == null) {
        debugPrint('SHRT: no controller for index $index');
        return;
      }
      Future.delayed(1000.ms, () {
        if (!isMounted()) return;
        if (currentIndex.value != index) {
          debugPrint('SHRT: setupCurrentController index: $index: index changed, aborting');
          return;
        }
        setupNextAndPreviousControllersForIndex(index);
      });

      await controller.controller.seekTo(Duration.zero);
      await controller.controller.play();
      debugPrint('SHRT: short started playing');
    }

    setCurrentIndex(int index) {
      if (!isMounted()) return;
      currentIndex.value = index;
      debugPrint('SHRT: setCurrentIndex: $index');
      Future.delayed(500.ms, () {
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
      for (var c in shortControllerPairs) {
        c.value?.controller.pause();
        c.value?.controller.dispose();
        if (isMounted()) c.value = null;
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
          PageView.builder(
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemCount: shorts.value.length,
            onPageChanged: (index) {
              setCurrentIndex(index);
            },
            itemBuilder: (context, index) {
              var shortController = shortControllerPairs[index % 3].value;
              var short = shorts.value.elementAtOrNull(index);
              if (shortController?.short.id != short?.id) {
                short = null;
                shortController = null;
              }
              return HookBuilder(builder: (context) {
                // Say index == 2 and we want to have a bool indicating that we
                return ShortView(
                  future: short == null ? fetchMoreFuture.value : null,
                  short: short,
                  videoController: shortController?.controller,
                  muted: muted.value,
                  onMuteRequested: (value) {
                    muted.value = value;
                    for (final c in shortControllerPairs) {
                      c.value?.controller.setVolume(muted.value ? 0 : 1);
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
