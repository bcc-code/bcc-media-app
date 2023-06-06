import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$SearchResultItem {
  Fragment$SearchResultItem({
    required this.collection,
    required this.id,
    this.legacyID,
    required this.title,
    this.description,
    this.image,
    required this.$__typename,
  });

  factory Fragment$SearchResultItem.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "EpisodeSearchItem":
        return Fragment$SearchResultItem$$EpisodeSearchItem.fromJson(json);

      case "ShowSearchItem":
        return Fragment$SearchResultItem$$ShowSearchItem.fromJson(json);

      case "SeasonSearchItem":
        return Fragment$SearchResultItem$$SeasonSearchItem.fromJson(json);

      default:
        final l$collection = json['collection'];
        final l$id = json['id'];
        final l$legacyID = json['legacyID'];
        final l$title = json['title'];
        final l$description = json['description'];
        final l$image = json['image'];
        final l$$__typename = json['__typename'];
        return Fragment$SearchResultItem(
          collection: (l$collection as String),
          id: (l$id as String),
          legacyID: (l$legacyID as String?),
          title: (l$title as String),
          description: (l$description as String?),
          image: (l$image as String?),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final String collection;

  final String id;

  final String? legacyID;

  final String title;

  final String? description;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$collection = collection;
    _resultData['collection'] = l$collection;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$legacyID = legacyID;
    _resultData['legacyID'] = l$legacyID;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$collection = collection;
    final l$id = id;
    final l$legacyID = legacyID;
    final l$title = title;
    final l$description = description;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$collection,
      l$id,
      l$legacyID,
      l$title,
      l$description,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SearchResultItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$collection = collection;
    final lOther$collection = other.collection;
    if (l$collection != lOther$collection) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$legacyID = legacyID;
    final lOther$legacyID = other.legacyID;
    if (l$legacyID != lOther$legacyID) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$SearchResultItem
    on Fragment$SearchResultItem {
  CopyWith$Fragment$SearchResultItem<Fragment$SearchResultItem> get copyWith =>
      CopyWith$Fragment$SearchResultItem(
        this,
        (i) => i,
      );
  _T when<_T>({
    required _T Function(Fragment$SearchResultItem$$EpisodeSearchItem)
        episodeSearchItem,
    required _T Function(Fragment$SearchResultItem$$ShowSearchItem)
        showSearchItem,
    required _T Function(Fragment$SearchResultItem$$SeasonSearchItem)
        seasonSearchItem,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "EpisodeSearchItem":
        return episodeSearchItem(
            this as Fragment$SearchResultItem$$EpisodeSearchItem);

      case "ShowSearchItem":
        return showSearchItem(
            this as Fragment$SearchResultItem$$ShowSearchItem);

      case "SeasonSearchItem":
        return seasonSearchItem(
            this as Fragment$SearchResultItem$$SeasonSearchItem);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$SearchResultItem$$EpisodeSearchItem)?
        episodeSearchItem,
    _T Function(Fragment$SearchResultItem$$ShowSearchItem)? showSearchItem,
    _T Function(Fragment$SearchResultItem$$SeasonSearchItem)? seasonSearchItem,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "EpisodeSearchItem":
        if (episodeSearchItem != null) {
          return episodeSearchItem(
              this as Fragment$SearchResultItem$$EpisodeSearchItem);
        } else {
          return orElse();
        }

      case "ShowSearchItem":
        if (showSearchItem != null) {
          return showSearchItem(
              this as Fragment$SearchResultItem$$ShowSearchItem);
        } else {
          return orElse();
        }

      case "SeasonSearchItem":
        if (seasonSearchItem != null) {
          return seasonSearchItem(
              this as Fragment$SearchResultItem$$SeasonSearchItem);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$SearchResultItem<TRes> {
  factory CopyWith$Fragment$SearchResultItem(
    Fragment$SearchResultItem instance,
    TRes Function(Fragment$SearchResultItem) then,
  ) = _CopyWithImpl$Fragment$SearchResultItem;

  factory CopyWith$Fragment$SearchResultItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SearchResultItem;

  TRes call({
    String? collection,
    String? id,
    String? legacyID,
    String? title,
    String? description,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SearchResultItem<TRes>
    implements CopyWith$Fragment$SearchResultItem<TRes> {
  _CopyWithImpl$Fragment$SearchResultItem(
    this._instance,
    this._then,
  );

  final Fragment$SearchResultItem _instance;

  final TRes Function(Fragment$SearchResultItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? collection = _undefined,
    Object? id = _undefined,
    Object? legacyID = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SearchResultItem(
        collection: collection == _undefined || collection == null
            ? _instance.collection
            : (collection as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        legacyID:
            legacyID == _undefined ? _instance.legacyID : (legacyID as String?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SearchResultItem<TRes>
    implements CopyWith$Fragment$SearchResultItem<TRes> {
  _CopyWithStubImpl$Fragment$SearchResultItem(this._res);

  TRes _res;

  call({
    String? collection,
    String? id,
    String? legacyID,
    String? title,
    String? description,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionSearchResultItem = FragmentDefinitionNode(
  name: NameNode(value: 'SearchResultItem'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SearchResultItem'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'collection'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'legacyID'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'image'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'EpisodeSearchItem'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'showTitle'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'ageRating'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'duration'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'ShowSearchItem'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
      ]),
    ),
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentSearchResultItem = DocumentNode(definitions: [
  fragmentDefinitionSearchResultItem,
]);

extension ClientExtension$Fragment$SearchResultItem on graphql.GraphQLClient {
  void writeFragment$SearchResultItem({
    required Fragment$SearchResultItem data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'SearchResultItem',
            document: documentNodeFragmentSearchResultItem,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$SearchResultItem? readFragment$SearchResultItem({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'SearchResultItem',
          document: documentNodeFragmentSearchResultItem,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$SearchResultItem.fromJson(result);
  }
}

class Fragment$SearchResultItem$$EpisodeSearchItem
    implements Fragment$SearchResultItem {
  Fragment$SearchResultItem$$EpisodeSearchItem({
    this.showTitle,
    required this.ageRating,
    required this.duration,
    this.$__typename = 'EpisodeSearchItem',
    required this.collection,
    required this.id,
    this.legacyID,
    required this.title,
    this.description,
    this.image,
  });

  factory Fragment$SearchResultItem$$EpisodeSearchItem.fromJson(
      Map<String, dynamic> json) {
    final l$showTitle = json['showTitle'];
    final l$ageRating = json['ageRating'];
    final l$duration = json['duration'];
    final l$$__typename = json['__typename'];
    final l$collection = json['collection'];
    final l$id = json['id'];
    final l$legacyID = json['legacyID'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$image = json['image'];
    return Fragment$SearchResultItem$$EpisodeSearchItem(
      showTitle: (l$showTitle as String?),
      ageRating: (l$ageRating as String),
      duration: (l$duration as int),
      $__typename: (l$$__typename as String),
      collection: (l$collection as String),
      id: (l$id as String),
      legacyID: (l$legacyID as String?),
      title: (l$title as String),
      description: (l$description as String?),
      image: (l$image as String?),
    );
  }

  final String? showTitle;

  final String ageRating;

  final int duration;

  final String $__typename;

  final String collection;

  final String id;

  final String? legacyID;

  final String title;

  final String? description;

  final String? image;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$showTitle = showTitle;
    _resultData['showTitle'] = l$showTitle;
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$collection = collection;
    _resultData['collection'] = l$collection;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$legacyID = legacyID;
    _resultData['legacyID'] = l$legacyID;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$image = image;
    _resultData['image'] = l$image;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$showTitle = showTitle;
    final l$ageRating = ageRating;
    final l$duration = duration;
    final l$$__typename = $__typename;
    final l$collection = collection;
    final l$id = id;
    final l$legacyID = legacyID;
    final l$title = title;
    final l$description = description;
    final l$image = image;
    return Object.hashAll([
      l$showTitle,
      l$ageRating,
      l$duration,
      l$$__typename,
      l$collection,
      l$id,
      l$legacyID,
      l$title,
      l$description,
      l$image,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SearchResultItem$$EpisodeSearchItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$showTitle = showTitle;
    final lOther$showTitle = other.showTitle;
    if (l$showTitle != lOther$showTitle) {
      return false;
    }
    final l$ageRating = ageRating;
    final lOther$ageRating = other.ageRating;
    if (l$ageRating != lOther$ageRating) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$collection = collection;
    final lOther$collection = other.collection;
    if (l$collection != lOther$collection) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$legacyID = legacyID;
    final lOther$legacyID = other.legacyID;
    if (l$legacyID != lOther$legacyID) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$SearchResultItem$$EpisodeSearchItem
    on Fragment$SearchResultItem$$EpisodeSearchItem {
  CopyWith$Fragment$SearchResultItem$$EpisodeSearchItem<
          Fragment$SearchResultItem$$EpisodeSearchItem>
      get copyWith => CopyWith$Fragment$SearchResultItem$$EpisodeSearchItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SearchResultItem$$EpisodeSearchItem<TRes> {
  factory CopyWith$Fragment$SearchResultItem$$EpisodeSearchItem(
    Fragment$SearchResultItem$$EpisodeSearchItem instance,
    TRes Function(Fragment$SearchResultItem$$EpisodeSearchItem) then,
  ) = _CopyWithImpl$Fragment$SearchResultItem$$EpisodeSearchItem;

  factory CopyWith$Fragment$SearchResultItem$$EpisodeSearchItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SearchResultItem$$EpisodeSearchItem;

  TRes call({
    String? showTitle,
    String? ageRating,
    int? duration,
    String? $__typename,
    String? collection,
    String? id,
    String? legacyID,
    String? title,
    String? description,
    String? image,
  });
}

class _CopyWithImpl$Fragment$SearchResultItem$$EpisodeSearchItem<TRes>
    implements CopyWith$Fragment$SearchResultItem$$EpisodeSearchItem<TRes> {
  _CopyWithImpl$Fragment$SearchResultItem$$EpisodeSearchItem(
    this._instance,
    this._then,
  );

  final Fragment$SearchResultItem$$EpisodeSearchItem _instance;

  final TRes Function(Fragment$SearchResultItem$$EpisodeSearchItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? showTitle = _undefined,
    Object? ageRating = _undefined,
    Object? duration = _undefined,
    Object? $__typename = _undefined,
    Object? collection = _undefined,
    Object? id = _undefined,
    Object? legacyID = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? image = _undefined,
  }) =>
      _then(Fragment$SearchResultItem$$EpisodeSearchItem(
        showTitle: showTitle == _undefined
            ? _instance.showTitle
            : (showTitle as String?),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        collection: collection == _undefined || collection == null
            ? _instance.collection
            : (collection as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        legacyID:
            legacyID == _undefined ? _instance.legacyID : (legacyID as String?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        image: image == _undefined ? _instance.image : (image as String?),
      ));
}

class _CopyWithStubImpl$Fragment$SearchResultItem$$EpisodeSearchItem<TRes>
    implements CopyWith$Fragment$SearchResultItem$$EpisodeSearchItem<TRes> {
  _CopyWithStubImpl$Fragment$SearchResultItem$$EpisodeSearchItem(this._res);

  TRes _res;

  call({
    String? showTitle,
    String? ageRating,
    int? duration,
    String? $__typename,
    String? collection,
    String? id,
    String? legacyID,
    String? title,
    String? description,
    String? image,
  }) =>
      _res;
}

class Fragment$SearchResultItem$$ShowSearchItem
    implements Fragment$SearchResultItem {
  Fragment$SearchResultItem$$ShowSearchItem({
    this.$__typename = 'ShowSearchItem',
    required this.collection,
    required this.id,
    this.legacyID,
    required this.title,
    this.description,
    this.image,
  });

  factory Fragment$SearchResultItem$$ShowSearchItem.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$collection = json['collection'];
    final l$id = json['id'];
    final l$legacyID = json['legacyID'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$image = json['image'];
    return Fragment$SearchResultItem$$ShowSearchItem(
      $__typename: (l$$__typename as String),
      collection: (l$collection as String),
      id: (l$id as String),
      legacyID: (l$legacyID as String?),
      title: (l$title as String),
      description: (l$description as String?),
      image: (l$image as String?),
    );
  }

  final String $__typename;

  final String collection;

  final String id;

  final String? legacyID;

  final String title;

  final String? description;

  final String? image;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$collection = collection;
    _resultData['collection'] = l$collection;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$legacyID = legacyID;
    _resultData['legacyID'] = l$legacyID;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$image = image;
    _resultData['image'] = l$image;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$collection = collection;
    final l$id = id;
    final l$legacyID = legacyID;
    final l$title = title;
    final l$description = description;
    final l$image = image;
    return Object.hashAll([
      l$$__typename,
      l$collection,
      l$id,
      l$legacyID,
      l$title,
      l$description,
      l$image,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SearchResultItem$$ShowSearchItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$collection = collection;
    final lOther$collection = other.collection;
    if (l$collection != lOther$collection) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$legacyID = legacyID;
    final lOther$legacyID = other.legacyID;
    if (l$legacyID != lOther$legacyID) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$SearchResultItem$$ShowSearchItem
    on Fragment$SearchResultItem$$ShowSearchItem {
  CopyWith$Fragment$SearchResultItem$$ShowSearchItem<
          Fragment$SearchResultItem$$ShowSearchItem>
      get copyWith => CopyWith$Fragment$SearchResultItem$$ShowSearchItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SearchResultItem$$ShowSearchItem<TRes> {
  factory CopyWith$Fragment$SearchResultItem$$ShowSearchItem(
    Fragment$SearchResultItem$$ShowSearchItem instance,
    TRes Function(Fragment$SearchResultItem$$ShowSearchItem) then,
  ) = _CopyWithImpl$Fragment$SearchResultItem$$ShowSearchItem;

  factory CopyWith$Fragment$SearchResultItem$$ShowSearchItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SearchResultItem$$ShowSearchItem;

  TRes call({
    String? $__typename,
    String? collection,
    String? id,
    String? legacyID,
    String? title,
    String? description,
    String? image,
  });
}

class _CopyWithImpl$Fragment$SearchResultItem$$ShowSearchItem<TRes>
    implements CopyWith$Fragment$SearchResultItem$$ShowSearchItem<TRes> {
  _CopyWithImpl$Fragment$SearchResultItem$$ShowSearchItem(
    this._instance,
    this._then,
  );

  final Fragment$SearchResultItem$$ShowSearchItem _instance;

  final TRes Function(Fragment$SearchResultItem$$ShowSearchItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $__typename = _undefined,
    Object? collection = _undefined,
    Object? id = _undefined,
    Object? legacyID = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? image = _undefined,
  }) =>
      _then(Fragment$SearchResultItem$$ShowSearchItem(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        collection: collection == _undefined || collection == null
            ? _instance.collection
            : (collection as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        legacyID:
            legacyID == _undefined ? _instance.legacyID : (legacyID as String?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        image: image == _undefined ? _instance.image : (image as String?),
      ));
}

class _CopyWithStubImpl$Fragment$SearchResultItem$$ShowSearchItem<TRes>
    implements CopyWith$Fragment$SearchResultItem$$ShowSearchItem<TRes> {
  _CopyWithStubImpl$Fragment$SearchResultItem$$ShowSearchItem(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? collection,
    String? id,
    String? legacyID,
    String? title,
    String? description,
    String? image,
  }) =>
      _res;
}

class Fragment$SearchResultItem$$SeasonSearchItem
    implements Fragment$SearchResultItem {
  Fragment$SearchResultItem$$SeasonSearchItem({
    required this.collection,
    required this.id,
    this.legacyID,
    required this.title,
    this.description,
    this.image,
    this.$__typename = 'SeasonSearchItem',
  });

  factory Fragment$SearchResultItem$$SeasonSearchItem.fromJson(
      Map<String, dynamic> json) {
    final l$collection = json['collection'];
    final l$id = json['id'];
    final l$legacyID = json['legacyID'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Fragment$SearchResultItem$$SeasonSearchItem(
      collection: (l$collection as String),
      id: (l$id as String),
      legacyID: (l$legacyID as String?),
      title: (l$title as String),
      description: (l$description as String?),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String collection;

  final String id;

  final String? legacyID;

  final String title;

  final String? description;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$collection = collection;
    _resultData['collection'] = l$collection;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$legacyID = legacyID;
    _resultData['legacyID'] = l$legacyID;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$collection = collection;
    final l$id = id;
    final l$legacyID = legacyID;
    final l$title = title;
    final l$description = description;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$collection,
      l$id,
      l$legacyID,
      l$title,
      l$description,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SearchResultItem$$SeasonSearchItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$collection = collection;
    final lOther$collection = other.collection;
    if (l$collection != lOther$collection) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$legacyID = legacyID;
    final lOther$legacyID = other.legacyID;
    if (l$legacyID != lOther$legacyID) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$SearchResultItem$$SeasonSearchItem
    on Fragment$SearchResultItem$$SeasonSearchItem {
  CopyWith$Fragment$SearchResultItem$$SeasonSearchItem<
          Fragment$SearchResultItem$$SeasonSearchItem>
      get copyWith => CopyWith$Fragment$SearchResultItem$$SeasonSearchItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SearchResultItem$$SeasonSearchItem<TRes> {
  factory CopyWith$Fragment$SearchResultItem$$SeasonSearchItem(
    Fragment$SearchResultItem$$SeasonSearchItem instance,
    TRes Function(Fragment$SearchResultItem$$SeasonSearchItem) then,
  ) = _CopyWithImpl$Fragment$SearchResultItem$$SeasonSearchItem;

  factory CopyWith$Fragment$SearchResultItem$$SeasonSearchItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SearchResultItem$$SeasonSearchItem;

  TRes call({
    String? collection,
    String? id,
    String? legacyID,
    String? title,
    String? description,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SearchResultItem$$SeasonSearchItem<TRes>
    implements CopyWith$Fragment$SearchResultItem$$SeasonSearchItem<TRes> {
  _CopyWithImpl$Fragment$SearchResultItem$$SeasonSearchItem(
    this._instance,
    this._then,
  );

  final Fragment$SearchResultItem$$SeasonSearchItem _instance;

  final TRes Function(Fragment$SearchResultItem$$SeasonSearchItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? collection = _undefined,
    Object? id = _undefined,
    Object? legacyID = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SearchResultItem$$SeasonSearchItem(
        collection: collection == _undefined || collection == null
            ? _instance.collection
            : (collection as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        legacyID:
            legacyID == _undefined ? _instance.legacyID : (legacyID as String?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SearchResultItem$$SeasonSearchItem<TRes>
    implements CopyWith$Fragment$SearchResultItem$$SeasonSearchItem<TRes> {
  _CopyWithStubImpl$Fragment$SearchResultItem$$SeasonSearchItem(this._res);

  TRes _res;

  call({
    String? collection,
    String? id,
    String? legacyID,
    String? title,
    String? description,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$Search {
  factory Variables$Query$Search({
    required String queryString,
    int? first,
    int? offset,
  }) =>
      Variables$Query$Search._({
        r'queryString': queryString,
        if (first != null) r'first': first,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$Search._(this._$data);

  factory Variables$Query$Search.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$queryString = data['queryString'];
    result$data['queryString'] = (l$queryString as String);
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$Search._(result$data);
  }

  Map<String, dynamic> _$data;

  String get queryString => (_$data['queryString'] as String);
  int? get first => (_$data['first'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$queryString = queryString;
    result$data['queryString'] = l$queryString;
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    return result$data;
  }

  CopyWith$Variables$Query$Search<Variables$Query$Search> get copyWith =>
      CopyWith$Variables$Query$Search(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$Search) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$queryString = queryString;
    final lOther$queryString = other.queryString;
    if (l$queryString != lOther$queryString) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$queryString = queryString;
    final l$first = first;
    final l$offset = offset;
    return Object.hashAll([
      l$queryString,
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Search<TRes> {
  factory CopyWith$Variables$Query$Search(
    Variables$Query$Search instance,
    TRes Function(Variables$Query$Search) then,
  ) = _CopyWithImpl$Variables$Query$Search;

  factory CopyWith$Variables$Query$Search.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Search;

  TRes call({
    String? queryString,
    int? first,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$Search<TRes>
    implements CopyWith$Variables$Query$Search<TRes> {
  _CopyWithImpl$Variables$Query$Search(
    this._instance,
    this._then,
  );

  final Variables$Query$Search _instance;

  final TRes Function(Variables$Query$Search) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? queryString = _undefined,
    Object? first = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$Search._({
        ..._instance._$data,
        if (queryString != _undefined && queryString != null)
          'queryString': (queryString as String),
        if (first != _undefined) 'first': (first as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$Search<TRes>
    implements CopyWith$Variables$Query$Search<TRes> {
  _CopyWithStubImpl$Variables$Query$Search(this._res);

  TRes _res;

  call({
    String? queryString,
    int? first,
    int? offset,
  }) =>
      _res;
}

class Query$Search {
  Query$Search({
    required this.search,
    this.$__typename = 'QueryRoot',
  });

  factory Query$Search.fromJson(Map<String, dynamic> json) {
    final l$search = json['search'];
    final l$$__typename = json['__typename'];
    return Query$Search(
      search: Query$Search$search.fromJson((l$search as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Search$search search;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$search = search;
    _resultData['search'] = l$search.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$search = search;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$search,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$search = search;
    final lOther$search = other.search;
    if (l$search != lOther$search) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Search on Query$Search {
  CopyWith$Query$Search<Query$Search> get copyWith => CopyWith$Query$Search(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Search<TRes> {
  factory CopyWith$Query$Search(
    Query$Search instance,
    TRes Function(Query$Search) then,
  ) = _CopyWithImpl$Query$Search;

  factory CopyWith$Query$Search.stub(TRes res) = _CopyWithStubImpl$Query$Search;

  TRes call({
    Query$Search$search? search,
    String? $__typename,
  });
  CopyWith$Query$Search$search<TRes> get search;
}

class _CopyWithImpl$Query$Search<TRes> implements CopyWith$Query$Search<TRes> {
  _CopyWithImpl$Query$Search(
    this._instance,
    this._then,
  );

  final Query$Search _instance;

  final TRes Function(Query$Search) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? search = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search(
        search: search == _undefined || search == null
            ? _instance.search
            : (search as Query$Search$search),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Search$search<TRes> get search {
    final local$search = _instance.search;
    return CopyWith$Query$Search$search(local$search, (e) => call(search: e));
  }
}

class _CopyWithStubImpl$Query$Search<TRes>
    implements CopyWith$Query$Search<TRes> {
  _CopyWithStubImpl$Query$Search(this._res);

  TRes _res;

  call({
    Query$Search$search? search,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Search$search<TRes> get search =>
      CopyWith$Query$Search$search.stub(_res);
}

const documentNodeQuerySearch = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Search'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'queryString')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'search'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'queryString'),
            value: VariableNode(name: NameNode(value: 'queryString')),
          ),
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: VariableNode(name: NameNode(value: 'first')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'hits'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'page'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'result'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'SearchResultItem'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionSearchResultItem,
]);
Query$Search _parserFn$Query$Search(Map<String, dynamic> data) =>
    Query$Search.fromJson(data);
typedef OnQueryComplete$Query$Search = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Search?,
);

class Options$Query$Search extends graphql.QueryOptions<Query$Search> {
  Options$Query$Search({
    String? operationName,
    required Variables$Query$Search variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Search? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Search? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$Search(data),
                  ),
          onError: onError,
          document: documentNodeQuerySearch,
          parserFn: _parserFn$Query$Search,
        );

  final OnQueryComplete$Query$Search? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Search
    extends graphql.WatchQueryOptions<Query$Search> {
  WatchOptions$Query$Search({
    String? operationName,
    required Variables$Query$Search variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Search? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerySearch,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Search,
        );
}

class FetchMoreOptions$Query$Search extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Search({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Search variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerySearch,
        );
}

extension ClientExtension$Query$Search on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Search>> query$Search(
          Options$Query$Search options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$Search> watchQuery$Search(
          WatchOptions$Query$Search options) =>
      this.watchQuery(options);
  void writeQuery$Search({
    required Query$Search data,
    required Variables$Query$Search variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerySearch),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Search? readQuery$Search({
    required Variables$Query$Search variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySearch),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Search.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Search> useQuery$Search(
        Options$Query$Search options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$Search> useWatchQuery$Search(
        WatchOptions$Query$Search options) =>
    graphql_flutter.useWatchQuery(options);

class Query$Search$Widget extends graphql_flutter.Query<Query$Search> {
  Query$Search$Widget({
    widgets.Key? key,
    required Options$Query$Search options,
    required graphql_flutter.QueryBuilder<Query$Search> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$Search$search {
  Query$Search$search({
    required this.hits,
    required this.page,
    required this.result,
    this.$__typename = 'SearchResult',
  });

  factory Query$Search$search.fromJson(Map<String, dynamic> json) {
    final l$hits = json['hits'];
    final l$page = json['page'];
    final l$result = json['result'];
    final l$$__typename = json['__typename'];
    return Query$Search$search(
      hits: (l$hits as int),
      page: (l$page as int),
      result: (l$result as List<dynamic>)
          .map((e) =>
              Fragment$SearchResultItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int hits;

  final int page;

  final List<Fragment$SearchResultItem> result;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hits = hits;
    _resultData['hits'] = l$hits;
    final l$page = page;
    _resultData['page'] = l$page;
    final l$result = result;
    _resultData['result'] = l$result.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hits = hits;
    final l$page = page;
    final l$result = result;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hits,
      l$page,
      Object.hashAll(l$result.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$search) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$hits = hits;
    final lOther$hits = other.hits;
    if (l$hits != lOther$hits) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$result = result;
    final lOther$result = other.result;
    if (l$result.length != lOther$result.length) {
      return false;
    }
    for (int i = 0; i < l$result.length; i++) {
      final l$result$entry = l$result[i];
      final lOther$result$entry = lOther$result[i];
      if (l$result$entry != lOther$result$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Search$search on Query$Search$search {
  CopyWith$Query$Search$search<Query$Search$search> get copyWith =>
      CopyWith$Query$Search$search(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Search$search<TRes> {
  factory CopyWith$Query$Search$search(
    Query$Search$search instance,
    TRes Function(Query$Search$search) then,
  ) = _CopyWithImpl$Query$Search$search;

  factory CopyWith$Query$Search$search.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$search;

  TRes call({
    int? hits,
    int? page,
    List<Fragment$SearchResultItem>? result,
    String? $__typename,
  });
  TRes result(
      Iterable<Fragment$SearchResultItem> Function(
              Iterable<
                  CopyWith$Fragment$SearchResultItem<
                      Fragment$SearchResultItem>>)
          _fn);
}

class _CopyWithImpl$Query$Search$search<TRes>
    implements CopyWith$Query$Search$search<TRes> {
  _CopyWithImpl$Query$Search$search(
    this._instance,
    this._then,
  );

  final Query$Search$search _instance;

  final TRes Function(Query$Search$search) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hits = _undefined,
    Object? page = _undefined,
    Object? result = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$search(
        hits:
            hits == _undefined || hits == null ? _instance.hits : (hits as int),
        page:
            page == _undefined || page == null ? _instance.page : (page as int),
        result: result == _undefined || result == null
            ? _instance.result
            : (result as List<Fragment$SearchResultItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes result(
          Iterable<Fragment$SearchResultItem> Function(
                  Iterable<
                      CopyWith$Fragment$SearchResultItem<
                          Fragment$SearchResultItem>>)
              _fn) =>
      call(
          result: _fn(
              _instance.result.map((e) => CopyWith$Fragment$SearchResultItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$Search$search<TRes>
    implements CopyWith$Query$Search$search<TRes> {
  _CopyWithStubImpl$Query$Search$search(this._res);

  TRes _res;

  call({
    int? hits,
    int? page,
    List<Fragment$SearchResultItem>? result,
    String? $__typename,
  }) =>
      _res;
  result(_fn) => _res;
}
