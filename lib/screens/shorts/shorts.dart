import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/shorts/short_view.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
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

    debugPrint('Short deeplink: $id');

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

      nextCursor.value = result.parsedData?.shorts.nextCursor;
      shorts.value = [
        ...shorts.value,
        ...result.parsedData?.shorts.shorts ?? [],
      ];

      return result;
    }

    final fetchMoreFuture = useState<Future<QueryResult<Query$getShorts>>?>(null);
    final fetchMoreSnapshot = useFuture(fetchMoreFuture.value);

    final shortControllerPairs = useMemoized<List<ValueNotifier<ShortsVideoController?>>>(
      () => List.unmodifiable(List.generate(3, (_) => ValueNotifier<ShortsVideoController?>(null))),
    );
    for (final l in shortControllerPairs) {
      //ignore: nested_hooks
      useListenable(l);
    }

    final currentIndex = useState(0);

    initializeController(int index, Fragment$Short short) async {
      final existing = shortControllerPairs[index].value;
      if (existing != null && existing.short.id == short.id) {
        debugPrint('controller for index $index already initialized, pausing');
        existing.controller.pause();
        return;
      } else if (existing != null) {
        debugPrint('disposing controller for index $index');
        existing.controller.pause();
        existing.controller.dispose();
        shortControllerPairs[index].value = null;
      }

      debugPrint('initializing controller for index $index');
      final url = short.streams.getBestStreamUrl();
      final uri = Uri.tryParse(url);
      if (uri == null) {
        debugPrint('invalid url: $url');
        // shorts.value.removeWhere((element) => element.id == short.id);
        return;
      }
      final controller = VideoPlayerController.networkUrl(uri, videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
      shortControllerPairs[index].value = ShortsVideoController(controller: controller, short: short);
      await controller.initialize();
      controller.setLooping(true);
      controller.setVolume(muted.value ? 0 : 1);
    }

    setupNextAndPreviousControllers() async {
      final previous = currentIndex.value == 0 ? null : shorts.value.elementAtOrNull(currentIndex.value - 1);
      if (previous != null) {
        final previousControllerIndex = (currentIndex.value - 1) % 3;
        initializeController(previousControllerIndex, previous);
      }

      final next = currentIndex.value == shorts.value.length - 1 ? null : shorts.value.elementAtOrNull(currentIndex.value + 1);
      if (next != null) {
        final nextControllerIndex = (currentIndex.value + 1) % 3;
        initializeController(nextControllerIndex, next);
      }
    }

    setupCurrentController() async {
      final index = currentIndex.value;
      debugPrint('setupCurrentController index: $index');
      final currentShort = shorts.value.elementAtOrNull(index);
      if (currentShort == null) {
        debugPrint('no short for index $index');
        return;
      }
      final controllerIndex = index % 3;
      await initializeController(controllerIndex, currentShort);
      final controller = shortControllerPairs[controllerIndex].value;
      if (controller == null) {
        debugPrint('no controller for index $index');
        return;
      }
      setupNextAndPreviousControllers();

      await controller.controller.seekTo(Duration.zero);
      await controller.controller.play();
      debugPrint('short started playing');
    }

    setCurrentIndex(int index) {
      currentIndex.value = index;
      setupCurrentController();
      if (currentIndex.value + 4 == shorts.value.length) {
        debugPrint('fetching more: close to end');
        fetchMoreFuture.value = fetchMore();
      }
    }

    init() async {
      currentIndex.value = 0;
      final short = (await deepLinkShortFuture)?.parsedData?.short;
      if (short != null) {
        shorts.value = [short];
      }
      debugPrint('fetching more: init');
      fetchMoreFuture.value = fetchMore();
      await fetchMoreFuture.value;
      setCurrentIndex(0);
      debugPrint('shorts initialized');
    }

    final isMounted = useIsMounted();

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
            scrollDirection: Axis.vertical,
            itemCount: shorts.value.length,
            onPageChanged: (index) {
              setCurrentIndex(index);
            },
            itemBuilder: (context, index) {
              final short = shorts.value.elementAtOrNull(index);
              return ShortView(
                future: short == null ? null : fetchMoreFuture.value,
                short: short,
                videoController: shortControllerPairs[index % 3].value?.controller,
                muted: muted.value,
                onMuteRequested: (value) {
                  muted.value = value;
                  for (final c in shortControllerPairs) {
                    c.value?.controller.setVolume(muted.value ? 0 : 1);
                  }
                },
              );
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
