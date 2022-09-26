import 'dart:convert';

import 'package:http/http.dart' as http;

import '../services/auth_service.dart';

class Section {
  final String title;
  final List<SectionItem> items;

  const Section({
    required this.title,
    required this.items,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    var itemsRaw = json['items'] as List<dynamic>;

    List<SectionItem> items =
        itemsRaw.map((i) => SectionItem.fromJson(i)).toList();

    return Section(
      title: json['title'],
      items: items,
    );
  }
}

class SectionItem {
  final String title;
  final String type;
  final String imageUrl;
  final int id;

  const SectionItem(
      {required this.title,
      required this.type,
      required this.imageUrl,
      required this.id});

  factory SectionItem.fromJson(Map<String, dynamic> json) {
    return SectionItem(
        title: json['title'],
        type: json['type'],
        id: json['id'],
        imageUrl: json['image']);
  }
}

Future<List<Section>> fetchSections() async {
  var url = 'https://brunstad.tv/api/sliders';
  final response = await http.get(Uri.parse(url), headers: {
    'Authorization': 'Bearer ${AuthService.instance.auth0AccessToken}'
  });
  if (response.statusCode != 200) {
    return Future.error('statuscode ${response.statusCode}');
  }
  List body = jsonDecode(response.body);

  return body
      .map(
        (s) => Section.fromJson(s),
      )
      .toList();
}
