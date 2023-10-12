import 'package:auto_route/auto_route.dart';
import 'package:bccm_player/bccm_player.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/schema.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids/router/router.gr.dart';

Future<dynamic>? handleSectionItemClick(BuildContext context, Fragment$ItemSectionItem$item item, {String? collectionId}) async {
  final ref = ProviderScope.containerOf(context, listen: false);
  final analytics = ref.read(analyticsProvider);
  analytics.sectionItemClicked(context);

  final episodeItem = item.asOrNull<Fragment$ItemSectionItem$item$$Episode>();
  if (episodeItem != null && !episodeItem.locked) {
    final ep = await ref.read(apiProvider).fetchEpisode(episodeItem.id, context: Input$EpisodeContext(collectionId: collectionId));
    if (ep == null) return;
    if (!context.mounted) return;
    return ref.read(playbackServiceProvider).playEpisode(playerId: BccmPlayerController.primary.value.playerId, episode: ep);
  }

  final showItem = item.asOrNull<Fragment$ItemSectionItem$item$$Show>();
  if (showItem != null) {
    return context.router.push(ShowScreenRoute(showId: showItem.id));
  }

  final playlistItem = item.asOrNull<Fragment$ItemSectionItem$item$$Playlist>();
  if (playlistItem != null) {
    return context.router.push(PlaylistScreenRoute(id: playlistItem.id));
  }
  return showDialog(context: context, builder: (context) => SimpleDialog(title: Text('Clicked ${item.$__typename} ')));
}
