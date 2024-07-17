import 'dart:convert';

import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bmm_api.g.dart';

final bmmApiProvider = Provider((ref) {
  return BMMApi(ref: ref);
});

class BMMApi {
  Ref ref;
  String? accessToken;
  http.BaseClient client;
  final String baseUrl;

  BMMApi({
    required this.ref,
    this.baseUrl = 'https://bmm-api.brunstad.org',
  }) : client = RetryClient(http.Client());

  String getSignedUrl(String url) {
    return '$url&auth=Bearer+${Env.bmmAccessToken}';
  }

  Future<List<BmmTrack>> getTracks() async {
    final response = await client.get(Uri.parse('$baseUrl/podcast/1/track?size=40&from=0'), headers: {
      'Authorization': 'Bearer ${Env.bmmAccessToken}',
      'Accept-Language': ref.read(settingsProvider).appLanguage.toLanguageTag(),
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return (json as List).map((e) => BmmTrack.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load tracks. ${response.statusCode}');
    }
  }
}

@JsonSerializable(explicitToJson: true)
class BmmTrack {
  final int? id;
  final bool? isVisible;
  final int? order;
  final int? parentId;
  final String? publishedAt;
  final String? recordedAt;
  final List<Relation>? rel;
  final List<dynamic>? bibleRelations;
  final List<dynamic>? externalRelations;
  final List<Contributor>? contributors;
  final List<SongbookRelation>? songbookRelations;
  final String? subtype;
  final List<String>? tags;
  @JsonKey(name: '_meta')
  final Meta? meta;
  final String? type;
  final List<String>? languages;
  final String? language;
  final String? title;
  final String? publisher;
  final String? copyright;
  final List<Media>? media;
  final bool? hasListened;
  final bool? hasTranscription;
  final bool? isLiked;

  BmmTrack({
    this.id,
    this.isVisible,
    this.order,
    this.parentId,
    this.publishedAt,
    this.recordedAt,
    this.rel,
    this.bibleRelations,
    this.externalRelations,
    this.contributors,
    this.songbookRelations,
    this.subtype,
    this.tags,
    this.meta,
    this.type,
    this.languages,
    this.language,
    this.title,
    this.publisher,
    this.copyright,
    this.media,
    this.hasListened,
    this.hasTranscription,
    this.isLiked,
  });

  factory BmmTrack.fromJson(Map<String, dynamic> json) => _$BmmTrackFromJson(json);
  Map<String, dynamic> toJson() => _$BmmTrackToJson(this);
}

@JsonSerializable()
class Relation {
  final String? type;
  final String? name;
  final int? timestamp;
  final int? id;
  final bool? hasListened;

  Relation({
    this.type,
    this.name,
    this.timestamp,
    this.id,
    this.hasListened,
  });

  factory Relation.fromJson(Map<String, dynamic> json) => _$RelationFromJson(json);
  Map<String, dynamic> toJson() => _$RelationToJson(this);
}

@JsonSerializable()
class Contributor {
  final String? type;
  final int? id;
  final String? name;

  Contributor({
    this.type,
    this.id,
    this.name,
  });

  factory Contributor.fromJson(Map<String, dynamic> json) => _$ContributorFromJson(json);
  Map<String, dynamic> toJson() => _$ContributorToJson(this);
}

@JsonSerializable()
class SongbookRelation {
  final int? id;
  final String? name;
  final int? timestamp;

  SongbookRelation({
    this.id,
    this.name,
    this.timestamp,
  });

  factory SongbookRelation.fromJson(Map<String, dynamic> json) => _$SongbookRelationFromJson(json);
  Map<String, dynamic> toJson() => _$SongbookRelationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Meta {
  final MetaParent? parent;
  final MetaRootParent? rootParent;
  final int? rootParentId;
  final String? modifiedAt;
  final String? modifiedBy;
  final bool? isVisible;
  final String? title;
  final String? language;
  final String? album;
  final int? tracknumber;
  final String? artist;
  final String? lyricist;
  final String? composer;
  final String? publisher;
  final int? itunescompilation;
  final String? attachedPicture;
  final String? time;
  final String? date;
  final String? year;
  final String? copyright;

  Meta({
    this.parent,
    this.rootParent,
    this.rootParentId,
    this.modifiedAt,
    this.modifiedBy,
    this.isVisible,
    this.title,
    this.language,
    this.album,
    this.tracknumber,
    this.artist,
    this.lyricist,
    this.composer,
    this.publisher,
    this.itunescompilation,
    this.attachedPicture,
    this.time,
    this.date,
    this.year,
    this.copyright,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class MetaParent {
  @JsonKey(name: '_meta')
  final MetaMeta? meta;
  final int? id;
  final int? parentId;
  final String? type;
  final String? bmmId;
  final String? cover;
  final String? language;
  final List<String>? languages;
  final String? publishedAt;
  final List<dynamic>? tags;
  final String? title;

  MetaParent({
    this.meta,
    this.id,
    this.parentId,
    this.type,
    this.bmmId,
    this.cover,
    this.language,
    this.languages,
    this.publishedAt,
    this.tags,
    this.title,
  });

  factory MetaParent.fromJson(Map<String, dynamic> json) => _$MetaParentFromJson(json);
  Map<String, dynamic> toJson() => _$MetaParentToJson(this);
}

@JsonSerializable()
class MetaRootParent {
  @JsonKey(name: '_meta')
  final MetaMeta? meta;
  final int? id;
  final int? parentId;
  final String? type;
  final String? bmmId;
  final String? cover;
  final String? language;
  final List<String>? languages;
  final String? publishedAt;
  final List<dynamic>? tags;
  final String? title;

  MetaRootParent({
    this.meta,
    this.id,
    this.parentId,
    this.type,
    this.bmmId,
    this.cover,
    this.language,
    this.languages,
    this.publishedAt,
    this.tags,
    this.title,
  });

  factory MetaRootParent.fromJson(Map<String, dynamic> json) => _$MetaRootParentFromJson(json);
  Map<String, dynamic> toJson() => _$MetaRootParentToJson(this);
}

@JsonSerializable()
class MetaMeta {
  final List<String>? containedTypes;
  final bool? isVisible;
  final String? modifiedAt;
  final String? modifiedBy;

  MetaMeta({
    this.containedTypes,
    this.isVisible,
    this.modifiedAt,
    this.modifiedBy,
  });

  factory MetaMeta.fromJson(Map<String, dynamic> json) => _$MetaMetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaMetaToJson(this);
}

@JsonSerializable()
class Media {
  final String? type;
  final bool? isVisible;
  final List<MediaFile>? files;

  Media({
    this.type,
    this.isVisible,
    this.files,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
class MediaFile {
  final String? mimeType;
  final int? size;
  final int? duration;
  final String? url;

  MediaFile({
    this.mimeType,
    this.size,
    this.duration,
    this.url,
  });

  factory MediaFile.fromJson(Map<String, dynamic> json) => _$MediaFileFromJson(json);
  Map<String, dynamic> toJson() => _$MediaFileToJson(this);
}
