import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids/components/player/player_view.dart';

void openPlayerForEpisode({
  required BuildContext context,
  required String id,
  required Api api,
  required PlaybackService playbackService,
}) async {
  final ep = await api.fetchEpisode(id);
  if (ep == null) return;
  if (!context.mounted) return;
  playbackService
      .openFullscreen(
    context,
    config: BccmPlayerViewConfig(
      deviceOrientationsFullscreen: (vc) => [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
      deviceOrientationsNormal: (vc) => [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
      fullscreenRouteBuilderFactory: (BccmPlayerViewController viewController) => PageRouteBuilder(
        pageBuilder: (context, aAnim, bAnim) => InheritedBccmPlayerViewController(
          controller: viewController,
          child: const PlayerView(),
        ),
        transitionsBuilder: (context, aAnim, bAnim, child) => FadeTransition(
          opacity: aAnim,
          child: child,
        ),
        fullscreenDialog: true,
      ),
    ),
  )
      .then((_) {
    BccmPlayerController.primary.stop(reset: true);
  });
  return playbackService.playEpisode(
    playerId: BccmPlayerController.primary.value.playerId,
    autoplay: true,
    episode: ep,
  );
}
