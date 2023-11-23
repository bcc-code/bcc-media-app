import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/misc/collapsable_markdown.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/shorts/shorts.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
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
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final gqlClient = ref.watch(gqlClientProvider);
    final shorts = useState<List<Fragment$Short>>([]);
    final nextCursor = useState<String?>(null);
    final muted = useState(false);

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

    final fetchMoreFuture = useState(
      useMemoized(fetchMore),
    );
    final fetchMoreSnapshot = useFuture(fetchMoreFuture.value);

    final shortControllerPairs = useMemoized<List<ValueNotifier<ShortsVideoController?>>>(
      () => List.unmodifiable(
        List.generate(3, (_) => ValueNotifier<ShortsVideoController?>(null)),
      ),
    );
    for (final l in shortControllerPairs) {
      //ignore: nested_hooks
      useListenable(l);
    }

    useEffect(
      () => () {
        for (var c in shortControllerPairs) {
          c.value?.controller.dispose();
        }
        shortControllerPairs.clear();
      },
      [],
    );

    final currentIndex = useState(0);
    final currentControllerIndex = currentIndex.value % 3;

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
      await controller.initialize();
      controller.setLooping(true);
      shortControllerPairs[index].value = ShortsVideoController(controller: controller, short: short);
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

    useValueChanged<int, void>(currentIndex.value, (oldValue, _) {
      final newValue = currentIndex.value;
      () async {
        debugPrint('${currentIndex.value}');
        debugPrint('$newValue');
        var currentShort = shorts.value.elementAtOrNull(newValue);
        if (currentShort == null) {
          await fetchMoreFuture.value;
        }
        currentShort = shorts.value.elementAtOrNull(newValue);
        if (currentShort == null) {
          debugPrint('no short for index $newValue');
          return;
        }
        await initializeController(currentControllerIndex, currentShort);
        final controller = shortControllerPairs[currentControllerIndex].value;
        if (controller == null) {
          debugPrint('no controller for index $newValue');
          return;
        }
        setupNextAndPreviousControllers();

        await controller.controller.seekTo(Duration.zero);
        await controller.controller.play();
        debugPrint('short started playing');
      }();

      if (newValue + 4 == shorts.value.length) {
        fetchMore();
      }
    });

    final currentShort = shorts.value.elementAtOrNull(currentIndex.value);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: shorts.value.length,
            onPageChanged: (index) {
              currentIndex.value = index;
            },
            itemBuilder: (context, index) => currentShort == null
                ? null
                : ShortView(
                    short: shorts.value[index],
                    videoController: shortControllerPairs[index % 3].value?.controller,
                    muted: muted.value,
                    onMuteRequested: (value) {
                      muted.value = value;
                      for (final c in shortControllerPairs) {
                        c.value?.controller.setVolume(muted.value ? 0 : 1);
                      }
                    },
                  ),
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
