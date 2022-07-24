import 'dart:convert';

import 'package:http/http.dart' as http;

import '../services/auth_service.dart';

class Episode {
  final String streamUrl;

  const Episode({
    required this.streamUrl
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    var videosRaw = json['video']['videos'] as List<dynamic>;
    var stream = videosRaw.firstWhere((element) => element['encodingType'] == 'application/vnd.apple.mpegurl', orElse: () =>
      videosRaw.firstWhere((element) => element['encodingType'] == 'application/vnd.applev3.mpegurl')
    );
    String streamUrl = stream['url'];
    if (!streamUrl.contains('vod2')) {
      var encoded = Uri.encodeComponent(streamUrl);
      var token = json['video']['token'];
      streamUrl = 'https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=$encoded&token=$token&subs=true';
    }
    return Episode(
      streamUrl: streamUrl,
    );
  }
}


Future<Episode> fetchEpisode(int id) async {
  var url = 'https://brunstad.tv/api/series/$id';
  final response = await http.get(Uri.parse(url), headers: {
    'Authorization': 'Bearer ${AuthService.instance.idToken}'
  });
  if (response.statusCode != 200) {
    return Future.error('statuscode ${response.statusCode}');
  }
  var body = jsonDecode(response.body);
  return Episode.fromJson(body);
}