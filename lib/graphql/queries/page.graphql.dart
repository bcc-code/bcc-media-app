import '../schema/pages.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$GridSectionItem implements Fragment$ItemSectionItem {
  Fragment$GridSectionItem({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Fragment$GridSectionItem.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$GridSectionItem(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: Fragment$GridSectionItem$item.fromJson(
          (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$GridSectionItem$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$GridSectionItem) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Fragment$GridSectionItem
    on Fragment$GridSectionItem {
  CopyWith$Fragment$GridSectionItem<Fragment$GridSectionItem> get copyWith =>
      CopyWith$Fragment$GridSectionItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$GridSectionItem<TRes> {
  factory CopyWith$Fragment$GridSectionItem(
    Fragment$GridSectionItem instance,
    TRes Function(Fragment$GridSectionItem) then,
  ) = _CopyWithImpl$Fragment$GridSectionItem;

  factory CopyWith$Fragment$GridSectionItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$GridSectionItem;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$GridSectionItem$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$GridSectionItem$item<TRes> get item;
}

class _CopyWithImpl$Fragment$GridSectionItem<TRes>
    implements CopyWith$Fragment$GridSectionItem<TRes> {
  _CopyWithImpl$Fragment$GridSectionItem(
    this._instance,
    this._then,
  );

  final Fragment$GridSectionItem _instance;

  final TRes Function(Fragment$GridSectionItem) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$GridSectionItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$GridSectionItem$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$GridSectionItem$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$GridSectionItem$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$GridSectionItem<TRes>
    implements CopyWith$Fragment$GridSectionItem<TRes> {
  _CopyWithStubImpl$Fragment$GridSectionItem(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$GridSectionItem$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$GridSectionItem$item<TRes> get item =>
      CopyWith$Fragment$GridSectionItem$item.stub(_res);
}

const fragmentDefinitionGridSectionItem = FragmentDefinitionNode(
  name: NameNode(value: 'GridSectionItem'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SectionItem'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FragmentSpreadNode(
      name: NameNode(value: 'ItemSectionItem'),
      directives: [],
    ),
    FieldNode(
      name: NameNode(value: 'item'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'Show'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'episodeCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'seasonCount'),
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
            name: NameNode(value: 'Episode'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'publishDate'),
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
              name: NameNode(value: 'number'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'season'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                  name: NameNode(value: 'number'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'show'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                      name: NameNode(value: 'title'),
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
const documentNodeFragmentGridSectionItem = DocumentNode(definitions: [
  fragmentDefinitionGridSectionItem,
  fragmentDefinitionItemSectionItem,
]);

extension ClientExtension$Fragment$GridSectionItem on graphql.GraphQLClient {
  void writeFragment$GridSectionItem({
    required Fragment$GridSectionItem data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'GridSectionItem',
            document: documentNodeFragmentGridSectionItem,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$GridSectionItem? readFragment$GridSectionItem({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'GridSectionItem',
          document: documentNodeFragmentGridSectionItem,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$GridSectionItem.fromJson(result);
  }
}

class Fragment$GridSectionItem$item implements Fragment$ItemSectionItem$item {
  Fragment$GridSectionItem$item({required this.$__typename});

  factory Fragment$GridSectionItem$item.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$GridSectionItem$item$$Link.fromJson(json);

      case "Page":
        return Fragment$GridSectionItem$item$$Page.fromJson(json);

      case "Episode":
        return Fragment$GridSectionItem$item$$Episode.fromJson(json);

      case "Show":
        return Fragment$GridSectionItem$item$$Show.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$GridSectionItem$item(
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
    if (!(other is Fragment$GridSectionItem$item) ||
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

extension UtilityExtension$Fragment$GridSectionItem$item
    on Fragment$GridSectionItem$item {
  CopyWith$Fragment$GridSectionItem$item<Fragment$GridSectionItem$item>
      get copyWith => CopyWith$Fragment$GridSectionItem$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$GridSectionItem$item<TRes> {
  factory CopyWith$Fragment$GridSectionItem$item(
    Fragment$GridSectionItem$item instance,
    TRes Function(Fragment$GridSectionItem$item) then,
  ) = _CopyWithImpl$Fragment$GridSectionItem$item;

  factory CopyWith$Fragment$GridSectionItem$item.stub(TRes res) =
      _CopyWithStubImpl$Fragment$GridSectionItem$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$GridSectionItem$item<TRes>
    implements CopyWith$Fragment$GridSectionItem$item<TRes> {
  _CopyWithImpl$Fragment$GridSectionItem$item(
    this._instance,
    this._then,
  );

  final Fragment$GridSectionItem$item _instance;

  final TRes Function(Fragment$GridSectionItem$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$GridSectionItem$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$GridSectionItem$item<TRes>
    implements CopyWith$Fragment$GridSectionItem$item<TRes> {
  _CopyWithStubImpl$Fragment$GridSectionItem$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$GridSectionItem$item$$Link
    implements
        Fragment$ItemSectionItem$item$$Link,
        Fragment$GridSectionItem$item {
  Fragment$GridSectionItem$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$GridSectionItem$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$GridSectionItem$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$GridSectionItem$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$GridSectionItem$item$$Link
    on Fragment$GridSectionItem$item$$Link {
  CopyWith$Fragment$GridSectionItem$item$$Link<
          Fragment$GridSectionItem$item$$Link>
      get copyWith => CopyWith$Fragment$GridSectionItem$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$GridSectionItem$item$$Link<TRes> {
  factory CopyWith$Fragment$GridSectionItem$item$$Link(
    Fragment$GridSectionItem$item$$Link instance,
    TRes Function(Fragment$GridSectionItem$item$$Link) then,
  ) = _CopyWithImpl$Fragment$GridSectionItem$item$$Link;

  factory CopyWith$Fragment$GridSectionItem$item$$Link.stub(TRes res) =
      _CopyWithStubImpl$Fragment$GridSectionItem$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$GridSectionItem$item$$Link<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Link<TRes> {
  _CopyWithImpl$Fragment$GridSectionItem$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$GridSectionItem$item$$Link _instance;

  final TRes Function(Fragment$GridSectionItem$item$$Link) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$GridSectionItem$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$GridSectionItem$item$$Link<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$GridSectionItem$item$$Link(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$GridSectionItem$item$$Page
    implements
        Fragment$ItemSectionItem$item$$Page,
        Fragment$GridSectionItem$item {
  Fragment$GridSectionItem$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$GridSectionItem$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$GridSectionItem$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$GridSectionItem$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$GridSectionItem$item$$Page
    on Fragment$GridSectionItem$item$$Page {
  CopyWith$Fragment$GridSectionItem$item$$Page<
          Fragment$GridSectionItem$item$$Page>
      get copyWith => CopyWith$Fragment$GridSectionItem$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$GridSectionItem$item$$Page<TRes> {
  factory CopyWith$Fragment$GridSectionItem$item$$Page(
    Fragment$GridSectionItem$item$$Page instance,
    TRes Function(Fragment$GridSectionItem$item$$Page) then,
  ) = _CopyWithImpl$Fragment$GridSectionItem$item$$Page;

  factory CopyWith$Fragment$GridSectionItem$item$$Page.stub(TRes res) =
      _CopyWithStubImpl$Fragment$GridSectionItem$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$GridSectionItem$item$$Page<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Page<TRes> {
  _CopyWithImpl$Fragment$GridSectionItem$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$GridSectionItem$item$$Page _instance;

  final TRes Function(Fragment$GridSectionItem$item$$Page) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$GridSectionItem$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$GridSectionItem$item$$Page<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$GridSectionItem$item$$Page(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$GridSectionItem$item$$Episode
    implements
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$GridSectionItem$item {
  Fragment$GridSectionItem$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    this.number,
    this.season,
  });

  factory Fragment$GridSectionItem$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$number = json['number'];
    final l$season = json['season'];
    return Fragment$GridSectionItem$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      number: (l$number as int?),
      season: l$season == null
          ? null
          : Fragment$GridSectionItem$item$$Episode$season.fromJson(
              (l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final int? number;

  final Fragment$GridSectionItem$item$$Episode$season? season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$number = number;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$number,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$GridSectionItem$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
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
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$GridSectionItem$item$$Episode
    on Fragment$GridSectionItem$item$$Episode {
  CopyWith$Fragment$GridSectionItem$item$$Episode<
          Fragment$GridSectionItem$item$$Episode>
      get copyWith => CopyWith$Fragment$GridSectionItem$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$GridSectionItem$item$$Episode<TRes> {
  factory CopyWith$Fragment$GridSectionItem$item$$Episode(
    Fragment$GridSectionItem$item$$Episode instance,
    TRes Function(Fragment$GridSectionItem$item$$Episode) then,
  ) = _CopyWithImpl$Fragment$GridSectionItem$item$$Episode;

  factory CopyWith$Fragment$GridSectionItem$item$$Episode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$GridSectionItem$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Fragment$GridSectionItem$item$$Episode$season? season,
  });
  CopyWith$Fragment$GridSectionItem$item$$Episode$season<TRes> get season;
}

class _CopyWithImpl$Fragment$GridSectionItem$item$$Episode<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Episode<TRes> {
  _CopyWithImpl$Fragment$GridSectionItem$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$GridSectionItem$item$$Episode _instance;

  final TRes Function(Fragment$GridSectionItem$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? number = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$GridSectionItem$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        number: number == _undefined ? _instance.number : (number as int?),
        season: season == _undefined
            ? _instance.season
            : (season as Fragment$GridSectionItem$item$$Episode$season?),
      ));
  CopyWith$Fragment$GridSectionItem$item$$Episode$season<TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$GridSectionItem$item$$Episode$season.stub(
            _then(_instance))
        : CopyWith$Fragment$GridSectionItem$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$GridSectionItem$item$$Episode<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Episode<TRes> {
  _CopyWithStubImpl$Fragment$GridSectionItem$item$$Episode(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Fragment$GridSectionItem$item$$Episode$season? season,
  }) =>
      _res;
  CopyWith$Fragment$GridSectionItem$item$$Episode$season<TRes> get season =>
      CopyWith$Fragment$GridSectionItem$item$$Episode$season.stub(_res);
}

class Fragment$GridSectionItem$item$$Show
    implements
        Fragment$ItemSectionItem$item$$Show,
        Fragment$GridSectionItem$item {
  Fragment$GridSectionItem$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Fragment$GridSectionItem$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Fragment$GridSectionItem$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Fragment$GridSectionItem$item$$Show$defaultEpisode.fromJson(
              (l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Fragment$GridSectionItem$item$$Show$defaultEpisode defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$GridSectionItem$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$GridSectionItem$item$$Show
    on Fragment$GridSectionItem$item$$Show {
  CopyWith$Fragment$GridSectionItem$item$$Show<
          Fragment$GridSectionItem$item$$Show>
      get copyWith => CopyWith$Fragment$GridSectionItem$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$GridSectionItem$item$$Show<TRes> {
  factory CopyWith$Fragment$GridSectionItem$item$$Show(
    Fragment$GridSectionItem$item$$Show instance,
    TRes Function(Fragment$GridSectionItem$item$$Show) then,
  ) = _CopyWithImpl$Fragment$GridSectionItem$item$$Show;

  factory CopyWith$Fragment$GridSectionItem$item$$Show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$GridSectionItem$item$$Show;

  TRes call({
    String? $__typename,
    Fragment$GridSectionItem$item$$Show$defaultEpisode? defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode<TRes>
      get defaultEpisode;
}

class _CopyWithImpl$Fragment$GridSectionItem$item$$Show<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Show<TRes> {
  _CopyWithImpl$Fragment$GridSectionItem$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$GridSectionItem$item$$Show _instance;

  final TRes Function(Fragment$GridSectionItem$item$$Show) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(Fragment$GridSectionItem$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Fragment$GridSectionItem$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode<TRes>
      get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$GridSectionItem$item$$Show<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$GridSectionItem$item$$Show(this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$GridSectionItem$item$$Show$defaultEpisode? defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode<TRes>
      get defaultEpisode =>
          CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode.stub(
              _res);
}

class Fragment$GridSectionItem$item$$Show$defaultEpisode
    implements Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Fragment$GridSectionItem$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$GridSectionItem$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$GridSectionItem$item$$Show$defaultEpisode(
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
    if (!(other is Fragment$GridSectionItem$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Fragment$GridSectionItem$item$$Show$defaultEpisode
    on Fragment$GridSectionItem$item$$Show$defaultEpisode {
  CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode<
          Fragment$GridSectionItem$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode(
    Fragment$GridSectionItem$item$$Show$defaultEpisode instance,
    TRes Function(Fragment$GridSectionItem$item$$Show$defaultEpisode) then,
  ) = _CopyWithImpl$Fragment$GridSectionItem$item$$Show$defaultEpisode;

  factory CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$GridSectionItem$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$GridSectionItem$item$$Show$defaultEpisode<TRes>
    implements
        CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode<TRes> {
  _CopyWithImpl$Fragment$GridSectionItem$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Fragment$GridSectionItem$item$$Show$defaultEpisode _instance;

  final TRes Function(Fragment$GridSectionItem$item$$Show$defaultEpisode) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$GridSectionItem$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$GridSectionItem$item$$Show$defaultEpisode<TRes>
    implements
        CopyWith$Fragment$GridSectionItem$item$$Show$defaultEpisode<TRes> {
  _CopyWithStubImpl$Fragment$GridSectionItem$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$GridSectionItem$item$$Episode$season {
  Fragment$GridSectionItem$item$$Episode$season({
    required this.number,
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$GridSectionItem$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$number = json['number'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$GridSectionItem$item$$Episode$season(
      number: (l$number as int),
      $show: Fragment$GridSectionItem$item$$Episode$season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int number;

  final Fragment$GridSectionItem$item$$Episode$season$show $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$number = number;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$number,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$GridSectionItem$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$$show = $show;
    final lOther$$show = other.$show;
    if (l$$show != lOther$$show) {
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

extension UtilityExtension$Fragment$GridSectionItem$item$$Episode$season
    on Fragment$GridSectionItem$item$$Episode$season {
  CopyWith$Fragment$GridSectionItem$item$$Episode$season<
          Fragment$GridSectionItem$item$$Episode$season>
      get copyWith => CopyWith$Fragment$GridSectionItem$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$GridSectionItem$item$$Episode$season<TRes> {
  factory CopyWith$Fragment$GridSectionItem$item$$Episode$season(
    Fragment$GridSectionItem$item$$Episode$season instance,
    TRes Function(Fragment$GridSectionItem$item$$Episode$season) then,
  ) = _CopyWithImpl$Fragment$GridSectionItem$item$$Episode$season;

  factory CopyWith$Fragment$GridSectionItem$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$GridSectionItem$item$$Episode$season;

  TRes call({
    int? number,
    Fragment$GridSectionItem$item$$Episode$season$show? $show,
    String? $__typename,
  });
  CopyWith$Fragment$GridSectionItem$item$$Episode$season$show<TRes> get $show;
}

class _CopyWithImpl$Fragment$GridSectionItem$item$$Episode$season<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Episode$season<TRes> {
  _CopyWithImpl$Fragment$GridSectionItem$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$GridSectionItem$item$$Episode$season _instance;

  final TRes Function(Fragment$GridSectionItem$item$$Episode$season) _then;

  static const _undefined = {};

  TRes call({
    Object? number = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$GridSectionItem$item$$Episode$season(
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Fragment$GridSectionItem$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$GridSectionItem$item$$Episode$season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$GridSectionItem$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$GridSectionItem$item$$Episode$season<TRes>
    implements CopyWith$Fragment$GridSectionItem$item$$Episode$season<TRes> {
  _CopyWithStubImpl$Fragment$GridSectionItem$item$$Episode$season(this._res);

  TRes _res;

  call({
    int? number,
    Fragment$GridSectionItem$item$$Episode$season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$GridSectionItem$item$$Episode$season$show<TRes> get $show =>
      CopyWith$Fragment$GridSectionItem$item$$Episode$season$show.stub(_res);
}

class Fragment$GridSectionItem$item$$Episode$season$show {
  Fragment$GridSectionItem$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$GridSectionItem$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$GridSectionItem$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$GridSectionItem$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$GridSectionItem$item$$Episode$season$show
    on Fragment$GridSectionItem$item$$Episode$season$show {
  CopyWith$Fragment$GridSectionItem$item$$Episode$season$show<
          Fragment$GridSectionItem$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$GridSectionItem$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$GridSectionItem$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$GridSectionItem$item$$Episode$season$show(
    Fragment$GridSectionItem$item$$Episode$season$show instance,
    TRes Function(Fragment$GridSectionItem$item$$Episode$season$show) then,
  ) = _CopyWithImpl$Fragment$GridSectionItem$item$$Episode$season$show;

  factory CopyWith$Fragment$GridSectionItem$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$GridSectionItem$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$GridSectionItem$item$$Episode$season$show<TRes>
    implements
        CopyWith$Fragment$GridSectionItem$item$$Episode$season$show<TRes> {
  _CopyWithImpl$Fragment$GridSectionItem$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$GridSectionItem$item$$Episode$season$show _instance;

  final TRes Function(Fragment$GridSectionItem$item$$Episode$season$show) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$GridSectionItem$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$GridSectionItem$item$$Episode$season$show<TRes>
    implements
        CopyWith$Fragment$GridSectionItem$item$$Episode$season$show<TRes> {
  _CopyWithStubImpl$Fragment$GridSectionItem$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$ItemSectionItem {
  Fragment$ItemSectionItem({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Fragment$ItemSectionItem.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSectionItem(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: Fragment$ItemSectionItem$item.fromJson(
          (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$ItemSectionItem$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Fragment$ItemSectionItem
    on Fragment$ItemSectionItem {
  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem> get copyWith =>
      CopyWith$Fragment$ItemSectionItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ItemSectionItem<TRes> {
  factory CopyWith$Fragment$ItemSectionItem(
    Fragment$ItemSectionItem instance,
    TRes Function(Fragment$ItemSectionItem) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem;

  factory CopyWith$Fragment$ItemSectionItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$ItemSectionItem$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$ItemSectionItem$item<TRes> get item;
}

class _CopyWithImpl$Fragment$ItemSectionItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem _instance;

  final TRes Function(Fragment$ItemSectionItem) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ItemSectionItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$ItemSectionItem$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$ItemSectionItem$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$ItemSectionItem$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$ItemSectionItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$ItemSectionItem$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$ItemSectionItem$item<TRes> get item =>
      CopyWith$Fragment$ItemSectionItem$item.stub(_res);
}

const fragmentDefinitionItemSectionItem = FragmentDefinitionNode(
  name: NameNode(value: 'ItemSectionItem'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SectionItem'),
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
      name: NameNode(value: 'image'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'item'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'Link'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'url'),
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
            name: NameNode(value: 'Page'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'code'),
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
              name: NameNode(value: 'duration'),
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
            name: NameNode(value: 'Show'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'defaultEpisode'),
              alias: null,
              arguments: [],
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
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentItemSectionItem = DocumentNode(definitions: [
  fragmentDefinitionItemSectionItem,
]);

extension ClientExtension$Fragment$ItemSectionItem on graphql.GraphQLClient {
  void writeFragment$ItemSectionItem({
    required Fragment$ItemSectionItem data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ItemSectionItem',
            document: documentNodeFragmentItemSectionItem,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ItemSectionItem? readFragment$ItemSectionItem({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ItemSectionItem',
          document: documentNodeFragmentItemSectionItem,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ItemSectionItem.fromJson(result);
  }
}

class Fragment$ItemSectionItem$item {
  Fragment$ItemSectionItem$item({required this.$__typename});

  factory Fragment$ItemSectionItem$item.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$ItemSectionItem$item$$Link.fromJson(json);

      case "Page":
        return Fragment$ItemSectionItem$item$$Page.fromJson(json);

      case "Episode":
        return Fragment$ItemSectionItem$item$$Episode.fromJson(json);

      case "Show":
        return Fragment$ItemSectionItem$item$$Show.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$ItemSectionItem$item(
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
    if (!(other is Fragment$ItemSectionItem$item) ||
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

extension UtilityExtension$Fragment$ItemSectionItem$item
    on Fragment$ItemSectionItem$item {
  CopyWith$Fragment$ItemSectionItem$item<Fragment$ItemSectionItem$item>
      get copyWith => CopyWith$Fragment$ItemSectionItem$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSectionItem$item<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$item(
    Fragment$ItemSectionItem$item instance,
    TRes Function(Fragment$ItemSectionItem$item) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem$item;

  factory CopyWith$Fragment$ItemSectionItem$item.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$ItemSectionItem$item<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$item(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem$item _instance;

  final TRes Function(Fragment$ItemSectionItem$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$ItemSectionItem$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$item<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$ItemSectionItem$item$$Link
    implements Fragment$ItemSectionItem$item {
  Fragment$ItemSectionItem$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$ItemSectionItem$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$ItemSectionItem$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ItemSectionItem$item$$Link
    on Fragment$ItemSectionItem$item$$Link {
  CopyWith$Fragment$ItemSectionItem$item$$Link<
          Fragment$ItemSectionItem$item$$Link>
      get copyWith => CopyWith$Fragment$ItemSectionItem$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSectionItem$item$$Link<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$item$$Link(
    Fragment$ItemSectionItem$item$$Link instance,
    TRes Function(Fragment$ItemSectionItem$item$$Link) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem$item$$Link;

  factory CopyWith$Fragment$ItemSectionItem$item$$Link.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$ItemSectionItem$item$$Link<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Link<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem$item$$Link _instance;

  final TRes Function(Fragment$ItemSectionItem$item$$Link) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$ItemSectionItem$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Link<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Link(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$ItemSectionItem$item$$Page
    implements Fragment$ItemSectionItem$item {
  Fragment$ItemSectionItem$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$ItemSectionItem$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$ItemSectionItem$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ItemSectionItem$item$$Page
    on Fragment$ItemSectionItem$item$$Page {
  CopyWith$Fragment$ItemSectionItem$item$$Page<
          Fragment$ItemSectionItem$item$$Page>
      get copyWith => CopyWith$Fragment$ItemSectionItem$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSectionItem$item$$Page<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$item$$Page(
    Fragment$ItemSectionItem$item$$Page instance,
    TRes Function(Fragment$ItemSectionItem$item$$Page) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem$item$$Page;

  factory CopyWith$Fragment$ItemSectionItem$item$$Page.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$ItemSectionItem$item$$Page<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Page<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem$item$$Page _instance;

  final TRes Function(Fragment$ItemSectionItem$item$$Page) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$ItemSectionItem$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Page<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Page(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$ItemSectionItem$item$$Episode
    implements Fragment$ItemSectionItem$item {
  Fragment$ItemSectionItem$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
  });

  factory Fragment$ItemSectionItem$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    return Fragment$ItemSectionItem$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ItemSectionItem$item$$Episode
    on Fragment$ItemSectionItem$item$$Episode {
  CopyWith$Fragment$ItemSectionItem$item$$Episode<
          Fragment$ItemSectionItem$item$$Episode>
      get copyWith => CopyWith$Fragment$ItemSectionItem$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSectionItem$item$$Episode<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$item$$Episode(
    Fragment$ItemSectionItem$item$$Episode instance,
    TRes Function(Fragment$ItemSectionItem$item$$Episode) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem$item$$Episode;

  factory CopyWith$Fragment$ItemSectionItem$item$$Episode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
  });
}

class _CopyWithImpl$Fragment$ItemSectionItem$item$$Episode<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Episode<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem$item$$Episode _instance;

  final TRes Function(Fragment$ItemSectionItem$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
  }) =>
      _then(Fragment$ItemSectionItem$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
      ));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Episode<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Episode<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Episode(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
  }) =>
      _res;
}

class Fragment$ItemSectionItem$item$$Show
    implements Fragment$ItemSectionItem$item {
  Fragment$ItemSectionItem$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
  });

  factory Fragment$ItemSectionItem$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    return Fragment$ItemSectionItem$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Fragment$ItemSectionItem$item$$Show$defaultEpisode.fromJson(
              (l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final Fragment$ItemSectionItem$item$$Show$defaultEpisode defaultEpisode;

  final String id;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ItemSectionItem$item$$Show
    on Fragment$ItemSectionItem$item$$Show {
  CopyWith$Fragment$ItemSectionItem$item$$Show<
          Fragment$ItemSectionItem$item$$Show>
      get copyWith => CopyWith$Fragment$ItemSectionItem$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSectionItem$item$$Show<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$item$$Show(
    Fragment$ItemSectionItem$item$$Show instance,
    TRes Function(Fragment$ItemSectionItem$item$$Show) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem$item$$Show;

  factory CopyWith$Fragment$ItemSectionItem$item$$Show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Show;

  TRes call({
    String? $__typename,
    Fragment$ItemSectionItem$item$$Show$defaultEpisode? defaultEpisode,
    String? id,
  });
  CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode<TRes>
      get defaultEpisode;
}

class _CopyWithImpl$Fragment$ItemSectionItem$item$$Show<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Show<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem$item$$Show _instance;

  final TRes Function(Fragment$ItemSectionItem$item$$Show) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Fragment$ItemSectionItem$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Fragment$ItemSectionItem$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
  CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode<TRes>
      get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Show<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Show(this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$ItemSectionItem$item$$Show$defaultEpisode? defaultEpisode,
    String? id,
  }) =>
      _res;
  CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode<TRes>
      get defaultEpisode =>
          CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode.stub(
              _res);
}

class Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Fragment$ItemSectionItem$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$ItemSectionItem$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSectionItem$item$$Show$defaultEpisode(
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
    if (!(other is Fragment$ItemSectionItem$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Fragment$ItemSectionItem$item$$Show$defaultEpisode
    on Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode<
          Fragment$ItemSectionItem$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode(
    Fragment$ItemSectionItem$item$$Show$defaultEpisode instance,
    TRes Function(Fragment$ItemSectionItem$item$$Show$defaultEpisode) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem$item$$Show$defaultEpisode;

  factory CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ItemSectionItem$item$$Show$defaultEpisode<TRes>
    implements
        CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem$item$$Show$defaultEpisode _instance;

  final TRes Function(Fragment$ItemSectionItem$item$$Show$defaultEpisode) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ItemSectionItem$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Show$defaultEpisode<TRes>
    implements
        CopyWith$Fragment$ItemSectionItem$item$$Show$defaultEpisode<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$ItemSection {
  Fragment$ItemSection({
    this.metadata,
    required this.items,
    required this.$__typename,
  });

  factory Fragment$ItemSection.fromJson(Map<String, dynamic> json) {
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSection(
      metadata: l$metadata == null
          ? null
          : Fragment$ItemSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$ItemSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$ItemSection$metadata? metadata;

  final Fragment$ItemSection$items items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$metadata = metadata;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$metadata,
      l$items,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSection) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
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

extension UtilityExtension$Fragment$ItemSection on Fragment$ItemSection {
  CopyWith$Fragment$ItemSection<Fragment$ItemSection> get copyWith =>
      CopyWith$Fragment$ItemSection(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ItemSection<TRes> {
  factory CopyWith$Fragment$ItemSection(
    Fragment$ItemSection instance,
    TRes Function(Fragment$ItemSection) then,
  ) = _CopyWithImpl$Fragment$ItemSection;

  factory CopyWith$Fragment$ItemSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSection;

  TRes call({
    Fragment$ItemSection$metadata? metadata,
    Fragment$ItemSection$items? items,
    String? $__typename,
  });
  CopyWith$Fragment$ItemSection$metadata<TRes> get metadata;
  CopyWith$Fragment$ItemSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$ItemSection<TRes>
    implements CopyWith$Fragment$ItemSection<TRes> {
  _CopyWithImpl$Fragment$ItemSection(
    this._instance,
    this._then,
  );

  final Fragment$ItemSection _instance;

  final TRes Function(Fragment$ItemSection) _then;

  static const _undefined = {};

  TRes call({
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ItemSection(
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$ItemSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$ItemSection$items),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$ItemSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$ItemSection$metadata.stub(_then(_instance))
        : CopyWith$Fragment$ItemSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$ItemSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$ItemSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$ItemSection<TRes>
    implements CopyWith$Fragment$ItemSection<TRes> {
  _CopyWithStubImpl$Fragment$ItemSection(this._res);

  TRes _res;

  call({
    Fragment$ItemSection$metadata? metadata,
    Fragment$ItemSection$items? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$ItemSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$ItemSection$metadata.stub(_res);
  CopyWith$Fragment$ItemSection$items<TRes> get items =>
      CopyWith$Fragment$ItemSection$items.stub(_res);
}

const fragmentDefinitionItemSection = FragmentDefinitionNode(
  name: NameNode(value: 'ItemSection'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ItemSection'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'metadata'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'continueWatching'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'secondaryTitles'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'collectionId'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'useContext'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'prependLiveElement'),
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
      name: NameNode(value: 'items'),
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
              name: NameNode(value: 'ItemSectionItem'),
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
);
const documentNodeFragmentItemSection = DocumentNode(definitions: [
  fragmentDefinitionItemSection,
  fragmentDefinitionItemSectionItem,
]);

extension ClientExtension$Fragment$ItemSection on graphql.GraphQLClient {
  void writeFragment$ItemSection({
    required Fragment$ItemSection data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ItemSection',
            document: documentNodeFragmentItemSection,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ItemSection? readFragment$ItemSection({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ItemSection',
          document: documentNodeFragmentItemSection,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ItemSection.fromJson(result);
  }
}

class Fragment$ItemSection$metadata {
  Fragment$ItemSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$ItemSection$metadata.fromJson(Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$ItemSection$metadata
    on Fragment$ItemSection$metadata {
  CopyWith$Fragment$ItemSection$metadata<Fragment$ItemSection$metadata>
      get copyWith => CopyWith$Fragment$ItemSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSection$metadata<TRes> {
  factory CopyWith$Fragment$ItemSection$metadata(
    Fragment$ItemSection$metadata instance,
    TRes Function(Fragment$ItemSection$metadata) then,
  ) = _CopyWithImpl$Fragment$ItemSection$metadata;

  factory CopyWith$Fragment$ItemSection$metadata.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ItemSection$metadata<TRes>
    implements CopyWith$Fragment$ItemSection$metadata<TRes> {
  _CopyWithImpl$Fragment$ItemSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$ItemSection$metadata _instance;

  final TRes Function(Fragment$ItemSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ItemSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ItemSection$metadata<TRes>
    implements CopyWith$Fragment$ItemSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$ItemSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$ItemSection$items {
  Fragment$ItemSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$ItemSection$items.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Fragment$ItemSection$items) ||
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

extension UtilityExtension$Fragment$ItemSection$items
    on Fragment$ItemSection$items {
  CopyWith$Fragment$ItemSection$items<Fragment$ItemSection$items>
      get copyWith => CopyWith$Fragment$ItemSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSection$items<TRes> {
  factory CopyWith$Fragment$ItemSection$items(
    Fragment$ItemSection$items instance,
    TRes Function(Fragment$ItemSection$items) then,
  ) = _CopyWithImpl$Fragment$ItemSection$items;

  factory CopyWith$Fragment$ItemSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Fragment$ItemSection$items<TRes>
    implements CopyWith$Fragment$ItemSection$items<TRes> {
  _CopyWithImpl$Fragment$ItemSection$items(
    this._instance,
    this._then,
  );

  final Fragment$ItemSection$items _instance;

  final TRes Function(Fragment$ItemSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ItemSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ItemSectionItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$ItemSectionItem> Function(
                  Iterable<
                      CopyWith$Fragment$ItemSectionItem<
                          Fragment$ItemSectionItem>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$ItemSectionItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$ItemSection$items<TRes>
    implements CopyWith$Fragment$ItemSection$items<TRes> {
  _CopyWithStubImpl$Fragment$ItemSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section {
  Fragment$Section({
    required this.id,
    this.title,
    required this.$__typename,
  });

  factory Fragment$Section.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "PosterSection":
        return Fragment$Section$$PosterSection.fromJson(json);

      case "FeaturedSection":
        return Fragment$Section$$FeaturedSection.fromJson(json);

      case "DefaultSection":
        return Fragment$Section$$DefaultSection.fromJson(json);

      case "ListSection":
        return Fragment$Section$$ListSection.fromJson(json);

      case "DefaultGridSection":
        return Fragment$Section$$DefaultGridSection.fromJson(json);

      case "PosterGridSection":
        return Fragment$Section$$PosterGridSection.fromJson(json);

      case "IconGridSection":
        return Fragment$Section$$IconGridSection.fromJson(json);

      case "IconSection":
        return Fragment$Section$$IconSection.fromJson(json);

      case "LabelSection":
        return Fragment$Section$$LabelSection.fromJson(json);

      case "WebSection":
        return Fragment$Section$$WebSection.fromJson(json);

      case "MessageSection":
        return Fragment$Section$$MessageSection.fromJson(json);

      default:
        final l$id = json['id'];
        final l$title = json['title'];
        final l$$__typename = json['__typename'];
        return Fragment$Section(
          id: (l$id as String),
          title: (l$title as String?),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final String id;

  final String? title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section) || runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section on Fragment$Section {
  CopyWith$Fragment$Section<Fragment$Section> get copyWith =>
      CopyWith$Fragment$Section(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Section<TRes> {
  factory CopyWith$Fragment$Section(
    Fragment$Section instance,
    TRes Function(Fragment$Section) then,
  ) = _CopyWithImpl$Fragment$Section;

  factory CopyWith$Fragment$Section.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section<TRes>
    implements CopyWith$Fragment$Section<TRes> {
  _CopyWithImpl$Fragment$Section(
    this._instance,
    this._then,
  );

  final Fragment$Section _instance;

  final TRes Function(Fragment$Section) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section<TRes>
    implements CopyWith$Fragment$Section<TRes> {
  _CopyWithStubImpl$Fragment$Section(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionSection = FragmentDefinitionNode(
  name: NameNode(value: 'Section'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Section'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'ItemSection'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'ItemSection'),
          directives: [],
        ),
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'PosterSection'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'size'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'items'),
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
                    FieldNode(
                      name: NameNode(value: 'item'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        InlineFragmentNode(
                          typeCondition: TypeConditionNode(
                              on: NamedTypeNode(
                            name: NameNode(value: 'Show'),
                            isNonNull: false,
                          )),
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                              name: NameNode(value: 'episodeCount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'seasonCount'),
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
                            name: NameNode(value: 'Episode'),
                            isNonNull: false,
                          )),
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                              name: NameNode(value: 'productionDate'),
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
                              name: NameNode(value: 'duration'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'season'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                  name: NameNode(value: 'show'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: SelectionSetNode(selections: [
                                    FieldNode(
                                      name: NameNode(value: 'title'),
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
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'FeaturedSection'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'size'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'items'),
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
                    FieldNode(
                      name: NameNode(value: 'description'),
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
        ),
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'DefaultSection'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'size'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'items'),
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
                    FieldNode(
                      name: NameNode(value: 'item'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        InlineFragmentNode(
                          typeCondition: TypeConditionNode(
                              on: NamedTypeNode(
                            name: NameNode(value: 'Show'),
                            isNonNull: false,
                          )),
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                              name: NameNode(value: 'episodeCount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'seasonCount'),
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
                            name: NameNode(value: 'Episode'),
                            isNonNull: false,
                          )),
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                              name: NameNode(value: 'productionDate'),
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
                              name: NameNode(value: 'duration'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'season'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                  name: NameNode(value: 'show'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: SelectionSetNode(selections: [
                                    FieldNode(
                                      name: NameNode(value: 'title'),
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
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'GridSection'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'size'),
              alias: NameNode(value: 'gridSize'),
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'items'),
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
                      name: NameNode(value: 'GridSectionItem'),
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
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'ListSection'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'items'),
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
                              name: NameNode(value: 'title'),
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
                              name: NameNode(value: 'image'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'season'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                  name: NameNode(value: 'show'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: SelectionSetNode(selections: [
                                    FieldNode(
                                      name: NameNode(value: 'title'),
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
        name: NameNode(value: 'WebSection'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'authentication'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'widthRatio'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'height'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'url'),
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
        name: NameNode(value: 'MessageSection'),
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
          name: NameNode(value: 'messages'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'content'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'style'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                  name: NameNode(value: 'text'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'background'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'border'),
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
const documentNodeFragmentSection = DocumentNode(definitions: [
  fragmentDefinitionSection,
  fragmentDefinitionItemSection,
  fragmentDefinitionItemSectionItem,
  fragmentDefinitionGridSectionItem,
]);

extension ClientExtension$Fragment$Section on graphql.GraphQLClient {
  void writeFragment$Section({
    required Fragment$Section data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Section',
            document: documentNodeFragmentSection,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Section? readFragment$Section({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Section',
          document: documentNodeFragmentSection,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Section.fromJson(result);
  }
}

class Fragment$Section$$PosterSection
    implements Fragment$ItemSection, Fragment$Section {
  Fragment$Section$$PosterSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.size,
  });

  factory Fragment$Section$$PosterSection.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$size = json['size'];
    return Fragment$Section$$PosterSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Fragment$Section$$PosterSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$Section$$PosterSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      size: fromJson$Enum$SectionSize((l$size as String)),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final Fragment$Section$$PosterSection$metadata? metadata;

  final Fragment$Section$$PosterSection$items items;

  final Enum$SectionSize size;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$size = size;
    _resultData['size'] = toJson$Enum$SectionSize(l$size);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$size = size;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$metadata,
      l$items,
      l$size,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (l$size != lOther$size) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterSection
    on Fragment$Section$$PosterSection {
  CopyWith$Fragment$Section$$PosterSection<Fragment$Section$$PosterSection>
      get copyWith => CopyWith$Fragment$Section$$PosterSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection<TRes> {
  factory CopyWith$Fragment$Section$$PosterSection(
    Fragment$Section$$PosterSection instance,
    TRes Function(Fragment$Section$$PosterSection) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection;

  factory CopyWith$Fragment$Section$$PosterSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$PosterSection$metadata? metadata,
    Fragment$Section$$PosterSection$items? items,
    Enum$SectionSize? size,
  });
  CopyWith$Fragment$Section$$PosterSection$metadata<TRes> get metadata;
  CopyWith$Fragment$Section$$PosterSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$PosterSection<TRes>
    implements CopyWith$Fragment$Section$$PosterSection<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection _instance;

  final TRes Function(Fragment$Section$$PosterSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? size = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$Section$$PosterSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$PosterSection$items),
        size: size == _undefined || size == null
            ? _instance.size
            : (size as Enum$SectionSize),
      ));
  CopyWith$Fragment$Section$$PosterSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$Section$$PosterSection$metadata.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$PosterSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$Section$$PosterSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$PosterSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection<TRes>
    implements CopyWith$Fragment$Section$$PosterSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$PosterSection$metadata? metadata,
    Fragment$Section$$PosterSection$items? items,
    Enum$SectionSize? size,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$Section$$PosterSection$metadata.stub(_res);
  CopyWith$Fragment$Section$$PosterSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$PosterSection$items.stub(_res);
}

class Fragment$Section$$PosterSection$metadata
    implements Fragment$ItemSection$metadata {
  Fragment$Section$$PosterSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$Section$$PosterSection$metadata
    on Fragment$Section$$PosterSection$metadata {
  CopyWith$Fragment$Section$$PosterSection$metadata<
          Fragment$Section$$PosterSection$metadata>
      get copyWith => CopyWith$Fragment$Section$$PosterSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$metadata<TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$metadata(
    Fragment$Section$$PosterSection$metadata instance,
    TRes Function(Fragment$Section$$PosterSection$metadata) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$metadata;

  factory CopyWith$Fragment$Section$$PosterSection$metadata.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$metadata<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$metadata _instance;

  final TRes Function(Fragment$Section$$PosterSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$PosterSection$items
    implements Fragment$ItemSection$items {
  Fragment$Section$$PosterSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$PosterSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$PosterSection$items$items> items;

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
    if (!(other is Fragment$Section$$PosterSection$items) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items
    on Fragment$Section$$PosterSection$items {
  CopyWith$Fragment$Section$$PosterSection$items<
          Fragment$Section$$PosterSection$items>
      get copyWith => CopyWith$Fragment$Section$$PosterSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items<TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items(
    Fragment$Section$$PosterSection$items instance,
    TRes Function(Fragment$Section$$PosterSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items;

  factory CopyWith$Fragment$Section$$PosterSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items;

  TRes call({
    List<Fragment$Section$$PosterSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$PosterSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$PosterSection$items$items<
                      Fragment$Section$$PosterSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items _instance;

  final TRes Function(Fragment$Section$$PosterSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$PosterSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$PosterSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$PosterSection$items$items<
                          Fragment$Section$$PosterSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$Section$$PosterSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$PosterSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$PosterSection$items$items
    implements Fragment$ItemSectionItem {
  Fragment$Section$$PosterSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: Fragment$Section$$PosterSection$items$items$item.fromJson(
          (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$PosterSection$items$items$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterSection$items$items) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items
    on Fragment$Section$$PosterSection$items$items {
  CopyWith$Fragment$Section$$PosterSection$items$items<
          Fragment$Section$$PosterSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$PosterSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items(
    Fragment$Section$$PosterSection$items$items instance,
    TRes Function(Fragment$Section$$PosterSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items;

  factory CopyWith$Fragment$Section$$PosterSection$items$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$PosterSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$Section$$PosterSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$Section$$PosterSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$PosterSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$PosterSection$items$items$item.stub(_res);
}

class Fragment$Section$$PosterSection$items$items$item
    implements Fragment$ItemSectionItem$item {
  Fragment$Section$$PosterSection$items$items$item({required this.$__typename});

  factory Fragment$Section$$PosterSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$PosterSection$items$items$item$$Link.fromJson(
            json);

      case "Page":
        return Fragment$Section$$PosterSection$items$items$item$$Page.fromJson(
            json);

      case "Episode":
        return Fragment$Section$$PosterSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$PosterSection$items$items$item$$Show.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$PosterSection$items$items$item(
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
    if (!(other is Fragment$Section$$PosterSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item
    on Fragment$Section$$PosterSection$items$items$item {
  CopyWith$Fragment$Section$$PosterSection$items$items$item<
          Fragment$Section$$PosterSection$items$items$item>
      get copyWith => CopyWith$Fragment$Section$$PosterSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item(
    Fragment$Section$$PosterSection$items$items$item instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$PosterSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$PosterSection$items$items$item$$Link
    implements
        Fragment$ItemSectionItem$item$$Link,
        Fragment$Section$$PosterSection$items$items$item {
  Fragment$Section$$PosterSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$PosterSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Link
    on Fragment$Section$$PosterSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link<
          Fragment$Section$$PosterSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link(
    Fragment$Section$$PosterSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item$$Link) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Link<TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$PosterSection$items$items$item$$Page
    implements
        Fragment$ItemSectionItem$item$$Page,
        Fragment$Section$$PosterSection$items$items$item {
  Fragment$Section$$PosterSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$PosterSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Page
    on Fragment$Section$$PosterSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page<
          Fragment$Section$$PosterSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page(
    Fragment$Section$$PosterSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item$$Page) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Page<TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$PosterSection$items$items$item$$Episode
    implements
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$Section$$PosterSection$items$items$item {
  Fragment$Section$$PosterSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    this.productionDate,
    required this.publishDate,
    this.season,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$productionDate = json['productionDate'];
    final l$publishDate = json['publishDate'];
    final l$season = json['season'];
    return Fragment$Section$$PosterSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      productionDate: (l$productionDate as String?),
      publishDate: (l$publishDate as String),
      season: l$season == null
          ? null
          : Fragment$Section$$PosterSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String? productionDate;

  final String publishDate;

  final Fragment$Section$$PosterSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$productionDate = productionDate;
    _resultData['productionDate'] = l$productionDate;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$productionDate = productionDate;
    final l$publishDate = publishDate;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$productionDate,
      l$publishDate,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterSection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$productionDate = productionDate;
    final lOther$productionDate = other.productionDate;
    if (l$productionDate != lOther$productionDate) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Episode
    on Fragment$Section$$PosterSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode<
          Fragment$Section$$PosterSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode(
    Fragment$Section$$PosterSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? productionDate,
    String? publishDate,
    Fragment$Section$$PosterSection$items$items$item$$Episode$season? season,
  });
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Episode _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? productionDate = _undefined,
    Object? publishDate = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        productionDate: productionDate == _undefined
            ? _instance.productionDate
            : (productionDate as String?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        season: season == _undefined
            ? _instance.season
            : (season
                as Fragment$Section$$PosterSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? productionDate,
    String? publishDate,
    Fragment$Section$$PosterSection$items$items$item$$Episode$season? season,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season
              .stub(_res);
}

class Fragment$Section$$PosterSection$items$items$item$$Show
    implements
        Fragment$ItemSectionItem$item$$Show,
        Fragment$Section$$PosterSection$items$items$item {
  Fragment$Section$$PosterSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Fragment$Section$$PosterSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Show
    on Fragment$Section$$PosterSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show<
          Fragment$Section$$PosterSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show(
    Fragment$Section$$PosterSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item$$Show) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Show<TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode
    implements Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode(
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
    if (!(other
            is Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode
    on Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode<
          Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode(
    Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$PosterSection$items$items$item$$Episode$season {
  Fragment$Section$$PosterSection$items$items$item$$Episode$season({
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$items$items$item$$Episode$season(
      $show:
          Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$PosterSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$show = $show;
    final lOther$$show = other.$show;
    if (l$$show != lOther$$show) {
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Episode$season
    on Fragment$Section$$PosterSection$items$items$item$$Episode$season {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
          Fragment$Section$$PosterSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
    Fragment$Section$$PosterSection$items$items$item$$Episode$season instance,
    TRes Function(
            Fragment$Section$$PosterSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season;

  TRes call({
    Fragment$Section$$PosterSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
      Fragment$Section$$PosterSection$items$items$item$$Episode$season) _then;

  static const _undefined = {};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Episode$season(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Fragment$Section$$PosterSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    Fragment$Section$$PosterSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Fragment$Section$$PosterSection$items$items$item$$Episode$season$show {
  Fragment$Section$$PosterSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$PosterSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
    on Fragment$Section$$PosterSection$items$items$item$$Episode$season$show {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
          Fragment$Section$$PosterSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
    Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Fragment$Section$$PosterSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Fragment$Section$$PosterSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$FeaturedSection
    implements Fragment$ItemSection, Fragment$Section {
  Fragment$Section$$FeaturedSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.size,
  });

  factory Fragment$Section$$FeaturedSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$size = json['size'];
    return Fragment$Section$$FeaturedSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Fragment$Section$$FeaturedSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$Section$$FeaturedSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      size: fromJson$Enum$SectionSize((l$size as String)),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final Fragment$Section$$FeaturedSection$metadata? metadata;

  final Fragment$Section$$FeaturedSection$items items;

  final Enum$SectionSize size;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$size = size;
    _resultData['size'] = toJson$Enum$SectionSize(l$size);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$size = size;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$metadata,
      l$items,
      l$size,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$FeaturedSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (l$size != lOther$size) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$FeaturedSection
    on Fragment$Section$$FeaturedSection {
  CopyWith$Fragment$Section$$FeaturedSection<Fragment$Section$$FeaturedSection>
      get copyWith => CopyWith$Fragment$Section$$FeaturedSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection<TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection(
    Fragment$Section$$FeaturedSection instance,
    TRes Function(Fragment$Section$$FeaturedSection) then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection;

  factory CopyWith$Fragment$Section$$FeaturedSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$FeaturedSection$metadata? metadata,
    Fragment$Section$$FeaturedSection$items? items,
    Enum$SectionSize? size,
  });
  CopyWith$Fragment$Section$$FeaturedSection$metadata<TRes> get metadata;
  CopyWith$Fragment$Section$$FeaturedSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection<TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection _instance;

  final TRes Function(Fragment$Section$$FeaturedSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? size = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$Section$$FeaturedSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$FeaturedSection$items),
        size: size == _undefined || size == null
            ? _instance.size
            : (size as Enum$SectionSize),
      ));
  CopyWith$Fragment$Section$$FeaturedSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$Section$$FeaturedSection$metadata.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$FeaturedSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$Section$$FeaturedSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$FeaturedSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$FeaturedSection$metadata? metadata,
    Fragment$Section$$FeaturedSection$items? items,
    Enum$SectionSize? size,
  }) =>
      _res;
  CopyWith$Fragment$Section$$FeaturedSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$Section$$FeaturedSection$metadata.stub(_res);
  CopyWith$Fragment$Section$$FeaturedSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$FeaturedSection$items.stub(_res);
}

class Fragment$Section$$FeaturedSection$metadata
    implements Fragment$ItemSection$metadata {
  Fragment$Section$$FeaturedSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$Section$$FeaturedSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$FeaturedSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$FeaturedSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$Section$$FeaturedSection$metadata
    on Fragment$Section$$FeaturedSection$metadata {
  CopyWith$Fragment$Section$$FeaturedSection$metadata<
          Fragment$Section$$FeaturedSection$metadata>
      get copyWith => CopyWith$Fragment$Section$$FeaturedSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$metadata<TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$metadata(
    Fragment$Section$$FeaturedSection$metadata instance,
    TRes Function(Fragment$Section$$FeaturedSection$metadata) then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$metadata;

  factory CopyWith$Fragment$Section$$FeaturedSection$metadata.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$metadata<TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$metadata _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$FeaturedSection$items
    implements Fragment$ItemSection$items {
  Fragment$Section$$FeaturedSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$FeaturedSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$FeaturedSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$FeaturedSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$FeaturedSection$items$items> items;

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
    if (!(other is Fragment$Section$$FeaturedSection$items) ||
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

extension UtilityExtension$Fragment$Section$$FeaturedSection$items
    on Fragment$Section$$FeaturedSection$items {
  CopyWith$Fragment$Section$$FeaturedSection$items<
          Fragment$Section$$FeaturedSection$items>
      get copyWith => CopyWith$Fragment$Section$$FeaturedSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items<TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items(
    Fragment$Section$$FeaturedSection$items instance,
    TRes Function(Fragment$Section$$FeaturedSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items;

  factory CopyWith$Fragment$Section$$FeaturedSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items;

  TRes call({
    List<Fragment$Section$$FeaturedSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$FeaturedSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$FeaturedSection$items$items<
                      Fragment$Section$$FeaturedSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$FeaturedSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$FeaturedSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$FeaturedSection$items$items<
                          Fragment$Section$$FeaturedSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Fragment$Section$$FeaturedSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$FeaturedSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$FeaturedSection$items$items
    implements Fragment$ItemSectionItem {
  Fragment$Section$$FeaturedSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
    required this.description,
  });

  factory Fragment$Section$$FeaturedSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    final l$description = json['description'];
    return Fragment$Section$$FeaturedSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: Fragment$Section$$FeaturedSection$items$items$item.fromJson(
          (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      description: (l$description as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$FeaturedSection$items$items$item item;

  final String $__typename;

  final String description;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$description = description;
    _resultData['description'] = l$description;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    final l$description = description;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
      l$description,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$FeaturedSection$items$items) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items
    on Fragment$Section$$FeaturedSection$items$items {
  CopyWith$Fragment$Section$$FeaturedSection$items$items<
          Fragment$Section$$FeaturedSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$FeaturedSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items(
    Fragment$Section$$FeaturedSection$items$items instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$FeaturedSection$items$items$item? item,
    String? $__typename,
    String? description,
  });
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
    Object? description = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$Section$$FeaturedSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
      ));
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$Section$$FeaturedSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$FeaturedSection$items$items$item? item,
    String? $__typename,
    String? description,
  }) =>
      _res;
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$FeaturedSection$items$items$item.stub(_res);
}

class Fragment$Section$$FeaturedSection$items$items$item
    implements Fragment$ItemSectionItem$item {
  Fragment$Section$$FeaturedSection$items$items$item(
      {required this.$__typename});

  factory Fragment$Section$$FeaturedSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$FeaturedSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Fragment$Section$$FeaturedSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Fragment$Section$$FeaturedSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$FeaturedSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$FeaturedSection$items$items$item(
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
    if (!(other is Fragment$Section$$FeaturedSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item
    on Fragment$Section$$FeaturedSection$items$items$item {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item<
          Fragment$Section$$FeaturedSection$items$items$item>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item(
    Fragment$Section$$FeaturedSection$items$items$item instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$FeaturedSection$items$items$item$$Link
    implements
        Fragment$ItemSectionItem$item$$Link,
        Fragment$Section$$FeaturedSection$items$items$item {
  Fragment$Section$$FeaturedSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$FeaturedSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$FeaturedSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$FeaturedSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item$$Link
    on Fragment$Section$$FeaturedSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link<
          Fragment$Section$$FeaturedSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link(
    Fragment$Section$$FeaturedSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$FeaturedSection$items$items$item$$Page
    implements
        Fragment$ItemSectionItem$item$$Page,
        Fragment$Section$$FeaturedSection$items$items$item {
  Fragment$Section$$FeaturedSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$FeaturedSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$FeaturedSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$FeaturedSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item$$Page
    on Fragment$Section$$FeaturedSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page<
          Fragment$Section$$FeaturedSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page(
    Fragment$Section$$FeaturedSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$FeaturedSection$items$items$item$$Episode
    implements
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$Section$$FeaturedSection$items$items$item {
  Fragment$Section$$FeaturedSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
  });

  factory Fragment$Section$$FeaturedSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    return Fragment$Section$$FeaturedSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$FeaturedSection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item$$Episode
    on Fragment$Section$$FeaturedSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
          Fragment$Section$$FeaturedSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode(
    Fragment$Section$$FeaturedSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
  });
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item$$Episode _instance;

  final TRes Function(
      Fragment$Section$$FeaturedSection$items$items$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
  }) =>
      _res;
}

class Fragment$Section$$FeaturedSection$items$items$item$$Show
    implements
        Fragment$ItemSectionItem$item$$Show,
        Fragment$Section$$FeaturedSection$items$items$item {
  Fragment$Section$$FeaturedSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
  });

  factory Fragment$Section$$FeaturedSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    return Fragment$Section$$FeaturedSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$FeaturedSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item$$Show
    on Fragment$Section$$FeaturedSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show<
          Fragment$Section$$FeaturedSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show(
    Fragment$Section$$FeaturedSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  });
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  }) =>
      _res;
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode
    implements Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
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
    if (!(other
            is Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode
    on Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
          Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
    Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$DefaultSection
    implements Fragment$ItemSection, Fragment$Section {
  Fragment$Section$$DefaultSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.size,
  });

  factory Fragment$Section$$DefaultSection.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$size = json['size'];
    return Fragment$Section$$DefaultSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Fragment$Section$$DefaultSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$Section$$DefaultSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      size: fromJson$Enum$SectionSize((l$size as String)),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final Fragment$Section$$DefaultSection$metadata? metadata;

  final Fragment$Section$$DefaultSection$items items;

  final Enum$SectionSize size;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$size = size;
    _resultData['size'] = toJson$Enum$SectionSize(l$size);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$size = size;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$metadata,
      l$items,
      l$size,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (l$size != lOther$size) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultSection
    on Fragment$Section$$DefaultSection {
  CopyWith$Fragment$Section$$DefaultSection<Fragment$Section$$DefaultSection>
      get copyWith => CopyWith$Fragment$Section$$DefaultSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection<TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection(
    Fragment$Section$$DefaultSection instance,
    TRes Function(Fragment$Section$$DefaultSection) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection;

  factory CopyWith$Fragment$Section$$DefaultSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$DefaultSection$metadata? metadata,
    Fragment$Section$$DefaultSection$items? items,
    Enum$SectionSize? size,
  });
  CopyWith$Fragment$Section$$DefaultSection$metadata<TRes> get metadata;
  CopyWith$Fragment$Section$$DefaultSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$DefaultSection<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection _instance;

  final TRes Function(Fragment$Section$$DefaultSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? size = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$Section$$DefaultSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$DefaultSection$items),
        size: size == _undefined || size == null
            ? _instance.size
            : (size as Enum$SectionSize),
      ));
  CopyWith$Fragment$Section$$DefaultSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$Section$$DefaultSection$metadata.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$DefaultSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$Section$$DefaultSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$DefaultSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$DefaultSection$metadata? metadata,
    Fragment$Section$$DefaultSection$items? items,
    Enum$SectionSize? size,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$Section$$DefaultSection$metadata.stub(_res);
  CopyWith$Fragment$Section$$DefaultSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$DefaultSection$items.stub(_res);
}

class Fragment$Section$$DefaultSection$metadata
    implements Fragment$ItemSection$metadata {
  Fragment$Section$$DefaultSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$Section$$DefaultSection$metadata
    on Fragment$Section$$DefaultSection$metadata {
  CopyWith$Fragment$Section$$DefaultSection$metadata<
          Fragment$Section$$DefaultSection$metadata>
      get copyWith => CopyWith$Fragment$Section$$DefaultSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$metadata<TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$metadata(
    Fragment$Section$$DefaultSection$metadata instance,
    TRes Function(Fragment$Section$$DefaultSection$metadata) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$metadata;

  factory CopyWith$Fragment$Section$$DefaultSection$metadata.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$metadata<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$metadata _instance;

  final TRes Function(Fragment$Section$$DefaultSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$DefaultSection$items
    implements Fragment$ItemSection$items {
  Fragment$Section$$DefaultSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$DefaultSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$DefaultSection$items$items> items;

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
    if (!(other is Fragment$Section$$DefaultSection$items) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items
    on Fragment$Section$$DefaultSection$items {
  CopyWith$Fragment$Section$$DefaultSection$items<
          Fragment$Section$$DefaultSection$items>
      get copyWith => CopyWith$Fragment$Section$$DefaultSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items<TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items(
    Fragment$Section$$DefaultSection$items instance,
    TRes Function(Fragment$Section$$DefaultSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items;

  factory CopyWith$Fragment$Section$$DefaultSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items;

  TRes call({
    List<Fragment$Section$$DefaultSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$DefaultSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$DefaultSection$items$items<
                      Fragment$Section$$DefaultSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$DefaultSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$DefaultSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$DefaultSection$items$items<
                          Fragment$Section$$DefaultSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$Section$$DefaultSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$DefaultSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$DefaultSection$items$items
    implements Fragment$ItemSectionItem {
  Fragment$Section$$DefaultSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: Fragment$Section$$DefaultSection$items$items$item.fromJson(
          (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$DefaultSection$items$items$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultSection$items$items) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items
    on Fragment$Section$$DefaultSection$items$items {
  CopyWith$Fragment$Section$$DefaultSection$items$items<
          Fragment$Section$$DefaultSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$DefaultSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items(
    Fragment$Section$$DefaultSection$items$items instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$DefaultSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$Section$$DefaultSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$Section$$DefaultSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$DefaultSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$DefaultSection$items$items$item.stub(_res);
}

class Fragment$Section$$DefaultSection$items$items$item
    implements Fragment$ItemSectionItem$item {
  Fragment$Section$$DefaultSection$items$items$item(
      {required this.$__typename});

  factory Fragment$Section$$DefaultSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$DefaultSection$items$items$item$$Link.fromJson(
            json);

      case "Page":
        return Fragment$Section$$DefaultSection$items$items$item$$Page.fromJson(
            json);

      case "Episode":
        return Fragment$Section$$DefaultSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$DefaultSection$items$items$item$$Show.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$DefaultSection$items$items$item(
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
    if (!(other is Fragment$Section$$DefaultSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item
    on Fragment$Section$$DefaultSection$items$items$item {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item<
          Fragment$Section$$DefaultSection$items$items$item>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item(
    Fragment$Section$$DefaultSection$items$items$item instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$DefaultSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$DefaultSection$items$items$item$$Link
    implements
        Fragment$ItemSectionItem$item$$Link,
        Fragment$Section$$DefaultSection$items$items$item {
  Fragment$Section$$DefaultSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$DefaultSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Link
    on Fragment$Section$$DefaultSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link<
          Fragment$Section$$DefaultSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link(
    Fragment$Section$$DefaultSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Link) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$DefaultSection$items$items$item$$Page
    implements
        Fragment$ItemSectionItem$item$$Page,
        Fragment$Section$$DefaultSection$items$items$item {
  Fragment$Section$$DefaultSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$DefaultSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Page
    on Fragment$Section$$DefaultSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page<
          Fragment$Section$$DefaultSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page(
    Fragment$Section$$DefaultSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Page) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$DefaultSection$items$items$item$$Episode
    implements
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$Section$$DefaultSection$items$items$item {
  Fragment$Section$$DefaultSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    this.productionDate,
    required this.publishDate,
    this.season,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$productionDate = json['productionDate'];
    final l$publishDate = json['publishDate'];
    final l$season = json['season'];
    return Fragment$Section$$DefaultSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      productionDate: (l$productionDate as String?),
      publishDate: (l$publishDate as String),
      season: l$season == null
          ? null
          : Fragment$Section$$DefaultSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String? productionDate;

  final String publishDate;

  final Fragment$Section$$DefaultSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$productionDate = productionDate;
    _resultData['productionDate'] = l$productionDate;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$productionDate = productionDate;
    final l$publishDate = publishDate;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$productionDate,
      l$publishDate,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultSection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$productionDate = productionDate;
    final lOther$productionDate = other.productionDate;
    if (l$productionDate != lOther$productionDate) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Episode
    on Fragment$Section$$DefaultSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode<
          Fragment$Section$$DefaultSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode(
    Fragment$Section$$DefaultSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? productionDate,
    String? publishDate,
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season? season,
  });
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Episode _instance;

  final TRes Function(
      Fragment$Section$$DefaultSection$items$items$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? productionDate = _undefined,
    Object? publishDate = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        productionDate: productionDate == _undefined
            ? _instance.productionDate
            : (productionDate as String?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        season: season == _undefined
            ? _instance.season
            : (season
                as Fragment$Section$$DefaultSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? productionDate,
    String? publishDate,
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season? season,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season
              .stub(_res);
}

class Fragment$Section$$DefaultSection$items$items$item$$Show
    implements
        Fragment$ItemSectionItem$item$$Show,
        Fragment$Section$$DefaultSection$items$items$item {
  Fragment$Section$$DefaultSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Fragment$Section$$DefaultSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Show
    on Fragment$Section$$DefaultSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show<
          Fragment$Section$$DefaultSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show(
    Fragment$Section$$DefaultSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Show) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode
    implements Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode(
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
    if (!(other
            is Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode
    on Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode<
          Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode(
    Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$DefaultSection$items$items$item$$Episode$season {
  Fragment$Section$$DefaultSection$items$items$item$$Episode$season({
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
      $show:
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$show = $show;
    final lOther$$show = other.$show;
    if (l$$show != lOther$$show) {
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Episode$season
    on Fragment$Section$$DefaultSection$items$items$item$$Episode$season {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season instance,
    TRes Function(
            Fragment$Section$$DefaultSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season;

  TRes call({
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
      Fragment$Section$$DefaultSection$items$items$item$$Episode$season) _then;

  static const _undefined = {};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show {
  Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
    on Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$ListSection
    implements Fragment$ItemSection, Fragment$Section {
  Fragment$Section$$ListSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.metadata,
    required this.items,
  });

  factory Fragment$Section$$ListSection.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    return Fragment$Section$$ListSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Fragment$Section$$ListSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$Section$$ListSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final Fragment$Section$$ListSection$metadata? metadata;

  final Fragment$Section$$ListSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$metadata,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$ListSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$ListSection
    on Fragment$Section$$ListSection {
  CopyWith$Fragment$Section$$ListSection<Fragment$Section$$ListSection>
      get copyWith => CopyWith$Fragment$Section$$ListSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection<TRes> {
  factory CopyWith$Fragment$Section$$ListSection(
    Fragment$Section$$ListSection instance,
    TRes Function(Fragment$Section$$ListSection) then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection;

  factory CopyWith$Fragment$Section$$ListSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$ListSection$metadata? metadata,
    Fragment$Section$$ListSection$items? items,
  });
  CopyWith$Fragment$Section$$ListSection$metadata<TRes> get metadata;
  CopyWith$Fragment$Section$$ListSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$ListSection<TRes>
    implements CopyWith$Fragment$Section$$ListSection<TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection _instance;

  final TRes Function(Fragment$Section$$ListSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$Section$$ListSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$ListSection$items),
      ));
  CopyWith$Fragment$Section$$ListSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$Section$$ListSection$metadata.stub(_then(_instance))
        : CopyWith$Fragment$Section$$ListSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$Section$$ListSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$ListSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$ListSection<TRes>
    implements CopyWith$Fragment$Section$$ListSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$ListSection$metadata? metadata,
    Fragment$Section$$ListSection$items? items,
  }) =>
      _res;
  CopyWith$Fragment$Section$$ListSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$Section$$ListSection$metadata.stub(_res);
  CopyWith$Fragment$Section$$ListSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$ListSection$items.stub(_res);
}

class Fragment$Section$$ListSection$metadata
    implements Fragment$ItemSection$metadata {
  Fragment$Section$$ListSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$Section$$ListSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$ListSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$ListSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$Section$$ListSection$metadata
    on Fragment$Section$$ListSection$metadata {
  CopyWith$Fragment$Section$$ListSection$metadata<
          Fragment$Section$$ListSection$metadata>
      get copyWith => CopyWith$Fragment$Section$$ListSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$metadata<TRes> {
  factory CopyWith$Fragment$Section$$ListSection$metadata(
    Fragment$Section$$ListSection$metadata instance,
    TRes Function(Fragment$Section$$ListSection$metadata) then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$metadata;

  factory CopyWith$Fragment$Section$$ListSection$metadata.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$ListSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$ListSection$metadata<TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$metadata _instance;

  final TRes Function(Fragment$Section$$ListSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$ListSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$ListSection$items
    implements Fragment$ItemSection$items {
  Fragment$Section$$ListSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$ListSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$ListSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$ListSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$ListSection$items$items> items;

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
    if (!(other is Fragment$Section$$ListSection$items) ||
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

extension UtilityExtension$Fragment$Section$$ListSection$items
    on Fragment$Section$$ListSection$items {
  CopyWith$Fragment$Section$$ListSection$items<
          Fragment$Section$$ListSection$items>
      get copyWith => CopyWith$Fragment$Section$$ListSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items<TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items(
    Fragment$Section$$ListSection$items instance,
    TRes Function(Fragment$Section$$ListSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items;

  factory CopyWith$Fragment$Section$$ListSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items;

  TRes call({
    List<Fragment$Section$$ListSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$ListSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$ListSection$items$items<
                      Fragment$Section$$ListSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$ListSection$items<TRes>
    implements CopyWith$Fragment$Section$$ListSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items _instance;

  final TRes Function(Fragment$Section$$ListSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$ListSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$ListSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$ListSection$items$items<
                          Fragment$Section$$ListSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$Section$$ListSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items<TRes>
    implements CopyWith$Fragment$Section$$ListSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$ListSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$ListSection$items$items
    implements Fragment$ItemSectionItem {
  Fragment$Section$$ListSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$ListSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$ListSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: Fragment$Section$$ListSection$items$items$item.fromJson(
          (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$ListSection$items$items$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$ListSection$items$items) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Fragment$Section$$ListSection$items$items
    on Fragment$Section$$ListSection$items$items {
  CopyWith$Fragment$Section$$ListSection$items$items<
          Fragment$Section$$ListSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$ListSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items$items(
    Fragment$Section$$ListSection$items$items instance,
    TRes Function(Fragment$Section$$ListSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items$items;

  factory CopyWith$Fragment$Section$$ListSection$items$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$ListSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$ListSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$ListSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$ListSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items$items _instance;

  final TRes Function(Fragment$Section$$ListSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$Section$$ListSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$ListSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$Section$$ListSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$ListSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$ListSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$ListSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$ListSection$items$items$item.stub(_res);
}

class Fragment$Section$$ListSection$items$items$item
    implements Fragment$ItemSectionItem$item {
  Fragment$Section$$ListSection$items$items$item({required this.$__typename});

  factory Fragment$Section$$ListSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$ListSection$items$items$item$$Link.fromJson(
            json);

      case "Page":
        return Fragment$Section$$ListSection$items$items$item$$Page.fromJson(
            json);

      case "Episode":
        return Fragment$Section$$ListSection$items$items$item$$Episode.fromJson(
            json);

      case "Show":
        return Fragment$Section$$ListSection$items$items$item$$Show.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$ListSection$items$items$item(
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
    if (!(other is Fragment$Section$$ListSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$ListSection$items$items$item
    on Fragment$Section$$ListSection$items$items$item {
  CopyWith$Fragment$Section$$ListSection$items$items$item<
          Fragment$Section$$ListSection$items$items$item>
      get copyWith => CopyWith$Fragment$Section$$ListSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items$items$item<TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items$items$item(
    Fragment$Section$$ListSection$items$items$item instance,
    TRes Function(Fragment$Section$$ListSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items$items$item;

  factory CopyWith$Fragment$Section$$ListSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$ListSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$ListSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$ListSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$ListSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$ListSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$ListSection$items$items$item$$Link
    implements
        Fragment$ItemSectionItem$item$$Link,
        Fragment$Section$$ListSection$items$items$item {
  Fragment$Section$$ListSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$ListSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$ListSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$ListSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$ListSection$items$items$item$$Link
    on Fragment$Section$$ListSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Link<
          Fragment$Section$$ListSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Link(
    Fragment$Section$$ListSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$ListSection$items$items$item$$Link) then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Link<TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Link<TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$ListSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$ListSection$items$items$item$$Page
    implements
        Fragment$ItemSectionItem$item$$Page,
        Fragment$Section$$ListSection$items$items$item {
  Fragment$Section$$ListSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$ListSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$ListSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$ListSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$ListSection$items$items$item$$Page
    on Fragment$Section$$ListSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Page<
          Fragment$Section$$ListSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Page(
    Fragment$Section$$ListSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$ListSection$items$items$item$$Page) then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Page<TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Page<TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$ListSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$ListSection$items$items$item$$Episode
    implements
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$Section$$ListSection$items$items$item {
  Fragment$Section$$ListSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.title,
    required this.ageRating,
    this.image,
    this.season,
  });

  factory Fragment$Section$$ListSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$title = json['title'];
    final l$ageRating = json['ageRating'];
    final l$image = json['image'];
    final l$season = json['season'];
    return Fragment$Section$$ListSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      title: (l$title as String),
      ageRating: (l$ageRating as String),
      image: (l$image as String?),
      season: l$season == null
          ? null
          : Fragment$Section$$ListSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String title;

  final String ageRating;

  final String? image;

  final Fragment$Section$$ListSection$items$items$item$$Episode$season? season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$title = title;
    final l$ageRating = ageRating;
    final l$image = image;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$title,
      l$ageRating,
      l$image,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$ListSection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$ageRating = ageRating;
    final lOther$ageRating = other.ageRating;
    if (l$ageRating != lOther$ageRating) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$ListSection$items$items$item$$Episode
    on Fragment$Section$$ListSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode<
          Fragment$Section$$ListSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode(
    Fragment$Section$$ListSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$ListSection$items$items$item$$Episode) then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? title,
    String? ageRating,
    String? image,
    Fragment$Section$$ListSection$items$items$item$$Episode$season? season,
  });
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season<TRes>
      get season;
}

class _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode<TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items$items$item$$Episode _instance;

  final TRes Function(Fragment$Section$$ListSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? title = _undefined,
    Object? ageRating = _undefined,
    Object? image = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        image: image == _undefined ? _instance.image : (image as String?),
        season: season == _undefined
            ? _instance.season
            : (season
                as Fragment$Section$$ListSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season<TRes>
      get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode<TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? title,
    String? ageRating,
    String? image,
    Fragment$Section$$ListSection$items$items$item$$Episode$season? season,
  }) =>
      _res;
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season<TRes>
      get season =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season
              .stub(_res);
}

class Fragment$Section$$ListSection$items$items$item$$Show
    implements
        Fragment$ItemSectionItem$item$$Show,
        Fragment$Section$$ListSection$items$items$item {
  Fragment$Section$$ListSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
  });

  factory Fragment$Section$$ListSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    return Fragment$Section$$ListSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$ListSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$ListSection$items$items$item$$Show
    on Fragment$Section$$ListSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Show<
          Fragment$Section$$ListSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Show(
    Fragment$Section$$ListSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$ListSection$items$items$item$$Show) then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  });
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Show<TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Show<TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$ListSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  }) =>
      _res;
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode
    implements Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode(
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
    if (!(other
            is Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode
    on Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode<
          Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode(
    Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$ListSection$items$items$item$$Episode$season {
  Fragment$Section$$ListSection$items$items$item$$Episode$season({
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$Section$$ListSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$ListSection$items$items$item$$Episode$season(
      $show: Fragment$Section$$ListSection$items$items$item$$Episode$season$show
          .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Section$$ListSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$ListSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$show = $show;
    final lOther$$show = other.$show;
    if (l$$show != lOther$$show) {
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

extension UtilityExtension$Fragment$Section$$ListSection$items$items$item$$Episode$season
    on Fragment$Section$$ListSection$items$items$item$$Episode$season {
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season<
          Fragment$Section$$ListSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season(
    Fragment$Section$$ListSection$items$items$item$$Episode$season instance,
    TRes Function(
            Fragment$Section$$ListSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season;

  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season;

  TRes call({
    Fragment$Section$$ListSection$items$items$item$$Episode$season$show? $show,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
      Fragment$Section$$ListSection$items$items$item$$Episode$season) _then;

  static const _undefined = {};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$items$items$item$$Episode$season(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Fragment$Section$$ListSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    Fragment$Section$$ListSection$items$items$item$$Episode$season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Fragment$Section$$ListSection$items$items$item$$Episode$season$show {
  Fragment$Section$$ListSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$Section$$ListSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$ListSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$ListSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$Section$$ListSection$items$items$item$$Episode$season$show
    on Fragment$Section$$ListSection$items$items$item$$Episode$season$show {
  CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show<
          Fragment$Section$$ListSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show(
    Fragment$Section$$ListSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Fragment$Section$$ListSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season$show;

  factory CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$ListSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Fragment$Section$$ListSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$ListSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$ListSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$ListSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$DefaultGridSection
    implements Fragment$ItemSection, Fragment$Section {
  Fragment$Section$$DefaultGridSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.gridSize,
  });

  factory Fragment$Section$$DefaultGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$gridSize = json['gridSize'];
    return Fragment$Section$$DefaultGridSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Fragment$Section$$DefaultGridSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$Section$$DefaultGridSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      gridSize: fromJson$Enum$GridSectionSize((l$gridSize as String)),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final Fragment$Section$$DefaultGridSection$metadata? metadata;

  final Fragment$Section$$DefaultGridSection$items items;

  final Enum$GridSectionSize gridSize;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$gridSize = gridSize;
    _resultData['gridSize'] = toJson$Enum$GridSectionSize(l$gridSize);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$gridSize = gridSize;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$metadata,
      l$items,
      l$gridSize,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultGridSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$gridSize = gridSize;
    final lOther$gridSize = other.gridSize;
    if (l$gridSize != lOther$gridSize) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultGridSection
    on Fragment$Section$$DefaultGridSection {
  CopyWith$Fragment$Section$$DefaultGridSection<
          Fragment$Section$$DefaultGridSection>
      get copyWith => CopyWith$Fragment$Section$$DefaultGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection<TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection(
    Fragment$Section$$DefaultGridSection instance,
    TRes Function(Fragment$Section$$DefaultGridSection) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection;

  factory CopyWith$Fragment$Section$$DefaultGridSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$DefaultGridSection$metadata? metadata,
    Fragment$Section$$DefaultGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  });
  CopyWith$Fragment$Section$$DefaultGridSection$metadata<TRes> get metadata;
  CopyWith$Fragment$Section$$DefaultGridSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection<TRes>
    implements CopyWith$Fragment$Section$$DefaultGridSection<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection _instance;

  final TRes Function(Fragment$Section$$DefaultGridSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? gridSize = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultGridSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$Section$$DefaultGridSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$DefaultGridSection$items),
        gridSize: gridSize == _undefined || gridSize == null
            ? _instance.gridSize
            : (gridSize as Enum$GridSectionSize),
      ));
  CopyWith$Fragment$Section$$DefaultGridSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$Section$$DefaultGridSection$metadata.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$DefaultGridSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$Section$$DefaultGridSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$DefaultGridSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection<TRes>
    implements CopyWith$Fragment$Section$$DefaultGridSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$DefaultGridSection$metadata? metadata,
    Fragment$Section$$DefaultGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultGridSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$Section$$DefaultGridSection$metadata.stub(_res);
  CopyWith$Fragment$Section$$DefaultGridSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$DefaultGridSection$items.stub(_res);
}

class Fragment$Section$$DefaultGridSection$metadata
    implements Fragment$ItemSection$metadata {
  Fragment$Section$$DefaultGridSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultGridSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultGridSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultGridSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$Section$$DefaultGridSection$metadata
    on Fragment$Section$$DefaultGridSection$metadata {
  CopyWith$Fragment$Section$$DefaultGridSection$metadata<
          Fragment$Section$$DefaultGridSection$metadata>
      get copyWith => CopyWith$Fragment$Section$$DefaultGridSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$metadata<TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$metadata(
    Fragment$Section$$DefaultGridSection$metadata instance,
    TRes Function(Fragment$Section$$DefaultGridSection$metadata) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$metadata;

  factory CopyWith$Fragment$Section$$DefaultGridSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$DefaultGridSection$metadata<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$metadata _instance;

  final TRes Function(Fragment$Section$$DefaultGridSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultGridSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$DefaultGridSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$DefaultGridSection$items
    implements Fragment$ItemSection$items {
  Fragment$Section$$DefaultGridSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultGridSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultGridSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$DefaultGridSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$DefaultGridSection$items$items> items;

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
    if (!(other is Fragment$Section$$DefaultGridSection$items) ||
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

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items
    on Fragment$Section$$DefaultGridSection$items {
  CopyWith$Fragment$Section$$DefaultGridSection$items<
          Fragment$Section$$DefaultGridSection$items>
      get copyWith => CopyWith$Fragment$Section$$DefaultGridSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items<TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items(
    Fragment$Section$$DefaultGridSection$items instance,
    TRes Function(Fragment$Section$$DefaultGridSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items;

  TRes call({
    List<Fragment$Section$$DefaultGridSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$DefaultGridSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$DefaultGridSection$items$items<
                      Fragment$Section$$DefaultGridSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultGridSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items _instance;

  final TRes Function(Fragment$Section$$DefaultGridSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultGridSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$DefaultGridSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$DefaultGridSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$DefaultGridSection$items$items<
                          Fragment$Section$$DefaultGridSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Fragment$Section$$DefaultGridSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultGridSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$DefaultGridSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$DefaultGridSection$items$items
    implements Fragment$ItemSectionItem, Fragment$GridSectionItem {
  Fragment$Section$$DefaultGridSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultGridSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultGridSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: Fragment$Section$$DefaultGridSection$items$items$item.fromJson(
          (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$DefaultGridSection$items$items$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultGridSection$items$items) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items$items
    on Fragment$Section$$DefaultGridSection$items$items {
  CopyWith$Fragment$Section$$DefaultGridSection$items$items<
          Fragment$Section$$DefaultGridSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$DefaultGridSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items(
    Fragment$Section$$DefaultGridSection$items$items instance,
    TRes Function(Fragment$Section$$DefaultGridSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$DefaultGridSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultGridSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items$items _instance;

  final TRes Function(Fragment$Section$$DefaultGridSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultGridSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$Section$$DefaultGridSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item<TRes>
      get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$Section$$DefaultGridSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultGridSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$DefaultGridSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item<TRes>
      get item =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item.stub(
              _res);
}

class Fragment$Section$$DefaultGridSection$items$items$item
    implements Fragment$ItemSectionItem$item, Fragment$GridSectionItem$item {
  Fragment$Section$$DefaultGridSection$items$items$item(
      {required this.$__typename});

  factory Fragment$Section$$DefaultGridSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$DefaultGridSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Fragment$Section$$DefaultGridSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Fragment$Section$$DefaultGridSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$DefaultGridSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$DefaultGridSection$items$items$item(
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
    if (!(other is Fragment$Section$$DefaultGridSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items$items$item
    on Fragment$Section$$DefaultGridSection$items$items$item {
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item<
          Fragment$Section$$DefaultGridSection$items$items$item>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items$items$item<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item(
    Fragment$Section$$DefaultGridSection$items$items$item instance,
    TRes Function(Fragment$Section$$DefaultGridSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$DefaultGridSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$DefaultGridSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$DefaultGridSection$items$items$item$$Link
    implements
        Fragment$ItemSectionItem$item$$Link,
        Fragment$GridSectionItem$item$$Link,
        Fragment$Section$$DefaultGridSection$items$items$item {
  Fragment$Section$$DefaultGridSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$DefaultGridSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$DefaultGridSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultGridSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items$items$item$$Link
    on Fragment$Section$$DefaultGridSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Link<
          Fragment$Section$$DefaultGridSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Link(
    Fragment$Section$$DefaultGridSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$DefaultGridSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items$items$item$$Link _instance;

  final TRes Function(
      Fragment$Section$$DefaultGridSection$items$items$item$$Link) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultGridSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$DefaultGridSection$items$items$item$$Page
    implements
        Fragment$ItemSectionItem$item$$Page,
        Fragment$GridSectionItem$item$$Page,
        Fragment$Section$$DefaultGridSection$items$items$item {
  Fragment$Section$$DefaultGridSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$DefaultGridSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$DefaultGridSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultGridSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items$items$item$$Page
    on Fragment$Section$$DefaultGridSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Page<
          Fragment$Section$$DefaultGridSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Page(
    Fragment$Section$$DefaultGridSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$DefaultGridSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items$items$item$$Page _instance;

  final TRes Function(
      Fragment$Section$$DefaultGridSection$items$items$item$$Page) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultGridSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$DefaultGridSection$items$items$item$$Episode
    implements
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$GridSectionItem$item$$Episode,
        Fragment$Section$$DefaultGridSection$items$items$item {
  Fragment$Section$$DefaultGridSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    this.number,
    this.season,
  });

  factory Fragment$Section$$DefaultGridSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$number = json['number'];
    final l$season = json['season'];
    return Fragment$Section$$DefaultGridSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      number: (l$number as int?),
      season: l$season == null
          ? null
          : Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final int? number;

  final Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$number = number;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$number,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultGridSection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
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
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items$items$item$$Episode
    on Fragment$Section$$DefaultGridSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode<
          Fragment$Section$$DefaultGridSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode(
    Fragment$Section$$DefaultGridSection$items$items$item$$Episode instance,
    TRes Function(
            Fragment$Section$$DefaultGridSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season?
        season,
  });
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items$items$item$$Episode
      _instance;

  final TRes Function(
      Fragment$Section$$DefaultGridSection$items$items$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? number = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultGridSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        number: number == _undefined ? _instance.number : (number as int?),
        season: season == _undefined
            ? _instance.season
            : (season
                as Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season?
        season,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season
              .stub(_res);
}

class Fragment$Section$$DefaultGridSection$items$items$item$$Show
    implements
        Fragment$ItemSectionItem$item$$Show,
        Fragment$GridSectionItem$item$$Show,
        Fragment$Section$$DefaultGridSection$items$items$item {
  Fragment$Section$$DefaultGridSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Fragment$Section$$DefaultGridSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Fragment$Section$$DefaultGridSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultGridSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items$items$item$$Show
    on Fragment$Section$$DefaultGridSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show<
          Fragment$Section$$DefaultGridSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show(
    Fragment$Section$$DefaultGridSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$DefaultGridSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items$items$item$$Show _instance;

  final TRes Function(
      Fragment$Section$$DefaultGridSection$items$items$item$$Show) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultGridSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$ItemSectionItem$item$$Show$defaultEpisode,
        Fragment$GridSectionItem$item$$Show$defaultEpisode {
  Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
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
    if (!(other
            is Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
    on Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
          Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
    Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season
    implements Fragment$GridSectionItem$item$$Episode$season {
  Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season({
    required this.number,
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$number = json['number'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season(
      number: (l$number as int),
      $show:
          Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int number;

  final Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$number = number;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$number,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$$show = $show;
    final lOther$$show = other.$show;
    if (l$$show != lOther$$show) {
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

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season
    on Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season {
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season<
          Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season(
    Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season
        instance,
    TRes Function(
            Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season;

  TRes call({
    int? number,
    Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
          Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season)
      _then;

  static const _undefined = {};

  TRes call({
    Object? number = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season(
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    int? number,
    Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show
    implements Fragment$GridSectionItem$item$$Episode$season$show {
  Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show
    on Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show {
  CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show<
          Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show(
    Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show;

  factory CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$PosterGridSection
    implements Fragment$ItemSection, Fragment$Section {
  Fragment$Section$$PosterGridSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.gridSize,
  });

  factory Fragment$Section$$PosterGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$gridSize = json['gridSize'];
    return Fragment$Section$$PosterGridSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Fragment$Section$$PosterGridSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$Section$$PosterGridSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      gridSize: fromJson$Enum$GridSectionSize((l$gridSize as String)),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final Fragment$Section$$PosterGridSection$metadata? metadata;

  final Fragment$Section$$PosterGridSection$items items;

  final Enum$GridSectionSize gridSize;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$gridSize = gridSize;
    _resultData['gridSize'] = toJson$Enum$GridSectionSize(l$gridSize);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$gridSize = gridSize;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$metadata,
      l$items,
      l$gridSize,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterGridSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$gridSize = gridSize;
    final lOther$gridSize = other.gridSize;
    if (l$gridSize != lOther$gridSize) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterGridSection
    on Fragment$Section$$PosterGridSection {
  CopyWith$Fragment$Section$$PosterGridSection<
          Fragment$Section$$PosterGridSection>
      get copyWith => CopyWith$Fragment$Section$$PosterGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection<TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection(
    Fragment$Section$$PosterGridSection instance,
    TRes Function(Fragment$Section$$PosterGridSection) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection;

  factory CopyWith$Fragment$Section$$PosterGridSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$PosterGridSection$metadata? metadata,
    Fragment$Section$$PosterGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  });
  CopyWith$Fragment$Section$$PosterGridSection$metadata<TRes> get metadata;
  CopyWith$Fragment$Section$$PosterGridSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection<TRes>
    implements CopyWith$Fragment$Section$$PosterGridSection<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection _instance;

  final TRes Function(Fragment$Section$$PosterGridSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? gridSize = _undefined,
  }) =>
      _then(Fragment$Section$$PosterGridSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$Section$$PosterGridSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$PosterGridSection$items),
        gridSize: gridSize == _undefined || gridSize == null
            ? _instance.gridSize
            : (gridSize as Enum$GridSectionSize),
      ));
  CopyWith$Fragment$Section$$PosterGridSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$Section$$PosterGridSection$metadata.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$PosterGridSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$Section$$PosterGridSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$PosterGridSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection<TRes>
    implements CopyWith$Fragment$Section$$PosterGridSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$PosterGridSection$metadata? metadata,
    Fragment$Section$$PosterGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterGridSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$Section$$PosterGridSection$metadata.stub(_res);
  CopyWith$Fragment$Section$$PosterGridSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$PosterGridSection$items.stub(_res);
}

class Fragment$Section$$PosterGridSection$metadata
    implements Fragment$ItemSection$metadata {
  Fragment$Section$$PosterGridSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterGridSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterGridSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterGridSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$Section$$PosterGridSection$metadata
    on Fragment$Section$$PosterGridSection$metadata {
  CopyWith$Fragment$Section$$PosterGridSection$metadata<
          Fragment$Section$$PosterGridSection$metadata>
      get copyWith => CopyWith$Fragment$Section$$PosterGridSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$metadata<TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$metadata(
    Fragment$Section$$PosterGridSection$metadata instance,
    TRes Function(Fragment$Section$$PosterGridSection$metadata) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$metadata;

  factory CopyWith$Fragment$Section$$PosterGridSection$metadata.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$PosterGridSection$metadata<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$metadata _instance;

  final TRes Function(Fragment$Section$$PosterGridSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterGridSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$PosterGridSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$PosterGridSection$items
    implements Fragment$ItemSection$items {
  Fragment$Section$$PosterGridSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterGridSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterGridSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$PosterGridSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$PosterGridSection$items$items> items;

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
    if (!(other is Fragment$Section$$PosterGridSection$items) ||
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

extension UtilityExtension$Fragment$Section$$PosterGridSection$items
    on Fragment$Section$$PosterGridSection$items {
  CopyWith$Fragment$Section$$PosterGridSection$items<
          Fragment$Section$$PosterGridSection$items>
      get copyWith => CopyWith$Fragment$Section$$PosterGridSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items<TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items(
    Fragment$Section$$PosterGridSection$items instance,
    TRes Function(Fragment$Section$$PosterGridSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items;

  factory CopyWith$Fragment$Section$$PosterGridSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items;

  TRes call({
    List<Fragment$Section$$PosterGridSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$PosterGridSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$PosterGridSection$items$items<
                      Fragment$Section$$PosterGridSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items<TRes>
    implements CopyWith$Fragment$Section$$PosterGridSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items _instance;

  final TRes Function(Fragment$Section$$PosterGridSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterGridSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$PosterGridSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$PosterGridSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$PosterGridSection$items$items<
                          Fragment$Section$$PosterGridSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Fragment$Section$$PosterGridSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items<TRes>
    implements CopyWith$Fragment$Section$$PosterGridSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$PosterGridSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$PosterGridSection$items$items
    implements Fragment$ItemSectionItem, Fragment$GridSectionItem {
  Fragment$Section$$PosterGridSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterGridSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterGridSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: Fragment$Section$$PosterGridSection$items$items$item.fromJson(
          (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$PosterGridSection$items$items$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterGridSection$items$items) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Fragment$Section$$PosterGridSection$items$items
    on Fragment$Section$$PosterGridSection$items$items {
  CopyWith$Fragment$Section$$PosterGridSection$items$items<
          Fragment$Section$$PosterGridSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$PosterGridSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items$items(
    Fragment$Section$$PosterGridSection$items$items instance,
    TRes Function(Fragment$Section$$PosterGridSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items;

  factory CopyWith$Fragment$Section$$PosterGridSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$PosterGridSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$PosterGridSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items$items _instance;

  final TRes Function(Fragment$Section$$PosterGridSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterGridSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$Section$$PosterGridSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$Section$$PosterGridSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$PosterGridSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$PosterGridSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item<TRes>
      get item =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item.stub(
              _res);
}

class Fragment$Section$$PosterGridSection$items$items$item
    implements Fragment$ItemSectionItem$item, Fragment$GridSectionItem$item {
  Fragment$Section$$PosterGridSection$items$items$item(
      {required this.$__typename});

  factory Fragment$Section$$PosterGridSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$PosterGridSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Fragment$Section$$PosterGridSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Fragment$Section$$PosterGridSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$PosterGridSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$PosterGridSection$items$items$item(
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
    if (!(other is Fragment$Section$$PosterGridSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$PosterGridSection$items$items$item
    on Fragment$Section$$PosterGridSection$items$items$item {
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item<
          Fragment$Section$$PosterGridSection$items$items$item>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items$items$item<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item(
    Fragment$Section$$PosterGridSection$items$items$item instance,
    TRes Function(Fragment$Section$$PosterGridSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item;

  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$PosterGridSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$PosterGridSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$PosterGridSection$items$items$item$$Link
    implements
        Fragment$ItemSectionItem$item$$Link,
        Fragment$GridSectionItem$item$$Link,
        Fragment$Section$$PosterGridSection$items$items$item {
  Fragment$Section$$PosterGridSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$PosterGridSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$PosterGridSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$PosterGridSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterGridSection$items$items$item$$Link
    on Fragment$Section$$PosterGridSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Link<
          Fragment$Section$$PosterGridSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Link(
    Fragment$Section$$PosterGridSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$PosterGridSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items$items$item$$Link _instance;

  final TRes Function(
      Fragment$Section$$PosterGridSection$items$items$item$$Link) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$PosterGridSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$PosterGridSection$items$items$item$$Page
    implements
        Fragment$ItemSectionItem$item$$Page,
        Fragment$GridSectionItem$item$$Page,
        Fragment$Section$$PosterGridSection$items$items$item {
  Fragment$Section$$PosterGridSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$PosterGridSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$PosterGridSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$PosterGridSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterGridSection$items$items$item$$Page
    on Fragment$Section$$PosterGridSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Page<
          Fragment$Section$$PosterGridSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Page(
    Fragment$Section$$PosterGridSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$PosterGridSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items$items$item$$Page _instance;

  final TRes Function(
      Fragment$Section$$PosterGridSection$items$items$item$$Page) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$PosterGridSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$PosterGridSection$items$items$item$$Episode
    implements
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$GridSectionItem$item$$Episode,
        Fragment$Section$$PosterGridSection$items$items$item {
  Fragment$Section$$PosterGridSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    this.number,
    this.season,
  });

  factory Fragment$Section$$PosterGridSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$number = json['number'];
    final l$season = json['season'];
    return Fragment$Section$$PosterGridSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      number: (l$number as int?),
      season: l$season == null
          ? null
          : Fragment$Section$$PosterGridSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final int? number;

  final Fragment$Section$$PosterGridSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$number = number;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$number,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$PosterGridSection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
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
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterGridSection$items$items$item$$Episode
    on Fragment$Section$$PosterGridSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode<
          Fragment$Section$$PosterGridSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode(
    Fragment$Section$$PosterGridSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$PosterGridSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Fragment$Section$$PosterGridSection$items$items$item$$Episode$season?
        season,
  });
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items$items$item$$Episode _instance;

  final TRes Function(
      Fragment$Section$$PosterGridSection$items$items$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? number = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$Section$$PosterGridSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        number: number == _undefined ? _instance.number : (number as int?),
        season: season == _undefined
            ? _instance.season
            : (season
                as Fragment$Section$$PosterGridSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Fragment$Section$$PosterGridSection$items$items$item$$Episode$season?
        season,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season
              .stub(_res);
}

class Fragment$Section$$PosterGridSection$items$items$item$$Show
    implements
        Fragment$ItemSectionItem$item$$Show,
        Fragment$GridSectionItem$item$$Show,
        Fragment$Section$$PosterGridSection$items$items$item {
  Fragment$Section$$PosterGridSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Fragment$Section$$PosterGridSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Fragment$Section$$PosterGridSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$PosterGridSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterGridSection$items$items$item$$Show
    on Fragment$Section$$PosterGridSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show<
          Fragment$Section$$PosterGridSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show(
    Fragment$Section$$PosterGridSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$PosterGridSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items$items$item$$Show _instance;

  final TRes Function(
      Fragment$Section$$PosterGridSection$items$items$item$$Show) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(Fragment$Section$$PosterGridSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$ItemSectionItem$item$$Show$defaultEpisode,
        Fragment$GridSectionItem$item$$Show$defaultEpisode {
  Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
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
    if (!(other
            is Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode
    on Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
          Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
    Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$PosterGridSection$items$items$item$$Episode$season
    implements Fragment$GridSectionItem$item$$Episode$season {
  Fragment$Section$$PosterGridSection$items$items$item$$Episode$season({
    required this.number,
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterGridSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$number = json['number'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterGridSection$items$items$item$$Episode$season(
      number: (l$number as int),
      $show:
          Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int number;

  final Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$number = number;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$number,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$PosterGridSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$$show = $show;
    final lOther$$show = other.$show;
    if (l$$show != lOther$$show) {
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

extension UtilityExtension$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season
    on Fragment$Section$$PosterGridSection$items$items$item$$Episode$season {
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season<
          Fragment$Section$$PosterGridSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season(
    Fragment$Section$$PosterGridSection$items$items$item$$Episode$season
        instance,
    TRes Function(
            Fragment$Section$$PosterGridSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season;

  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season;

  TRes call({
    int? number,
    Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
          Fragment$Section$$PosterGridSection$items$items$item$$Episode$season)
      _then;

  static const _undefined = {};

  TRes call({
    Object? number = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$PosterGridSection$items$items$item$$Episode$season(
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    int? number,
    Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show
    implements Fragment$GridSectionItem$item$$Episode$season$show {
  Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show
    on Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show {
  CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show<
          Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show(
    Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show;

  factory CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$IconGridSection
    implements Fragment$ItemSection, Fragment$Section {
  Fragment$Section$$IconGridSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.gridSize,
  });

  factory Fragment$Section$$IconGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$gridSize = json['gridSize'];
    return Fragment$Section$$IconGridSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Fragment$Section$$IconGridSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$Section$$IconGridSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      gridSize: fromJson$Enum$GridSectionSize((l$gridSize as String)),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final Fragment$Section$$IconGridSection$metadata? metadata;

  final Fragment$Section$$IconGridSection$items items;

  final Enum$GridSectionSize gridSize;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$gridSize = gridSize;
    _resultData['gridSize'] = toJson$Enum$GridSectionSize(l$gridSize);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$gridSize = gridSize;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$metadata,
      l$items,
      l$gridSize,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconGridSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$gridSize = gridSize;
    final lOther$gridSize = other.gridSize;
    if (l$gridSize != lOther$gridSize) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$IconGridSection
    on Fragment$Section$$IconGridSection {
  CopyWith$Fragment$Section$$IconGridSection<Fragment$Section$$IconGridSection>
      get copyWith => CopyWith$Fragment$Section$$IconGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection<TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection(
    Fragment$Section$$IconGridSection instance,
    TRes Function(Fragment$Section$$IconGridSection) then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection;

  factory CopyWith$Fragment$Section$$IconGridSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$IconGridSection$metadata? metadata,
    Fragment$Section$$IconGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  });
  CopyWith$Fragment$Section$$IconGridSection$metadata<TRes> get metadata;
  CopyWith$Fragment$Section$$IconGridSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$IconGridSection<TRes>
    implements CopyWith$Fragment$Section$$IconGridSection<TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection _instance;

  final TRes Function(Fragment$Section$$IconGridSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? gridSize = _undefined,
  }) =>
      _then(Fragment$Section$$IconGridSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$Section$$IconGridSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$IconGridSection$items),
        gridSize: gridSize == _undefined || gridSize == null
            ? _instance.gridSize
            : (gridSize as Enum$GridSectionSize),
      ));
  CopyWith$Fragment$Section$$IconGridSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$Section$$IconGridSection$metadata.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$IconGridSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$Section$$IconGridSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$IconGridSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection<TRes>
    implements CopyWith$Fragment$Section$$IconGridSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$IconGridSection$metadata? metadata,
    Fragment$Section$$IconGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  }) =>
      _res;
  CopyWith$Fragment$Section$$IconGridSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$Section$$IconGridSection$metadata.stub(_res);
  CopyWith$Fragment$Section$$IconGridSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$IconGridSection$items.stub(_res);
}

class Fragment$Section$$IconGridSection$metadata
    implements Fragment$ItemSection$metadata {
  Fragment$Section$$IconGridSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$Section$$IconGridSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconGridSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconGridSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$Section$$IconGridSection$metadata
    on Fragment$Section$$IconGridSection$metadata {
  CopyWith$Fragment$Section$$IconGridSection$metadata<
          Fragment$Section$$IconGridSection$metadata>
      get copyWith => CopyWith$Fragment$Section$$IconGridSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$metadata<TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$metadata(
    Fragment$Section$$IconGridSection$metadata instance,
    TRes Function(Fragment$Section$$IconGridSection$metadata) then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$metadata;

  factory CopyWith$Fragment$Section$$IconGridSection$metadata.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$IconGridSection$metadata<TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$metadata _instance;

  final TRes Function(Fragment$Section$$IconGridSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$IconGridSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$IconGridSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$IconGridSection$items
    implements Fragment$ItemSection$items {
  Fragment$Section$$IconGridSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$IconGridSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconGridSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$IconGridSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$IconGridSection$items$items> items;

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
    if (!(other is Fragment$Section$$IconGridSection$items) ||
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

extension UtilityExtension$Fragment$Section$$IconGridSection$items
    on Fragment$Section$$IconGridSection$items {
  CopyWith$Fragment$Section$$IconGridSection$items<
          Fragment$Section$$IconGridSection$items>
      get copyWith => CopyWith$Fragment$Section$$IconGridSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items<TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items(
    Fragment$Section$$IconGridSection$items instance,
    TRes Function(Fragment$Section$$IconGridSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items;

  factory CopyWith$Fragment$Section$$IconGridSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items;

  TRes call({
    List<Fragment$Section$$IconGridSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$IconGridSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$IconGridSection$items$items<
                      Fragment$Section$$IconGridSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items<TRes>
    implements CopyWith$Fragment$Section$$IconGridSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items _instance;

  final TRes Function(Fragment$Section$$IconGridSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$IconGridSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$IconGridSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$IconGridSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$IconGridSection$items$items<
                          Fragment$Section$$IconGridSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Fragment$Section$$IconGridSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items<TRes>
    implements CopyWith$Fragment$Section$$IconGridSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$IconGridSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$IconGridSection$items$items
    implements Fragment$ItemSectionItem, Fragment$GridSectionItem {
  Fragment$Section$$IconGridSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$IconGridSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconGridSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: Fragment$Section$$IconGridSection$items$items$item.fromJson(
          (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$IconGridSection$items$items$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconGridSection$items$items) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Fragment$Section$$IconGridSection$items$items
    on Fragment$Section$$IconGridSection$items$items {
  CopyWith$Fragment$Section$$IconGridSection$items$items<
          Fragment$Section$$IconGridSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$IconGridSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items$items(
    Fragment$Section$$IconGridSection$items$items instance,
    TRes Function(Fragment$Section$$IconGridSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items$items;

  factory CopyWith$Fragment$Section$$IconGridSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$IconGridSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$IconGridSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$IconGridSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items$items _instance;

  final TRes Function(Fragment$Section$$IconGridSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$IconGridSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$Section$$IconGridSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$IconGridSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$Section$$IconGridSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$IconGridSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$IconGridSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$IconGridSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$IconGridSection$items$items$item.stub(_res);
}

class Fragment$Section$$IconGridSection$items$items$item
    implements Fragment$ItemSectionItem$item, Fragment$GridSectionItem$item {
  Fragment$Section$$IconGridSection$items$items$item(
      {required this.$__typename});

  factory Fragment$Section$$IconGridSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$IconGridSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Fragment$Section$$IconGridSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Fragment$Section$$IconGridSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$IconGridSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$IconGridSection$items$items$item(
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
    if (!(other is Fragment$Section$$IconGridSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$IconGridSection$items$items$item
    on Fragment$Section$$IconGridSection$items$items$item {
  CopyWith$Fragment$Section$$IconGridSection$items$items$item<
          Fragment$Section$$IconGridSection$items$items$item>
      get copyWith =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items$items$item<
    TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item(
    Fragment$Section$$IconGridSection$items$items$item instance,
    TRes Function(Fragment$Section$$IconGridSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item;

  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$IconGridSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$IconGridSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$IconGridSection$items$items$item$$Link
    implements
        Fragment$ItemSectionItem$item$$Link,
        Fragment$GridSectionItem$item$$Link,
        Fragment$Section$$IconGridSection$items$items$item {
  Fragment$Section$$IconGridSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$IconGridSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$IconGridSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconGridSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$IconGridSection$items$items$item$$Link
    on Fragment$Section$$IconGridSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Link<
          Fragment$Section$$IconGridSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Link(
    Fragment$Section$$IconGridSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$IconGridSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$IconGridSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$IconGridSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$IconGridSection$items$items$item$$Page
    implements
        Fragment$ItemSectionItem$item$$Page,
        Fragment$GridSectionItem$item$$Page,
        Fragment$Section$$IconGridSection$items$items$item {
  Fragment$Section$$IconGridSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$IconGridSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$IconGridSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconGridSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$IconGridSection$items$items$item$$Page
    on Fragment$Section$$IconGridSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Page<
          Fragment$Section$$IconGridSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Page(
    Fragment$Section$$IconGridSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$IconGridSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$IconGridSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$IconGridSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$IconGridSection$items$items$item$$Episode
    implements
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$GridSectionItem$item$$Episode,
        Fragment$Section$$IconGridSection$items$items$item {
  Fragment$Section$$IconGridSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    this.number,
    this.season,
  });

  factory Fragment$Section$$IconGridSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$number = json['number'];
    final l$season = json['season'];
    return Fragment$Section$$IconGridSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      number: (l$number as int?),
      season: l$season == null
          ? null
          : Fragment$Section$$IconGridSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final int? number;

  final Fragment$Section$$IconGridSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$number = number;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$number,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$IconGridSection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
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
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$IconGridSection$items$items$item$$Episode
    on Fragment$Section$$IconGridSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode<
          Fragment$Section$$IconGridSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode(
    Fragment$Section$$IconGridSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$IconGridSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Fragment$Section$$IconGridSection$items$items$item$$Episode$season? season,
  });
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items$items$item$$Episode _instance;

  final TRes Function(
      Fragment$Section$$IconGridSection$items$items$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? number = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$Section$$IconGridSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        number: number == _undefined ? _instance.number : (number as int?),
        season: season == _undefined
            ? _instance.season
            : (season
                as Fragment$Section$$IconGridSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Fragment$Section$$IconGridSection$items$items$item$$Episode$season? season,
  }) =>
      _res;
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season
              .stub(_res);
}

class Fragment$Section$$IconGridSection$items$items$item$$Show
    implements
        Fragment$ItemSectionItem$item$$Show,
        Fragment$GridSectionItem$item$$Show,
        Fragment$Section$$IconGridSection$items$items$item {
  Fragment$Section$$IconGridSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Fragment$Section$$IconGridSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Fragment$Section$$IconGridSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconGridSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$IconGridSection$items$items$item$$Show
    on Fragment$Section$$IconGridSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show<
          Fragment$Section$$IconGridSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show(
    Fragment$Section$$IconGridSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$IconGridSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$IconGridSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(Fragment$Section$$IconGridSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$ItemSectionItem$item$$Show$defaultEpisode,
        Fragment$GridSectionItem$item$$Show$defaultEpisode {
  Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode(
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
    if (!(other
            is Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode
    on Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode<
          Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode(
    Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$IconGridSection$items$items$item$$Episode$season
    implements Fragment$GridSectionItem$item$$Episode$season {
  Fragment$Section$$IconGridSection$items$items$item$$Episode$season({
    required this.number,
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$Section$$IconGridSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$number = json['number'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconGridSection$items$items$item$$Episode$season(
      number: (l$number as int),
      $show:
          Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int number;

  final Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$number = number;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$number,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$IconGridSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$$show = $show;
    final lOther$$show = other.$show;
    if (l$$show != lOther$$show) {
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

extension UtilityExtension$Fragment$Section$$IconGridSection$items$items$item$$Episode$season
    on Fragment$Section$$IconGridSection$items$items$item$$Episode$season {
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season<
          Fragment$Section$$IconGridSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season(
    Fragment$Section$$IconGridSection$items$items$item$$Episode$season instance,
    TRes Function(
            Fragment$Section$$IconGridSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season;

  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season;

  TRes call({
    int? number,
    Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
      Fragment$Section$$IconGridSection$items$items$item$$Episode$season) _then;

  static const _undefined = {};

  TRes call({
    Object? number = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$IconGridSection$items$items$item$$Episode$season(
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    int? number,
    Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show
    implements Fragment$GridSectionItem$item$$Episode$season$show {
  Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show
    on Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show {
  CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show<
          Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show(
    Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show;

  factory CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$IconSection
    implements Fragment$ItemSection, Fragment$Section {
  Fragment$Section$$IconSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.metadata,
    required this.items,
  });

  factory Fragment$Section$$IconSection.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    return Fragment$Section$$IconSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Fragment$Section$$IconSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$Section$$IconSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final Fragment$Section$$IconSection$metadata? metadata;

  final Fragment$Section$$IconSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$metadata,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$IconSection
    on Fragment$Section$$IconSection {
  CopyWith$Fragment$Section$$IconSection<Fragment$Section$$IconSection>
      get copyWith => CopyWith$Fragment$Section$$IconSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection<TRes> {
  factory CopyWith$Fragment$Section$$IconSection(
    Fragment$Section$$IconSection instance,
    TRes Function(Fragment$Section$$IconSection) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection;

  factory CopyWith$Fragment$Section$$IconSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$IconSection$metadata? metadata,
    Fragment$Section$$IconSection$items? items,
  });
  CopyWith$Fragment$Section$$IconSection$metadata<TRes> get metadata;
  CopyWith$Fragment$Section$$IconSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$IconSection<TRes>
    implements CopyWith$Fragment$Section$$IconSection<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection _instance;

  final TRes Function(Fragment$Section$$IconSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$Section$$IconSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$IconSection$items),
      ));
  CopyWith$Fragment$Section$$IconSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$Section$$IconSection$metadata.stub(_then(_instance))
        : CopyWith$Fragment$Section$$IconSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$Section$$IconSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$IconSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$IconSection<TRes>
    implements CopyWith$Fragment$Section$$IconSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$IconSection$metadata? metadata,
    Fragment$Section$$IconSection$items? items,
  }) =>
      _res;
  CopyWith$Fragment$Section$$IconSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$Section$$IconSection$metadata.stub(_res);
  CopyWith$Fragment$Section$$IconSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$IconSection$items.stub(_res);
}

class Fragment$Section$$IconSection$metadata
    implements Fragment$ItemSection$metadata {
  Fragment$Section$$IconSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$Section$$IconSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$Section$$IconSection$metadata
    on Fragment$Section$$IconSection$metadata {
  CopyWith$Fragment$Section$$IconSection$metadata<
          Fragment$Section$$IconSection$metadata>
      get copyWith => CopyWith$Fragment$Section$$IconSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection$metadata<TRes> {
  factory CopyWith$Fragment$Section$$IconSection$metadata(
    Fragment$Section$$IconSection$metadata instance,
    TRes Function(Fragment$Section$$IconSection$metadata) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection$metadata;

  factory CopyWith$Fragment$Section$$IconSection$metadata.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$IconSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$IconSection$metadata<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection$metadata _instance;

  final TRes Function(Fragment$Section$$IconSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$IconSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$IconSection$items
    implements Fragment$ItemSection$items {
  Fragment$Section$$IconSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$IconSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Fragment$Section$$IconSection$items) ||
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

extension UtilityExtension$Fragment$Section$$IconSection$items
    on Fragment$Section$$IconSection$items {
  CopyWith$Fragment$Section$$IconSection$items<
          Fragment$Section$$IconSection$items>
      get copyWith => CopyWith$Fragment$Section$$IconSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection$items<TRes> {
  factory CopyWith$Fragment$Section$$IconSection$items(
    Fragment$Section$$IconSection$items instance,
    TRes Function(Fragment$Section$$IconSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection$items;

  factory CopyWith$Fragment$Section$$IconSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$IconSection$items<TRes>
    implements CopyWith$Fragment$Section$$IconSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection$items _instance;

  final TRes Function(Fragment$Section$$IconSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ItemSectionItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$ItemSectionItem> Function(
                  Iterable<
                      CopyWith$Fragment$ItemSectionItem<
                          Fragment$ItemSectionItem>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$ItemSectionItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$IconSection$items<TRes>
    implements CopyWith$Fragment$Section$$IconSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$LabelSection
    implements Fragment$ItemSection, Fragment$Section {
  Fragment$Section$$LabelSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.metadata,
    required this.items,
  });

  factory Fragment$Section$$LabelSection.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    return Fragment$Section$$LabelSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Fragment$Section$$LabelSection$metadata.fromJson(
              (l$metadata as Map<String, dynamic>)),
      items: Fragment$Section$$LabelSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final Fragment$Section$$LabelSection$metadata? metadata;

  final Fragment$Section$$LabelSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$metadata,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$LabelSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$LabelSection
    on Fragment$Section$$LabelSection {
  CopyWith$Fragment$Section$$LabelSection<Fragment$Section$$LabelSection>
      get copyWith => CopyWith$Fragment$Section$$LabelSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection<TRes> {
  factory CopyWith$Fragment$Section$$LabelSection(
    Fragment$Section$$LabelSection instance,
    TRes Function(Fragment$Section$$LabelSection) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection;

  factory CopyWith$Fragment$Section$$LabelSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$LabelSection$metadata? metadata,
    Fragment$Section$$LabelSection$items? items,
  });
  CopyWith$Fragment$Section$$LabelSection$metadata<TRes> get metadata;
  CopyWith$Fragment$Section$$LabelSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$LabelSection<TRes>
    implements CopyWith$Fragment$Section$$LabelSection<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection _instance;

  final TRes Function(Fragment$Section$$LabelSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata as Fragment$Section$$LabelSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$LabelSection$items),
      ));
  CopyWith$Fragment$Section$$LabelSection$metadata<TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Fragment$Section$$LabelSection$metadata.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$LabelSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Fragment$Section$$LabelSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$LabelSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection<TRes>
    implements CopyWith$Fragment$Section$$LabelSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    Fragment$Section$$LabelSection$metadata? metadata,
    Fragment$Section$$LabelSection$items? items,
  }) =>
      _res;
  CopyWith$Fragment$Section$$LabelSection$metadata<TRes> get metadata =>
      CopyWith$Fragment$Section$$LabelSection$metadata.stub(_res);
  CopyWith$Fragment$Section$$LabelSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$LabelSection$items.stub(_res);
}

class Fragment$Section$$LabelSection$metadata
    implements Fragment$ItemSection$metadata {
  Fragment$Section$$LabelSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Fragment$Section$$LabelSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$LabelSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$LabelSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Fragment$Section$$LabelSection$metadata
    on Fragment$Section$$LabelSection$metadata {
  CopyWith$Fragment$Section$$LabelSection$metadata<
          Fragment$Section$$LabelSection$metadata>
      get copyWith => CopyWith$Fragment$Section$$LabelSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection$metadata<TRes> {
  factory CopyWith$Fragment$Section$$LabelSection$metadata(
    Fragment$Section$$LabelSection$metadata instance,
    TRes Function(Fragment$Section$$LabelSection$metadata) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection$metadata;

  factory CopyWith$Fragment$Section$$LabelSection$metadata.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$LabelSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$metadata<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection$metadata(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection$metadata _instance;

  final TRes Function(Fragment$Section$$LabelSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection$metadata<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$metadata<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection$metadata(this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$LabelSection$items
    implements Fragment$ItemSection$items {
  Fragment$Section$$LabelSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$LabelSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$LabelSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Fragment$Section$$LabelSection$items) ||
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

extension UtilityExtension$Fragment$Section$$LabelSection$items
    on Fragment$Section$$LabelSection$items {
  CopyWith$Fragment$Section$$LabelSection$items<
          Fragment$Section$$LabelSection$items>
      get copyWith => CopyWith$Fragment$Section$$LabelSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection$items<TRes> {
  factory CopyWith$Fragment$Section$$LabelSection$items(
    Fragment$Section$$LabelSection$items instance,
    TRes Function(Fragment$Section$$LabelSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection$items;

  factory CopyWith$Fragment$Section$$LabelSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$LabelSection$items<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection$items _instance;

  final TRes Function(Fragment$Section$$LabelSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ItemSectionItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$ItemSectionItem> Function(
                  Iterable<
                      CopyWith$Fragment$ItemSectionItem<
                          Fragment$ItemSectionItem>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$ItemSectionItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection$items<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$WebSection implements Fragment$Section {
  Fragment$Section$$WebSection({
    required this.id,
    this.title,
    required this.$__typename,
    required this.authentication,
    required this.widthRatio,
    this.height,
    required this.url,
  });

  factory Fragment$Section$$WebSection.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$authentication = json['authentication'];
    final l$widthRatio = json['widthRatio'];
    final l$height = json['height'];
    final l$url = json['url'];
    return Fragment$Section$$WebSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      authentication: (l$authentication as bool),
      widthRatio: (l$widthRatio as num).toDouble(),
      height: (l$height as int?),
      url: (l$url as String),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final bool authentication;

  final double widthRatio;

  final int? height;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$authentication = authentication;
    _resultData['authentication'] = l$authentication;
    final l$widthRatio = widthRatio;
    _resultData['widthRatio'] = l$widthRatio;
    final l$height = height;
    _resultData['height'] = l$height;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$authentication = authentication;
    final l$widthRatio = widthRatio;
    final l$height = height;
    final l$url = url;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$authentication,
      l$widthRatio,
      l$height,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$WebSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$authentication = authentication;
    final lOther$authentication = other.authentication;
    if (l$authentication != lOther$authentication) {
      return false;
    }
    final l$widthRatio = widthRatio;
    final lOther$widthRatio = other.widthRatio;
    if (l$widthRatio != lOther$widthRatio) {
      return false;
    }
    final l$height = height;
    final lOther$height = other.height;
    if (l$height != lOther$height) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$WebSection
    on Fragment$Section$$WebSection {
  CopyWith$Fragment$Section$$WebSection<Fragment$Section$$WebSection>
      get copyWith => CopyWith$Fragment$Section$$WebSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$WebSection<TRes> {
  factory CopyWith$Fragment$Section$$WebSection(
    Fragment$Section$$WebSection instance,
    TRes Function(Fragment$Section$$WebSection) then,
  ) = _CopyWithImpl$Fragment$Section$$WebSection;

  factory CopyWith$Fragment$Section$$WebSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$WebSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    bool? authentication,
    double? widthRatio,
    int? height,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$WebSection<TRes>
    implements CopyWith$Fragment$Section$$WebSection<TRes> {
  _CopyWithImpl$Fragment$Section$$WebSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$WebSection _instance;

  final TRes Function(Fragment$Section$$WebSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? authentication = _undefined,
    Object? widthRatio = _undefined,
    Object? height = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$WebSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        authentication: authentication == _undefined || authentication == null
            ? _instance.authentication
            : (authentication as bool),
        widthRatio: widthRatio == _undefined || widthRatio == null
            ? _instance.widthRatio
            : (widthRatio as double),
        height: height == _undefined ? _instance.height : (height as int?),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$WebSection<TRes>
    implements CopyWith$Fragment$Section$$WebSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$WebSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    bool? authentication,
    double? widthRatio,
    int? height,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$MessageSection implements Fragment$Section {
  Fragment$Section$$MessageSection({
    required this.id,
    this.title,
    required this.$__typename,
    this.messages,
  });

  factory Fragment$Section$$MessageSection.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$messages = json['messages'];
    return Fragment$Section$$MessageSection(
      id: (l$id as String),
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      messages: (l$messages as List<dynamic>?)
          ?.map((e) => Fragment$Section$$MessageSection$messages.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final String id;

  final String? title;

  final String $__typename;

  final List<Fragment$Section$$MessageSection$messages>? messages;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$messages = messages;
    _resultData['messages'] = l$messages?.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$messages = messages;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
      l$messages == null ? null : Object.hashAll(l$messages.map((v) => v)),
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$MessageSection) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$messages = messages;
    final lOther$messages = other.messages;
    if (l$messages != null && lOther$messages != null) {
      if (l$messages.length != lOther$messages.length) {
        return false;
      }
      for (int i = 0; i < l$messages.length; i++) {
        final l$messages$entry = l$messages[i];
        final lOther$messages$entry = lOther$messages[i];
        if (l$messages$entry != lOther$messages$entry) {
          return false;
        }
      }
    } else if (l$messages != lOther$messages) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$MessageSection
    on Fragment$Section$$MessageSection {
  CopyWith$Fragment$Section$$MessageSection<Fragment$Section$$MessageSection>
      get copyWith => CopyWith$Fragment$Section$$MessageSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$MessageSection<TRes> {
  factory CopyWith$Fragment$Section$$MessageSection(
    Fragment$Section$$MessageSection instance,
    TRes Function(Fragment$Section$$MessageSection) then,
  ) = _CopyWithImpl$Fragment$Section$$MessageSection;

  factory CopyWith$Fragment$Section$$MessageSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$MessageSection;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
    List<Fragment$Section$$MessageSection$messages>? messages,
  });
  TRes messages(
      Iterable<Fragment$Section$$MessageSection$messages>? Function(
              Iterable<
                  CopyWith$Fragment$Section$$MessageSection$messages<
                      Fragment$Section$$MessageSection$messages>>?)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$MessageSection<TRes>
    implements CopyWith$Fragment$Section$$MessageSection<TRes> {
  _CopyWithImpl$Fragment$Section$$MessageSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$MessageSection _instance;

  final TRes Function(Fragment$Section$$MessageSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? messages = _undefined,
  }) =>
      _then(Fragment$Section$$MessageSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        messages: messages == _undefined
            ? _instance.messages
            : (messages as List<Fragment$Section$$MessageSection$messages>?),
      ));
  TRes messages(
          Iterable<Fragment$Section$$MessageSection$messages>? Function(
                  Iterable<
                      CopyWith$Fragment$Section$$MessageSection$messages<
                          Fragment$Section$$MessageSection$messages>>?)
              _fn) =>
      call(
          messages: _fn(_instance.messages
              ?.map((e) => CopyWith$Fragment$Section$$MessageSection$messages(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Fragment$Section$$MessageSection<TRes>
    implements CopyWith$Fragment$Section$$MessageSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$MessageSection(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
    List<Fragment$Section$$MessageSection$messages>? messages,
  }) =>
      _res;
  messages(_fn) => _res;
}

class Fragment$Section$$MessageSection$messages {
  Fragment$Section$$MessageSection$messages({
    required this.content,
    required this.style,
    required this.$__typename,
  });

  factory Fragment$Section$$MessageSection$messages.fromJson(
      Map<String, dynamic> json) {
    final l$content = json['content'];
    final l$style = json['style'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$MessageSection$messages(
      content: (l$content as String),
      style: Fragment$Section$$MessageSection$messages$style.fromJson(
          (l$style as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String content;

  final Fragment$Section$$MessageSection$messages$style style;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$content = content;
    _resultData['content'] = l$content;
    final l$style = style;
    _resultData['style'] = l$style.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$content = content;
    final l$style = style;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$content,
      l$style,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$MessageSection$messages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$style = style;
    final lOther$style = other.style;
    if (l$style != lOther$style) {
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

extension UtilityExtension$Fragment$Section$$MessageSection$messages
    on Fragment$Section$$MessageSection$messages {
  CopyWith$Fragment$Section$$MessageSection$messages<
          Fragment$Section$$MessageSection$messages>
      get copyWith => CopyWith$Fragment$Section$$MessageSection$messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$MessageSection$messages<TRes> {
  factory CopyWith$Fragment$Section$$MessageSection$messages(
    Fragment$Section$$MessageSection$messages instance,
    TRes Function(Fragment$Section$$MessageSection$messages) then,
  ) = _CopyWithImpl$Fragment$Section$$MessageSection$messages;

  factory CopyWith$Fragment$Section$$MessageSection$messages.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$MessageSection$messages;

  TRes call({
    String? content,
    Fragment$Section$$MessageSection$messages$style? style,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$MessageSection$messages$style<TRes> get style;
}

class _CopyWithImpl$Fragment$Section$$MessageSection$messages<TRes>
    implements CopyWith$Fragment$Section$$MessageSection$messages<TRes> {
  _CopyWithImpl$Fragment$Section$$MessageSection$messages(
    this._instance,
    this._then,
  );

  final Fragment$Section$$MessageSection$messages _instance;

  final TRes Function(Fragment$Section$$MessageSection$messages) _then;

  static const _undefined = {};

  TRes call({
    Object? content = _undefined,
    Object? style = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$MessageSection$messages(
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        style: style == _undefined || style == null
            ? _instance.style
            : (style as Fragment$Section$$MessageSection$messages$style),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$MessageSection$messages$style<TRes> get style {
    final local$style = _instance.style;
    return CopyWith$Fragment$Section$$MessageSection$messages$style(
        local$style, (e) => call(style: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$MessageSection$messages<TRes>
    implements CopyWith$Fragment$Section$$MessageSection$messages<TRes> {
  _CopyWithStubImpl$Fragment$Section$$MessageSection$messages(this._res);

  TRes _res;

  call({
    String? content,
    Fragment$Section$$MessageSection$messages$style? style,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$MessageSection$messages$style<TRes> get style =>
      CopyWith$Fragment$Section$$MessageSection$messages$style.stub(_res);
}

class Fragment$Section$$MessageSection$messages$style {
  Fragment$Section$$MessageSection$messages$style({
    required this.text,
    required this.background,
    required this.border,
    required this.$__typename,
  });

  factory Fragment$Section$$MessageSection$messages$style.fromJson(
      Map<String, dynamic> json) {
    final l$text = json['text'];
    final l$background = json['background'];
    final l$border = json['border'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$MessageSection$messages$style(
      text: (l$text as String),
      background: (l$background as String),
      border: (l$border as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String text;

  final String background;

  final String border;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$text = text;
    _resultData['text'] = l$text;
    final l$background = background;
    _resultData['background'] = l$background;
    final l$border = border;
    _resultData['border'] = l$border;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$text = text;
    final l$background = background;
    final l$border = border;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$text,
      l$background,
      l$border,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$MessageSection$messages$style) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$background = background;
    final lOther$background = other.background;
    if (l$background != lOther$background) {
      return false;
    }
    final l$border = border;
    final lOther$border = other.border;
    if (l$border != lOther$border) {
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

extension UtilityExtension$Fragment$Section$$MessageSection$messages$style
    on Fragment$Section$$MessageSection$messages$style {
  CopyWith$Fragment$Section$$MessageSection$messages$style<
          Fragment$Section$$MessageSection$messages$style>
      get copyWith => CopyWith$Fragment$Section$$MessageSection$messages$style(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$MessageSection$messages$style<TRes> {
  factory CopyWith$Fragment$Section$$MessageSection$messages$style(
    Fragment$Section$$MessageSection$messages$style instance,
    TRes Function(Fragment$Section$$MessageSection$messages$style) then,
  ) = _CopyWithImpl$Fragment$Section$$MessageSection$messages$style;

  factory CopyWith$Fragment$Section$$MessageSection$messages$style.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$MessageSection$messages$style;

  TRes call({
    String? text,
    String? background,
    String? border,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$MessageSection$messages$style<TRes>
    implements CopyWith$Fragment$Section$$MessageSection$messages$style<TRes> {
  _CopyWithImpl$Fragment$Section$$MessageSection$messages$style(
    this._instance,
    this._then,
  );

  final Fragment$Section$$MessageSection$messages$style _instance;

  final TRes Function(Fragment$Section$$MessageSection$messages$style) _then;

  static const _undefined = {};

  TRes call({
    Object? text = _undefined,
    Object? background = _undefined,
    Object? border = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$MessageSection$messages$style(
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        background: background == _undefined || background == null
            ? _instance.background
            : (background as String),
        border: border == _undefined || border == null
            ? _instance.border
            : (border as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$MessageSection$messages$style<TRes>
    implements CopyWith$Fragment$Section$$MessageSection$messages$style<TRes> {
  _CopyWithStubImpl$Fragment$Section$$MessageSection$messages$style(this._res);

  TRes _res;

  call({
    String? text,
    String? background,
    String? border,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$Page {
  factory Variables$Query$Page({required String code}) =>
      Variables$Query$Page._({
        r'code': code,
      });

  Variables$Query$Page._(this._$data);

  factory Variables$Query$Page.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$code = data['code'];
    result$data['code'] = (l$code as String);
    return Variables$Query$Page._(result$data);
  }

  Map<String, dynamic> _$data;

  String get code => (_$data['code'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$code = code;
    result$data['code'] = l$code;
    return result$data;
  }

  CopyWith$Variables$Query$Page<Variables$Query$Page> get copyWith =>
      CopyWith$Variables$Query$Page(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$Page) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$code = code;
    return Object.hashAll([l$code]);
  }
}

abstract class CopyWith$Variables$Query$Page<TRes> {
  factory CopyWith$Variables$Query$Page(
    Variables$Query$Page instance,
    TRes Function(Variables$Query$Page) then,
  ) = _CopyWithImpl$Variables$Query$Page;

  factory CopyWith$Variables$Query$Page.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Page;

  TRes call({String? code});
}

class _CopyWithImpl$Variables$Query$Page<TRes>
    implements CopyWith$Variables$Query$Page<TRes> {
  _CopyWithImpl$Variables$Query$Page(
    this._instance,
    this._then,
  );

  final Variables$Query$Page _instance;

  final TRes Function(Variables$Query$Page) _then;

  static const _undefined = {};

  TRes call({Object? code = _undefined}) => _then(Variables$Query$Page._({
        ..._instance._$data,
        if (code != _undefined && code != null) 'code': (code as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$Page<TRes>
    implements CopyWith$Variables$Query$Page<TRes> {
  _CopyWithStubImpl$Variables$Query$Page(this._res);

  TRes _res;

  call({String? code}) => _res;
}

class Query$Page {
  Query$Page({
    required this.page,
    required this.$__typename,
  });

  factory Query$Page.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$$__typename = json['__typename'];
    return Query$Page(
      page: Query$Page$page.fromJson((l$page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Page$page page;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$page,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
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

extension UtilityExtension$Query$Page on Query$Page {
  CopyWith$Query$Page<Query$Page> get copyWith => CopyWith$Query$Page(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Page<TRes> {
  factory CopyWith$Query$Page(
    Query$Page instance,
    TRes Function(Query$Page) then,
  ) = _CopyWithImpl$Query$Page;

  factory CopyWith$Query$Page.stub(TRes res) = _CopyWithStubImpl$Query$Page;

  TRes call({
    Query$Page$page? page,
    String? $__typename,
  });
  CopyWith$Query$Page$page<TRes> get page;
}

class _CopyWithImpl$Query$Page<TRes> implements CopyWith$Query$Page<TRes> {
  _CopyWithImpl$Query$Page(
    this._instance,
    this._then,
  );

  final Query$Page _instance;

  final TRes Function(Query$Page) _then;

  static const _undefined = {};

  TRes call({
    Object? page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page(
        page: page == _undefined || page == null
            ? _instance.page
            : (page as Query$Page$page),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Page$page<TRes> get page {
    final local$page = _instance.page;
    return CopyWith$Query$Page$page(local$page, (e) => call(page: e));
  }
}

class _CopyWithStubImpl$Query$Page<TRes> implements CopyWith$Query$Page<TRes> {
  _CopyWithStubImpl$Query$Page(this._res);

  TRes _res;

  call({
    Query$Page$page? page,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Page$page<TRes> get page =>
      CopyWith$Query$Page$page.stub(_res);
}

const documentNodeQueryPage = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Page'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'code')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'page'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'code'),
            value: VariableNode(name: NameNode(value: 'code')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sections'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '30'),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'Section'),
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
  fragmentDefinitionSection,
  fragmentDefinitionItemSection,
  fragmentDefinitionItemSectionItem,
  fragmentDefinitionGridSectionItem,
]);
Query$Page _parserFn$Query$Page(Map<String, dynamic> data) =>
    Query$Page.fromJson(data);

class Options$Query$Page extends graphql.QueryOptions<Query$Page> {
  Options$Query$Page({
    String? operationName,
    required Variables$Query$Page variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryPage,
          parserFn: _parserFn$Query$Page,
        );
}

class WatchOptions$Query$Page extends graphql.WatchQueryOptions<Query$Page> {
  WatchOptions$Query$Page({
    String? operationName,
    required Variables$Query$Page variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
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
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryPage,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Page,
        );
}

class FetchMoreOptions$Query$Page extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Page({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Page variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryPage,
        );
}

extension ClientExtension$Query$Page on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Page>> query$Page(
          Options$Query$Page options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$Page> watchQuery$Page(
          WatchOptions$Query$Page options) =>
      this.watchQuery(options);
  void writeQuery$Page({
    required Query$Page data,
    required Variables$Query$Page variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryPage),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Page? readQuery$Page({
    required Variables$Query$Page variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryPage),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Page.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Page> useQuery$Page(
        Options$Query$Page options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$Page> useWatchQuery$Page(
        WatchOptions$Query$Page options) =>
    graphql_flutter.useWatchQuery(options);

class Query$Page$Widget extends graphql_flutter.Query<Query$Page> {
  Query$Page$Widget({
    widgets.Key? key,
    required Options$Query$Page options,
    required graphql_flutter.QueryBuilder<Query$Page> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$Page$page {
  Query$Page$page({
    required this.title,
    required this.sections,
    required this.$__typename,
  });

  factory Query$Page$page.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$sections = json['sections'];
    final l$$__typename = json['__typename'];
    return Query$Page$page(
      title: (l$title as String),
      sections: Query$Page$page$sections.fromJson(
          (l$sections as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final Query$Page$page$sections sections;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$sections = sections;
    _resultData['sections'] = l$sections.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$sections = sections;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$sections,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$sections = sections;
    final lOther$sections = other.sections;
    if (l$sections != lOther$sections) {
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

extension UtilityExtension$Query$Page$page on Query$Page$page {
  CopyWith$Query$Page$page<Query$Page$page> get copyWith =>
      CopyWith$Query$Page$page(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Page$page<TRes> {
  factory CopyWith$Query$Page$page(
    Query$Page$page instance,
    TRes Function(Query$Page$page) then,
  ) = _CopyWithImpl$Query$Page$page;

  factory CopyWith$Query$Page$page.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page;

  TRes call({
    String? title,
    Query$Page$page$sections? sections,
    String? $__typename,
  });
  CopyWith$Query$Page$page$sections<TRes> get sections;
}

class _CopyWithImpl$Query$Page$page<TRes>
    implements CopyWith$Query$Page$page<TRes> {
  _CopyWithImpl$Query$Page$page(
    this._instance,
    this._then,
  );

  final Query$Page$page _instance;

  final TRes Function(Query$Page$page) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? sections = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        sections: sections == _undefined || sections == null
            ? _instance.sections
            : (sections as Query$Page$page$sections),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Page$page$sections<TRes> get sections {
    final local$sections = _instance.sections;
    return CopyWith$Query$Page$page$sections(
        local$sections, (e) => call(sections: e));
  }
}

class _CopyWithStubImpl$Query$Page$page<TRes>
    implements CopyWith$Query$Page$page<TRes> {
  _CopyWithStubImpl$Query$Page$page(this._res);

  TRes _res;

  call({
    String? title,
    Query$Page$page$sections? sections,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Page$page$sections<TRes> get sections =>
      CopyWith$Query$Page$page$sections.stub(_res);
}

class Query$Page$page$sections {
  Query$Page$page$sections({
    required this.items,
    required this.$__typename,
  });

  factory Query$Page$page$sections.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section> items;

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
    if (!(other is Query$Page$page$sections) ||
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

extension UtilityExtension$Query$Page$page$sections
    on Query$Page$page$sections {
  CopyWith$Query$Page$page$sections<Query$Page$page$sections> get copyWith =>
      CopyWith$Query$Page$page$sections(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Page$page$sections<TRes> {
  factory CopyWith$Query$Page$page$sections(
    Query$Page$page$sections instance,
    TRes Function(Query$Page$page$sections) then,
  ) = _CopyWithImpl$Query$Page$page$sections;

  factory CopyWith$Query$Page$page$sections.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections;

  TRes call({
    List<Fragment$Section>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section> Function(
              Iterable<CopyWith$Fragment$Section<Fragment$Section>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections<TRes>
    implements CopyWith$Query$Page$page$sections<TRes> {
  _CopyWithImpl$Query$Page$page$sections(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections _instance;

  final TRes Function(Query$Page$page$sections) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page$sections(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section> Function(
                  Iterable<CopyWith$Fragment$Section<Fragment$Section>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$Section(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$Page$page$sections<TRes>
    implements CopyWith$Query$Page$page$sections<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections(this._res);

  TRes _res;

  call({
    List<Fragment$Section>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}
