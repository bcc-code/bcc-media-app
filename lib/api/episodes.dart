import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/graphql/client.dart';
import 'package:my_app/graphql/queries/episode.graphql.dart';
import 'package:my_app/graphql/schema/schema.graphql.dart';
import 'package:riverpod/riverpod.dart';

import '../graphql/queries/page.graphql.dart';
import '../services/auth_service.dart';

class Episode {
  final String id;
  final String streamUrl;
  final String title;
  final String? imageUrl;

  const Episode(
      {required this.id,
      required this.streamUrl,
      required this.title,
      this.imageUrl});

  factory Episode.fromJson(Map<String, dynamic> json) {
    var videosRaw = json['video']['videos'] as List<dynamic>;
    var stream = videosRaw.firstWhere(
        (element) => element['encodingType'] == 'application/vnd.apple.mpegurl',
        orElse: () => videosRaw.firstWhere((element) =>
            element['encodingType'] == 'application/vnd.applev3.mpegurl'));
    String streamUrl = stream['url'];
    if (!streamUrl.contains('vod2')) {
      var encoded = Uri.encodeComponent(streamUrl);
      var token = json['video']['token'];
      streamUrl =
          'https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=$encoded&token=$token&subs=true';
    }
    return Episode(
        id: json['id'],
        streamUrl: streamUrl,
        title: json['title'],
        imageUrl: json['image']);
  }
}

Future<Episode> fetchEpisode(String id) async {
  var url = 'https://brunstad.tv/api/series/$id';
  final response = await http.get(Uri.parse(url),
      headers: {'Authorization': 'Bearer ${AuthService.instance.idToken}'});
  if (response.statusCode != 200) {
    return Future.error('statuscode ${response.statusCode}');
  }
  var body = jsonDecode(response.body);
  return Episode.fromJson(body);
}
/* 
class Page {
  
} */

class Api {
  final Reader refRead;

  Api(this.refRead);

  Future<Episode?> fetchEpisode(String id) async {
    final client = refRead(gqlClientProvider);
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

  Future<Query$Page$page?> fetchPage(String code) async {
    final client = refRead(gqlClientProvider);
    final result = await client.query$Page(
      Options$Query$Page(
        variables: Variables$Query$Page(code: code),
      ),
    );
    var sections = result.parsedData?.page?.sections.items;
    if (sections == null) {
      return null;
    }
    for (var section in sections) {
      if (section is Query$Page$page$sections$items$$ItemSection) {}
    }
    return result.parsedData?.page;
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(ref.read);
});
