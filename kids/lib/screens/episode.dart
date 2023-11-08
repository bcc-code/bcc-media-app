import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/kids/episodes.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/schema.graphql.dart';
import 'package:brunstadtv_app/providers/inherited_data.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids/components/player/player_view.dart';
import 'package:kids/helpers/transitions.dart';
import 'package:kids/router/router.gr.dart';

@RoutePage<void>()
class EpisodeScreen extends HookConsumerWidget {
  const EpisodeScreen({
    super.key,
    required this.id,
    @QueryParam() this.shuffle,
    @QueryParam() this.playlistId,
    @QueryParam() this.cursor,
  });

  final String id;
  final bool? shuffle;
  final String? cursor;
  final String? playlistId;

  bool get episodeIsCurrentItem => BccmPlayerController.primary.value.currentMediaItem?.metadata?.extras?['id'] == id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gqlClient = ref.watch(gqlClientProvider);

    final episodeFuture = useMemoized<Future<QueryResult<Query$KidsFetchEpisode?>>>(
      () => gqlClient.query$KidsFetchEpisode(
        Options$Query$KidsFetchEpisode(
          variables: Variables$Query$KidsFetchEpisode(
            id: id,
            context: Input$EpisodeContext(
              shuffle: shuffle ?? false,
              cursor: cursor,
              playlistId: playlistId,
            ),
          ),
        ),
      ),
      // ignore: exhaustive_keys
      [id, shuffle, cursor],
    );
    final episodeSnapshot = useFuture(episodeFuture);
    final episodeData = episodeSnapshot.data?.parsedData?.episode;
    final playbackService = ref.watch(playbackServiceProvider);
    final firstLoadDone = useState(false);
    final currentId = useState(BccmPlayerController.primary.value.currentMediaItem?.metadata?.extras?['id']);
    final morphTransition = InheritedData.listen<MorphTransitionInfo>(context);

    debugPrint('Rendering EpisodeScreen: $id');

    useEffect(() {
      void listener() {
        currentId.value = BccmPlayerController.primary.value.currentMediaItem?.metadata?.extras?['id'];
      }

      BccmPlayerController.primary.addListener(listener);
      return () {
        BccmPlayerController.primary.removeListener(listener);
      };
    });

    final transitionDone = useState(false);

    final play = useCallback(() {
      if (episodeData == null) {
        return;
      }
      playbackService.playEpisode(
        playerId: BccmPlayerController.primary.value.playerId,
        episode: episodeData,
        autoplay: true,
        playlistId: playlistId,
      );
    }, [episodeData, playlistId, playbackService]);

    useEffect(() {
      if (episodeData != null && !episodeIsCurrentItem) {
        final duration = morphTransition?.duration ?? 0.ms;
        Future.delayed(duration - 100.ms, () {
          if (!context.mounted) return;
          transitionDone.value = true;
          play();
        });
        firstLoadDone.value = true;
      }
      return () {
        // on dispose
        if (BccmPlayerController.primary.value.currentMediaItem != null && episodeIsCurrentItem) {
          BccmPlayerController.primary.stop(reset: true);
        }
      };
    }, [episodeData]);

    final viewController = useMemoized(() => BccmPlayerViewController(playerController: BccmPlayerController.primary), []);

    return InheritedBccmPlayerViewController(
      controller: viewController,
      child: PlayerView(
        episode: episodeData,
        playlistId: playlistId,
        onReplayRequested: play,
      ),
    );
  }
}
