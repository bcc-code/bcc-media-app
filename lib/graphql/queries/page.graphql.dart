import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$ItemSection {
  Fragment$ItemSection(
      {required this.title, required this.items, required this.$__typename});

  factory Fragment$ItemSection.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSection(
        title: (l$title as String),
        items: Fragment$ItemSection$items.fromJson(
            (l$items as Map<String, dynamic>)),
        $__typename: (l$$__typename as String));
  }

  final String title;

  final Fragment$ItemSection$items items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([l$title, l$items, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSection) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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
      CopyWith$Fragment$ItemSection(this, (i) => i);
}

abstract class CopyWith$Fragment$ItemSection<TRes> {
  factory CopyWith$Fragment$ItemSection(Fragment$ItemSection instance,
          TRes Function(Fragment$ItemSection) then) =
      _CopyWithImpl$Fragment$ItemSection;

  factory CopyWith$Fragment$ItemSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSection;

  TRes call(
      {String? title, Fragment$ItemSection$items? items, String? $__typename});
  CopyWith$Fragment$ItemSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$ItemSection<TRes>
    implements CopyWith$Fragment$ItemSection<TRes> {
  _CopyWithImpl$Fragment$ItemSection(this._instance, this._then);

  final Fragment$ItemSection _instance;

  final TRes Function(Fragment$ItemSection) _then;

  static const _undefined = {};

  TRes call(
          {Object? title = _undefined,
          Object? items = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$ItemSection(
          title: title == _undefined || title == null
              ? _instance.title
              : (title as String),
          items: items == _undefined || items == null
              ? _instance.items
              : (items as Fragment$ItemSection$items),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
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

  call(
          {String? title,
          Fragment$ItemSection$items? items,
          String? $__typename}) =>
      _res;
  CopyWith$Fragment$ItemSection$items<TRes> get items =>
      CopyWith$Fragment$ItemSection$items.stub(_res);
}

const fragmentDefinitionItemSection = FragmentDefinitionNode(
    name: NameNode(value: 'ItemSection'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'ItemSection'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'title'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
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
                      name: NameNode(value: 'ItemSectionItem'), directives: []),
                  FieldNode(
                      name: NameNode(value: '__typename'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ])),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const documentNodeFragmentItemSection = DocumentNode(definitions: [
  fragmentDefinitionItemSection,
  fragmentDefinitionItemSectionItem,
]);

extension ClientExtension$Fragment$ItemSection on graphql.GraphQLClient {
  void writeFragment$ItemSection(
          {required Fragment$ItemSection data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'ItemSection',
                  document: documentNodeFragmentItemSection)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$ItemSection? readFragment$ItemSection(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'ItemSection',
                document: documentNodeFragmentItemSection)),
        optimistic: optimistic);
    return result == null ? null : Fragment$ItemSection.fromJson(result);
  }
}

class Fragment$ItemSection$items {
  Fragment$ItemSection$items({required this.items, required this.$__typename});

  factory Fragment$ItemSection$items.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSection$items(
        items: (l$items as List<dynamic>)
            .map((e) =>
                Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
            .toList(),
        $__typename: (l$$__typename as String));
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
    return Object.hashAll(
        [Object.hashAll(l$items.map((v) => v)), l$$__typename]);
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
      get copyWith => CopyWith$Fragment$ItemSection$items(this, (i) => i);
}

abstract class CopyWith$Fragment$ItemSection$items<TRes> {
  factory CopyWith$Fragment$ItemSection$items(
          Fragment$ItemSection$items instance,
          TRes Function(Fragment$ItemSection$items) then) =
      _CopyWithImpl$Fragment$ItemSection$items;

  factory CopyWith$Fragment$ItemSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSection$items;

  TRes call({List<Fragment$ItemSectionItem>? items, String? $__typename});
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Fragment$ItemSection$items<TRes>
    implements CopyWith$Fragment$ItemSection$items<TRes> {
  _CopyWithImpl$Fragment$ItemSection$items(this._instance, this._then);

  final Fragment$ItemSection$items _instance;

  final TRes Function(Fragment$ItemSection$items) _then;

  static const _undefined = {};

  TRes call({Object? items = _undefined, Object? $__typename = _undefined}) =>
      _then(Fragment$ItemSection$items(
          items: items == _undefined || items == null
              ? _instance.items
              : (items as List<Fragment$ItemSectionItem>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes items(
          Iterable<Fragment$ItemSectionItem> Function(
                  Iterable<
                      CopyWith$Fragment$ItemSectionItem<
                          Fragment$ItemSectionItem>>)
              _fn) =>
      call(
          items: _fn(_instance.items
                  .map((e) => CopyWith$Fragment$ItemSectionItem(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Fragment$ItemSection$items<TRes>
    implements CopyWith$Fragment$ItemSection$items<TRes> {
  _CopyWithStubImpl$Fragment$ItemSection$items(this._res);

  TRes _res;

  call({List<Fragment$ItemSectionItem>? items, String? $__typename}) => _res;
  items(_fn) => _res;
}

class Fragment$ItemSectionItem {
  Fragment$ItemSectionItem(
      {required this.id,
      required this.sort,
      required this.title,
      required this.$__typename});

  factory Fragment$ItemSectionItem.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "EpisodeItem":
        return Fragment$ItemSectionItem$$EpisodeItem.fromJson(json);

      case "ShowItem":
        return Fragment$ItemSectionItem$$ShowItem.fromJson(json);

      default:
        final l$id = json['id'];
        final l$sort = json['sort'];
        final l$title = json['title'];
        final l$$__typename = json['__typename'];
        return Fragment$ItemSectionItem(
            id: (l$id as String),
            sort: (l$sort as int),
            title: (l$title as String),
            $__typename: (l$$__typename as String));
    }
  }

  final String id;

  final int sort;

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$sort = sort;
    _resultData['sort'] = l$sort;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$sort = sort;
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$sort, l$title, l$$__typename]);
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
    final l$sort = sort;
    final lOther$sort = other.sort;
    if (l$sort != lOther$sort) {
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

extension UtilityExtension$Fragment$ItemSectionItem
    on Fragment$ItemSectionItem {
  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem> get copyWith =>
      CopyWith$Fragment$ItemSectionItem(this, (i) => i);
}

abstract class CopyWith$Fragment$ItemSectionItem<TRes> {
  factory CopyWith$Fragment$ItemSectionItem(Fragment$ItemSectionItem instance,
          TRes Function(Fragment$ItemSectionItem) then) =
      _CopyWithImpl$Fragment$ItemSectionItem;

  factory CopyWith$Fragment$ItemSectionItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem;

  TRes call({String? id, int? sort, String? title, String? $__typename});
}

class _CopyWithImpl$Fragment$ItemSectionItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem(this._instance, this._then);

  final Fragment$ItemSectionItem _instance;

  final TRes Function(Fragment$ItemSectionItem) _then;

  static const _undefined = {};

  TRes call(
          {Object? id = _undefined,
          Object? sort = _undefined,
          Object? title = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$ItemSectionItem(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          sort: sort == _undefined || sort == null
              ? _instance.sort
              : (sort as int),
          title: title == _undefined || title == null
              ? _instance.title
              : (title as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem(this._res);

  TRes _res;

  call({String? id, int? sort, String? title, String? $__typename}) => _res;
}

const fragmentDefinitionItemSectionItem = FragmentDefinitionNode(
    name: NameNode(value: 'ItemSectionItem'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'Item'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'sort'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'title'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
                  name: NameNode(value: 'EpisodeItem'), isNonNull: false)),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'episode'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                      name: NameNode(value: 'number'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  FieldNode(
                      name: NameNode(value: '__typename'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ])),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
                  name: NameNode(value: 'ShowItem'), isNonNull: false)),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'show'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                      name: NameNode(value: 'episodeCount'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  FieldNode(
                      name: NameNode(value: '__typename'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ])),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const documentNodeFragmentItemSectionItem = DocumentNode(definitions: [
  fragmentDefinitionItemSectionItem,
]);

extension ClientExtension$Fragment$ItemSectionItem on graphql.GraphQLClient {
  void writeFragment$ItemSectionItem(
          {required Fragment$ItemSectionItem data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'ItemSectionItem',
                  document: documentNodeFragmentItemSectionItem)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$ItemSectionItem? readFragment$ItemSectionItem(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'ItemSectionItem',
                document: documentNodeFragmentItemSectionItem)),
        optimistic: optimistic);
    return result == null ? null : Fragment$ItemSectionItem.fromJson(result);
  }
}

class Fragment$ItemSectionItem$$EpisodeItem
    implements Fragment$ItemSectionItem {
  Fragment$ItemSectionItem$$EpisodeItem(
      {required this.id,
      required this.sort,
      required this.title,
      required this.$__typename,
      required this.episode});

  factory Fragment$ItemSectionItem$$EpisodeItem.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$sort = json['sort'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$episode = json['episode'];
    return Fragment$ItemSectionItem$$EpisodeItem(
        id: (l$id as String),
        sort: (l$sort as int),
        title: (l$title as String),
        $__typename: (l$$__typename as String),
        episode: Fragment$ItemSectionItem$$EpisodeItem$episode.fromJson(
            (l$episode as Map<String, dynamic>)));
  }

  final String id;

  final int sort;

  final String title;

  final String $__typename;

  final Fragment$ItemSectionItem$$EpisodeItem$episode episode;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episode = episode;
    _resultData['episode'] = l$episode.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$sort = sort;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$episode = episode;
    return Object.hashAll([l$id, l$sort, l$title, l$$__typename, l$episode]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$$EpisodeItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$sort = sort;
    final lOther$sort = other.sort;
    if (l$sort != lOther$sort) {
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
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ItemSectionItem$$EpisodeItem
    on Fragment$ItemSectionItem$$EpisodeItem {
  CopyWith$Fragment$ItemSectionItem$$EpisodeItem<
          Fragment$ItemSectionItem$$EpisodeItem>
      get copyWith =>
          CopyWith$Fragment$ItemSectionItem$$EpisodeItem(this, (i) => i);
}

abstract class CopyWith$Fragment$ItemSectionItem$$EpisodeItem<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$$EpisodeItem(
          Fragment$ItemSectionItem$$EpisodeItem instance,
          TRes Function(Fragment$ItemSectionItem$$EpisodeItem) then) =
      _CopyWithImpl$Fragment$ItemSectionItem$$EpisodeItem;

  factory CopyWith$Fragment$ItemSectionItem$$EpisodeItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$$EpisodeItem;

  TRes call(
      {String? id,
      int? sort,
      String? title,
      String? $__typename,
      Fragment$ItemSectionItem$$EpisodeItem$episode? episode});
  CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode<TRes> get episode;
}

class _CopyWithImpl$Fragment$ItemSectionItem$$EpisodeItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem$$EpisodeItem<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$$EpisodeItem(
      this._instance, this._then);

  final Fragment$ItemSectionItem$$EpisodeItem _instance;

  final TRes Function(Fragment$ItemSectionItem$$EpisodeItem) _then;

  static const _undefined = {};

  TRes call(
          {Object? id = _undefined,
          Object? sort = _undefined,
          Object? title = _undefined,
          Object? $__typename = _undefined,
          Object? episode = _undefined}) =>
      _then(Fragment$ItemSectionItem$$EpisodeItem(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          sort: sort == _undefined || sort == null
              ? _instance.sort
              : (sort as int),
          title: title == _undefined || title == null
              ? _instance.title
              : (title as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
          episode: episode == _undefined || episode == null
              ? _instance.episode
              : (episode as Fragment$ItemSectionItem$$EpisodeItem$episode)));
  CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$$EpisodeItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem$$EpisodeItem<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$$EpisodeItem(this._res);

  TRes _res;

  call(
          {String? id,
          int? sort,
          String? title,
          String? $__typename,
          Fragment$ItemSectionItem$$EpisodeItem$episode? episode}) =>
      _res;
  CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode<TRes> get episode =>
      CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode.stub(_res);
}

class Fragment$ItemSectionItem$$EpisodeItem$episode {
  Fragment$ItemSectionItem$$EpisodeItem$episode(
      {this.number, required this.$__typename});

  factory Fragment$ItemSectionItem$$EpisodeItem$episode.fromJson(
      Map<String, dynamic> json) {
    final l$number = json['number'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSectionItem$$EpisodeItem$episode(
        number: (l$number as int?), $__typename: (l$$__typename as String));
  }

  final int? number;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$number = number;
    final l$$__typename = $__typename;
    return Object.hashAll([l$number, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$$EpisodeItem$episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
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

extension UtilityExtension$Fragment$ItemSectionItem$$EpisodeItem$episode
    on Fragment$ItemSectionItem$$EpisodeItem$episode {
  CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode<
          Fragment$ItemSectionItem$$EpisodeItem$episode>
      get copyWith => CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode(
          this, (i) => i);
}

abstract class CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode(
          Fragment$ItemSectionItem$$EpisodeItem$episode instance,
          TRes Function(Fragment$ItemSectionItem$$EpisodeItem$episode) then) =
      _CopyWithImpl$Fragment$ItemSectionItem$$EpisodeItem$episode;

  factory CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$$EpisodeItem$episode;

  TRes call({int? number, String? $__typename});
}

class _CopyWithImpl$Fragment$ItemSectionItem$$EpisodeItem$episode<TRes>
    implements CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$$EpisodeItem$episode(
      this._instance, this._then);

  final Fragment$ItemSectionItem$$EpisodeItem$episode _instance;

  final TRes Function(Fragment$ItemSectionItem$$EpisodeItem$episode) _then;

  static const _undefined = {};

  TRes call({Object? number = _undefined, Object? $__typename = _undefined}) =>
      _then(Fragment$ItemSectionItem$$EpisodeItem$episode(
          number: number == _undefined ? _instance.number : (number as int?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$$EpisodeItem$episode<TRes>
    implements CopyWith$Fragment$ItemSectionItem$$EpisodeItem$episode<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$$EpisodeItem$episode(this._res);

  TRes _res;

  call({int? number, String? $__typename}) => _res;
}

class Fragment$ItemSectionItem$$ShowItem implements Fragment$ItemSectionItem {
  Fragment$ItemSectionItem$$ShowItem(
      {required this.id,
      required this.sort,
      required this.title,
      required this.$__typename,
      required this.$show});

  factory Fragment$ItemSectionItem$$ShowItem.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$sort = json['sort'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$$show = json['show'];
    return Fragment$ItemSectionItem$$ShowItem(
        id: (l$id as String),
        sort: (l$sort as int),
        title: (l$title as String),
        $__typename: (l$$__typename as String),
        $show: Fragment$ItemSectionItem$$ShowItem$show.fromJson(
            (l$$show as Map<String, dynamic>)));
  }

  final String id;

  final int sort;

  final String title;

  final String $__typename;

  final Fragment$ItemSectionItem$$ShowItem$show $show;

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
    final l$id = id;
    final l$sort = sort;
    final l$title = title;
    final l$$__typename = $__typename;
    final l$$show = $show;
    return Object.hashAll([l$id, l$sort, l$title, l$$__typename, l$$show]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$$ShowItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$sort = sort;
    final lOther$sort = other.sort;
    if (l$sort != lOther$sort) {
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
    final l$$show = $show;
    final lOther$$show = other.$show;
    if (l$$show != lOther$$show) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ItemSectionItem$$ShowItem
    on Fragment$ItemSectionItem$$ShowItem {
  CopyWith$Fragment$ItemSectionItem$$ShowItem<
          Fragment$ItemSectionItem$$ShowItem>
      get copyWith =>
          CopyWith$Fragment$ItemSectionItem$$ShowItem(this, (i) => i);
}

abstract class CopyWith$Fragment$ItemSectionItem$$ShowItem<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$$ShowItem(
          Fragment$ItemSectionItem$$ShowItem instance,
          TRes Function(Fragment$ItemSectionItem$$ShowItem) then) =
      _CopyWithImpl$Fragment$ItemSectionItem$$ShowItem;

  factory CopyWith$Fragment$ItemSectionItem$$ShowItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$$ShowItem;

  TRes call(
      {String? id,
      int? sort,
      String? title,
      String? $__typename,
      Fragment$ItemSectionItem$$ShowItem$show? $show});
  CopyWith$Fragment$ItemSectionItem$$ShowItem$show<TRes> get $show;
}

class _CopyWithImpl$Fragment$ItemSectionItem$$ShowItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem$$ShowItem<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$$ShowItem(this._instance, this._then);

  final Fragment$ItemSectionItem$$ShowItem _instance;

  final TRes Function(Fragment$ItemSectionItem$$ShowItem) _then;

  static const _undefined = {};

  TRes call(
          {Object? id = _undefined,
          Object? sort = _undefined,
          Object? title = _undefined,
          Object? $__typename = _undefined,
          Object? $show = _undefined}) =>
      _then(Fragment$ItemSectionItem$$ShowItem(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          sort: sort == _undefined || sort == null
              ? _instance.sort
              : (sort as int),
          title: title == _undefined || title == null
              ? _instance.title
              : (title as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
          $show: $show == _undefined || $show == null
              ? _instance.$show
              : ($show as Fragment$ItemSectionItem$$ShowItem$show)));
  CopyWith$Fragment$ItemSectionItem$$ShowItem$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$ItemSectionItem$$ShowItem$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$$ShowItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem$$ShowItem<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$$ShowItem(this._res);

  TRes _res;

  call(
          {String? id,
          int? sort,
          String? title,
          String? $__typename,
          Fragment$ItemSectionItem$$ShowItem$show? $show}) =>
      _res;
  CopyWith$Fragment$ItemSectionItem$$ShowItem$show<TRes> get $show =>
      CopyWith$Fragment$ItemSectionItem$$ShowItem$show.stub(_res);
}

class Fragment$ItemSectionItem$$ShowItem$show {
  Fragment$ItemSectionItem$$ShowItem$show(
      {required this.episodeCount, required this.$__typename});

  factory Fragment$ItemSectionItem$$ShowItem$show.fromJson(
      Map<String, dynamic> json) {
    final l$episodeCount = json['episodeCount'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSectionItem$$ShowItem$show(
        episodeCount: (l$episodeCount as int),
        $__typename: (l$$__typename as String));
  }

  final int episodeCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$episodeCount = episodeCount;
    final l$$__typename = $__typename;
    return Object.hashAll([l$episodeCount, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$$ShowItem$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
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

extension UtilityExtension$Fragment$ItemSectionItem$$ShowItem$show
    on Fragment$ItemSectionItem$$ShowItem$show {
  CopyWith$Fragment$ItemSectionItem$$ShowItem$show<
          Fragment$ItemSectionItem$$ShowItem$show>
      get copyWith =>
          CopyWith$Fragment$ItemSectionItem$$ShowItem$show(this, (i) => i);
}

abstract class CopyWith$Fragment$ItemSectionItem$$ShowItem$show<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$$ShowItem$show(
          Fragment$ItemSectionItem$$ShowItem$show instance,
          TRes Function(Fragment$ItemSectionItem$$ShowItem$show) then) =
      _CopyWithImpl$Fragment$ItemSectionItem$$ShowItem$show;

  factory CopyWith$Fragment$ItemSectionItem$$ShowItem$show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$$ShowItem$show;

  TRes call({int? episodeCount, String? $__typename});
}

class _CopyWithImpl$Fragment$ItemSectionItem$$ShowItem$show<TRes>
    implements CopyWith$Fragment$ItemSectionItem$$ShowItem$show<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$$ShowItem$show(
      this._instance, this._then);

  final Fragment$ItemSectionItem$$ShowItem$show _instance;

  final TRes Function(Fragment$ItemSectionItem$$ShowItem$show) _then;

  static const _undefined = {};

  TRes call(
          {Object? episodeCount = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$ItemSectionItem$$ShowItem$show(
          episodeCount: episodeCount == _undefined || episodeCount == null
              ? _instance.episodeCount
              : (episodeCount as int),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$$ShowItem$show<TRes>
    implements CopyWith$Fragment$ItemSectionItem$$ShowItem$show<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$$ShowItem$show(this._res);

  TRes _res;

  call({int? episodeCount, String? $__typename}) => _res;
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
      CopyWith$Variables$Query$Page(this, (i) => i);
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
  factory CopyWith$Variables$Query$Page(Variables$Query$Page instance,
          TRes Function(Variables$Query$Page) then) =
      _CopyWithImpl$Variables$Query$Page;

  factory CopyWith$Variables$Query$Page.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Page;

  TRes call({String? code});
}

class _CopyWithImpl$Variables$Query$Page<TRes>
    implements CopyWith$Variables$Query$Page<TRes> {
  _CopyWithImpl$Variables$Query$Page(this._instance, this._then);

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
  Query$Page({this.page, required this.$__typename});

  factory Query$Page.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$$__typename = json['__typename'];
    return Query$Page(
        page: l$page == null
            ? null
            : Query$Page$page.fromJson((l$page as Map<String, dynamic>)),
        $__typename: (l$$__typename as String));
  }

  final Query$Page$page? page;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$$__typename = $__typename;
    return Object.hashAll([l$page, l$$__typename]);
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
  CopyWith$Query$Page<Query$Page> get copyWith =>
      CopyWith$Query$Page(this, (i) => i);
}

abstract class CopyWith$Query$Page<TRes> {
  factory CopyWith$Query$Page(
          Query$Page instance, TRes Function(Query$Page) then) =
      _CopyWithImpl$Query$Page;

  factory CopyWith$Query$Page.stub(TRes res) = _CopyWithStubImpl$Query$Page;

  TRes call({Query$Page$page? page, String? $__typename});
  CopyWith$Query$Page$page<TRes> get page;
}

class _CopyWithImpl$Query$Page<TRes> implements CopyWith$Query$Page<TRes> {
  _CopyWithImpl$Query$Page(this._instance, this._then);

  final Query$Page _instance;

  final TRes Function(Query$Page) _then;

  static const _undefined = {};

  TRes call({Object? page = _undefined, Object? $__typename = _undefined}) =>
      _then(Query$Page(
          page:
              page == _undefined ? _instance.page : (page as Query$Page$page?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  CopyWith$Query$Page$page<TRes> get page {
    final local$page = _instance.page;
    return local$page == null
        ? CopyWith$Query$Page$page.stub(_then(_instance))
        : CopyWith$Query$Page$page(local$page, (e) => call(page: e));
  }
}

class _CopyWithStubImpl$Query$Page<TRes> implements CopyWith$Query$Page<TRes> {
  _CopyWithStubImpl$Query$Page(this._res);

  TRes _res;

  call({Query$Page$page? page, String? $__typename}) => _res;
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
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'page'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'code'),
                  value: VariableNode(name: NameNode(value: 'code')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'sections'),
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
                              name: NameNode(value: 'ItemSection'),
                              directives: []),
                          FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ])),
                    FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  fragmentDefinitionItemSection,
  fragmentDefinitionItemSectionItem,
]);
Query$Page _parserFn$Query$Page(Map<String, dynamic> data) =>
    Query$Page.fromJson(data);

class Options$Query$Page extends graphql.QueryOptions<Query$Page> {
  Options$Query$Page(
      {String? operationName,
      required Variables$Query$Page variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: documentNodeQueryPage,
            parserFn: _parserFn$Query$Page);
}

class WatchOptions$Query$Page extends graphql.WatchQueryOptions<Query$Page> {
  WatchOptions$Query$Page(
      {String? operationName,
      required Variables$Query$Page variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
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
            parserFn: _parserFn$Query$Page);
}

class FetchMoreOptions$Query$Page extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Page(
      {required graphql.UpdateQuery updateQuery,
      required Variables$Query$Page variables})
      : super(
            updateQuery: updateQuery,
            variables: variables.toJson(),
            document: documentNodeQueryPage);
}

extension ClientExtension$Query$Page on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Page>> query$Page(
          Options$Query$Page options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$Page> watchQuery$Page(
          WatchOptions$Query$Page options) =>
      this.watchQuery(options);
  void writeQuery$Page(
          {required Query$Page data,
          required Variables$Query$Page variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: documentNodeQueryPage),
              variables: variables.toJson()),
          data: data.toJson(),
          broadcast: broadcast);
  Query$Page? readQuery$Page(
      {required Variables$Query$Page variables, bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryPage),
            variables: variables.toJson()),
        optimistic: optimistic);
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
  Query$Page$Widget(
      {widgets.Key? key,
      required Options$Query$Page options,
      required graphql_flutter.QueryBuilder<Query$Page> builder})
      : super(key: key, options: options, builder: builder);
}

class Query$Page$page {
  Query$Page$page({required this.sections, required this.$__typename});

  factory Query$Page$page.fromJson(Map<String, dynamic> json) {
    final l$sections = json['sections'];
    final l$$__typename = json['__typename'];
    return Query$Page$page(
        sections: Query$Page$page$sections.fromJson(
            (l$sections as Map<String, dynamic>)),
        $__typename: (l$$__typename as String));
  }

  final Query$Page$page$sections sections;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sections = sections;
    _resultData['sections'] = l$sections.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sections = sections;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sections, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page) || runtimeType != other.runtimeType) {
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
      CopyWith$Query$Page$page(this, (i) => i);
}

abstract class CopyWith$Query$Page$page<TRes> {
  factory CopyWith$Query$Page$page(
          Query$Page$page instance, TRes Function(Query$Page$page) then) =
      _CopyWithImpl$Query$Page$page;

  factory CopyWith$Query$Page$page.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page;

  TRes call({Query$Page$page$sections? sections, String? $__typename});
  CopyWith$Query$Page$page$sections<TRes> get sections;
}

class _CopyWithImpl$Query$Page$page<TRes>
    implements CopyWith$Query$Page$page<TRes> {
  _CopyWithImpl$Query$Page$page(this._instance, this._then);

  final Query$Page$page _instance;

  final TRes Function(Query$Page$page) _then;

  static const _undefined = {};

  TRes call(
          {Object? sections = _undefined, Object? $__typename = _undefined}) =>
      _then(Query$Page$page(
          sections: sections == _undefined || sections == null
              ? _instance.sections
              : (sections as Query$Page$page$sections),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
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

  call({Query$Page$page$sections? sections, String? $__typename}) => _res;
  CopyWith$Query$Page$page$sections<TRes> get sections =>
      CopyWith$Query$Page$page$sections.stub(_res);
}

class Query$Page$page$sections {
  Query$Page$page$sections({required this.items, required this.$__typename});

  factory Query$Page$page$sections.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections(
        items: (l$items as List<dynamic>)
            .map((e) => Query$Page$page$sections$items.fromJson(
                (e as Map<String, dynamic>)))
            .toList(),
        $__typename: (l$$__typename as String));
  }

  final List<Query$Page$page$sections$items> items;

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
    return Object.hashAll(
        [Object.hashAll(l$items.map((v) => v)), l$$__typename]);
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
      CopyWith$Query$Page$page$sections(this, (i) => i);
}

abstract class CopyWith$Query$Page$page$sections<TRes> {
  factory CopyWith$Query$Page$page$sections(Query$Page$page$sections instance,
          TRes Function(Query$Page$page$sections) then) =
      _CopyWithImpl$Query$Page$page$sections;

  factory CopyWith$Query$Page$page$sections.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections;

  TRes call({List<Query$Page$page$sections$items>? items, String? $__typename});
  TRes items(
      Iterable<Query$Page$page$sections$items> Function(
              Iterable<
                  CopyWith$Query$Page$page$sections$items<
                      Query$Page$page$sections$items>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections<TRes>
    implements CopyWith$Query$Page$page$sections<TRes> {
  _CopyWithImpl$Query$Page$page$sections(this._instance, this._then);

  final Query$Page$page$sections _instance;

  final TRes Function(Query$Page$page$sections) _then;

  static const _undefined = {};

  TRes call({Object? items = _undefined, Object? $__typename = _undefined}) =>
      _then(Query$Page$page$sections(
          items: items == _undefined || items == null
              ? _instance.items
              : (items as List<Query$Page$page$sections$items>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes items(
          Iterable<Query$Page$page$sections$items> Function(
                  Iterable<
                      CopyWith$Query$Page$page$sections$items<
                          Query$Page$page$sections$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
                  (e) => CopyWith$Query$Page$page$sections$items(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Query$Page$page$sections<TRes>
    implements CopyWith$Query$Page$page$sections<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections(this._res);

  TRes _res;

  call({List<Query$Page$page$sections$items>? items, String? $__typename}) =>
      _res;
  items(_fn) => _res;
}

class Query$Page$page$sections$items {
  Query$Page$page$sections$items({required this.$__typename});

  factory Query$Page$page$sections$items.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ItemSection":
        return Query$Page$page$sections$items$$ItemSection.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$Page$page$sections$items(
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
    if (!(other is Query$Page$page$sections$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items
    on Query$Page$page$sections$items {
  CopyWith$Query$Page$page$sections$items<Query$Page$page$sections$items>
      get copyWith => CopyWith$Query$Page$page$sections$items(this, (i) => i);
}

abstract class CopyWith$Query$Page$page$sections$items<TRes> {
  factory CopyWith$Query$Page$page$sections$items(
          Query$Page$page$sections$items instance,
          TRes Function(Query$Page$page$sections$items) then) =
      _CopyWithImpl$Query$Page$page$sections$items;

  factory CopyWith$Query$Page$page$sections$items.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$Page$page$sections$items<TRes>
    implements CopyWith$Query$Page$page$sections$items<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items(this._instance, this._then);

  final Query$Page$page$sections$items _instance;

  final TRes Function(Query$Page$page$sections$items) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$Page$page$sections$items(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$Page$page$sections$items<TRes>
    implements CopyWith$Query$Page$page$sections$items<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$Page$page$sections$items$$ItemSection
    implements Fragment$ItemSection, Query$Page$page$sections$items {
  Query$Page$page$sections$items$$ItemSection(
      {required this.$__typename, required this.title, required this.items});

  factory Query$Page$page$sections$items$$ItemSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$title = json['title'];
    final l$items = json['items'];
    return Query$Page$page$sections$items$$ItemSection(
        $__typename: (l$$__typename as String),
        title: (l$title as String),
        items: Query$Page$page$sections$items$$ItemSection$items.fromJson(
            (l$items as Map<String, dynamic>)));
  }

  final String $__typename;

  final String title;

  final Query$Page$page$sections$items$$ItemSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$title = title;
    final l$items = items;
    return Object.hashAll([l$$__typename, l$title, l$items]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page$sections$items$$ItemSection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$Page$page$sections$items$$ItemSection
    on Query$Page$page$sections$items$$ItemSection {
  CopyWith$Query$Page$page$sections$items$$ItemSection<
          Query$Page$page$sections$items$$ItemSection>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$ItemSection(this, (i) => i);
}

abstract class CopyWith$Query$Page$page$sections$items$$ItemSection<TRes> {
  factory CopyWith$Query$Page$page$sections$items$$ItemSection(
          Query$Page$page$sections$items$$ItemSection instance,
          TRes Function(Query$Page$page$sections$items$$ItemSection) then) =
      _CopyWithImpl$Query$Page$page$sections$items$$ItemSection;

  factory CopyWith$Query$Page$page$sections$items$$ItemSection.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$ItemSection;

  TRes call(
      {String? $__typename,
      String? title,
      Query$Page$page$sections$items$$ItemSection$items? items});
  CopyWith$Query$Page$page$sections$items$$ItemSection$items<TRes> get items;
}

class _CopyWithImpl$Query$Page$page$sections$items$$ItemSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$ItemSection<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$ItemSection(
      this._instance, this._then);

  final Query$Page$page$sections$items$$ItemSection _instance;

  final TRes Function(Query$Page$page$sections$items$$ItemSection) _then;

  static const _undefined = {};

  TRes call(
          {Object? $__typename = _undefined,
          Object? title = _undefined,
          Object? items = _undefined}) =>
      _then(Query$Page$page$sections$items$$ItemSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
          title: title == _undefined || title == null
              ? _instance.title
              : (title as String),
          items: items == _undefined || items == null
              ? _instance.items
              : (items as Query$Page$page$sections$items$$ItemSection$items)));
  CopyWith$Query$Page$page$sections$items$$ItemSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$Page$page$sections$items$$ItemSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$Page$page$sections$items$$ItemSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$ItemSection<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$ItemSection(this._res);

  TRes _res;

  call(
          {String? $__typename,
          String? title,
          Query$Page$page$sections$items$$ItemSection$items? items}) =>
      _res;
  CopyWith$Query$Page$page$sections$items$$ItemSection$items<TRes> get items =>
      CopyWith$Query$Page$page$sections$items$$ItemSection$items.stub(_res);
}

class Query$Page$page$sections$items$$ItemSection$items
    implements Fragment$ItemSection$items {
  Query$Page$page$sections$items$$ItemSection$items(
      {required this.items, required this.$__typename});

  factory Query$Page$page$sections$items$$ItemSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections$items$$ItemSection$items(
        items: (l$items as List<dynamic>)
            .map((e) =>
                Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
            .toList(),
        $__typename: (l$$__typename as String));
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
    return Object.hashAll(
        [Object.hashAll(l$items.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page$sections$items$$ItemSection$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items$$ItemSection$items
    on Query$Page$page$sections$items$$ItemSection$items {
  CopyWith$Query$Page$page$sections$items$$ItemSection$items<
          Query$Page$page$sections$items$$ItemSection$items>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$ItemSection$items(
              this, (i) => i);
}

abstract class CopyWith$Query$Page$page$sections$items$$ItemSection$items<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$ItemSection$items(
          Query$Page$page$sections$items$$ItemSection$items instance,
          TRes Function(Query$Page$page$sections$items$$ItemSection$items)
              then) =
      _CopyWithImpl$Query$Page$page$sections$items$$ItemSection$items;

  factory CopyWith$Query$Page$page$sections$items$$ItemSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$ItemSection$items;

  TRes call({List<Fragment$ItemSectionItem>? items, String? $__typename});
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections$items$$ItemSection$items<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$ItemSection$items<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$ItemSection$items(
      this._instance, this._then);

  final Query$Page$page$sections$items$$ItemSection$items _instance;

  final TRes Function(Query$Page$page$sections$items$$ItemSection$items) _then;

  static const _undefined = {};

  TRes call({Object? items = _undefined, Object? $__typename = _undefined}) =>
      _then(Query$Page$page$sections$items$$ItemSection$items(
          items: items == _undefined || items == null
              ? _instance.items
              : (items as List<Fragment$ItemSectionItem>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes items(
          Iterable<Fragment$ItemSectionItem> Function(
                  Iterable<
                      CopyWith$Fragment$ItemSectionItem<
                          Fragment$ItemSectionItem>>)
              _fn) =>
      call(
          items: _fn(_instance.items
                  .map((e) => CopyWith$Fragment$ItemSectionItem(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Query$Page$page$sections$items$$ItemSection$items<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$ItemSection$items<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$ItemSection$items(
      this._res);

  TRes _res;

  call({List<Fragment$ItemSectionItem>? items, String? $__typename}) => _res;
  items(_fn) => _res;
}
