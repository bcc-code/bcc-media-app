import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:my_app/graphql/queries/episode.graphql.dart';
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
            element.type == Enum$StreamType.cmaf ||
            element.type == Enum$StreamType.hls)
        ?.url;
    streamUrl ??= episode.streams.first.url;
    return Episode(
        id: episode.id,
        streamUrl:
            "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
        title: episode.title);
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(ref.watch(gqlClientProvider));
});
