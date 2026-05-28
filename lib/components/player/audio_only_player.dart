import 'dart:math';
import 'dart:ui';

import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:brunstadtv_app/components/player/audio_only_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AudioOnlyPlayer extends HookConsumerWidget {
  const AudioOnlyPlayer({
    required this.viewController,
    required this.disableToggle,
    super.key,
  });

  final BccmPlayerViewController viewController;
  final bool disableToggle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final controlsTheme = BccmPlayerTheme.safeOf(context).controls;
    final player = useListenable(viewController.playerController);
    final timeline = useTimeline(viewController.playerController);
    final artworkUri = player.value.currentMediaItem?.metadata?.artworkUri;
    final isLive = player.value.currentMediaItem?.isLive == true;
    final hasArtwork = artworkUri != null && artworkUri.isNotEmpty;

    const forwardRewindDurationSec = 15;

    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        color: design.colors.background2,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (hasArtwork)
              LayoutBuilder(
                builder: (context, constraints) {
                  return ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30, tileMode: TileMode.decal),
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: MemoryImage(kTransparentImage),
                      image: networkImageWithRetryAndResize(
                        imageUrl: artworkUri,
                        cacheHeight: (constraints.maxHeight * MediaQuery.devicePixelRatioOf(context)).round(),
                      ),
                      imageErrorBuilder: imageErrorBuilder,
                      fadeInDuration: const Duration(milliseconds: 150),
                    ),
                  );
                },
              ),
            if (hasArtwork)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.35),
                      Colors.black.withValues(alpha: 0.65),
                    ],
                  ),
                ),
              ),
            // Middle band: cover (Expanded) + play/skip row, stacked vertically with no overlap
            Positioned(
              top: 24,
              bottom: 74,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: hasArtwork
                              ? DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.45),
                                        blurRadius: 24,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return FadeInImage(
                                          fit: BoxFit.cover,
                                          placeholder: MemoryImage(kTransparentImage),
                                          image: networkImageWithRetryAndResize(
                                            imageUrl: artworkUri,
                                            cacheHeight: (constraints.maxHeight * MediaQuery.devicePixelRatioOf(context)).round(),
                                          ),
                                          imageErrorBuilder: imageErrorBuilder,
                                          fadeInDuration: const Duration(milliseconds: 150),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: TimeSkipButton(
                            forwardRewindDurationSec: forwardRewindDurationSec,
                            onPressed: () => timeline.scrubToRelative(-forwardRewindDurationSec * 1000),
                            icon: const Icon(Icons.replay),
                          ),
                        ),
                        PlayPauseButton(
                          player: viewController.playerController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: TimeSkipButton(
                            forwardRewindDurationSec: forwardRewindDurationSec,
                            onPressed: () => timeline.scrubToRelative(forwardRewindDurationSec * 1000),
                            icon: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: const Icon(Icons.replay),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Top bar: settings (mirrors default_controls.dart:46-85)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.topRight,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (controlsTheme != null)
                      SettingsButton(
                        viewController: viewController,
                        padding: const EdgeInsets.only(top: 12, bottom: 24, left: 24, right: 10),
                        controlsTheme: controlsTheme,
                        removePadding: true,
                      ),
                  ],
                ),
              ),
            ),
            // Bottom: duration + additionalActions + fullscreen, slider (mirrors default_controls.dart:86-168)
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (!isLive)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, left: 13),
                            child: Text(
                              '${getFormattedDuration(timeline.seeking ? (timeline.currentScrub / 1000).toInt() : (timeline.actualTimeMs / 1000).toInt())} / ${getFormattedDuration((timeline.duration / 1000).toInt())}',
                              style: controlsTheme?.durationTextStyle,
                            ),
                          ),
                        const Spacer(),
                        if (!disableToggle)
                          const Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: AudioOnlyButton(),
                          ),
                      ],
                    ),
                  ),
                  if (!isLive)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SmoothVideoProgress(
                        controller: viewController.playerController,
                        builder: (context, position, duration, child) {
                          final durationMs = duration.inMilliseconds.toDouble();
                          final positionMsLocal = position.inMilliseconds.toDouble().clamp(0.0, durationMs);
                          if (controlsTheme?.progressBarTheme == null) return const SizedBox.shrink();
                          return SliderTheme(
                            data: controlsTheme!.progressBarTheme!,
                            child: SizedBox(
                              height: 16,
                              child: Slider(
                                max: durationMs > 0 ? durationMs : 1,
                                value: positionMsLocal,
                                onChanged:
                                    durationMs > 0 ? (value) => viewController.playerController.seekTo(Duration(milliseconds: value.toInt())) : null,
                              ),
                            ),
                          );
                        },
                      ),
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
