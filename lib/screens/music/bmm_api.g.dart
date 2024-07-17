// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmm_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BmmTrack _$BmmTrackFromJson(Map<String, dynamic> json) => BmmTrack(
      id: (json['id'] as num?)?.toInt(),
      isVisible: json['isVisible'] as bool?,
      order: (json['order'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      publishedAt: json['publishedAt'] as String?,
      recordedAt: json['recordedAt'] as String?,
      rel: (json['rel'] as List<dynamic>?)
          ?.map((e) => Relation.fromJson(e as Map<String, dynamic>))
          .toList(),
      bibleRelations: json['bibleRelations'] as List<dynamic>?,
      externalRelations: json['externalRelations'] as List<dynamic>?,
      contributors: (json['contributors'] as List<dynamic>?)
          ?.map((e) => Contributor.fromJson(e as Map<String, dynamic>))
          .toList(),
      songbookRelations: (json['songbookRelations'] as List<dynamic>?)
          ?.map((e) => SongbookRelation.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtype: json['subtype'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      meta: json['_meta'] == null
          ? null
          : Meta.fromJson(json['_meta'] as Map<String, dynamic>),
      type: json['type'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      language: json['language'] as String?,
      title: json['title'] as String?,
      publisher: json['publisher'] as String?,
      copyright: json['copyright'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasListened: json['hasListened'] as bool?,
      hasTranscription: json['hasTranscription'] as bool?,
      isLiked: json['isLiked'] as bool?,
    );

Map<String, dynamic> _$BmmTrackToJson(BmmTrack instance) => <String, dynamic>{
      'id': instance.id,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'parentId': instance.parentId,
      'publishedAt': instance.publishedAt,
      'recordedAt': instance.recordedAt,
      'rel': instance.rel?.map((e) => e.toJson()).toList(),
      'bibleRelations': instance.bibleRelations,
      'externalRelations': instance.externalRelations,
      'contributors': instance.contributors?.map((e) => e.toJson()).toList(),
      'songbookRelations':
          instance.songbookRelations?.map((e) => e.toJson()).toList(),
      'subtype': instance.subtype,
      'tags': instance.tags,
      '_meta': instance.meta?.toJson(),
      'type': instance.type,
      'languages': instance.languages,
      'language': instance.language,
      'title': instance.title,
      'publisher': instance.publisher,
      'copyright': instance.copyright,
      'media': instance.media?.map((e) => e.toJson()).toList(),
      'hasListened': instance.hasListened,
      'hasTranscription': instance.hasTranscription,
      'isLiked': instance.isLiked,
    };

Relation _$RelationFromJson(Map<String, dynamic> json) => Relation(
      type: json['type'] as String?,
      name: json['name'] as String?,
      timestamp: (json['timestamp'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      hasListened: json['hasListened'] as bool?,
    );

Map<String, dynamic> _$RelationToJson(Relation instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'timestamp': instance.timestamp,
      'id': instance.id,
      'hasListened': instance.hasListened,
    };

Contributor _$ContributorFromJson(Map<String, dynamic> json) => Contributor(
      type: json['type'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ContributorToJson(Contributor instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'name': instance.name,
    };

SongbookRelation _$SongbookRelationFromJson(Map<String, dynamic> json) =>
    SongbookRelation(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      timestamp: (json['timestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SongbookRelationToJson(SongbookRelation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'timestamp': instance.timestamp,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      parent: json['parent'] == null
          ? null
          : MetaParent.fromJson(json['parent'] as Map<String, dynamic>),
      rootParent: json['rootParent'] == null
          ? null
          : MetaRootParent.fromJson(json['rootParent'] as Map<String, dynamic>),
      rootParentId: (json['rootParentId'] as num?)?.toInt(),
      modifiedAt: json['modifiedAt'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      isVisible: json['isVisible'] as bool?,
      title: json['title'] as String?,
      language: json['language'] as String?,
      album: json['album'] as String?,
      tracknumber: (json['tracknumber'] as num?)?.toInt(),
      artist: json['artist'] as String?,
      lyricist: json['lyricist'] as String?,
      composer: json['composer'] as String?,
      publisher: json['publisher'] as String?,
      itunescompilation: (json['itunescompilation'] as num?)?.toInt(),
      attachedPicture: json['attachedPicture'] as String?,
      time: json['time'] as String?,
      date: json['date'] as String?,
      year: json['year'] as String?,
      copyright: json['copyright'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'parent': instance.parent?.toJson(),
      'rootParent': instance.rootParent?.toJson(),
      'rootParentId': instance.rootParentId,
      'modifiedAt': instance.modifiedAt,
      'modifiedBy': instance.modifiedBy,
      'isVisible': instance.isVisible,
      'title': instance.title,
      'language': instance.language,
      'album': instance.album,
      'tracknumber': instance.tracknumber,
      'artist': instance.artist,
      'lyricist': instance.lyricist,
      'composer': instance.composer,
      'publisher': instance.publisher,
      'itunescompilation': instance.itunescompilation,
      'attachedPicture': instance.attachedPicture,
      'time': instance.time,
      'date': instance.date,
      'year': instance.year,
      'copyright': instance.copyright,
    };

MetaParent _$MetaParentFromJson(Map<String, dynamic> json) => MetaParent(
      meta: json['_meta'] == null
          ? null
          : MetaMeta.fromJson(json['_meta'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      type: json['type'] as String?,
      bmmId: json['bmmId'] as String?,
      cover: json['cover'] as String?,
      language: json['language'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      publishedAt: json['publishedAt'] as String?,
      tags: json['tags'] as List<dynamic>?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$MetaParentToJson(MetaParent instance) =>
    <String, dynamic>{
      '_meta': instance.meta,
      'id': instance.id,
      'parentId': instance.parentId,
      'type': instance.type,
      'bmmId': instance.bmmId,
      'cover': instance.cover,
      'language': instance.language,
      'languages': instance.languages,
      'publishedAt': instance.publishedAt,
      'tags': instance.tags,
      'title': instance.title,
    };

MetaRootParent _$MetaRootParentFromJson(Map<String, dynamic> json) =>
    MetaRootParent(
      meta: json['_meta'] == null
          ? null
          : MetaMeta.fromJson(json['_meta'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      type: json['type'] as String?,
      bmmId: json['bmmId'] as String?,
      cover: json['cover'] as String?,
      language: json['language'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      publishedAt: json['publishedAt'] as String?,
      tags: json['tags'] as List<dynamic>?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$MetaRootParentToJson(MetaRootParent instance) =>
    <String, dynamic>{
      '_meta': instance.meta,
      'id': instance.id,
      'parentId': instance.parentId,
      'type': instance.type,
      'bmmId': instance.bmmId,
      'cover': instance.cover,
      'language': instance.language,
      'languages': instance.languages,
      'publishedAt': instance.publishedAt,
      'tags': instance.tags,
      'title': instance.title,
    };

MetaMeta _$MetaMetaFromJson(Map<String, dynamic> json) => MetaMeta(
      containedTypes: (json['containedTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isVisible: json['isVisible'] as bool?,
      modifiedAt: json['modifiedAt'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
    );

Map<String, dynamic> _$MetaMetaToJson(MetaMeta instance) => <String, dynamic>{
      'containedTypes': instance.containedTypes,
      'isVisible': instance.isVisible,
      'modifiedAt': instance.modifiedAt,
      'modifiedBy': instance.modifiedBy,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      type: json['type'] as String?,
      isVisible: json['isVisible'] as bool?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => MediaFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'type': instance.type,
      'isVisible': instance.isVisible,
      'files': instance.files,
    };

MediaFile _$MediaFileFromJson(Map<String, dynamic> json) => MediaFile(
      mimeType: json['mimeType'] as String?,
      size: (json['size'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MediaFileToJson(MediaFile instance) => <String, dynamic>{
      'mimeType': instance.mimeType,
      'size': instance.size,
      'duration': instance.duration,
      'url': instance.url,
    };
