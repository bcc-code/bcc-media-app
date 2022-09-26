import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:riverpod/riverpod.dart';

import '../graphql/client.dart';
import '../graphql/queries/page.graphql.dart';
import '../graphql/schema/schema.graphql.dart';
import 'episodes.dart';

class Api {
  final GraphQLClient client;

  Api(this.client);

  Future<Episode?> fetchEpisode(String id) async {
    final result = await client.query$FetchEpisode(
      Options$Query$FetchEpisode(
        variables: Variables$Query$FetchEpisode(id: id),
      ),
    );
    if (result.hasException) {
      throw ErrorDescription(result.exception.toString());
    }
    var episode = result.parsedData?.episode;
    if (episode == null) return null;

    var streamUrl = episode.streams
        .firstWhereOrNull((element) =>
            element.type == Enum$StreamType.hls_cmaf ||
            element.type == Enum$StreamType.hls_ts)
        ?.url;
    streamUrl ??= episode.streams.first.url;
    return Episode(
        id: episode.id,
        streamUrl: streamUrl,
        title: episode.title,
        imageUrl: episode.imageUrl,
        showTitle: episode.season?.$show.title,
        seasonTitle: episode.season?.title);
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(ref.watch(gqlClientProvider));
});
