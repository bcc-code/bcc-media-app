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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
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
                      TimeSkipButton(
                        forwardRewindDurationSec: forwardRewindDurationSec,
                        onPressed: () => timeline.scrubToRelative(-forwardRewindDurationSec * 1000),
                        icon: const Icon(Icons.replay),
                      ),
                      const SizedBox(width: 28),
                      PlayPauseButton(
                        player: viewController.playerController,
                      ),
                      const SizedBox(width: 28),
                      TimeSkipButton(
                        forwardRewindDurationSec: forwardRewindDurationSec,
                        onPressed: () => timeline.scrubToRelative(forwardRewindDurationSec * 1000),
                        icon: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child: const Icon(Icons.replay),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 14,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (controlsTheme != null && !disableToggle) const SizedBox(width: 4),
                  if (!disableToggle)
                    Theme(
                      data: Theme.of(context).copyWith(
                        iconButtonTheme: IconButtonThemeData(
                          style: IconButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                      child: const AudioOnlyButton(),
                    ),
                  if (controlsTheme != null)
                    SettingsButton(
                      viewController: viewController,
                      controlsTheme: controlsTheme,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      iconSize: 24,
                      removePadding: true,
                    ),
                ],
              ),
            ),
            if (!isLive)
              Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: SmoothVideoProgress(
                  controller: viewController.playerController,
                  builder: (context, position, duration, child) {
                    final durationMs = duration.inMilliseconds.toDouble();
                    final positionMsLocal = position.inMilliseconds.toDouble().clamp(0.0, durationMs);
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (durationMs > 0)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              '${getFormattedDuration(position.inSeconds)} / ${getFormattedDuration(duration.inSeconds)}',
                              style: design.textStyles.caption2.copyWith(
                                color: design.colors.label1,
                                fontFeatures: [FontFeature.tabularFigures()],
                              ),
                            ),
                          ),
                        if (controlsTheme?.progressBarTheme != null)
                          SliderTheme(
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
                          ),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
