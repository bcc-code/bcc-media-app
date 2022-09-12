import 'package:collection/collection.dart';
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
        variables: Variables$Query$FetchEpisode(id: '1'),
      ),
    );
    var episode = result.parsedData?.episode;
    var streamUrl = episode?.streams
        .firstWhereOrNull((element) =>
            element.type == Enum$StreamType.cmaf ||
            element.type == Enum$StreamType.hls)
        ?.url;
    if (episode == null || streamUrl == null) return null;
    return Episode(
        id: episode.id,
        streamUrl: streamUrl,
        title: episode.title,
        imageUrl: episode.imageUrl);
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(ref.watch(gqlClientProvider));
});
