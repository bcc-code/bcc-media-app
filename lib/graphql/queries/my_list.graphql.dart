import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$MyListEntry {
  Fragment$MyListEntry({
    required this.item,
    this.$__typename = 'UserCollectionEntry',
  });

  factory Fragment$MyListEntry.fromJson(Map<String, dynamic> json) {
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$MyListEntry(
      item:
          Fragment$MyListEntry$item.fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MyListEntry$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$MyListEntry) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Fragment$MyListEntry on Fragment$MyListEntry {
  CopyWith$Fragment$MyListEntry<Fragment$MyListEntry> get copyWith =>
      CopyWith$Fragment$MyListEntry(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$MyListEntry<TRes> {
  factory CopyWith$Fragment$MyListEntry(
    Fragment$MyListEntry instance,
    TRes Function(Fragment$MyListEntry) then,
  ) = _CopyWithImpl$Fragment$MyListEntry;

  factory CopyWith$Fragment$MyListEntry.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MyListEntry;

  TRes call({
    Fragment$MyListEntry$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$MyListEntry$item<TRes> get item;
}

class _CopyWithImpl$Fragment$MyListEntry<TRes>
    implements CopyWith$Fragment$MyListEntry<TRes> {
  _CopyWithImpl$Fragment$MyListEntry(
    this._instance,
    this._then,
  );

  final Fragment$MyListEntry _instance;

  final TRes Function(Fragment$MyListEntry) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MyListEntry(
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$MyListEntry$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$MyListEntry$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$MyListEntry$item(local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$MyListEntry<TRes>
    implements CopyWith$Fragment$MyListEntry<TRes> {
  _CopyWithStubImpl$Fragment$MyListEntry(this._res);

  TRes _res;

  call({
    Fragment$MyListEntry$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$MyListEntry$item<TRes> get item =>
      CopyWith$Fragment$MyListEntry$item.stub(_res);
}

const fragmentDefinitionMyListEntry = FragmentDefinitionNode(
  name: NameNode(value: 'MyListEntry'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'UserCollectionEntry'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'item'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'Episode'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'id'),
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
              name: NameNode(value: 'duration'),
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
            FieldNode(
              name: NameNode(value: 'locked'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'progress'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'publishDate'),
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
);
const documentNodeFragmentMyListEntry = DocumentNode(definitions: [
  fragmentDefinitionMyListEntry,
]);

extension ClientExtension$Fragment$MyListEntry on graphql.GraphQLClient {
  void writeFragment$MyListEntry({
    required Fragment$MyListEntry data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'MyListEntry',
            document: documentNodeFragmentMyListEntry,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$MyListEntry? readFragment$MyListEntry({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'MyListEntry',
          document: documentNodeFragmentMyListEntry,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$MyListEntry.fromJson(result);
  }
}

class Fragment$MyListEntry$item {
  Fragment$MyListEntry$item({required this.$__typename});

  factory Fragment$MyListEntry$item.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Episode":
        return Fragment$MyListEntry$item$$Episode.fromJson(json);

      case "Show":
        return Fragment$MyListEntry$item$$Show.fromJson(json);

      case "Short":
        return Fragment$MyListEntry$item$$Short.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$MyListEntry$item(
            $__typename: (l$$__typename as String));
    }
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$MyListEntry$item) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$MyListEntry$item
    on Fragment$MyListEntry$item {
  CopyWith$Fragment$MyListEntry$item<Fragment$MyListEntry$item> get copyWith =>
      CopyWith$Fragment$MyListEntry$item(
        this,
        (i) => i,
      );
  _T when<_T>({
    required _T Function(Fragment$MyListEntry$item$$Episode) episode,
    required _T Function(Fragment$MyListEntry$item$$Show) show,
    required _T Function(Fragment$MyListEntry$item$$Short) short,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        return episode(this as Fragment$MyListEntry$item$$Episode);

      case "Show":
        return show(this as Fragment$MyListEntry$item$$Show);

      case "Short":
        return short(this as Fragment$MyListEntry$item$$Short);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$MyListEntry$item$$Episode)? episode,
    _T Function(Fragment$MyListEntry$item$$Show)? show,
    _T Function(Fragment$MyListEntry$item$$Short)? short,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        if (episode != null) {
          return episode(this as Fragment$MyListEntry$item$$Episode);
        } else {
          return orElse();
        }

      case "Show":
        if (show != null) {
          return show(this as Fragment$MyListEntry$item$$Show);
        } else {
          return orElse();
        }

      case "Short":
        if (short != null) {
          return short(this as Fragment$MyListEntry$item$$Short);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$MyListEntry$item<TRes> {
  factory CopyWith$Fragment$MyListEntry$item(
    Fragment$MyListEntry$item instance,
    TRes Function(Fragment$MyListEntry$item) then,
  ) = _CopyWithImpl$Fragment$MyListEntry$item;

  factory CopyWith$Fragment$MyListEntry$item.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MyListEntry$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$MyListEntry$item<TRes>
    implements CopyWith$Fragment$MyListEntry$item<TRes> {
  _CopyWithImpl$Fragment$MyListEntry$item(
    this._instance,
    this._then,
  );

  final Fragment$MyListEntry$item _instance;

  final TRes Function(Fragment$MyListEntry$item) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$MyListEntry$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$MyListEntry$item<TRes>
    implements CopyWith$Fragment$MyListEntry$item<TRes> {
  _CopyWithStubImpl$Fragment$MyListEntry$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$MyListEntry$item$$Episode implements Fragment$MyListEntry$item {
  Fragment$MyListEntry$item$$Episode({
    required this.id,
    required this.title,
    required this.duration,
    this.image,
    required this.locked,
    this.progress,
    required this.publishDate,
    this.$__typename = 'Episode',
  });

  factory Fragment$MyListEntry$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$duration = json['duration'];
    final l$image = json['image'];
    final l$locked = json['locked'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$$__typename = json['__typename'];
    return Fragment$MyListEntry$item$$Episode(
      id: (l$id as String),
      title: (l$title as String),
      duration: (l$duration as int),
      image: (l$image as String?),
      locked: (l$locked as bool),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final int duration;

  final String? image;

  final bool locked;

  final int? progress;

  final String publishDate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$locked = locked;
    _resultData['locked'] = l$locked;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$duration = duration;
    final l$image = image;
    final l$locked = locked;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$duration,
      l$image,
      l$locked,
      l$progress,
      l$publishDate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$MyListEntry$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$locked = locked;
    final lOther$locked = other.locked;
    if (l$locked != lOther$locked) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
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

extension UtilityExtension$Fragment$MyListEntry$item$$Episode
    on Fragment$MyListEntry$item$$Episode {
  CopyWith$Fragment$MyListEntry$item$$Episode<
          Fragment$MyListEntry$item$$Episode>
      get copyWith => CopyWith$Fragment$MyListEntry$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MyListEntry$item$$Episode<TRes> {
  factory CopyWith$Fragment$MyListEntry$item$$Episode(
    Fragment$MyListEntry$item$$Episode instance,
    TRes Function(Fragment$MyListEntry$item$$Episode) then,
  ) = _CopyWithImpl$Fragment$MyListEntry$item$$Episode;

  factory CopyWith$Fragment$MyListEntry$item$$Episode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MyListEntry$item$$Episode;

  TRes call({
    String? id,
    String? title,
    int? duration,
    String? image,
    bool? locked,
    int? progress,
    String? publishDate,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MyListEntry$item$$Episode<TRes>
    implements CopyWith$Fragment$MyListEntry$item$$Episode<TRes> {
  _CopyWithImpl$Fragment$MyListEntry$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$MyListEntry$item$$Episode _instance;

  final TRes Function(Fragment$MyListEntry$item$$Episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? duration = _undefined,
    Object? image = _undefined,
    Object? locked = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MyListEntry$item$$Episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        image: image == _undefined ? _instance.image : (image as String?),
        locked: locked == _undefined || locked == null
            ? _instance.locked
            : (locked as bool),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$MyListEntry$item$$Episode<TRes>
    implements CopyWith$Fragment$MyListEntry$item$$Episode<TRes> {
  _CopyWithStubImpl$Fragment$MyListEntry$item$$Episode(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    int? duration,
    String? image,
    bool? locked,
    int? progress,
    String? publishDate,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$MyListEntry$item$$Show implements Fragment$MyListEntry$item {
  Fragment$MyListEntry$item$$Show({this.$__typename = 'Show'});

  factory Fragment$MyListEntry$item$$Show.fromJson(Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$MyListEntry$item$$Show(
        $__typename: (l$$__typename as String));
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$MyListEntry$item$$Show) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$MyListEntry$item$$Show
    on Fragment$MyListEntry$item$$Show {
  CopyWith$Fragment$MyListEntry$item$$Show<Fragment$MyListEntry$item$$Show>
      get copyWith => CopyWith$Fragment$MyListEntry$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MyListEntry$item$$Show<TRes> {
  factory CopyWith$Fragment$MyListEntry$item$$Show(
    Fragment$MyListEntry$item$$Show instance,
    TRes Function(Fragment$MyListEntry$item$$Show) then,
  ) = _CopyWithImpl$Fragment$MyListEntry$item$$Show;

  factory CopyWith$Fragment$MyListEntry$item$$Show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MyListEntry$item$$Show;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$MyListEntry$item$$Show<TRes>
    implements CopyWith$Fragment$MyListEntry$item$$Show<TRes> {
  _CopyWithImpl$Fragment$MyListEntry$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$MyListEntry$item$$Show _instance;

  final TRes Function(Fragment$MyListEntry$item$$Show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$MyListEntry$item$$Show(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$MyListEntry$item$$Show<TRes>
    implements CopyWith$Fragment$MyListEntry$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$MyListEntry$item$$Show(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$MyListEntry$item$$Short implements Fragment$MyListEntry$item {
  Fragment$MyListEntry$item$$Short({this.$__typename = 'Short'});

  factory Fragment$MyListEntry$item$$Short.fromJson(Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$MyListEntry$item$$Short(
        $__typename: (l$$__typename as String));
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$MyListEntry$item$$Short) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$MyListEntry$item$$Short
    on Fragment$MyListEntry$item$$Short {
  CopyWith$Fragment$MyListEntry$item$$Short<Fragment$MyListEntry$item$$Short>
      get copyWith => CopyWith$Fragment$MyListEntry$item$$Short(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$MyListEntry$item$$Short<TRes> {
  factory CopyWith$Fragment$MyListEntry$item$$Short(
    Fragment$MyListEntry$item$$Short instance,
    TRes Function(Fragment$MyListEntry$item$$Short) then,
  ) = _CopyWithImpl$Fragment$MyListEntry$item$$Short;

  factory CopyWith$Fragment$MyListEntry$item$$Short.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MyListEntry$item$$Short;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$MyListEntry$item$$Short<TRes>
    implements CopyWith$Fragment$MyListEntry$item$$Short<TRes> {
  _CopyWithImpl$Fragment$MyListEntry$item$$Short(
    this._instance,
    this._then,
  );

  final Fragment$MyListEntry$item$$Short _instance;

  final TRes Function(Fragment$MyListEntry$item$$Short) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$MyListEntry$item$$Short(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$MyListEntry$item$$Short<TRes>
    implements CopyWith$Fragment$MyListEntry$item$$Short<TRes> {
  _CopyWithStubImpl$Fragment$MyListEntry$item$$Short(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$MyList {
  Query$MyList({
    required this.myList,
    this.$__typename = 'QueryRoot',
  });

  factory Query$MyList.fromJson(Map<String, dynamic> json) {
    final l$myList = json['myList'];
    final l$$__typename = json['__typename'];
    return Query$MyList(
      myList: Query$MyList$myList.fromJson((l$myList as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyList$myList myList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myList = myList;
    _resultData['myList'] = l$myList.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myList = myList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$myList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$MyList) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myList = myList;
    final lOther$myList = other.myList;
    if (l$myList != lOther$myList) {
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

extension UtilityExtension$Query$MyList on Query$MyList {
  CopyWith$Query$MyList<Query$MyList> get copyWith => CopyWith$Query$MyList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MyList<TRes> {
  factory CopyWith$Query$MyList(
    Query$MyList instance,
    TRes Function(Query$MyList) then,
  ) = _CopyWithImpl$Query$MyList;

  factory CopyWith$Query$MyList.stub(TRes res) = _CopyWithStubImpl$Query$MyList;

  TRes call({
    Query$MyList$myList? myList,
    String? $__typename,
  });
  CopyWith$Query$MyList$myList<TRes> get myList;
}

class _CopyWithImpl$Query$MyList<TRes> implements CopyWith$Query$MyList<TRes> {
  _CopyWithImpl$Query$MyList(
    this._instance,
    this._then,
  );

  final Query$MyList _instance;

  final TRes Function(Query$MyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? myList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MyList(
        myList: myList == _undefined || myList == null
            ? _instance.myList
            : (myList as Query$MyList$myList),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$MyList$myList<TRes> get myList {
    final local$myList = _instance.myList;
    return CopyWith$Query$MyList$myList(local$myList, (e) => call(myList: e));
  }
}

class _CopyWithStubImpl$Query$MyList<TRes>
    implements CopyWith$Query$MyList<TRes> {
  _CopyWithStubImpl$Query$MyList(this._res);

  TRes _res;

  call({
    Query$MyList$myList? myList,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$MyList$myList<TRes> get myList =>
      CopyWith$Query$MyList$myList.stub(_res);
}

const documentNodeQueryMyList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'MyList'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'myList'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'entries'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'MyListEntry'),
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
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionMyListEntry,
]);
Query$MyList _parserFn$Query$MyList(Map<String, dynamic> data) =>
    Query$MyList.fromJson(data);
typedef OnQueryComplete$Query$MyList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$MyList?,
);

class Options$Query$MyList extends graphql.QueryOptions<Query$MyList> {
  Options$Query$MyList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyList? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MyList? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
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
                    data == null ? null : _parserFn$Query$MyList(data),
                  ),
          onError: onError,
          document: documentNodeQueryMyList,
          parserFn: _parserFn$Query$MyList,
        );

  final OnQueryComplete$Query$MyList? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$MyList
    extends graphql.WatchQueryOptions<Query$MyList> {
  WatchOptions$Query$MyList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MyList? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryMyList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$MyList,
        );
}

class FetchMoreOptions$Query$MyList extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MyList({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryMyList,
        );
}

extension ClientExtension$Query$MyList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MyList>> query$MyList(
          [Options$Query$MyList? options]) async =>
      await this.query(options ?? Options$Query$MyList());
  graphql.ObservableQuery<Query$MyList> watchQuery$MyList(
          [WatchOptions$Query$MyList? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$MyList());
  void writeQuery$MyList({
    required Query$MyList data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryMyList)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$MyList? readQuery$MyList({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryMyList)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MyList.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$MyList> useQuery$MyList(
        [Options$Query$MyList? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$MyList());
graphql.ObservableQuery<Query$MyList> useWatchQuery$MyList(
        [WatchOptions$Query$MyList? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$MyList());

class Query$MyList$Widget extends graphql_flutter.Query<Query$MyList> {
  Query$MyList$Widget({
    widgets.Key? key,
    Options$Query$MyList? options,
    required graphql_flutter.QueryBuilder<Query$MyList> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$MyList(),
          builder: builder,
        );
}

class Query$MyList$myList {
  Query$MyList$myList({
    required this.entries,
    this.$__typename = 'UserCollection',
  });

  factory Query$MyList$myList.fromJson(Map<String, dynamic> json) {
    final l$entries = json['entries'];
    final l$$__typename = json['__typename'];
    return Query$MyList$myList(
      entries: Query$MyList$myList$entries.fromJson(
          (l$entries as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$MyList$myList$entries entries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$entries = entries;
    _resultData['entries'] = l$entries.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$entries = entries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$entries,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$MyList$myList) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$entries = entries;
    final lOther$entries = other.entries;
    if (l$entries != lOther$entries) {
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

extension UtilityExtension$Query$MyList$myList on Query$MyList$myList {
  CopyWith$Query$MyList$myList<Query$MyList$myList> get copyWith =>
      CopyWith$Query$MyList$myList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MyList$myList<TRes> {
  factory CopyWith$Query$MyList$myList(
    Query$MyList$myList instance,
    TRes Function(Query$MyList$myList) then,
  ) = _CopyWithImpl$Query$MyList$myList;

  factory CopyWith$Query$MyList$myList.stub(TRes res) =
      _CopyWithStubImpl$Query$MyList$myList;

  TRes call({
    Query$MyList$myList$entries? entries,
    String? $__typename,
  });
  CopyWith$Query$MyList$myList$entries<TRes> get entries;
}

class _CopyWithImpl$Query$MyList$myList<TRes>
    implements CopyWith$Query$MyList$myList<TRes> {
  _CopyWithImpl$Query$MyList$myList(
    this._instance,
    this._then,
  );

  final Query$MyList$myList _instance;

  final TRes Function(Query$MyList$myList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? entries = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MyList$myList(
        entries: entries == _undefined || entries == null
            ? _instance.entries
            : (entries as Query$MyList$myList$entries),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$MyList$myList$entries<TRes> get entries {
    final local$entries = _instance.entries;
    return CopyWith$Query$MyList$myList$entries(
        local$entries, (e) => call(entries: e));
  }
}

class _CopyWithStubImpl$Query$MyList$myList<TRes>
    implements CopyWith$Query$MyList$myList<TRes> {
  _CopyWithStubImpl$Query$MyList$myList(this._res);

  TRes _res;

  call({
    Query$MyList$myList$entries? entries,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$MyList$myList$entries<TRes> get entries =>
      CopyWith$Query$MyList$myList$entries.stub(_res);
}

class Query$MyList$myList$entries {
  Query$MyList$myList$entries({
    required this.items,
    this.$__typename = 'UserCollectionEntryPagination',
  });

  factory Query$MyList$myList$entries.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$MyList$myList$entries(
      items: (l$items as List<dynamic>)
          .map(
              (e) => Fragment$MyListEntry.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$MyListEntry> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$MyList$myList$entries) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
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

extension UtilityExtension$Query$MyList$myList$entries
    on Query$MyList$myList$entries {
  CopyWith$Query$MyList$myList$entries<Query$MyList$myList$entries>
      get copyWith => CopyWith$Query$MyList$myList$entries(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MyList$myList$entries<TRes> {
  factory CopyWith$Query$MyList$myList$entries(
    Query$MyList$myList$entries instance,
    TRes Function(Query$MyList$myList$entries) then,
  ) = _CopyWithImpl$Query$MyList$myList$entries;

  factory CopyWith$Query$MyList$myList$entries.stub(TRes res) =
      _CopyWithStubImpl$Query$MyList$myList$entries;

  TRes call({
    List<Fragment$MyListEntry>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$MyListEntry> Function(
              Iterable<CopyWith$Fragment$MyListEntry<Fragment$MyListEntry>>)
          _fn);
}

class _CopyWithImpl$Query$MyList$myList$entries<TRes>
    implements CopyWith$Query$MyList$myList$entries<TRes> {
  _CopyWithImpl$Query$MyList$myList$entries(
    this._instance,
    this._then,
  );

  final Query$MyList$myList$entries _instance;

  final TRes Function(Query$MyList$myList$entries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MyList$myList$entries(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$MyListEntry>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$MyListEntry> Function(
                  Iterable<CopyWith$Fragment$MyListEntry<Fragment$MyListEntry>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$MyListEntry(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$MyList$myList$entries<TRes>
    implements CopyWith$Query$MyList$myList$entries<TRes> {
  _CopyWithStubImpl$Query$MyList$myList$entries(this._res);

  TRes _res;

  call({
    List<Fragment$MyListEntry>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Variables$Mutation$addEpisodeToMyList {
  factory Variables$Mutation$addEpisodeToMyList({required String episodeId}) =>
      Variables$Mutation$addEpisodeToMyList._({
        r'episodeId': episodeId,
      });

  Variables$Mutation$addEpisodeToMyList._(this._$data);

  factory Variables$Mutation$addEpisodeToMyList.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$episodeId = data['episodeId'];
    result$data['episodeId'] = (l$episodeId as String);
    return Variables$Mutation$addEpisodeToMyList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get episodeId => (_$data['episodeId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$episodeId = episodeId;
    result$data['episodeId'] = l$episodeId;
    return result$data;
  }

  CopyWith$Variables$Mutation$addEpisodeToMyList<
          Variables$Mutation$addEpisodeToMyList>
      get copyWith => CopyWith$Variables$Mutation$addEpisodeToMyList(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addEpisodeToMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$episodeId = episodeId;
    final lOther$episodeId = other.episodeId;
    if (l$episodeId != lOther$episodeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$episodeId = episodeId;
    return Object.hashAll([l$episodeId]);
  }
}

abstract class CopyWith$Variables$Mutation$addEpisodeToMyList<TRes> {
  factory CopyWith$Variables$Mutation$addEpisodeToMyList(
    Variables$Mutation$addEpisodeToMyList instance,
    TRes Function(Variables$Mutation$addEpisodeToMyList) then,
  ) = _CopyWithImpl$Variables$Mutation$addEpisodeToMyList;

  factory CopyWith$Variables$Mutation$addEpisodeToMyList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addEpisodeToMyList;

  TRes call({String? episodeId});
}

class _CopyWithImpl$Variables$Mutation$addEpisodeToMyList<TRes>
    implements CopyWith$Variables$Mutation$addEpisodeToMyList<TRes> {
  _CopyWithImpl$Variables$Mutation$addEpisodeToMyList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addEpisodeToMyList _instance;

  final TRes Function(Variables$Mutation$addEpisodeToMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? episodeId = _undefined}) =>
      _then(Variables$Mutation$addEpisodeToMyList._({
        ..._instance._$data,
        if (episodeId != _undefined && episodeId != null)
          'episodeId': (episodeId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addEpisodeToMyList<TRes>
    implements CopyWith$Variables$Mutation$addEpisodeToMyList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addEpisodeToMyList(this._res);

  TRes _res;

  call({String? episodeId}) => _res;
}

class Mutation$addEpisodeToMyList {
  Mutation$addEpisodeToMyList({
    required this.addEpisodeToMyList,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$addEpisodeToMyList.fromJson(Map<String, dynamic> json) {
    final l$addEpisodeToMyList = json['addEpisodeToMyList'];
    final l$$__typename = json['__typename'];
    return Mutation$addEpisodeToMyList(
      addEpisodeToMyList:
          Mutation$addEpisodeToMyList$addEpisodeToMyList.fromJson(
              (l$addEpisodeToMyList as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$addEpisodeToMyList$addEpisodeToMyList addEpisodeToMyList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addEpisodeToMyList = addEpisodeToMyList;
    _resultData['addEpisodeToMyList'] = l$addEpisodeToMyList.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addEpisodeToMyList = addEpisodeToMyList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addEpisodeToMyList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addEpisodeToMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addEpisodeToMyList = addEpisodeToMyList;
    final lOther$addEpisodeToMyList = other.addEpisodeToMyList;
    if (l$addEpisodeToMyList != lOther$addEpisodeToMyList) {
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

extension UtilityExtension$Mutation$addEpisodeToMyList
    on Mutation$addEpisodeToMyList {
  CopyWith$Mutation$addEpisodeToMyList<Mutation$addEpisodeToMyList>
      get copyWith => CopyWith$Mutation$addEpisodeToMyList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addEpisodeToMyList<TRes> {
  factory CopyWith$Mutation$addEpisodeToMyList(
    Mutation$addEpisodeToMyList instance,
    TRes Function(Mutation$addEpisodeToMyList) then,
  ) = _CopyWithImpl$Mutation$addEpisodeToMyList;

  factory CopyWith$Mutation$addEpisodeToMyList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addEpisodeToMyList;

  TRes call({
    Mutation$addEpisodeToMyList$addEpisodeToMyList? addEpisodeToMyList,
    String? $__typename,
  });
  CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
      get addEpisodeToMyList;
}

class _CopyWithImpl$Mutation$addEpisodeToMyList<TRes>
    implements CopyWith$Mutation$addEpisodeToMyList<TRes> {
  _CopyWithImpl$Mutation$addEpisodeToMyList(
    this._instance,
    this._then,
  );

  final Mutation$addEpisodeToMyList _instance;

  final TRes Function(Mutation$addEpisodeToMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addEpisodeToMyList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addEpisodeToMyList(
        addEpisodeToMyList:
            addEpisodeToMyList == _undefined || addEpisodeToMyList == null
                ? _instance.addEpisodeToMyList
                : (addEpisodeToMyList
                    as Mutation$addEpisodeToMyList$addEpisodeToMyList),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
      get addEpisodeToMyList {
    final local$addEpisodeToMyList = _instance.addEpisodeToMyList;
    return CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList(
        local$addEpisodeToMyList, (e) => call(addEpisodeToMyList: e));
  }
}

class _CopyWithStubImpl$Mutation$addEpisodeToMyList<TRes>
    implements CopyWith$Mutation$addEpisodeToMyList<TRes> {
  _CopyWithStubImpl$Mutation$addEpisodeToMyList(this._res);

  TRes _res;

  call({
    Mutation$addEpisodeToMyList$addEpisodeToMyList? addEpisodeToMyList,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
      get addEpisodeToMyList =>
          CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList.stub(_res);
}

const documentNodeMutationaddEpisodeToMyList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addEpisodeToMyList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'episodeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addEpisodeToMyList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'episodeId'),
            value: VariableNode(name: NameNode(value: 'episodeId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'entryId'),
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
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$addEpisodeToMyList _parserFn$Mutation$addEpisodeToMyList(
        Map<String, dynamic> data) =>
    Mutation$addEpisodeToMyList.fromJson(data);
typedef OnMutationCompleted$Mutation$addEpisodeToMyList = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$addEpisodeToMyList?,
);

class Options$Mutation$addEpisodeToMyList
    extends graphql.MutationOptions<Mutation$addEpisodeToMyList> {
  Options$Mutation$addEpisodeToMyList({
    String? operationName,
    required Variables$Mutation$addEpisodeToMyList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$addEpisodeToMyList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addEpisodeToMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$addEpisodeToMyList>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$addEpisodeToMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddEpisodeToMyList,
          parserFn: _parserFn$Mutation$addEpisodeToMyList,
        );

  final OnMutationCompleted$Mutation$addEpisodeToMyList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addEpisodeToMyList
    extends graphql.WatchQueryOptions<Mutation$addEpisodeToMyList> {
  WatchOptions$Mutation$addEpisodeToMyList({
    String? operationName,
    required Variables$Mutation$addEpisodeToMyList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$addEpisodeToMyList? typedOptimisticResult,
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
          document: documentNodeMutationaddEpisodeToMyList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addEpisodeToMyList,
        );
}

extension ClientExtension$Mutation$addEpisodeToMyList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addEpisodeToMyList>>
      mutate$addEpisodeToMyList(
              Options$Mutation$addEpisodeToMyList options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$addEpisodeToMyList>
      watchMutation$addEpisodeToMyList(
              WatchOptions$Mutation$addEpisodeToMyList options) =>
          this.watchMutation(options);
}

class Mutation$addEpisodeToMyList$HookResult {
  Mutation$addEpisodeToMyList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$addEpisodeToMyList runMutation;

  final graphql.QueryResult<Mutation$addEpisodeToMyList> result;
}

Mutation$addEpisodeToMyList$HookResult useMutation$addEpisodeToMyList(
    [WidgetOptions$Mutation$addEpisodeToMyList? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$addEpisodeToMyList());
  return Mutation$addEpisodeToMyList$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$addEpisodeToMyList>
    useWatchMutation$addEpisodeToMyList(
            WatchOptions$Mutation$addEpisodeToMyList options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$addEpisodeToMyList
    extends graphql.MutationOptions<Mutation$addEpisodeToMyList> {
  WidgetOptions$Mutation$addEpisodeToMyList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$addEpisodeToMyList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addEpisodeToMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$addEpisodeToMyList>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$addEpisodeToMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddEpisodeToMyList,
          parserFn: _parserFn$Mutation$addEpisodeToMyList,
        );

  final OnMutationCompleted$Mutation$addEpisodeToMyList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$addEpisodeToMyList
    = graphql.MultiSourceResult<Mutation$addEpisodeToMyList> Function(
  Variables$Mutation$addEpisodeToMyList, {
  Object? optimisticResult,
  Mutation$addEpisodeToMyList? typedOptimisticResult,
});
typedef Builder$Mutation$addEpisodeToMyList = widgets.Widget Function(
  RunMutation$Mutation$addEpisodeToMyList,
  graphql.QueryResult<Mutation$addEpisodeToMyList>?,
);

class Mutation$addEpisodeToMyList$Widget
    extends graphql_flutter.Mutation<Mutation$addEpisodeToMyList> {
  Mutation$addEpisodeToMyList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$addEpisodeToMyList? options,
    required Builder$Mutation$addEpisodeToMyList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$addEpisodeToMyList(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$addEpisodeToMyList$addEpisodeToMyList {
  Mutation$addEpisodeToMyList$addEpisodeToMyList({
    required this.entryId,
    this.$__typename = 'AddToCollectionResult',
  });

  factory Mutation$addEpisodeToMyList$addEpisodeToMyList.fromJson(
      Map<String, dynamic> json) {
    final l$entryId = json['entryId'];
    final l$$__typename = json['__typename'];
    return Mutation$addEpisodeToMyList$addEpisodeToMyList(
      entryId: (l$entryId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String entryId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$entryId = entryId;
    _resultData['entryId'] = l$entryId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$entryId = entryId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$entryId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addEpisodeToMyList$addEpisodeToMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$entryId = entryId;
    final lOther$entryId = other.entryId;
    if (l$entryId != lOther$entryId) {
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

extension UtilityExtension$Mutation$addEpisodeToMyList$addEpisodeToMyList
    on Mutation$addEpisodeToMyList$addEpisodeToMyList {
  CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<
          Mutation$addEpisodeToMyList$addEpisodeToMyList>
      get copyWith => CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes> {
  factory CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList(
    Mutation$addEpisodeToMyList$addEpisodeToMyList instance,
    TRes Function(Mutation$addEpisodeToMyList$addEpisodeToMyList) then,
  ) = _CopyWithImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList;

  factory CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList;

  TRes call({
    String? entryId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
    implements CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes> {
  _CopyWithImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList(
    this._instance,
    this._then,
  );

  final Mutation$addEpisodeToMyList$addEpisodeToMyList _instance;

  final TRes Function(Mutation$addEpisodeToMyList$addEpisodeToMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? entryId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addEpisodeToMyList$addEpisodeToMyList(
        entryId: entryId == _undefined || entryId == null
            ? _instance.entryId
            : (entryId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
    implements CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes> {
  _CopyWithStubImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList(this._res);

  TRes _res;

  call({
    String? entryId,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$addShortToMyList {
  factory Variables$Mutation$addShortToMyList({required String shortId}) =>
      Variables$Mutation$addShortToMyList._({
        r'shortId': shortId,
      });

  Variables$Mutation$addShortToMyList._(this._$data);

  factory Variables$Mutation$addShortToMyList.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$shortId = data['shortId'];
    result$data['shortId'] = (l$shortId as String);
    return Variables$Mutation$addShortToMyList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get shortId => (_$data['shortId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$shortId = shortId;
    result$data['shortId'] = l$shortId;
    return result$data;
  }

  CopyWith$Variables$Mutation$addShortToMyList<
          Variables$Mutation$addShortToMyList>
      get copyWith => CopyWith$Variables$Mutation$addShortToMyList(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addShortToMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$shortId = shortId;
    final lOther$shortId = other.shortId;
    if (l$shortId != lOther$shortId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$shortId = shortId;
    return Object.hashAll([l$shortId]);
  }
}

abstract class CopyWith$Variables$Mutation$addShortToMyList<TRes> {
  factory CopyWith$Variables$Mutation$addShortToMyList(
    Variables$Mutation$addShortToMyList instance,
    TRes Function(Variables$Mutation$addShortToMyList) then,
  ) = _CopyWithImpl$Variables$Mutation$addShortToMyList;

  factory CopyWith$Variables$Mutation$addShortToMyList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addShortToMyList;

  TRes call({String? shortId});
}

class _CopyWithImpl$Variables$Mutation$addShortToMyList<TRes>
    implements CopyWith$Variables$Mutation$addShortToMyList<TRes> {
  _CopyWithImpl$Variables$Mutation$addShortToMyList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addShortToMyList _instance;

  final TRes Function(Variables$Mutation$addShortToMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? shortId = _undefined}) =>
      _then(Variables$Mutation$addShortToMyList._({
        ..._instance._$data,
        if (shortId != _undefined && shortId != null)
          'shortId': (shortId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addShortToMyList<TRes>
    implements CopyWith$Variables$Mutation$addShortToMyList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addShortToMyList(this._res);

  TRes _res;

  call({String? shortId}) => _res;
}

class Mutation$addShortToMyList {
  Mutation$addShortToMyList({
    required this.addShortToMyList,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$addShortToMyList.fromJson(Map<String, dynamic> json) {
    final l$addShortToMyList = json['addShortToMyList'];
    final l$$__typename = json['__typename'];
    return Mutation$addShortToMyList(
      addShortToMyList: Mutation$addShortToMyList$addShortToMyList.fromJson(
          (l$addShortToMyList as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$addShortToMyList$addShortToMyList addShortToMyList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addShortToMyList = addShortToMyList;
    _resultData['addShortToMyList'] = l$addShortToMyList.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addShortToMyList = addShortToMyList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addShortToMyList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addShortToMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addShortToMyList = addShortToMyList;
    final lOther$addShortToMyList = other.addShortToMyList;
    if (l$addShortToMyList != lOther$addShortToMyList) {
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

extension UtilityExtension$Mutation$addShortToMyList
    on Mutation$addShortToMyList {
  CopyWith$Mutation$addShortToMyList<Mutation$addShortToMyList> get copyWith =>
      CopyWith$Mutation$addShortToMyList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addShortToMyList<TRes> {
  factory CopyWith$Mutation$addShortToMyList(
    Mutation$addShortToMyList instance,
    TRes Function(Mutation$addShortToMyList) then,
  ) = _CopyWithImpl$Mutation$addShortToMyList;

  factory CopyWith$Mutation$addShortToMyList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addShortToMyList;

  TRes call({
    Mutation$addShortToMyList$addShortToMyList? addShortToMyList,
    String? $__typename,
  });
  CopyWith$Mutation$addShortToMyList$addShortToMyList<TRes>
      get addShortToMyList;
}

class _CopyWithImpl$Mutation$addShortToMyList<TRes>
    implements CopyWith$Mutation$addShortToMyList<TRes> {
  _CopyWithImpl$Mutation$addShortToMyList(
    this._instance,
    this._then,
  );

  final Mutation$addShortToMyList _instance;

  final TRes Function(Mutation$addShortToMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addShortToMyList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addShortToMyList(
        addShortToMyList: addShortToMyList == _undefined ||
                addShortToMyList == null
            ? _instance.addShortToMyList
            : (addShortToMyList as Mutation$addShortToMyList$addShortToMyList),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addShortToMyList$addShortToMyList<TRes>
      get addShortToMyList {
    final local$addShortToMyList = _instance.addShortToMyList;
    return CopyWith$Mutation$addShortToMyList$addShortToMyList(
        local$addShortToMyList, (e) => call(addShortToMyList: e));
  }
}

class _CopyWithStubImpl$Mutation$addShortToMyList<TRes>
    implements CopyWith$Mutation$addShortToMyList<TRes> {
  _CopyWithStubImpl$Mutation$addShortToMyList(this._res);

  TRes _res;

  call({
    Mutation$addShortToMyList$addShortToMyList? addShortToMyList,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addShortToMyList$addShortToMyList<TRes>
      get addShortToMyList =>
          CopyWith$Mutation$addShortToMyList$addShortToMyList.stub(_res);
}

const documentNodeMutationaddShortToMyList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addShortToMyList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'shortId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addShortToMyList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'shortId'),
            value: VariableNode(name: NameNode(value: 'shortId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'entryId'),
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
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$addShortToMyList _parserFn$Mutation$addShortToMyList(
        Map<String, dynamic> data) =>
    Mutation$addShortToMyList.fromJson(data);
typedef OnMutationCompleted$Mutation$addShortToMyList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$addShortToMyList?,
);

class Options$Mutation$addShortToMyList
    extends graphql.MutationOptions<Mutation$addShortToMyList> {
  Options$Mutation$addShortToMyList({
    String? operationName,
    required Variables$Mutation$addShortToMyList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$addShortToMyList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addShortToMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$addShortToMyList>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$addShortToMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddShortToMyList,
          parserFn: _parserFn$Mutation$addShortToMyList,
        );

  final OnMutationCompleted$Mutation$addShortToMyList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addShortToMyList
    extends graphql.WatchQueryOptions<Mutation$addShortToMyList> {
  WatchOptions$Mutation$addShortToMyList({
    String? operationName,
    required Variables$Mutation$addShortToMyList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$addShortToMyList? typedOptimisticResult,
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
          document: documentNodeMutationaddShortToMyList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addShortToMyList,
        );
}

extension ClientExtension$Mutation$addShortToMyList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addShortToMyList>>
      mutate$addShortToMyList(
              Options$Mutation$addShortToMyList options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$addShortToMyList>
      watchMutation$addShortToMyList(
              WatchOptions$Mutation$addShortToMyList options) =>
          this.watchMutation(options);
}

class Mutation$addShortToMyList$HookResult {
  Mutation$addShortToMyList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$addShortToMyList runMutation;

  final graphql.QueryResult<Mutation$addShortToMyList> result;
}

Mutation$addShortToMyList$HookResult useMutation$addShortToMyList(
    [WidgetOptions$Mutation$addShortToMyList? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$addShortToMyList());
  return Mutation$addShortToMyList$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$addShortToMyList>
    useWatchMutation$addShortToMyList(
            WatchOptions$Mutation$addShortToMyList options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$addShortToMyList
    extends graphql.MutationOptions<Mutation$addShortToMyList> {
  WidgetOptions$Mutation$addShortToMyList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$addShortToMyList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addShortToMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$addShortToMyList>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$addShortToMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddShortToMyList,
          parserFn: _parserFn$Mutation$addShortToMyList,
        );

  final OnMutationCompleted$Mutation$addShortToMyList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$addShortToMyList
    = graphql.MultiSourceResult<Mutation$addShortToMyList> Function(
  Variables$Mutation$addShortToMyList, {
  Object? optimisticResult,
  Mutation$addShortToMyList? typedOptimisticResult,
});
typedef Builder$Mutation$addShortToMyList = widgets.Widget Function(
  RunMutation$Mutation$addShortToMyList,
  graphql.QueryResult<Mutation$addShortToMyList>?,
);

class Mutation$addShortToMyList$Widget
    extends graphql_flutter.Mutation<Mutation$addShortToMyList> {
  Mutation$addShortToMyList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$addShortToMyList? options,
    required Builder$Mutation$addShortToMyList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$addShortToMyList(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$addShortToMyList$addShortToMyList {
  Mutation$addShortToMyList$addShortToMyList({
    required this.entryId,
    this.$__typename = 'AddToCollectionResult',
  });

  factory Mutation$addShortToMyList$addShortToMyList.fromJson(
      Map<String, dynamic> json) {
    final l$entryId = json['entryId'];
    final l$$__typename = json['__typename'];
    return Mutation$addShortToMyList$addShortToMyList(
      entryId: (l$entryId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String entryId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$entryId = entryId;
    _resultData['entryId'] = l$entryId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$entryId = entryId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$entryId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addShortToMyList$addShortToMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$entryId = entryId;
    final lOther$entryId = other.entryId;
    if (l$entryId != lOther$entryId) {
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

extension UtilityExtension$Mutation$addShortToMyList$addShortToMyList
    on Mutation$addShortToMyList$addShortToMyList {
  CopyWith$Mutation$addShortToMyList$addShortToMyList<
          Mutation$addShortToMyList$addShortToMyList>
      get copyWith => CopyWith$Mutation$addShortToMyList$addShortToMyList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addShortToMyList$addShortToMyList<TRes> {
  factory CopyWith$Mutation$addShortToMyList$addShortToMyList(
    Mutation$addShortToMyList$addShortToMyList instance,
    TRes Function(Mutation$addShortToMyList$addShortToMyList) then,
  ) = _CopyWithImpl$Mutation$addShortToMyList$addShortToMyList;

  factory CopyWith$Mutation$addShortToMyList$addShortToMyList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addShortToMyList$addShortToMyList;

  TRes call({
    String? entryId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addShortToMyList$addShortToMyList<TRes>
    implements CopyWith$Mutation$addShortToMyList$addShortToMyList<TRes> {
  _CopyWithImpl$Mutation$addShortToMyList$addShortToMyList(
    this._instance,
    this._then,
  );

  final Mutation$addShortToMyList$addShortToMyList _instance;

  final TRes Function(Mutation$addShortToMyList$addShortToMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? entryId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addShortToMyList$addShortToMyList(
        entryId: entryId == _undefined || entryId == null
            ? _instance.entryId
            : (entryId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addShortToMyList$addShortToMyList<TRes>
    implements CopyWith$Mutation$addShortToMyList$addShortToMyList<TRes> {
  _CopyWithStubImpl$Mutation$addShortToMyList$addShortToMyList(this._res);

  TRes _res;

  call({
    String? entryId,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$removeEntryFromMyList {
  factory Variables$Mutation$removeEntryFromMyList({required String entryId}) =>
      Variables$Mutation$removeEntryFromMyList._({
        r'entryId': entryId,
      });

  Variables$Mutation$removeEntryFromMyList._(this._$data);

  factory Variables$Mutation$removeEntryFromMyList.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$entryId = data['entryId'];
    result$data['entryId'] = (l$entryId as String);
    return Variables$Mutation$removeEntryFromMyList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get entryId => (_$data['entryId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$entryId = entryId;
    result$data['entryId'] = l$entryId;
    return result$data;
  }

  CopyWith$Variables$Mutation$removeEntryFromMyList<
          Variables$Mutation$removeEntryFromMyList>
      get copyWith => CopyWith$Variables$Mutation$removeEntryFromMyList(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$removeEntryFromMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$entryId = entryId;
    final lOther$entryId = other.entryId;
    if (l$entryId != lOther$entryId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$entryId = entryId;
    return Object.hashAll([l$entryId]);
  }
}

abstract class CopyWith$Variables$Mutation$removeEntryFromMyList<TRes> {
  factory CopyWith$Variables$Mutation$removeEntryFromMyList(
    Variables$Mutation$removeEntryFromMyList instance,
    TRes Function(Variables$Mutation$removeEntryFromMyList) then,
  ) = _CopyWithImpl$Variables$Mutation$removeEntryFromMyList;

  factory CopyWith$Variables$Mutation$removeEntryFromMyList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$removeEntryFromMyList;

  TRes call({String? entryId});
}

class _CopyWithImpl$Variables$Mutation$removeEntryFromMyList<TRes>
    implements CopyWith$Variables$Mutation$removeEntryFromMyList<TRes> {
  _CopyWithImpl$Variables$Mutation$removeEntryFromMyList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$removeEntryFromMyList _instance;

  final TRes Function(Variables$Mutation$removeEntryFromMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? entryId = _undefined}) =>
      _then(Variables$Mutation$removeEntryFromMyList._({
        ..._instance._$data,
        if (entryId != _undefined && entryId != null)
          'entryId': (entryId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$removeEntryFromMyList<TRes>
    implements CopyWith$Variables$Mutation$removeEntryFromMyList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$removeEntryFromMyList(this._res);

  TRes _res;

  call({String? entryId}) => _res;
}

class Mutation$removeEntryFromMyList {
  Mutation$removeEntryFromMyList({
    required this.removeEntryFromMyList,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$removeEntryFromMyList.fromJson(Map<String, dynamic> json) {
    final l$removeEntryFromMyList = json['removeEntryFromMyList'];
    final l$$__typename = json['__typename'];
    return Mutation$removeEntryFromMyList(
      removeEntryFromMyList:
          Mutation$removeEntryFromMyList$removeEntryFromMyList.fromJson(
              (l$removeEntryFromMyList as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$removeEntryFromMyList$removeEntryFromMyList
      removeEntryFromMyList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$removeEntryFromMyList = removeEntryFromMyList;
    _resultData['removeEntryFromMyList'] = l$removeEntryFromMyList.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$removeEntryFromMyList = removeEntryFromMyList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$removeEntryFromMyList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$removeEntryFromMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$removeEntryFromMyList = removeEntryFromMyList;
    final lOther$removeEntryFromMyList = other.removeEntryFromMyList;
    if (l$removeEntryFromMyList != lOther$removeEntryFromMyList) {
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

extension UtilityExtension$Mutation$removeEntryFromMyList
    on Mutation$removeEntryFromMyList {
  CopyWith$Mutation$removeEntryFromMyList<Mutation$removeEntryFromMyList>
      get copyWith => CopyWith$Mutation$removeEntryFromMyList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$removeEntryFromMyList<TRes> {
  factory CopyWith$Mutation$removeEntryFromMyList(
    Mutation$removeEntryFromMyList instance,
    TRes Function(Mutation$removeEntryFromMyList) then,
  ) = _CopyWithImpl$Mutation$removeEntryFromMyList;

  factory CopyWith$Mutation$removeEntryFromMyList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$removeEntryFromMyList;

  TRes call({
    Mutation$removeEntryFromMyList$removeEntryFromMyList? removeEntryFromMyList,
    String? $__typename,
  });
  CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes>
      get removeEntryFromMyList;
}

class _CopyWithImpl$Mutation$removeEntryFromMyList<TRes>
    implements CopyWith$Mutation$removeEntryFromMyList<TRes> {
  _CopyWithImpl$Mutation$removeEntryFromMyList(
    this._instance,
    this._then,
  );

  final Mutation$removeEntryFromMyList _instance;

  final TRes Function(Mutation$removeEntryFromMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? removeEntryFromMyList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$removeEntryFromMyList(
        removeEntryFromMyList:
            removeEntryFromMyList == _undefined || removeEntryFromMyList == null
                ? _instance.removeEntryFromMyList
                : (removeEntryFromMyList
                    as Mutation$removeEntryFromMyList$removeEntryFromMyList),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes>
      get removeEntryFromMyList {
    final local$removeEntryFromMyList = _instance.removeEntryFromMyList;
    return CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList(
        local$removeEntryFromMyList, (e) => call(removeEntryFromMyList: e));
  }
}

class _CopyWithStubImpl$Mutation$removeEntryFromMyList<TRes>
    implements CopyWith$Mutation$removeEntryFromMyList<TRes> {
  _CopyWithStubImpl$Mutation$removeEntryFromMyList(this._res);

  TRes _res;

  call({
    Mutation$removeEntryFromMyList$removeEntryFromMyList? removeEntryFromMyList,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes>
      get removeEntryFromMyList =>
          CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList.stub(
              _res);
}

const documentNodeMutationremoveEntryFromMyList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'removeEntryFromMyList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'entryId')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'removeEntryFromMyList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'entryId'),
            value: VariableNode(name: NameNode(value: 'entryId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
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
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$removeEntryFromMyList _parserFn$Mutation$removeEntryFromMyList(
        Map<String, dynamic> data) =>
    Mutation$removeEntryFromMyList.fromJson(data);
typedef OnMutationCompleted$Mutation$removeEntryFromMyList = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$removeEntryFromMyList?,
);

class Options$Mutation$removeEntryFromMyList
    extends graphql.MutationOptions<Mutation$removeEntryFromMyList> {
  Options$Mutation$removeEntryFromMyList({
    String? operationName,
    required Variables$Mutation$removeEntryFromMyList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$removeEntryFromMyList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$removeEntryFromMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$removeEntryFromMyList>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$removeEntryFromMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationremoveEntryFromMyList,
          parserFn: _parserFn$Mutation$removeEntryFromMyList,
        );

  final OnMutationCompleted$Mutation$removeEntryFromMyList?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$removeEntryFromMyList
    extends graphql.WatchQueryOptions<Mutation$removeEntryFromMyList> {
  WatchOptions$Mutation$removeEntryFromMyList({
    String? operationName,
    required Variables$Mutation$removeEntryFromMyList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$removeEntryFromMyList? typedOptimisticResult,
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
          document: documentNodeMutationremoveEntryFromMyList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$removeEntryFromMyList,
        );
}

extension ClientExtension$Mutation$removeEntryFromMyList
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$removeEntryFromMyList>>
      mutate$removeEntryFromMyList(
              Options$Mutation$removeEntryFromMyList options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$removeEntryFromMyList>
      watchMutation$removeEntryFromMyList(
              WatchOptions$Mutation$removeEntryFromMyList options) =>
          this.watchMutation(options);
}

class Mutation$removeEntryFromMyList$HookResult {
  Mutation$removeEntryFromMyList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$removeEntryFromMyList runMutation;

  final graphql.QueryResult<Mutation$removeEntryFromMyList> result;
}

Mutation$removeEntryFromMyList$HookResult useMutation$removeEntryFromMyList(
    [WidgetOptions$Mutation$removeEntryFromMyList? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$removeEntryFromMyList());
  return Mutation$removeEntryFromMyList$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$removeEntryFromMyList>
    useWatchMutation$removeEntryFromMyList(
            WatchOptions$Mutation$removeEntryFromMyList options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$removeEntryFromMyList
    extends graphql.MutationOptions<Mutation$removeEntryFromMyList> {
  WidgetOptions$Mutation$removeEntryFromMyList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$removeEntryFromMyList? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$removeEntryFromMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$removeEntryFromMyList>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$removeEntryFromMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationremoveEntryFromMyList,
          parserFn: _parserFn$Mutation$removeEntryFromMyList,
        );

  final OnMutationCompleted$Mutation$removeEntryFromMyList?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$removeEntryFromMyList
    = graphql.MultiSourceResult<Mutation$removeEntryFromMyList> Function(
  Variables$Mutation$removeEntryFromMyList, {
  Object? optimisticResult,
  Mutation$removeEntryFromMyList? typedOptimisticResult,
});
typedef Builder$Mutation$removeEntryFromMyList = widgets.Widget Function(
  RunMutation$Mutation$removeEntryFromMyList,
  graphql.QueryResult<Mutation$removeEntryFromMyList>?,
);

class Mutation$removeEntryFromMyList$Widget
    extends graphql_flutter.Mutation<Mutation$removeEntryFromMyList> {
  Mutation$removeEntryFromMyList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$removeEntryFromMyList? options,
    required Builder$Mutation$removeEntryFromMyList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$removeEntryFromMyList(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$removeEntryFromMyList$removeEntryFromMyList {
  Mutation$removeEntryFromMyList$removeEntryFromMyList({
    required this.id,
    this.$__typename = 'UserCollection',
  });

  factory Mutation$removeEntryFromMyList$removeEntryFromMyList.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$removeEntryFromMyList$removeEntryFromMyList(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$removeEntryFromMyList$removeEntryFromMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$removeEntryFromMyList$removeEntryFromMyList
    on Mutation$removeEntryFromMyList$removeEntryFromMyList {
  CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<
          Mutation$removeEntryFromMyList$removeEntryFromMyList>
      get copyWith =>
          CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<
    TRes> {
  factory CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList(
    Mutation$removeEntryFromMyList$removeEntryFromMyList instance,
    TRes Function(Mutation$removeEntryFromMyList$removeEntryFromMyList) then,
  ) = _CopyWithImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList;

  factory CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes>
    implements
        CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes> {
  _CopyWithImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList(
    this._instance,
    this._then,
  );

  final Mutation$removeEntryFromMyList$removeEntryFromMyList _instance;

  final TRes Function(Mutation$removeEntryFromMyList$removeEntryFromMyList)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$removeEntryFromMyList$removeEntryFromMyList(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList<
        TRes>
    implements
        CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes> {
  _CopyWithStubImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
