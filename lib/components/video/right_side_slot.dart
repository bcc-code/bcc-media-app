import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/platform.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/providers/feature_flags.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RightSideSlot extends HookConsumerWidget {
  const RightSideSlot({super.key, required this.episode});

  final Query$FetchEpisode$episode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackService = ref.watch(playbackServiceProvider);
    final controller = BccmPlayerViewController.of(context);
    final enableAutoplayNext = ref.watch(featureFlagsProvider.select((value) => value.autoplayNext));
    final enablePlayNextButton = enableAutoplayNext && ref.watch(featureFlagsProvider.select((value) => value.playNextButton));

    if (enablePlayNextButton) {
      return PlayNextButton(
        playerController: BccmPlayerController.primary,
        onTap: () => playbackService.getNextEpisodeAndAutoplayIt(playbackService, controller.playerController.value.playerId, context.router),
        text: S.of(context).nextEpisode,
      );
    }
    return const SizedBox.shrink();
  }
}
