import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/auth0_api.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_generic.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_indicator.dart';
import 'package:brunstadtv_app/flavors.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/providers/auth_state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TvLiveScreen extends HookConsumerWidget {
  const TvLiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(apiProvider);
    final liveUrl = useMemoized(() => api.fetchLiveUrl(), [api]);
    final liveUrlSnapshot = useFuture(liveUrl);

    useEffect(() {
      if (liveUrlSnapshot.data != null) {
        BccmPlayerController.primary.replaceCurrentMediaItem(MediaItem(url: liveUrlSnapshot.data!.streamUrl, metadata: MediaMetadata(title: 'Live')));
      }
    }, [liveUrlSnapshot.data]);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (liveUrlSnapshot.hasData)
              VideoPlatformView(
                playerController: BccmPlayerController.primary,
                showControls: true,
              )
            else ...[
              const LoadingGeneric(),
            ]
          ],
        ),
      ),
    );
  }
}
