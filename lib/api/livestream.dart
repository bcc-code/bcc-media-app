import 'dart:convert';

import 'package:http/http.dart' as http;

import '../services/auth_service.dart';

class LivestreamUrl {
  final String streamUrl;
  final DateTime expiryTime;

  LivestreamUrl({required this.streamUrl, DateTime? expiryTime})
      : expiryTime =
            (expiryTime ?? DateTime.now().add(const Duration(hours: 3)));

  factory LivestreamUrl.fromJson(Map<String, dynamic> json) {
    String streamUrl = json['url'];
    return LivestreamUrl(
        streamUrl: streamUrl,
        expiryTime: DateTime.tryParse(json['expiryTime']));
  }
}

Future<LivestreamUrl> fetchLiveUrl() async {
  var url = 'https://livestreamfunctions.brunstad.tv/api/urls/live';
  final response = await http.get(Uri.parse(url), headers: {
    'Authorization': 'Bearer ${AuthService.instance.auth0AccessToken}'
  });
  if (response.statusCode != 200) {
    return Future.error('statuscode ${response.statusCode}');
  }
  var body = jsonDecode(response.body);
  return LivestreamUrl.fromJson(body);
}
