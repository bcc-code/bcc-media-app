import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/season.graphql.dart';
import 'package:riverpod/riverpod.dart';

import '../graphql/client.dart';
import '../graphql/schema/items.graphql.dart';

class Api {
  final GraphQLClient client;

  Api(this.client);

  Future<Query$FetchEpisode$episode?> fetchEpisode(String id) async {
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

    return episode;
  }

  Future<Query$GetSeasonEpisodes$season?> getSeasonEpisodes(String id) async {
    final result = await client.query$GetSeasonEpisodes(
      Options$Query$GetSeasonEpisodes(
        variables: Variables$Query$GetSeasonEpisodes(id: id),
      ),
    );
    if (result.hasException) {
      throw ErrorDescription(result.exception.toString());
    }
    var season = result.parsedData?.season;
    if (season == null) return null;

    return season;
  }
}

extension StreamUrlExtension on Query$FetchEpisode$episode {
  String getBestStreamUrl() {
    var streamUrl = streams
        .firstWhereOrNull((element) =>
            element.type == Enum$StreamType.hls_cmaf ||
            element.type == Enum$StreamType.hls_ts)
        ?.url;
    streamUrl ??= streams.first.url;
    return streamUrl;
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(ref.watch(gqlClientProvider));
});
