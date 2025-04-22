import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:bccm_player/controls.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PlayerScreen extends HookConsumerWidget {
  const PlayerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = BccmPlayerController.primary;
    final mediaItem = player.value.currentMediaItem;
    final design = DesignSystem.of(context);

    if (mediaItem == null) {
      return const Scaffold(
        body: Center(
          child: Text('No media item'),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: SizedBox.square(
                  dimension: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return FadeInImage(
                          key: Key('player_cover_${mediaItem.id}'),
                          fit: BoxFit.cover,
                          placeholder: MemoryImage(kTransparentImage),
                          image: networkImageWithRetryAndResize(
                            imageUrl: mediaItem.metadata?.artworkUri ?? '',
                            cacheHeight: (constraints.maxHeight * MediaQuery.devicePixelRatioOf(context)).round(),
                          ),
                          imageErrorBuilder: imageErrorBuilder,
                          fadeInDuration: const Duration(milliseconds: 150),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 8,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mediaItem.metadata?.title ?? '',
                          textAlign: TextAlign.center,
                          style: design.textStyles.title2,
                        ),
                        Text(
                          mediaItem.metadata?.artist ?? '',
                          textAlign: TextAlign.center,
                          style: design.textStyles.body2,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SmoothVideoProgress(
                    controller: player,
                    builder: (context, position, duration, widget) {
                      return SliderTheme(
                        data: SliderThemeData(
                          thumbColor: design.colors.onTint,
                          activeTrackColor: design.colors.onTint,
                          inactiveTrackColor: design.colors.background2,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                        ),
                        child: Slider(
                          value: position.inMilliseconds.toDouble(),
                          min: 0,
                          max: duration.inMilliseconds.toDouble(),
                          onChanged: (value) {
                            player.seekTo(Duration(milliseconds: value.toInt()));
                          },
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      IconButton(
                        onPressed: () {
                          player.queue.skipToPrevious();
                        },
                        icon: const Icon(Icons.skip_previous),
                        iconSize: 40,
                      ),
                      PlayPauseButton(player: player, iconSize: 48),
                      IconButton(
                        onPressed: () {
                          player.queue.skipToNext();
                        },
                        icon: const Icon(Icons.skip_next),
                        iconSize: 40,
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
