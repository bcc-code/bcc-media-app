import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/schema/schema.graphql.dart';
import 'package:riverpod/riverpod.dart';

import '../graphql/queries/page.graphql.dart';
import '../services/auth_service.dart';

class Episode {
  final String id;
  final String streamUrl;
  final String title;
  final String? showTitle;
  final String? seasonTitle;
  final String? imageUrl;

  const Episode(
      {required this.id,
      required this.streamUrl,
      required this.title,
      this.imageUrl,
      this.showTitle,
      this.seasonTitle});

  factory Episode.fromLegacyJson(Map<String, dynamic> json) {
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

Future<Episode> fetchLegacyEpisode(String id) async {
  var url = 'https://brunstad.tv/api/series/$id';
  final response = await http.get(Uri.parse(url), headers: {
    'Authorization': 'Bearer ${AuthService.instance.auth0AccessToken}'
  });
  if (response.statusCode != 200) {
    return Future.error('statuscode ${response.statusCode}');
  }
  var body = jsonDecode(response.body);
  return Episode.fromLegacyJson(body);
}
