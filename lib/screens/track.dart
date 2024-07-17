// ignore_for_file: exhaustive_keys

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/insets.dart';
import 'package:bccm_core/design_system.dart';

@RoutePage<void>()
class TrackScreen extends HookConsumerWidget {
  final bool? autoplay;
  final int? queryParamStartPositionSeconds;

  const TrackScreen({
    super.key,
    this.autoplay,
    this.queryParamStartPositionSeconds,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to route animation status
    final scrollController = useScrollController();

    final vc = useMemoized<BccmPlayerViewController>(() {
      final vc = BccmPlayerViewController(
        playerController: BccmPlayerController.primary,
      );
      vc.playerController.replaceCurrentMediaItem(
        autoplay: true,
        MediaItem(url: ''),
      );
      return vc;
    }, []);
    useOnDispose(() {
      vc.dispose();
    });

    final timeline = useTimeline(vc.playerController);

    final forwardRewindDurationSec = Duration(milliseconds: timeline.duration.toInt()).inMinutes > 60 ? 30 : 15;
    final design = DesignSystem.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const ClampingScrollPhysics(),
                controller: scrollController,
                slivers: [
                  SliverMainAxisGroup(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: RadialGradient(
                                      colors: [
                                        design.colors.tint1.withOpacity(0.2),
                                        Colors.transparent,
                                      ],
                                      radius: 3,
                                      stops: const [0, 0.5],
                                      center: const Alignment(0, -1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    margin: const EdgeInsets.only(bottom: 16),
                                    decoration: BoxDecoration(
                                      color: design.colors.tint1,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TimeSkipButton(
                                        forwardRewindDurationSec: forwardRewindDurationSec,
                                        onPressed: () => timeline.scrubToRelative(-forwardRewindDurationSec * 1000),
                                        icon: const Icon(Icons.replay),
                                      ),
                                      PlayPauseButton(player: vc.playerController),
                                      TimeSkipButton(
                                        forwardRewindDurationSec: forwardRewindDurationSec,
                                        onPressed: () => timeline.scrubToRelative(-forwardRewindDurationSec * 1000),
                                        icon: Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.rotationY(pi),
                                          child: const Icon(Icons.replay),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          getFormattedDuration(timeline.actualTimeMs ~/ 1000, padFirstSegment: true),
                                          style: design.textStyles.caption1.copyWith(color: design.colors.label1),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          getFormattedDuration(timeline.duration ~/ 1000, padFirstSegment: true),
                                          style: design.textStyles.caption1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: SliderTheme(
                                      data: const SliderThemeData(
                                        thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius: 0,
                                        ),
                                      ),
                                      child: SizedBox(
                                        height: 16,
                                        child: Slider(
                                          value: timeline.timeFraction,
                                          onChanged: (double value) {
                                            timeline.scrubTo(value * timeline.duration);
                                          },
                                          onChangeEnd: (double value) {
                                            timeline.seekToScrubbed();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  width: 50,
                                  height: 5,
                                  margin: const EdgeInsets.only(
                                    bottom: 8,
                                    top: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
