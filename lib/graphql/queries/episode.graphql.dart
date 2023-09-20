import '../schema/episodes.graphql.dart';
import '../schema/schema.graphql.dart';
import '../schema/shows.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'page.graphql.dart';

class Fragment$EpisodeContext {
  Fragment$EpisodeContext({required this.$__typename});

  factory Fragment$EpisodeContext.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ContextCollection":
        return Fragment$EpisodeContext$$ContextCollection.fromJson(json);

      case "Season":
        return Fragment$EpisodeContext$$Season.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$EpisodeContext($__typename: (l$$__typename as String));
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
    if (!(other is Fragment$EpisodeContext) ||
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

extension UtilityExtension$Fragment$EpisodeContext on Fragment$EpisodeContext {
  CopyWith$Fragment$EpisodeContext<Fragment$EpisodeContext> get copyWith =>
      CopyWith$Fragment$EpisodeContext(
        this,
        (i) => i,
      );
  _T when<_T>({
    required _T Function(Fragment$EpisodeContext$$ContextCollection)
        contextCollection,
    required _T Function(Fragment$EpisodeContext$$Season) season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        return contextCollection(
            this as Fragment$EpisodeContext$$ContextCollection);

      case "Season":
        return season(this as Fragment$EpisodeContext$$Season);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$EpisodeContext$$ContextCollection)? contextCollection,
    _T Function(Fragment$EpisodeContext$$Season)? season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        if (contextCollection != null) {
          return contextCollection(
              this as Fragment$EpisodeContext$$ContextCollection);
        } else {
          return orElse();
        }

      case "Season":
        if (season != null) {
          return season(this as Fragment$EpisodeContext$$Season);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$EpisodeContext<TRes> {
  factory CopyWith$Fragment$EpisodeContext(
    Fragment$EpisodeContext instance,
    TRes Function(Fragment$EpisodeContext) then,
  ) = _CopyWithImpl$Fragment$EpisodeContext;

  factory CopyWith$Fragment$EpisodeContext.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$EpisodeContext<TRes>
    implements CopyWith$Fragment$EpisodeContext<TRes> {
  _CopyWithImpl$Fragment$EpisodeContext(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext _instance;

  final TRes Function(Fragment$EpisodeContext) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$EpisodeContext(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$EpisodeContext<TRes>
    implements CopyWith$Fragment$EpisodeContext<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

const fragmentDefinitionEpisodeContext = FragmentDefinitionNode(
  name: NameNode(value: 'EpisodeContext'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'EpisodeContextUnion'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'ContextCollection'),
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
                    FragmentSpreadNode(
                      name: NameNode(value: 'SeasonListEpisode'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'Season'),
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
          name: NameNode(value: 'number'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'episodes'),
          alias: null,
          arguments: [
            ArgumentNode(
              name: NameNode(value: 'first'),
              value: IntValueNode(value: '70'),
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
                  name: NameNode(value: 'SeasonListEpisode'),
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
          name: NameNode(value: 'show'),
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
              name: NameNode(value: 'title'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'type'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'seasons'),
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
const documentNodeFragmentEpisodeContext = DocumentNode(definitions: [
  fragmentDefinitionEpisodeContext,
  fragmentDefinitionSeasonListEpisode,
]);

extension ClientExtension$Fragment$EpisodeContext on graphql.GraphQLClient {
  void writeFragment$EpisodeContext({
    required Fragment$EpisodeContext data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'EpisodeContext',
            document: documentNodeFragmentEpisodeContext,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$EpisodeContext? readFragment$EpisodeContext({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'EpisodeContext',
          document: documentNodeFragmentEpisodeContext,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$EpisodeContext.fromJson(result);
  }
}

class Fragment$EpisodeContext$$ContextCollection
    implements Fragment$EpisodeContext {
  Fragment$EpisodeContext$$ContextCollection({
    required this.id,
    this.items,
    this.$__typename = 'ContextCollection',
  });

  factory Fragment$EpisodeContext$$ContextCollection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection(
      id: (l$id as String),
      items: l$items == null
          ? null
          : Fragment$EpisodeContext$$ContextCollection$items.fromJson(
              (l$items as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Fragment$EpisodeContext$$ContextCollection$items? items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$items = items;
    _resultData['items'] = l$items?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$items,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$EpisodeContext$$ContextCollection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection
    on Fragment$EpisodeContext$$ContextCollection {
  CopyWith$Fragment$EpisodeContext$$ContextCollection<
          Fragment$EpisodeContext$$ContextCollection>
      get copyWith => CopyWith$Fragment$EpisodeContext$$ContextCollection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection<TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection(
    Fragment$EpisodeContext$$ContextCollection instance,
    TRes Function(Fragment$EpisodeContext$$ContextCollection) then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection;

  TRes call({
    String? id,
    Fragment$EpisodeContext$$ContextCollection$items? items,
    String? $__typename,
  });
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection<TRes>
    implements CopyWith$Fragment$EpisodeContext$$ContextCollection<TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection _instance;

  final TRes Function(Fragment$EpisodeContext$$ContextCollection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeContext$$ContextCollection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        items: items == _undefined
            ? _instance.items
            : (items as Fragment$EpisodeContext$$ContextCollection$items?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items<TRes> get items {
    final local$items = _instance.items;
    return local$items == null
        ? CopyWith$Fragment$EpisodeContext$$ContextCollection$items.stub(
            _then(_instance))
        : CopyWith$Fragment$EpisodeContext$$ContextCollection$items(
            local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection<TRes>
    implements CopyWith$Fragment$EpisodeContext$$ContextCollection<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection(this._res);

  TRes _res;

  call({
    String? id,
    Fragment$EpisodeContext$$ContextCollection$items? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items<TRes> get items =>
      CopyWith$Fragment$EpisodeContext$$ContextCollection$items.stub(_res);
}

class Fragment$EpisodeContext$$ContextCollection$items {
  Fragment$EpisodeContext$$ContextCollection$items({
    required this.items,
    this.$__typename = 'SectionItemPagination',
  });

  factory Fragment$EpisodeContext$$ContextCollection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$EpisodeContext$$ContextCollection$items$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$EpisodeContext$$ContextCollection$items$items> items;

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
    if (!(other is Fragment$EpisodeContext$$ContextCollection$items) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items
    on Fragment$EpisodeContext$$ContextCollection$items {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items<
          Fragment$EpisodeContext$$ContextCollection$items>
      get copyWith => CopyWith$Fragment$EpisodeContext$$ContextCollection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items<TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items(
    Fragment$EpisodeContext$$ContextCollection$items instance,
    TRes Function(Fragment$EpisodeContext$$ContextCollection$items) then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items;

  TRes call({
    List<Fragment$EpisodeContext$$ContextCollection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$EpisodeContext$$ContextCollection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items<
                      Fragment$EpisodeContext$$ContextCollection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items<TRes>
    implements CopyWith$Fragment$EpisodeContext$$ContextCollection$items<TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items _instance;

  final TRes Function(Fragment$EpisodeContext$$ContextCollection$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeContext$$ContextCollection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Fragment$EpisodeContext$$ContextCollection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$EpisodeContext$$ContextCollection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items<
                          Fragment$EpisodeContext$$ContextCollection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items<TRes>
    implements CopyWith$Fragment$EpisodeContext$$ContextCollection$items<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items(this._res);

  TRes _res;

  call({
    List<Fragment$EpisodeContext$$ContextCollection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$EpisodeContext$$ContextCollection$items$items {
  Fragment$EpisodeContext$$ContextCollection$items$items({
    required this.item,
    this.$__typename = 'SectionItem',
  });

  factory Fragment$EpisodeContext$$ContextCollection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection$items$items(
      item:
          Fragment$EpisodeContext$$ContextCollection$items$items$item.fromJson(
              (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$EpisodeContext$$ContextCollection$items$items$item item;

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
    if (!(other is Fragment$EpisodeContext$$ContextCollection$items$items) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items$items
    on Fragment$EpisodeContext$$ContextCollection$items$items {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items<
          Fragment$EpisodeContext$$ContextCollection$items$items>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items(
    Fragment$EpisodeContext$$ContextCollection$items$items instance,
    TRes Function(Fragment$EpisodeContext$$ContextCollection$items$items) then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items;

  TRes call({
    Fragment$EpisodeContext$$ContextCollection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item<TRes>
      get item;
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items<TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items<TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items$items _instance;

  final TRes Function(Fragment$EpisodeContext$$ContextCollection$items$items)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeContext$$ContextCollection$items$items(
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Fragment$EpisodeContext$$ContextCollection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item<TRes>
      get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items(
      this._res);

  TRes _res;

  call({
    Fragment$EpisodeContext$$ContextCollection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item<TRes>
      get item =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item
              .stub(_res);
}

class Fragment$EpisodeContext$$ContextCollection$items$items$item {
  Fragment$EpisodeContext$$ContextCollection$items$items$item(
      {required this.$__typename});

  factory Fragment$EpisodeContext$$ContextCollection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Show":
        return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show
            .fromJson(json);

      case "Season":
        return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season
            .fromJson(json);

      case "Episode":
        return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode
            .fromJson(json);

      case "Page":
        return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page
            .fromJson(json);

      case "Link":
        return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link
            .fromJson(json);

      case "StudyTopic":
        return Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic
            .fromJson(json);

      case "Game":
        return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$EpisodeContext$$ContextCollection$items$items$item(
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
    if (!(other
            is Fragment$EpisodeContext$$ContextCollection$items$items$item) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items$items$item
    on Fragment$EpisodeContext$$ContextCollection$items$items$item {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item<
          Fragment$EpisodeContext$$ContextCollection$items$items$item>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show)
        show,
    required _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season)
        season,
    required _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode)
        episode,
    required _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page)
        page,
    required _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link)
        link,
    required _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic)
        studyTopic,
    required _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game)
        game,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Show":
        return show(this
            as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show);

      case "Season":
        return season(this
            as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season);

      case "Episode":
        return episode(this
            as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode);

      case "Page":
        return page(this
            as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page);

      case "Link":
        return link(this
            as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link);

      case "StudyTopic":
        return studyTopic(this
            as Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic);

      case "Game":
        return game(this
            as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show)?
        show,
    _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season)?
        season,
    _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode)?
        episode,
    _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page)?
        page,
    _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link)?
        link,
    _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic)?
        studyTopic,
    _T Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game)?
        game,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Show":
        if (show != null) {
          return show(this
              as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show);
        } else {
          return orElse();
        }

      case "Season":
        if (season != null) {
          return season(this
              as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season);
        } else {
          return orElse();
        }

      case "Episode":
        if (episode != null) {
          return episode(this
              as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode);
        } else {
          return orElse();
        }

      case "Page":
        if (page != null) {
          return page(this
              as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page);
        } else {
          return orElse();
        }

      case "Link":
        if (link != null) {
          return link(this
              as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link);
        } else {
          return orElse();
        }

      case "StudyTopic":
        if (studyTopic != null) {
          return studyTopic(this
              as Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic);
        } else {
          return orElse();
        }

      case "Game":
        if (game != null) {
          return game(this
              as Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item(
    Fragment$EpisodeContext$$ContextCollection$items$items$item instance,
    TRes Function(Fragment$EpisodeContext$$ContextCollection$items$items$item)
        then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item<
            TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items$items$item _instance;

  final TRes Function(
      Fragment$EpisodeContext$$ContextCollection$items$items$item) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$EpisodeContext$$ContextCollection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show
    implements Fragment$EpisodeContext$$ContextCollection$items$items$item {
  Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show(
      {this.$__typename = 'Show'});

  factory Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show(
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
    if (!(other
            is Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show
    on Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show<
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show(
    Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show instance,
    TRes Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show
      _instance;

  final TRes Function(
      Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season
    implements Fragment$EpisodeContext$$ContextCollection$items$items$item {
  Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season(
      {this.$__typename = 'Season'});

  factory Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season(
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
    if (!(other
            is Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season
    on Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season<
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season(
    Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season
        instance,
    TRes Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season)
        then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season<
            TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season
      _instance;

  final TRes Function(
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season<
            TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode
    implements
        Fragment$SeasonListEpisode,
        Fragment$EpisodeContext$$ContextCollection$items$items$item {
  Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode({
    required this.id,
    this.image,
    this.number,
    required this.title,
    required this.publishDate,
    required this.ageRating,
    required this.duration,
    required this.locked,
    required this.lessons,
    this.$__typename = 'Episode',
  });

  factory Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$number = json['number'];
    final l$title = json['title'];
    final l$publishDate = json['publishDate'];
    final l$ageRating = json['ageRating'];
    final l$duration = json['duration'];
    final l$locked = json['locked'];
    final l$lessons = json['lessons'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode(
      id: (l$id as String),
      image: (l$image as String?),
      number: (l$number as int?),
      title: (l$title as String),
      publishDate: (l$publishDate as String),
      ageRating: (l$ageRating as String),
      duration: (l$duration as int),
      locked: (l$locked as bool),
      lessons: Fragment$SeasonListEpisode$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? image;

  final int? number;

  final String title;

  final String publishDate;

  final String ageRating;

  final int duration;

  final bool locked;

  final Fragment$SeasonListEpisode$lessons lessons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$locked = locked;
    _resultData['locked'] = l$locked;
    final l$lessons = lessons;
    _resultData['lessons'] = l$lessons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$number = number;
    final l$title = title;
    final l$publishDate = publishDate;
    final l$ageRating = ageRating;
    final l$duration = duration;
    final l$locked = locked;
    final l$lessons = lessons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$number,
      l$title,
      l$publishDate,
      l$ageRating,
      l$duration,
      l$locked,
      l$lessons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
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
    final l$locked = locked;
    final lOther$locked = other.locked;
    if (l$locked != lOther$locked) {
      return false;
    }
    final l$lessons = lessons;
    final lOther$lessons = other.lessons;
    if (l$lessons != lOther$lessons) {
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode
    on Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode<
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode(
    Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode
        instance,
    TRes Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode;

  TRes call({
    String? id,
    String? image,
    int? number,
    String? title,
    String? publishDate,
    String? ageRating,
    int? duration,
    bool? locked,
    Fragment$SeasonListEpisode$lessons? lessons,
    String? $__typename,
  });
  CopyWith$Fragment$SeasonListEpisode$lessons<TRes> get lessons;
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? number = _undefined,
    Object? title = _undefined,
    Object? publishDate = _undefined,
    Object? ageRating = _undefined,
    Object? duration = _undefined,
    Object? locked = _undefined,
    Object? lessons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        number: number == _undefined ? _instance.number : (number as int?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        locked: locked == _undefined || locked == null
            ? _instance.locked
            : (locked as bool),
        lessons: lessons == _undefined || lessons == null
            ? _instance.lessons
            : (lessons as Fragment$SeasonListEpisode$lessons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$SeasonListEpisode$lessons<TRes> get lessons {
    final local$lessons = _instance.lessons;
    return CopyWith$Fragment$SeasonListEpisode$lessons(
        local$lessons, (e) => call(lessons: e));
  }
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? image,
    int? number,
    String? title,
    String? publishDate,
    String? ageRating,
    int? duration,
    bool? locked,
    Fragment$SeasonListEpisode$lessons? lessons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$SeasonListEpisode$lessons<TRes> get lessons =>
      CopyWith$Fragment$SeasonListEpisode$lessons.stub(_res);
}

class Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page
    implements Fragment$EpisodeContext$$ContextCollection$items$items$item {
  Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page(
      {this.$__typename = 'Page'});

  factory Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page(
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
    if (!(other
            is Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page
    on Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page<
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page(
    Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page instance,
    TRes Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page
      _instance;

  final TRes Function(
      Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link
    implements Fragment$EpisodeContext$$ContextCollection$items$items$item {
  Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link(
      {this.$__typename = 'Link'});

  factory Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link(
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
    if (!(other
            is Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link
    on Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link<
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link(
    Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link instance,
    TRes Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link
      _instance;

  final TRes Function(
      Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic
    implements Fragment$EpisodeContext$$ContextCollection$items$items$item {
  Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic(
      {this.$__typename = 'StudyTopic'});

  factory Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic(
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
    if (!(other
            is Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic
    on Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic<
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic(
    Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic
        instance,
    TRes Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic)
        then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic<
            TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic
      _instance;

  final TRes Function(
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic<
            TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game
    implements Fragment$EpisodeContext$$ContextCollection$items$items$item {
  Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game(
      {this.$__typename = 'Game'});

  factory Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game(
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
    if (!(other
            is Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game
    on Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game {
  CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game<
          Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game(
    Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game instance,
    TRes Function(
            Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game)
        then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game;

  factory CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game<
            TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game
      _instance;

  final TRes Function(
      Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game<
        TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game<
            TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$EpisodeContext$$Season implements Fragment$EpisodeContext {
  Fragment$EpisodeContext$$Season({
    required this.id,
    required this.title,
    required this.number,
    required this.episodes,
    required this.$show,
    this.$__typename = 'Season',
  });

  factory Fragment$EpisodeContext$$Season.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$number = json['number'];
    final l$episodes = json['episodes'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$Season(
      id: (l$id as String),
      title: (l$title as String),
      number: (l$number as int),
      episodes: Fragment$EpisodeContext$$Season$episodes.fromJson(
          (l$episodes as Map<String, dynamic>)),
      $show: Fragment$EpisodeContext$$Season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final int number;

  final Fragment$EpisodeContext$$Season$episodes episodes;

  final Fragment$EpisodeContext$$Season$show $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes.toJson();
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$number = number;
    final l$episodes = episodes;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$number,
      l$episodes,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$EpisodeContext$$Season) ||
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
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$episodes = episodes;
    final lOther$episodes = other.episodes;
    if (l$episodes != lOther$episodes) {
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

extension UtilityExtension$Fragment$EpisodeContext$$Season
    on Fragment$EpisodeContext$$Season {
  CopyWith$Fragment$EpisodeContext$$Season<Fragment$EpisodeContext$$Season>
      get copyWith => CopyWith$Fragment$EpisodeContext$$Season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$Season<TRes> {
  factory CopyWith$Fragment$EpisodeContext$$Season(
    Fragment$EpisodeContext$$Season instance,
    TRes Function(Fragment$EpisodeContext$$Season) then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$Season;

  factory CopyWith$Fragment$EpisodeContext$$Season.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$Season;

  TRes call({
    String? id,
    String? title,
    int? number,
    Fragment$EpisodeContext$$Season$episodes? episodes,
    Fragment$EpisodeContext$$Season$show? $show,
    String? $__typename,
  });
  CopyWith$Fragment$EpisodeContext$$Season$episodes<TRes> get episodes;
  CopyWith$Fragment$EpisodeContext$$Season$show<TRes> get $show;
}

class _CopyWithImpl$Fragment$EpisodeContext$$Season<TRes>
    implements CopyWith$Fragment$EpisodeContext$$Season<TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$Season(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$Season _instance;

  final TRes Function(Fragment$EpisodeContext$$Season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? number = _undefined,
    Object? episodes = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeContext$$Season(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        episodes: episodes == _undefined || episodes == null
            ? _instance.episodes
            : (episodes as Fragment$EpisodeContext$$Season$episodes),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Fragment$EpisodeContext$$Season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EpisodeContext$$Season$episodes<TRes> get episodes {
    final local$episodes = _instance.episodes;
    return CopyWith$Fragment$EpisodeContext$$Season$episodes(
        local$episodes, (e) => call(episodes: e));
  }

  CopyWith$Fragment$EpisodeContext$$Season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$EpisodeContext$$Season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$Season<TRes>
    implements CopyWith$Fragment$EpisodeContext$$Season<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$Season(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    int? number,
    Fragment$EpisodeContext$$Season$episodes? episodes,
    Fragment$EpisodeContext$$Season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EpisodeContext$$Season$episodes<TRes> get episodes =>
      CopyWith$Fragment$EpisodeContext$$Season$episodes.stub(_res);
  CopyWith$Fragment$EpisodeContext$$Season$show<TRes> get $show =>
      CopyWith$Fragment$EpisodeContext$$Season$show.stub(_res);
}

class Fragment$EpisodeContext$$Season$episodes {
  Fragment$EpisodeContext$$Season$episodes({
    required this.items,
    this.$__typename = 'EpisodePagination',
  });

  factory Fragment$EpisodeContext$$Season$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$Season$episodes(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$SeasonListEpisode.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$SeasonListEpisode> items;

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
    if (!(other is Fragment$EpisodeContext$$Season$episodes) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$Season$episodes
    on Fragment$EpisodeContext$$Season$episodes {
  CopyWith$Fragment$EpisodeContext$$Season$episodes<
          Fragment$EpisodeContext$$Season$episodes>
      get copyWith => CopyWith$Fragment$EpisodeContext$$Season$episodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$Season$episodes<TRes> {
  factory CopyWith$Fragment$EpisodeContext$$Season$episodes(
    Fragment$EpisodeContext$$Season$episodes instance,
    TRes Function(Fragment$EpisodeContext$$Season$episodes) then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$Season$episodes;

  factory CopyWith$Fragment$EpisodeContext$$Season$episodes.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$Season$episodes;

  TRes call({
    List<Fragment$SeasonListEpisode>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$SeasonListEpisode> Function(
              Iterable<
                  CopyWith$Fragment$SeasonListEpisode<
                      Fragment$SeasonListEpisode>>)
          _fn);
}

class _CopyWithImpl$Fragment$EpisodeContext$$Season$episodes<TRes>
    implements CopyWith$Fragment$EpisodeContext$$Season$episodes<TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$Season$episodes(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$Season$episodes _instance;

  final TRes Function(Fragment$EpisodeContext$$Season$episodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeContext$$Season$episodes(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$SeasonListEpisode>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$SeasonListEpisode> Function(
                  Iterable<
                      CopyWith$Fragment$SeasonListEpisode<
                          Fragment$SeasonListEpisode>>)
              _fn) =>
      call(
          items: _fn(
              _instance.items.map((e) => CopyWith$Fragment$SeasonListEpisode(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$Season$episodes<TRes>
    implements CopyWith$Fragment$EpisodeContext$$Season$episodes<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$Season$episodes(this._res);

  TRes _res;

  call({
    List<Fragment$SeasonListEpisode>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$EpisodeContext$$Season$show {
  Fragment$EpisodeContext$$Season$show({
    required this.id,
    required this.title,
    required this.type,
    required this.seasons,
    this.$__typename = 'Show',
  });

  factory Fragment$EpisodeContext$$Season$show.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$type = json['type'];
    final l$seasons = json['seasons'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$Season$show(
      id: (l$id as String),
      title: (l$title as String),
      type: fromJson$Enum$ShowType((l$type as String)),
      seasons: Fragment$EpisodeContext$$Season$show$seasons.fromJson(
          (l$seasons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final Enum$ShowType type;

  final Fragment$EpisodeContext$$Season$show$seasons seasons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$type = type;
    _resultData['type'] = toJson$Enum$ShowType(l$type);
    final l$seasons = seasons;
    _resultData['seasons'] = l$seasons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$type = type;
    final l$seasons = seasons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$type,
      l$seasons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$EpisodeContext$$Season$show) ||
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
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$seasons = seasons;
    final lOther$seasons = other.seasons;
    if (l$seasons != lOther$seasons) {
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

extension UtilityExtension$Fragment$EpisodeContext$$Season$show
    on Fragment$EpisodeContext$$Season$show {
  CopyWith$Fragment$EpisodeContext$$Season$show<
          Fragment$EpisodeContext$$Season$show>
      get copyWith => CopyWith$Fragment$EpisodeContext$$Season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$Season$show<TRes> {
  factory CopyWith$Fragment$EpisodeContext$$Season$show(
    Fragment$EpisodeContext$$Season$show instance,
    TRes Function(Fragment$EpisodeContext$$Season$show) then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$Season$show;

  factory CopyWith$Fragment$EpisodeContext$$Season$show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$Season$show;

  TRes call({
    String? id,
    String? title,
    Enum$ShowType? type,
    Fragment$EpisodeContext$$Season$show$seasons? seasons,
    String? $__typename,
  });
  CopyWith$Fragment$EpisodeContext$$Season$show$seasons<TRes> get seasons;
}

class _CopyWithImpl$Fragment$EpisodeContext$$Season$show<TRes>
    implements CopyWith$Fragment$EpisodeContext$$Season$show<TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$Season$show(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$Season$show _instance;

  final TRes Function(Fragment$EpisodeContext$$Season$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? type = _undefined,
    Object? seasons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeContext$$Season$show(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$ShowType),
        seasons: seasons == _undefined || seasons == null
            ? _instance.seasons
            : (seasons as Fragment$EpisodeContext$$Season$show$seasons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EpisodeContext$$Season$show$seasons<TRes> get seasons {
    final local$seasons = _instance.seasons;
    return CopyWith$Fragment$EpisodeContext$$Season$show$seasons(
        local$seasons, (e) => call(seasons: e));
  }
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$Season$show<TRes>
    implements CopyWith$Fragment$EpisodeContext$$Season$show<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$Season$show(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    Enum$ShowType? type,
    Fragment$EpisodeContext$$Season$show$seasons? seasons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EpisodeContext$$Season$show$seasons<TRes> get seasons =>
      CopyWith$Fragment$EpisodeContext$$Season$show$seasons.stub(_res);
}

class Fragment$EpisodeContext$$Season$show$seasons {
  Fragment$EpisodeContext$$Season$show$seasons({
    required this.items,
    this.$__typename = 'SeasonPagination',
  });

  factory Fragment$EpisodeContext$$Season$show$seasons.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$Season$show$seasons(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$EpisodeContext$$Season$show$seasons$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$EpisodeContext$$Season$show$seasons$items> items;

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
    if (!(other is Fragment$EpisodeContext$$Season$show$seasons) ||
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

extension UtilityExtension$Fragment$EpisodeContext$$Season$show$seasons
    on Fragment$EpisodeContext$$Season$show$seasons {
  CopyWith$Fragment$EpisodeContext$$Season$show$seasons<
          Fragment$EpisodeContext$$Season$show$seasons>
      get copyWith => CopyWith$Fragment$EpisodeContext$$Season$show$seasons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$Season$show$seasons<TRes> {
  factory CopyWith$Fragment$EpisodeContext$$Season$show$seasons(
    Fragment$EpisodeContext$$Season$show$seasons instance,
    TRes Function(Fragment$EpisodeContext$$Season$show$seasons) then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$Season$show$seasons;

  factory CopyWith$Fragment$EpisodeContext$$Season$show$seasons.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$Season$show$seasons;

  TRes call({
    List<Fragment$EpisodeContext$$Season$show$seasons$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$EpisodeContext$$Season$show$seasons$items> Function(
              Iterable<
                  CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items<
                      Fragment$EpisodeContext$$Season$show$seasons$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$EpisodeContext$$Season$show$seasons<TRes>
    implements CopyWith$Fragment$EpisodeContext$$Season$show$seasons<TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$Season$show$seasons(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$Season$show$seasons _instance;

  final TRes Function(Fragment$EpisodeContext$$Season$show$seasons) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeContext$$Season$show$seasons(
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as List<Fragment$EpisodeContext$$Season$show$seasons$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$EpisodeContext$$Season$show$seasons$items> Function(
                  Iterable<
                      CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items<
                          Fragment$EpisodeContext$$Season$show$seasons$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$Season$show$seasons<TRes>
    implements CopyWith$Fragment$EpisodeContext$$Season$show$seasons<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$Season$show$seasons(this._res);

  TRes _res;

  call({
    List<Fragment$EpisodeContext$$Season$show$seasons$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$EpisodeContext$$Season$show$seasons$items {
  Fragment$EpisodeContext$$Season$show$seasons$items({
    required this.id,
    required this.title,
    this.$__typename = 'Season',
  });

  factory Fragment$EpisodeContext$$Season$show$seasons$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeContext$$Season$show$seasons$items(
      id: (l$id as String),
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

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
    if (!(other is Fragment$EpisodeContext$$Season$show$seasons$items) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$EpisodeContext$$Season$show$seasons$items
    on Fragment$EpisodeContext$$Season$show$seasons$items {
  CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items<
          Fragment$EpisodeContext$$Season$show$seasons$items>
      get copyWith =>
          CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items<
    TRes> {
  factory CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items(
    Fragment$EpisodeContext$$Season$show$seasons$items instance,
    TRes Function(Fragment$EpisodeContext$$Season$show$seasons$items) then,
  ) = _CopyWithImpl$Fragment$EpisodeContext$$Season$show$seasons$items;

  factory CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeContext$$Season$show$seasons$items;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$EpisodeContext$$Season$show$seasons$items<TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items<TRes> {
  _CopyWithImpl$Fragment$EpisodeContext$$Season$show$seasons$items(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeContext$$Season$show$seasons$items _instance;

  final TRes Function(Fragment$EpisodeContext$$Season$show$seasons$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeContext$$Season$show$seasons$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$EpisodeContext$$Season$show$seasons$items<TRes>
    implements
        CopyWith$Fragment$EpisodeContext$$Season$show$seasons$items<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeContext$$Season$show$seasons$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$BasicStream {
  Fragment$BasicStream({
    required this.id,
    required this.url,
    required this.type,
    required this.audioLanguages,
    required this.subtitleLanguages,
    this.$__typename = 'Stream',
  });

  factory Fragment$BasicStream.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$url = json['url'];
    final l$type = json['type'];
    final l$audioLanguages = json['audioLanguages'];
    final l$subtitleLanguages = json['subtitleLanguages'];
    final l$$__typename = json['__typename'];
    return Fragment$BasicStream(
      id: (l$id as String),
      url: (l$url as String),
      type: fromJson$Enum$StreamType((l$type as String)),
      audioLanguages: (l$audioLanguages as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      subtitleLanguages: (l$subtitleLanguages as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String url;

  final Enum$StreamType type;

  final List<String> audioLanguages;

  final List<String> subtitleLanguages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$type = type;
    _resultData['type'] = toJson$Enum$StreamType(l$type);
    final l$audioLanguages = audioLanguages;
    _resultData['audioLanguages'] = l$audioLanguages.map((e) => e).toList();
    final l$subtitleLanguages = subtitleLanguages;
    _resultData['subtitleLanguages'] =
        l$subtitleLanguages.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$url = url;
    final l$type = type;
    final l$audioLanguages = audioLanguages;
    final l$subtitleLanguages = subtitleLanguages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$url,
      l$type,
      Object.hashAll(l$audioLanguages.map((v) => v)),
      Object.hashAll(l$subtitleLanguages.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$BasicStream) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$audioLanguages = audioLanguages;
    final lOther$audioLanguages = other.audioLanguages;
    if (l$audioLanguages.length != lOther$audioLanguages.length) {
      return false;
    }
    for (int i = 0; i < l$audioLanguages.length; i++) {
      final l$audioLanguages$entry = l$audioLanguages[i];
      final lOther$audioLanguages$entry = lOther$audioLanguages[i];
      if (l$audioLanguages$entry != lOther$audioLanguages$entry) {
        return false;
      }
    }
    final l$subtitleLanguages = subtitleLanguages;
    final lOther$subtitleLanguages = other.subtitleLanguages;
    if (l$subtitleLanguages.length != lOther$subtitleLanguages.length) {
      return false;
    }
    for (int i = 0; i < l$subtitleLanguages.length; i++) {
      final l$subtitleLanguages$entry = l$subtitleLanguages[i];
      final lOther$subtitleLanguages$entry = lOther$subtitleLanguages[i];
      if (l$subtitleLanguages$entry != lOther$subtitleLanguages$entry) {
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

extension UtilityExtension$Fragment$BasicStream on Fragment$BasicStream {
  CopyWith$Fragment$BasicStream<Fragment$BasicStream> get copyWith =>
      CopyWith$Fragment$BasicStream(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$BasicStream<TRes> {
  factory CopyWith$Fragment$BasicStream(
    Fragment$BasicStream instance,
    TRes Function(Fragment$BasicStream) then,
  ) = _CopyWithImpl$Fragment$BasicStream;

  factory CopyWith$Fragment$BasicStream.stub(TRes res) =
      _CopyWithStubImpl$Fragment$BasicStream;

  TRes call({
    String? id,
    String? url,
    Enum$StreamType? type,
    List<String>? audioLanguages,
    List<String>? subtitleLanguages,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$BasicStream<TRes>
    implements CopyWith$Fragment$BasicStream<TRes> {
  _CopyWithImpl$Fragment$BasicStream(
    this._instance,
    this._then,
  );

  final Fragment$BasicStream _instance;

  final TRes Function(Fragment$BasicStream) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? url = _undefined,
    Object? type = _undefined,
    Object? audioLanguages = _undefined,
    Object? subtitleLanguages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$BasicStream(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$StreamType),
        audioLanguages: audioLanguages == _undefined || audioLanguages == null
            ? _instance.audioLanguages
            : (audioLanguages as List<String>),
        subtitleLanguages:
            subtitleLanguages == _undefined || subtitleLanguages == null
                ? _instance.subtitleLanguages
                : (subtitleLanguages as List<String>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$BasicStream<TRes>
    implements CopyWith$Fragment$BasicStream<TRes> {
  _CopyWithStubImpl$Fragment$BasicStream(this._res);

  TRes _res;

  call({
    String? id,
    String? url,
    Enum$StreamType? type,
    List<String>? audioLanguages,
    List<String>? subtitleLanguages,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionBasicStream = FragmentDefinitionNode(
  name: NameNode(value: 'BasicStream'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Stream'),
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
      name: NameNode(value: 'url'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'audioLanguages'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'subtitleLanguages'),
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
);
const documentNodeFragmentBasicStream = DocumentNode(definitions: [
  fragmentDefinitionBasicStream,
]);

extension ClientExtension$Fragment$BasicStream on graphql.GraphQLClient {
  void writeFragment$BasicStream({
    required Fragment$BasicStream data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'BasicStream',
            document: documentNodeFragmentBasicStream,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$BasicStream? readFragment$BasicStream({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'BasicStream',
          document: documentNodeFragmentBasicStream,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$BasicStream.fromJson(result);
  }
}

class Fragment$SeasonListEpisode {
  Fragment$SeasonListEpisode({
    required this.id,
    this.image,
    this.number,
    required this.title,
    required this.publishDate,
    required this.ageRating,
    required this.duration,
    required this.locked,
    required this.lessons,
    this.$__typename = 'Episode',
  });

  factory Fragment$SeasonListEpisode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$number = json['number'];
    final l$title = json['title'];
    final l$publishDate = json['publishDate'];
    final l$ageRating = json['ageRating'];
    final l$duration = json['duration'];
    final l$locked = json['locked'];
    final l$lessons = json['lessons'];
    final l$$__typename = json['__typename'];
    return Fragment$SeasonListEpisode(
      id: (l$id as String),
      image: (l$image as String?),
      number: (l$number as int?),
      title: (l$title as String),
      publishDate: (l$publishDate as String),
      ageRating: (l$ageRating as String),
      duration: (l$duration as int),
      locked: (l$locked as bool),
      lessons: Fragment$SeasonListEpisode$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? image;

  final int? number;

  final String title;

  final String publishDate;

  final String ageRating;

  final int duration;

  final bool locked;

  final Fragment$SeasonListEpisode$lessons lessons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$locked = locked;
    _resultData['locked'] = l$locked;
    final l$lessons = lessons;
    _resultData['lessons'] = l$lessons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$number = number;
    final l$title = title;
    final l$publishDate = publishDate;
    final l$ageRating = ageRating;
    final l$duration = duration;
    final l$locked = locked;
    final l$lessons = lessons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$number,
      l$title,
      l$publishDate,
      l$ageRating,
      l$duration,
      l$locked,
      l$lessons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SeasonListEpisode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
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
    final l$locked = locked;
    final lOther$locked = other.locked;
    if (l$locked != lOther$locked) {
      return false;
    }
    final l$lessons = lessons;
    final lOther$lessons = other.lessons;
    if (l$lessons != lOther$lessons) {
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

extension UtilityExtension$Fragment$SeasonListEpisode
    on Fragment$SeasonListEpisode {
  CopyWith$Fragment$SeasonListEpisode<Fragment$SeasonListEpisode>
      get copyWith => CopyWith$Fragment$SeasonListEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SeasonListEpisode<TRes> {
  factory CopyWith$Fragment$SeasonListEpisode(
    Fragment$SeasonListEpisode instance,
    TRes Function(Fragment$SeasonListEpisode) then,
  ) = _CopyWithImpl$Fragment$SeasonListEpisode;

  factory CopyWith$Fragment$SeasonListEpisode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SeasonListEpisode;

  TRes call({
    String? id,
    String? image,
    int? number,
    String? title,
    String? publishDate,
    String? ageRating,
    int? duration,
    bool? locked,
    Fragment$SeasonListEpisode$lessons? lessons,
    String? $__typename,
  });
  CopyWith$Fragment$SeasonListEpisode$lessons<TRes> get lessons;
}

class _CopyWithImpl$Fragment$SeasonListEpisode<TRes>
    implements CopyWith$Fragment$SeasonListEpisode<TRes> {
  _CopyWithImpl$Fragment$SeasonListEpisode(
    this._instance,
    this._then,
  );

  final Fragment$SeasonListEpisode _instance;

  final TRes Function(Fragment$SeasonListEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? number = _undefined,
    Object? title = _undefined,
    Object? publishDate = _undefined,
    Object? ageRating = _undefined,
    Object? duration = _undefined,
    Object? locked = _undefined,
    Object? lessons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SeasonListEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        number: number == _undefined ? _instance.number : (number as int?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        locked: locked == _undefined || locked == null
            ? _instance.locked
            : (locked as bool),
        lessons: lessons == _undefined || lessons == null
            ? _instance.lessons
            : (lessons as Fragment$SeasonListEpisode$lessons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$SeasonListEpisode$lessons<TRes> get lessons {
    final local$lessons = _instance.lessons;
    return CopyWith$Fragment$SeasonListEpisode$lessons(
        local$lessons, (e) => call(lessons: e));
  }
}

class _CopyWithStubImpl$Fragment$SeasonListEpisode<TRes>
    implements CopyWith$Fragment$SeasonListEpisode<TRes> {
  _CopyWithStubImpl$Fragment$SeasonListEpisode(this._res);

  TRes _res;

  call({
    String? id,
    String? image,
    int? number,
    String? title,
    String? publishDate,
    String? ageRating,
    int? duration,
    bool? locked,
    Fragment$SeasonListEpisode$lessons? lessons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$SeasonListEpisode$lessons<TRes> get lessons =>
      CopyWith$Fragment$SeasonListEpisode$lessons.stub(_res);
}

const fragmentDefinitionSeasonListEpisode = FragmentDefinitionNode(
  name: NameNode(value: 'SeasonListEpisode'),
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
      name: NameNode(value: 'image'),
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
      name: NameNode(value: 'title'),
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
      name: NameNode(value: 'locked'),
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
      name: NameNode(value: 'lessons'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'total'),
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
);
const documentNodeFragmentSeasonListEpisode = DocumentNode(definitions: [
  fragmentDefinitionSeasonListEpisode,
]);

extension ClientExtension$Fragment$SeasonListEpisode on graphql.GraphQLClient {
  void writeFragment$SeasonListEpisode({
    required Fragment$SeasonListEpisode data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'SeasonListEpisode',
            document: documentNodeFragmentSeasonListEpisode,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$SeasonListEpisode? readFragment$SeasonListEpisode({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'SeasonListEpisode',
          document: documentNodeFragmentSeasonListEpisode,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$SeasonListEpisode.fromJson(result);
  }
}

class Fragment$SeasonListEpisode$lessons {
  Fragment$SeasonListEpisode$lessons({
    required this.total,
    this.$__typename = 'LessonPagination',
  });

  factory Fragment$SeasonListEpisode$lessons.fromJson(
      Map<String, dynamic> json) {
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Fragment$SeasonListEpisode$lessons(
      total: (l$total as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$total = total;
    _resultData['total'] = l$total;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$total,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SeasonListEpisode$lessons) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
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

extension UtilityExtension$Fragment$SeasonListEpisode$lessons
    on Fragment$SeasonListEpisode$lessons {
  CopyWith$Fragment$SeasonListEpisode$lessons<
          Fragment$SeasonListEpisode$lessons>
      get copyWith => CopyWith$Fragment$SeasonListEpisode$lessons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SeasonListEpisode$lessons<TRes> {
  factory CopyWith$Fragment$SeasonListEpisode$lessons(
    Fragment$SeasonListEpisode$lessons instance,
    TRes Function(Fragment$SeasonListEpisode$lessons) then,
  ) = _CopyWithImpl$Fragment$SeasonListEpisode$lessons;

  factory CopyWith$Fragment$SeasonListEpisode$lessons.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SeasonListEpisode$lessons;

  TRes call({
    int? total,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SeasonListEpisode$lessons<TRes>
    implements CopyWith$Fragment$SeasonListEpisode$lessons<TRes> {
  _CopyWithImpl$Fragment$SeasonListEpisode$lessons(
    this._instance,
    this._then,
  );

  final Fragment$SeasonListEpisode$lessons _instance;

  final TRes Function(Fragment$SeasonListEpisode$lessons) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SeasonListEpisode$lessons(
        total: total == _undefined || total == null
            ? _instance.total
            : (total as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SeasonListEpisode$lessons<TRes>
    implements CopyWith$Fragment$SeasonListEpisode$lessons<TRes> {
  _CopyWithStubImpl$Fragment$SeasonListEpisode$lessons(this._res);

  TRes _res;

  call({
    int? total,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$PlayableEpisode {
  Fragment$PlayableEpisode({
    required this.id,
    required this.streams,
    this.context,
    required this.title,
    this.image,
    required this.duration,
    this.season,
    this.$__typename = 'Episode',
  });

  factory Fragment$PlayableEpisode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$streams = json['streams'];
    final l$context = json['context'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$duration = json['duration'];
    final l$season = json['season'];
    final l$$__typename = json['__typename'];
    return Fragment$PlayableEpisode(
      id: (l$id as String),
      streams: (l$streams as List<dynamic>)
          .map(
              (e) => Fragment$BasicStream.fromJson((e as Map<String, dynamic>)))
          .toList(),
      context: l$context == null
          ? null
          : Fragment$PlayableEpisode$context.fromJson(
              (l$context as Map<String, dynamic>)),
      title: (l$title as String),
      image: (l$image as String?),
      duration: (l$duration as int),
      season: l$season == null
          ? null
          : Fragment$PlayableEpisode$season.fromJson(
              (l$season as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<Fragment$BasicStream> streams;

  final Fragment$PlayableEpisode$context? context;

  final String title;

  final String? image;

  final int duration;

  final Fragment$PlayableEpisode$season? season;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$streams = streams;
    _resultData['streams'] = l$streams.map((e) => e.toJson()).toList();
    final l$context = context;
    _resultData['context'] = l$context?.toJson();
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$streams = streams;
    final l$context = context;
    final l$title = title;
    final l$image = image;
    final l$duration = duration;
    final l$season = season;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$streams.map((v) => v)),
      l$context,
      l$title,
      l$image,
      l$duration,
      l$season,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$PlayableEpisode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$streams = streams;
    final lOther$streams = other.streams;
    if (l$streams.length != lOther$streams.length) {
      return false;
    }
    for (int i = 0; i < l$streams.length; i++) {
      final l$streams$entry = l$streams[i];
      final lOther$streams$entry = lOther$streams[i];
      if (l$streams$entry != lOther$streams$entry) {
        return false;
      }
    }
    final l$context = context;
    final lOther$context = other.context;
    if (l$context != lOther$context) {
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
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

extension UtilityExtension$Fragment$PlayableEpisode
    on Fragment$PlayableEpisode {
  CopyWith$Fragment$PlayableEpisode<Fragment$PlayableEpisode> get copyWith =>
      CopyWith$Fragment$PlayableEpisode(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$PlayableEpisode<TRes> {
  factory CopyWith$Fragment$PlayableEpisode(
    Fragment$PlayableEpisode instance,
    TRes Function(Fragment$PlayableEpisode) then,
  ) = _CopyWithImpl$Fragment$PlayableEpisode;

  factory CopyWith$Fragment$PlayableEpisode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PlayableEpisode;

  TRes call({
    String? id,
    List<Fragment$BasicStream>? streams,
    Fragment$PlayableEpisode$context? context,
    String? title,
    String? image,
    int? duration,
    Fragment$PlayableEpisode$season? season,
    String? $__typename,
  });
  TRes streams(
      Iterable<Fragment$BasicStream> Function(
              Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
          _fn);
  CopyWith$Fragment$PlayableEpisode$context<TRes> get context;
  CopyWith$Fragment$PlayableEpisode$season<TRes> get season;
}

class _CopyWithImpl$Fragment$PlayableEpisode<TRes>
    implements CopyWith$Fragment$PlayableEpisode<TRes> {
  _CopyWithImpl$Fragment$PlayableEpisode(
    this._instance,
    this._then,
  );

  final Fragment$PlayableEpisode _instance;

  final TRes Function(Fragment$PlayableEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? streams = _undefined,
    Object? context = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? duration = _undefined,
    Object? season = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$PlayableEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        streams: streams == _undefined || streams == null
            ? _instance.streams
            : (streams as List<Fragment$BasicStream>),
        context: context == _undefined
            ? _instance.context
            : (context as Fragment$PlayableEpisode$context?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        season: season == _undefined
            ? _instance.season
            : (season as Fragment$PlayableEpisode$season?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes streams(
          Iterable<Fragment$BasicStream> Function(
                  Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
              _fn) =>
      call(
          streams:
              _fn(_instance.streams.map((e) => CopyWith$Fragment$BasicStream(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Fragment$PlayableEpisode$context<TRes> get context {
    final local$context = _instance.context;
    return local$context == null
        ? CopyWith$Fragment$PlayableEpisode$context.stub(_then(_instance))
        : CopyWith$Fragment$PlayableEpisode$context(
            local$context, (e) => call(context: e));
  }

  CopyWith$Fragment$PlayableEpisode$season<TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$PlayableEpisode$season.stub(_then(_instance))
        : CopyWith$Fragment$PlayableEpisode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$PlayableEpisode<TRes>
    implements CopyWith$Fragment$PlayableEpisode<TRes> {
  _CopyWithStubImpl$Fragment$PlayableEpisode(this._res);

  TRes _res;

  call({
    String? id,
    List<Fragment$BasicStream>? streams,
    Fragment$PlayableEpisode$context? context,
    String? title,
    String? image,
    int? duration,
    Fragment$PlayableEpisode$season? season,
    String? $__typename,
  }) =>
      _res;
  streams(_fn) => _res;
  CopyWith$Fragment$PlayableEpisode$context<TRes> get context =>
      CopyWith$Fragment$PlayableEpisode$context.stub(_res);
  CopyWith$Fragment$PlayableEpisode$season<TRes> get season =>
      CopyWith$Fragment$PlayableEpisode$season.stub(_res);
}

const fragmentDefinitionPlayableEpisode = FragmentDefinitionNode(
  name: NameNode(value: 'PlayableEpisode'),
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
      name: NameNode(value: 'streams'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'BasicStream'),
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
      name: NameNode(value: 'context'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'ContextCollection'),
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
          name: NameNode(value: 'show'),
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
);
const documentNodeFragmentPlayableEpisode = DocumentNode(definitions: [
  fragmentDefinitionPlayableEpisode,
  fragmentDefinitionBasicStream,
]);

extension ClientExtension$Fragment$PlayableEpisode on graphql.GraphQLClient {
  void writeFragment$PlayableEpisode({
    required Fragment$PlayableEpisode data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'PlayableEpisode',
            document: documentNodeFragmentPlayableEpisode,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$PlayableEpisode? readFragment$PlayableEpisode({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'PlayableEpisode',
          document: documentNodeFragmentPlayableEpisode,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$PlayableEpisode.fromJson(result);
  }
}

class Fragment$PlayableEpisode$context {
  Fragment$PlayableEpisode$context({required this.$__typename});

  factory Fragment$PlayableEpisode$context.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ContextCollection":
        return Fragment$PlayableEpisode$context$$ContextCollection.fromJson(
            json);

      case "Season":
        return Fragment$PlayableEpisode$context$$Season.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$PlayableEpisode$context(
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
    if (!(other is Fragment$PlayableEpisode$context) ||
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

extension UtilityExtension$Fragment$PlayableEpisode$context
    on Fragment$PlayableEpisode$context {
  CopyWith$Fragment$PlayableEpisode$context<Fragment$PlayableEpisode$context>
      get copyWith => CopyWith$Fragment$PlayableEpisode$context(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(Fragment$PlayableEpisode$context$$ContextCollection)
        contextCollection,
    required _T Function(Fragment$PlayableEpisode$context$$Season) season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        return contextCollection(
            this as Fragment$PlayableEpisode$context$$ContextCollection);

      case "Season":
        return season(this as Fragment$PlayableEpisode$context$$Season);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$PlayableEpisode$context$$ContextCollection)?
        contextCollection,
    _T Function(Fragment$PlayableEpisode$context$$Season)? season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        if (contextCollection != null) {
          return contextCollection(
              this as Fragment$PlayableEpisode$context$$ContextCollection);
        } else {
          return orElse();
        }

      case "Season":
        if (season != null) {
          return season(this as Fragment$PlayableEpisode$context$$Season);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$PlayableEpisode$context<TRes> {
  factory CopyWith$Fragment$PlayableEpisode$context(
    Fragment$PlayableEpisode$context instance,
    TRes Function(Fragment$PlayableEpisode$context) then,
  ) = _CopyWithImpl$Fragment$PlayableEpisode$context;

  factory CopyWith$Fragment$PlayableEpisode$context.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PlayableEpisode$context;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$PlayableEpisode$context<TRes>
    implements CopyWith$Fragment$PlayableEpisode$context<TRes> {
  _CopyWithImpl$Fragment$PlayableEpisode$context(
    this._instance,
    this._then,
  );

  final Fragment$PlayableEpisode$context _instance;

  final TRes Function(Fragment$PlayableEpisode$context) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$PlayableEpisode$context(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$PlayableEpisode$context<TRes>
    implements CopyWith$Fragment$PlayableEpisode$context<TRes> {
  _CopyWithStubImpl$Fragment$PlayableEpisode$context(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$PlayableEpisode$context$$ContextCollection
    implements Fragment$PlayableEpisode$context {
  Fragment$PlayableEpisode$context$$ContextCollection({
    required this.id,
    this.$__typename = 'ContextCollection',
  });

  factory Fragment$PlayableEpisode$context$$ContextCollection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$PlayableEpisode$context$$ContextCollection(
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
    if (!(other is Fragment$PlayableEpisode$context$$ContextCollection) ||
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

extension UtilityExtension$Fragment$PlayableEpisode$context$$ContextCollection
    on Fragment$PlayableEpisode$context$$ContextCollection {
  CopyWith$Fragment$PlayableEpisode$context$$ContextCollection<
          Fragment$PlayableEpisode$context$$ContextCollection>
      get copyWith =>
          CopyWith$Fragment$PlayableEpisode$context$$ContextCollection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$PlayableEpisode$context$$ContextCollection<
    TRes> {
  factory CopyWith$Fragment$PlayableEpisode$context$$ContextCollection(
    Fragment$PlayableEpisode$context$$ContextCollection instance,
    TRes Function(Fragment$PlayableEpisode$context$$ContextCollection) then,
  ) = _CopyWithImpl$Fragment$PlayableEpisode$context$$ContextCollection;

  factory CopyWith$Fragment$PlayableEpisode$context$$ContextCollection.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$PlayableEpisode$context$$ContextCollection;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$PlayableEpisode$context$$ContextCollection<TRes>
    implements
        CopyWith$Fragment$PlayableEpisode$context$$ContextCollection<TRes> {
  _CopyWithImpl$Fragment$PlayableEpisode$context$$ContextCollection(
    this._instance,
    this._then,
  );

  final Fragment$PlayableEpisode$context$$ContextCollection _instance;

  final TRes Function(Fragment$PlayableEpisode$context$$ContextCollection)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$PlayableEpisode$context$$ContextCollection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$PlayableEpisode$context$$ContextCollection<
        TRes>
    implements
        CopyWith$Fragment$PlayableEpisode$context$$ContextCollection<TRes> {
  _CopyWithStubImpl$Fragment$PlayableEpisode$context$$ContextCollection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$PlayableEpisode$context$$Season
    implements Fragment$PlayableEpisode$context {
  Fragment$PlayableEpisode$context$$Season({this.$__typename = 'Season'});

  factory Fragment$PlayableEpisode$context$$Season.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$PlayableEpisode$context$$Season(
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
    if (!(other is Fragment$PlayableEpisode$context$$Season) ||
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

extension UtilityExtension$Fragment$PlayableEpisode$context$$Season
    on Fragment$PlayableEpisode$context$$Season {
  CopyWith$Fragment$PlayableEpisode$context$$Season<
          Fragment$PlayableEpisode$context$$Season>
      get copyWith => CopyWith$Fragment$PlayableEpisode$context$$Season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$PlayableEpisode$context$$Season<TRes> {
  factory CopyWith$Fragment$PlayableEpisode$context$$Season(
    Fragment$PlayableEpisode$context$$Season instance,
    TRes Function(Fragment$PlayableEpisode$context$$Season) then,
  ) = _CopyWithImpl$Fragment$PlayableEpisode$context$$Season;

  factory CopyWith$Fragment$PlayableEpisode$context$$Season.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PlayableEpisode$context$$Season;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$PlayableEpisode$context$$Season<TRes>
    implements CopyWith$Fragment$PlayableEpisode$context$$Season<TRes> {
  _CopyWithImpl$Fragment$PlayableEpisode$context$$Season(
    this._instance,
    this._then,
  );

  final Fragment$PlayableEpisode$context$$Season _instance;

  final TRes Function(Fragment$PlayableEpisode$context$$Season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$PlayableEpisode$context$$Season(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$PlayableEpisode$context$$Season<TRes>
    implements CopyWith$Fragment$PlayableEpisode$context$$Season<TRes> {
  _CopyWithStubImpl$Fragment$PlayableEpisode$context$$Season(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$PlayableEpisode$season {
  Fragment$PlayableEpisode$season({
    required this.id,
    required this.title,
    required this.$show,
    this.$__typename = 'Season',
  });

  factory Fragment$PlayableEpisode$season.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$PlayableEpisode$season(
      id: (l$id as String),
      title: (l$title as String),
      $show: Fragment$PlayableEpisode$season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final Fragment$PlayableEpisode$season$show $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$PlayableEpisode$season) ||
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

extension UtilityExtension$Fragment$PlayableEpisode$season
    on Fragment$PlayableEpisode$season {
  CopyWith$Fragment$PlayableEpisode$season<Fragment$PlayableEpisode$season>
      get copyWith => CopyWith$Fragment$PlayableEpisode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$PlayableEpisode$season<TRes> {
  factory CopyWith$Fragment$PlayableEpisode$season(
    Fragment$PlayableEpisode$season instance,
    TRes Function(Fragment$PlayableEpisode$season) then,
  ) = _CopyWithImpl$Fragment$PlayableEpisode$season;

  factory CopyWith$Fragment$PlayableEpisode$season.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PlayableEpisode$season;

  TRes call({
    String? id,
    String? title,
    Fragment$PlayableEpisode$season$show? $show,
    String? $__typename,
  });
  CopyWith$Fragment$PlayableEpisode$season$show<TRes> get $show;
}

class _CopyWithImpl$Fragment$PlayableEpisode$season<TRes>
    implements CopyWith$Fragment$PlayableEpisode$season<TRes> {
  _CopyWithImpl$Fragment$PlayableEpisode$season(
    this._instance,
    this._then,
  );

  final Fragment$PlayableEpisode$season _instance;

  final TRes Function(Fragment$PlayableEpisode$season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$PlayableEpisode$season(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Fragment$PlayableEpisode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$PlayableEpisode$season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$PlayableEpisode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$PlayableEpisode$season<TRes>
    implements CopyWith$Fragment$PlayableEpisode$season<TRes> {
  _CopyWithStubImpl$Fragment$PlayableEpisode$season(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    Fragment$PlayableEpisode$season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$PlayableEpisode$season$show<TRes> get $show =>
      CopyWith$Fragment$PlayableEpisode$season$show.stub(_res);
}

class Fragment$PlayableEpisode$season$show {
  Fragment$PlayableEpisode$season$show({
    required this.id,
    required this.title,
    this.$__typename = 'Show',
  });

  factory Fragment$PlayableEpisode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$PlayableEpisode$season$show(
      id: (l$id as String),
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

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
    if (!(other is Fragment$PlayableEpisode$season$show) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$PlayableEpisode$season$show
    on Fragment$PlayableEpisode$season$show {
  CopyWith$Fragment$PlayableEpisode$season$show<
          Fragment$PlayableEpisode$season$show>
      get copyWith => CopyWith$Fragment$PlayableEpisode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$PlayableEpisode$season$show<TRes> {
  factory CopyWith$Fragment$PlayableEpisode$season$show(
    Fragment$PlayableEpisode$season$show instance,
    TRes Function(Fragment$PlayableEpisode$season$show) then,
  ) = _CopyWithImpl$Fragment$PlayableEpisode$season$show;

  factory CopyWith$Fragment$PlayableEpisode$season$show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PlayableEpisode$season$show;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$PlayableEpisode$season$show<TRes>
    implements CopyWith$Fragment$PlayableEpisode$season$show<TRes> {
  _CopyWithImpl$Fragment$PlayableEpisode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$PlayableEpisode$season$show _instance;

  final TRes Function(Fragment$PlayableEpisode$season$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$PlayableEpisode$season$show(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$PlayableEpisode$season$show<TRes>
    implements CopyWith$Fragment$PlayableEpisode$season$show<TRes> {
  _CopyWithStubImpl$Fragment$PlayableEpisode$season$show(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$EpisodeDetails {
  Fragment$EpisodeDetails({
    required this.id,
    required this.publishDate,
    required this.availableFrom,
    required this.availableTo,
    required this.ageRating,
    required this.audioLanguages,
    this.season,
    this.$__typename = 'Episode',
  });

  factory Fragment$EpisodeDetails.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$publishDate = json['publishDate'];
    final l$availableFrom = json['availableFrom'];
    final l$availableTo = json['availableTo'];
    final l$ageRating = json['ageRating'];
    final l$audioLanguages = json['audioLanguages'];
    final l$season = json['season'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeDetails(
      id: (l$id as String),
      publishDate: (l$publishDate as String),
      availableFrom: (l$availableFrom as String),
      availableTo: (l$availableTo as String),
      ageRating: (l$ageRating as String),
      audioLanguages: (l$audioLanguages as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      season: l$season == null
          ? null
          : Fragment$EpisodeDetails$season.fromJson(
              (l$season as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String publishDate;

  final String availableFrom;

  final String availableTo;

  final String ageRating;

  final List<String> audioLanguages;

  final Fragment$EpisodeDetails$season? season;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$availableFrom = availableFrom;
    _resultData['availableFrom'] = l$availableFrom;
    final l$availableTo = availableTo;
    _resultData['availableTo'] = l$availableTo;
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$audioLanguages = audioLanguages;
    _resultData['audioLanguages'] = l$audioLanguages.map((e) => e).toList();
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$publishDate = publishDate;
    final l$availableFrom = availableFrom;
    final l$availableTo = availableTo;
    final l$ageRating = ageRating;
    final l$audioLanguages = audioLanguages;
    final l$season = season;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$publishDate,
      l$availableFrom,
      l$availableTo,
      l$ageRating,
      Object.hashAll(l$audioLanguages.map((v) => v)),
      l$season,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$EpisodeDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    final l$availableFrom = availableFrom;
    final lOther$availableFrom = other.availableFrom;
    if (l$availableFrom != lOther$availableFrom) {
      return false;
    }
    final l$availableTo = availableTo;
    final lOther$availableTo = other.availableTo;
    if (l$availableTo != lOther$availableTo) {
      return false;
    }
    final l$ageRating = ageRating;
    final lOther$ageRating = other.ageRating;
    if (l$ageRating != lOther$ageRating) {
      return false;
    }
    final l$audioLanguages = audioLanguages;
    final lOther$audioLanguages = other.audioLanguages;
    if (l$audioLanguages.length != lOther$audioLanguages.length) {
      return false;
    }
    for (int i = 0; i < l$audioLanguages.length; i++) {
      final l$audioLanguages$entry = l$audioLanguages[i];
      final lOther$audioLanguages$entry = lOther$audioLanguages[i];
      if (l$audioLanguages$entry != lOther$audioLanguages$entry) {
        return false;
      }
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
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

extension UtilityExtension$Fragment$EpisodeDetails on Fragment$EpisodeDetails {
  CopyWith$Fragment$EpisodeDetails<Fragment$EpisodeDetails> get copyWith =>
      CopyWith$Fragment$EpisodeDetails(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$EpisodeDetails<TRes> {
  factory CopyWith$Fragment$EpisodeDetails(
    Fragment$EpisodeDetails instance,
    TRes Function(Fragment$EpisodeDetails) then,
  ) = _CopyWithImpl$Fragment$EpisodeDetails;

  factory CopyWith$Fragment$EpisodeDetails.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeDetails;

  TRes call({
    String? id,
    String? publishDate,
    String? availableFrom,
    String? availableTo,
    String? ageRating,
    List<String>? audioLanguages,
    Fragment$EpisodeDetails$season? season,
    String? $__typename,
  });
  CopyWith$Fragment$EpisodeDetails$season<TRes> get season;
}

class _CopyWithImpl$Fragment$EpisodeDetails<TRes>
    implements CopyWith$Fragment$EpisodeDetails<TRes> {
  _CopyWithImpl$Fragment$EpisodeDetails(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeDetails _instance;

  final TRes Function(Fragment$EpisodeDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? publishDate = _undefined,
    Object? availableFrom = _undefined,
    Object? availableTo = _undefined,
    Object? ageRating = _undefined,
    Object? audioLanguages = _undefined,
    Object? season = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeDetails(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        availableFrom: availableFrom == _undefined || availableFrom == null
            ? _instance.availableFrom
            : (availableFrom as String),
        availableTo: availableTo == _undefined || availableTo == null
            ? _instance.availableTo
            : (availableTo as String),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        audioLanguages: audioLanguages == _undefined || audioLanguages == null
            ? _instance.audioLanguages
            : (audioLanguages as List<String>),
        season: season == _undefined
            ? _instance.season
            : (season as Fragment$EpisodeDetails$season?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EpisodeDetails$season<TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$EpisodeDetails$season.stub(_then(_instance))
        : CopyWith$Fragment$EpisodeDetails$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$EpisodeDetails<TRes>
    implements CopyWith$Fragment$EpisodeDetails<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeDetails(this._res);

  TRes _res;

  call({
    String? id,
    String? publishDate,
    String? availableFrom,
    String? availableTo,
    String? ageRating,
    List<String>? audioLanguages,
    Fragment$EpisodeDetails$season? season,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EpisodeDetails$season<TRes> get season =>
      CopyWith$Fragment$EpisodeDetails$season.stub(_res);
}

const fragmentDefinitionEpisodeDetails = FragmentDefinitionNode(
  name: NameNode(value: 'EpisodeDetails'),
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
      name: NameNode(value: 'publishDate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'availableFrom'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'availableTo'),
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
      name: NameNode(value: 'audioLanguages'),
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
);
const documentNodeFragmentEpisodeDetails = DocumentNode(definitions: [
  fragmentDefinitionEpisodeDetails,
]);

extension ClientExtension$Fragment$EpisodeDetails on graphql.GraphQLClient {
  void writeFragment$EpisodeDetails({
    required Fragment$EpisodeDetails data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'EpisodeDetails',
            document: documentNodeFragmentEpisodeDetails,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$EpisodeDetails? readFragment$EpisodeDetails({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'EpisodeDetails',
          document: documentNodeFragmentEpisodeDetails,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$EpisodeDetails.fromJson(result);
  }
}

class Fragment$EpisodeDetails$season {
  Fragment$EpisodeDetails$season({
    required this.$show,
    this.$__typename = 'Season',
  });

  factory Fragment$EpisodeDetails$season.fromJson(Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeDetails$season(
      $show: Fragment$EpisodeDetails$season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$EpisodeDetails$season$show $show;

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
    if (!(other is Fragment$EpisodeDetails$season) ||
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

extension UtilityExtension$Fragment$EpisodeDetails$season
    on Fragment$EpisodeDetails$season {
  CopyWith$Fragment$EpisodeDetails$season<Fragment$EpisodeDetails$season>
      get copyWith => CopyWith$Fragment$EpisodeDetails$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeDetails$season<TRes> {
  factory CopyWith$Fragment$EpisodeDetails$season(
    Fragment$EpisodeDetails$season instance,
    TRes Function(Fragment$EpisodeDetails$season) then,
  ) = _CopyWithImpl$Fragment$EpisodeDetails$season;

  factory CopyWith$Fragment$EpisodeDetails$season.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeDetails$season;

  TRes call({
    Fragment$EpisodeDetails$season$show? $show,
    String? $__typename,
  });
  CopyWith$Fragment$EpisodeDetails$season$show<TRes> get $show;
}

class _CopyWithImpl$Fragment$EpisodeDetails$season<TRes>
    implements CopyWith$Fragment$EpisodeDetails$season<TRes> {
  _CopyWithImpl$Fragment$EpisodeDetails$season(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeDetails$season _instance;

  final TRes Function(Fragment$EpisodeDetails$season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeDetails$season(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Fragment$EpisodeDetails$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EpisodeDetails$season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$EpisodeDetails$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$EpisodeDetails$season<TRes>
    implements CopyWith$Fragment$EpisodeDetails$season<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeDetails$season(this._res);

  TRes _res;

  call({
    Fragment$EpisodeDetails$season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EpisodeDetails$season$show<TRes> get $show =>
      CopyWith$Fragment$EpisodeDetails$season$show.stub(_res);
}

class Fragment$EpisodeDetails$season$show {
  Fragment$EpisodeDetails$season$show({
    required this.description,
    this.$__typename = 'Show',
  });

  factory Fragment$EpisodeDetails$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeDetails$season$show(
      description: (l$description as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$EpisodeDetails$season$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$EpisodeDetails$season$show
    on Fragment$EpisodeDetails$season$show {
  CopyWith$Fragment$EpisodeDetails$season$show<
          Fragment$EpisodeDetails$season$show>
      get copyWith => CopyWith$Fragment$EpisodeDetails$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeDetails$season$show<TRes> {
  factory CopyWith$Fragment$EpisodeDetails$season$show(
    Fragment$EpisodeDetails$season$show instance,
    TRes Function(Fragment$EpisodeDetails$season$show) then,
  ) = _CopyWithImpl$Fragment$EpisodeDetails$season$show;

  factory CopyWith$Fragment$EpisodeDetails$season$show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeDetails$season$show;

  TRes call({
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$EpisodeDetails$season$show<TRes>
    implements CopyWith$Fragment$EpisodeDetails$season$show<TRes> {
  _CopyWithImpl$Fragment$EpisodeDetails$season$show(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeDetails$season$show _instance;

  final TRes Function(Fragment$EpisodeDetails$season$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeDetails$season$show(
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$EpisodeDetails$season$show<TRes>
    implements CopyWith$Fragment$EpisodeDetails$season$show<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeDetails$season$show(this._res);

  TRes _res;

  call({
    String? description,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$EpisodeAvailability {
  Fragment$EpisodeAvailability({
    required this.availableFrom,
    required this.availableTo,
    this.$__typename = 'Episode',
  });

  factory Fragment$EpisodeAvailability.fromJson(Map<String, dynamic> json) {
    final l$availableFrom = json['availableFrom'];
    final l$availableTo = json['availableTo'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeAvailability(
      availableFrom: (l$availableFrom as String),
      availableTo: (l$availableTo as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String availableFrom;

  final String availableTo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$availableFrom = availableFrom;
    _resultData['availableFrom'] = l$availableFrom;
    final l$availableTo = availableTo;
    _resultData['availableTo'] = l$availableTo;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$availableFrom = availableFrom;
    final l$availableTo = availableTo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$availableFrom,
      l$availableTo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$EpisodeAvailability) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$availableFrom = availableFrom;
    final lOther$availableFrom = other.availableFrom;
    if (l$availableFrom != lOther$availableFrom) {
      return false;
    }
    final l$availableTo = availableTo;
    final lOther$availableTo = other.availableTo;
    if (l$availableTo != lOther$availableTo) {
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

extension UtilityExtension$Fragment$EpisodeAvailability
    on Fragment$EpisodeAvailability {
  CopyWith$Fragment$EpisodeAvailability<Fragment$EpisodeAvailability>
      get copyWith => CopyWith$Fragment$EpisodeAvailability(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeAvailability<TRes> {
  factory CopyWith$Fragment$EpisodeAvailability(
    Fragment$EpisodeAvailability instance,
    TRes Function(Fragment$EpisodeAvailability) then,
  ) = _CopyWithImpl$Fragment$EpisodeAvailability;

  factory CopyWith$Fragment$EpisodeAvailability.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeAvailability;

  TRes call({
    String? availableFrom,
    String? availableTo,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$EpisodeAvailability<TRes>
    implements CopyWith$Fragment$EpisodeAvailability<TRes> {
  _CopyWithImpl$Fragment$EpisodeAvailability(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeAvailability _instance;

  final TRes Function(Fragment$EpisodeAvailability) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? availableFrom = _undefined,
    Object? availableTo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeAvailability(
        availableFrom: availableFrom == _undefined || availableFrom == null
            ? _instance.availableFrom
            : (availableFrom as String),
        availableTo: availableTo == _undefined || availableTo == null
            ? _instance.availableTo
            : (availableTo as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$EpisodeAvailability<TRes>
    implements CopyWith$Fragment$EpisodeAvailability<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeAvailability(this._res);

  TRes _res;

  call({
    String? availableFrom,
    String? availableTo,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionEpisodeAvailability = FragmentDefinitionNode(
  name: NameNode(value: 'EpisodeAvailability'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Episode'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'availableFrom'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'availableTo'),
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
);
const documentNodeFragmentEpisodeAvailability = DocumentNode(definitions: [
  fragmentDefinitionEpisodeAvailability,
]);

extension ClientExtension$Fragment$EpisodeAvailability
    on graphql.GraphQLClient {
  void writeFragment$EpisodeAvailability({
    required Fragment$EpisodeAvailability data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'EpisodeAvailability',
            document: documentNodeFragmentEpisodeAvailability,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$EpisodeAvailability? readFragment$EpisodeAvailability({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'EpisodeAvailability',
          document: documentNodeFragmentEpisodeAvailability,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$EpisodeAvailability.fromJson(result);
  }
}

class Variables$Query$FetchEpisode {
  factory Variables$Query$FetchEpisode({
    required String id,
    Input$EpisodeContext? context,
    required bool authenticated,
  }) =>
      Variables$Query$FetchEpisode._({
        r'id': id,
        if (context != null) r'context': context,
        r'authenticated': authenticated,
      });

  Variables$Query$FetchEpisode._(this._$data);

  factory Variables$Query$FetchEpisode.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('context')) {
      final l$context = data['context'];
      result$data['context'] = l$context == null
          ? null
          : Input$EpisodeContext.fromJson((l$context as Map<String, dynamic>));
    }
    final l$authenticated = data['authenticated'];
    result$data['authenticated'] = (l$authenticated as bool);
    return Variables$Query$FetchEpisode._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Input$EpisodeContext? get context =>
      (_$data['context'] as Input$EpisodeContext?);
  bool get authenticated => (_$data['authenticated'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('context')) {
      final l$context = context;
      result$data['context'] = l$context?.toJson();
    }
    final l$authenticated = authenticated;
    result$data['authenticated'] = l$authenticated;
    return result$data;
  }

  CopyWith$Variables$Query$FetchEpisode<Variables$Query$FetchEpisode>
      get copyWith => CopyWith$Variables$Query$FetchEpisode(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$FetchEpisode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$context = context;
    final lOther$context = other.context;
    if (_$data.containsKey('context') != other._$data.containsKey('context')) {
      return false;
    }
    if (l$context != lOther$context) {
      return false;
    }
    final l$authenticated = authenticated;
    final lOther$authenticated = other.authenticated;
    if (l$authenticated != lOther$authenticated) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$context = context;
    final l$authenticated = authenticated;
    return Object.hashAll([
      l$id,
      _$data.containsKey('context') ? l$context : const {},
      l$authenticated,
    ]);
  }
}

abstract class CopyWith$Variables$Query$FetchEpisode<TRes> {
  factory CopyWith$Variables$Query$FetchEpisode(
    Variables$Query$FetchEpisode instance,
    TRes Function(Variables$Query$FetchEpisode) then,
  ) = _CopyWithImpl$Variables$Query$FetchEpisode;

  factory CopyWith$Variables$Query$FetchEpisode.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$FetchEpisode;

  TRes call({
    String? id,
    Input$EpisodeContext? context,
    bool? authenticated,
  });
}

class _CopyWithImpl$Variables$Query$FetchEpisode<TRes>
    implements CopyWith$Variables$Query$FetchEpisode<TRes> {
  _CopyWithImpl$Variables$Query$FetchEpisode(
    this._instance,
    this._then,
  );

  final Variables$Query$FetchEpisode _instance;

  final TRes Function(Variables$Query$FetchEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? context = _undefined,
    Object? authenticated = _undefined,
  }) =>
      _then(Variables$Query$FetchEpisode._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (context != _undefined)
          'context': (context as Input$EpisodeContext?),
        if (authenticated != _undefined && authenticated != null)
          'authenticated': (authenticated as bool),
      }));
}

class _CopyWithStubImpl$Variables$Query$FetchEpisode<TRes>
    implements CopyWith$Variables$Query$FetchEpisode<TRes> {
  _CopyWithStubImpl$Variables$Query$FetchEpisode(this._res);

  TRes _res;

  call({
    String? id,
    Input$EpisodeContext? context,
    bool? authenticated,
  }) =>
      _res;
}

class Query$FetchEpisode {
  Query$FetchEpisode({
    required this.episode,
    this.$__typename = 'QueryRoot',
  });

  factory Query$FetchEpisode.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode(
      episode: Query$FetchEpisode$episode.fromJson(
          (l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchEpisode$episode episode;

  final String $__typename;

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
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$episode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
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

extension UtilityExtension$Query$FetchEpisode on Query$FetchEpisode {
  CopyWith$Query$FetchEpisode<Query$FetchEpisode> get copyWith =>
      CopyWith$Query$FetchEpisode(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FetchEpisode<TRes> {
  factory CopyWith$Query$FetchEpisode(
    Query$FetchEpisode instance,
    TRes Function(Query$FetchEpisode) then,
  ) = _CopyWithImpl$Query$FetchEpisode;

  factory CopyWith$Query$FetchEpisode.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode;

  TRes call({
    Query$FetchEpisode$episode? episode,
    String? $__typename,
  });
  CopyWith$Query$FetchEpisode$episode<TRes> get episode;
}

class _CopyWithImpl$Query$FetchEpisode<TRes>
    implements CopyWith$Query$FetchEpisode<TRes> {
  _CopyWithImpl$Query$FetchEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode _instance;

  final TRes Function(Query$FetchEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode(
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Query$FetchEpisode$episode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchEpisode$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Query$FetchEpisode$episode(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode<TRes>
    implements CopyWith$Query$FetchEpisode<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode(this._res);

  TRes _res;

  call({
    Query$FetchEpisode$episode? episode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchEpisode$episode<TRes> get episode =>
      CopyWith$Query$FetchEpisode$episode.stub(_res);
}

const documentNodeQueryFetchEpisode = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'FetchEpisode'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'context')),
        type: NamedTypeNode(
          name: NameNode(value: 'EpisodeContext'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'authenticated')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'episode'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'context'),
            value: VariableNode(name: NameNode(value: 'context')),
          ),
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
          FragmentSpreadNode(
            name: NameNode(value: 'PlayableEpisode'),
            directives: [],
          ),
          FieldNode(
            name: NameNode(value: 'uuid'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
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
            name: NameNode(value: 'number'),
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
            name: NameNode(value: 'extraDescription'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'type'),
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
            name: NameNode(value: 'shareRestriction'),
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
            name: NameNode(value: 'availableTo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chapters'),
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
                name: NameNode(value: 'start'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'season'),
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
                name: NameNode(value: 'number'),
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
                name: NameNode(value: 'show'),
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
            name: NameNode(value: 'context'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'EpisodeContext'),
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
            name: NameNode(value: 'relatedItems'),
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
            name: NameNode(value: 'streams'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'BasicStream'),
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
            name: NameNode(value: 'lessons'),
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
            name: NameNode(value: 'inMyList'),
            alias: null,
            arguments: [],
            directives: [
              DirectiveNode(
                name: NameNode(value: 'include'),
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'if'),
                    value: VariableNode(name: NameNode(value: 'authenticated')),
                  )
                ],
              )
            ],
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
  fragmentDefinitionPlayableEpisode,
  fragmentDefinitionBasicStream,
  fragmentDefinitionEpisodeContext,
  fragmentDefinitionSeasonListEpisode,
  fragmentDefinitionGridSectionItem,
  fragmentDefinitionItemSectionItem,
]);
Query$FetchEpisode _parserFn$Query$FetchEpisode(Map<String, dynamic> data) =>
    Query$FetchEpisode.fromJson(data);
typedef OnQueryComplete$Query$FetchEpisode = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$FetchEpisode?,
);

class Options$Query$FetchEpisode
    extends graphql.QueryOptions<Query$FetchEpisode> {
  Options$Query$FetchEpisode({
    String? operationName,
    required Variables$Query$FetchEpisode variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchEpisode? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FetchEpisode? onComplete,
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
                    data == null ? null : _parserFn$Query$FetchEpisode(data),
                  ),
          onError: onError,
          document: documentNodeQueryFetchEpisode,
          parserFn: _parserFn$Query$FetchEpisode,
        );

  final OnQueryComplete$Query$FetchEpisode? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$FetchEpisode
    extends graphql.WatchQueryOptions<Query$FetchEpisode> {
  WatchOptions$Query$FetchEpisode({
    String? operationName,
    required Variables$Query$FetchEpisode variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FetchEpisode? typedOptimisticResult,
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
          document: documentNodeQueryFetchEpisode,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$FetchEpisode,
        );
}

class FetchMoreOptions$Query$FetchEpisode extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FetchEpisode({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$FetchEpisode variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryFetchEpisode,
        );
}

extension ClientExtension$Query$FetchEpisode on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FetchEpisode>> query$FetchEpisode(
          Options$Query$FetchEpisode options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$FetchEpisode> watchQuery$FetchEpisode(
          WatchOptions$Query$FetchEpisode options) =>
      this.watchQuery(options);
  void writeQuery$FetchEpisode({
    required Query$FetchEpisode data,
    required Variables$Query$FetchEpisode variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryFetchEpisode),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$FetchEpisode? readQuery$FetchEpisode({
    required Variables$Query$FetchEpisode variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFetchEpisode),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FetchEpisode.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$FetchEpisode> useQuery$FetchEpisode(
        Options$Query$FetchEpisode options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$FetchEpisode> useWatchQuery$FetchEpisode(
        WatchOptions$Query$FetchEpisode options) =>
    graphql_flutter.useWatchQuery(options);

class Query$FetchEpisode$Widget
    extends graphql_flutter.Query<Query$FetchEpisode> {
  Query$FetchEpisode$Widget({
    widgets.Key? key,
    required Options$Query$FetchEpisode options,
    required graphql_flutter.QueryBuilder<Query$FetchEpisode> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$FetchEpisode$episode implements Fragment$PlayableEpisode {
  Query$FetchEpisode$episode({
    required this.id,
    required this.streams,
    this.context,
    required this.title,
    this.image,
    required this.duration,
    this.season,
    this.$__typename = 'Episode',
    required this.uuid,
    required this.status,
    this.number,
    required this.description,
    required this.extraDescription,
    required this.type,
    this.progress,
    required this.shareRestriction,
    required this.ageRating,
    required this.availableTo,
    required this.chapters,
    this.relatedItems,
    required this.lessons,
    this.inMyList,
  });

  factory Query$FetchEpisode$episode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$streams = json['streams'];
    final l$context = json['context'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$duration = json['duration'];
    final l$season = json['season'];
    final l$$__typename = json['__typename'];
    final l$uuid = json['uuid'];
    final l$status = json['status'];
    final l$number = json['number'];
    final l$description = json['description'];
    final l$extraDescription = json['extraDescription'];
    final l$type = json['type'];
    final l$progress = json['progress'];
    final l$shareRestriction = json['shareRestriction'];
    final l$ageRating = json['ageRating'];
    final l$availableTo = json['availableTo'];
    final l$chapters = json['chapters'];
    final l$relatedItems = json['relatedItems'];
    final l$lessons = json['lessons'];
    final l$inMyList = json['inMyList'];
    return Query$FetchEpisode$episode(
      id: (l$id as String),
      streams: (l$streams as List<dynamic>)
          .map(
              (e) => Fragment$BasicStream.fromJson((e as Map<String, dynamic>)))
          .toList(),
      context: l$context == null
          ? null
          : Query$FetchEpisode$episode$context.fromJson(
              (l$context as Map<String, dynamic>)),
      title: (l$title as String),
      image: (l$image as String?),
      duration: (l$duration as int),
      season: l$season == null
          ? null
          : Query$FetchEpisode$episode$season.fromJson(
              (l$season as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      uuid: (l$uuid as String),
      status: fromJson$Enum$Status((l$status as String)),
      number: (l$number as int?),
      description: (l$description as String),
      extraDescription: (l$extraDescription as String),
      type: fromJson$Enum$EpisodeType((l$type as String)),
      progress: (l$progress as int?),
      shareRestriction:
          fromJson$Enum$ShareRestriction((l$shareRestriction as String)),
      ageRating: (l$ageRating as String),
      availableTo: (l$availableTo as String),
      chapters: (l$chapters as List<dynamic>)
          .map((e) => Query$FetchEpisode$episode$chapters.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      relatedItems: l$relatedItems == null
          ? null
          : Query$FetchEpisode$episode$relatedItems.fromJson(
              (l$relatedItems as Map<String, dynamic>)),
      lessons: Query$FetchEpisode$episode$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      inMyList: (l$inMyList as bool?),
    );
  }

  final String id;

  final List<Fragment$BasicStream> streams;

  final Query$FetchEpisode$episode$context? context;

  final String title;

  final String? image;

  final int duration;

  final Query$FetchEpisode$episode$season? season;

  final String $__typename;

  final String uuid;

  final Enum$Status status;

  final int? number;

  final String description;

  final String extraDescription;

  final Enum$EpisodeType type;

  final int? progress;

  final Enum$ShareRestriction shareRestriction;

  final String ageRating;

  final String availableTo;

  final List<Query$FetchEpisode$episode$chapters> chapters;

  final Query$FetchEpisode$episode$relatedItems? relatedItems;

  final Query$FetchEpisode$episode$lessons lessons;

  final bool? inMyList;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$streams = streams;
    _resultData['streams'] = l$streams.map((e) => e.toJson()).toList();
    final l$context = context;
    _resultData['context'] = l$context?.toJson();
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$uuid = uuid;
    _resultData['uuid'] = l$uuid;
    final l$status = status;
    _resultData['status'] = toJson$Enum$Status(l$status);
    final l$number = number;
    _resultData['number'] = l$number;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$extraDescription = extraDescription;
    _resultData['extraDescription'] = l$extraDescription;
    final l$type = type;
    _resultData['type'] = toJson$Enum$EpisodeType(l$type);
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$shareRestriction = shareRestriction;
    _resultData['shareRestriction'] =
        toJson$Enum$ShareRestriction(l$shareRestriction);
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$availableTo = availableTo;
    _resultData['availableTo'] = l$availableTo;
    final l$chapters = chapters;
    _resultData['chapters'] = l$chapters.map((e) => e.toJson()).toList();
    final l$relatedItems = relatedItems;
    _resultData['relatedItems'] = l$relatedItems?.toJson();
    final l$lessons = lessons;
    _resultData['lessons'] = l$lessons.toJson();
    final l$inMyList = inMyList;
    _resultData['inMyList'] = l$inMyList;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$streams = streams;
    final l$context = context;
    final l$title = title;
    final l$image = image;
    final l$duration = duration;
    final l$season = season;
    final l$$__typename = $__typename;
    final l$uuid = uuid;
    final l$status = status;
    final l$number = number;
    final l$description = description;
    final l$extraDescription = extraDescription;
    final l$type = type;
    final l$progress = progress;
    final l$shareRestriction = shareRestriction;
    final l$ageRating = ageRating;
    final l$availableTo = availableTo;
    final l$chapters = chapters;
    final l$relatedItems = relatedItems;
    final l$lessons = lessons;
    final l$inMyList = inMyList;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$streams.map((v) => v)),
      l$context,
      l$title,
      l$image,
      l$duration,
      l$season,
      l$$__typename,
      l$uuid,
      l$status,
      l$number,
      l$description,
      l$extraDescription,
      l$type,
      l$progress,
      l$shareRestriction,
      l$ageRating,
      l$availableTo,
      Object.hashAll(l$chapters.map((v) => v)),
      l$relatedItems,
      l$lessons,
      l$inMyList,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$streams = streams;
    final lOther$streams = other.streams;
    if (l$streams.length != lOther$streams.length) {
      return false;
    }
    for (int i = 0; i < l$streams.length; i++) {
      final l$streams$entry = l$streams[i];
      final lOther$streams$entry = lOther$streams[i];
      if (l$streams$entry != lOther$streams$entry) {
        return false;
      }
    }
    final l$context = context;
    final lOther$context = other.context;
    if (l$context != lOther$context) {
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$uuid = uuid;
    final lOther$uuid = other.uuid;
    if (l$uuid != lOther$uuid) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$extraDescription = extraDescription;
    final lOther$extraDescription = other.extraDescription;
    if (l$extraDescription != lOther$extraDescription) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$shareRestriction = shareRestriction;
    final lOther$shareRestriction = other.shareRestriction;
    if (l$shareRestriction != lOther$shareRestriction) {
      return false;
    }
    final l$ageRating = ageRating;
    final lOther$ageRating = other.ageRating;
    if (l$ageRating != lOther$ageRating) {
      return false;
    }
    final l$availableTo = availableTo;
    final lOther$availableTo = other.availableTo;
    if (l$availableTo != lOther$availableTo) {
      return false;
    }
    final l$chapters = chapters;
    final lOther$chapters = other.chapters;
    if (l$chapters.length != lOther$chapters.length) {
      return false;
    }
    for (int i = 0; i < l$chapters.length; i++) {
      final l$chapters$entry = l$chapters[i];
      final lOther$chapters$entry = lOther$chapters[i];
      if (l$chapters$entry != lOther$chapters$entry) {
        return false;
      }
    }
    final l$relatedItems = relatedItems;
    final lOther$relatedItems = other.relatedItems;
    if (l$relatedItems != lOther$relatedItems) {
      return false;
    }
    final l$lessons = lessons;
    final lOther$lessons = other.lessons;
    if (l$lessons != lOther$lessons) {
      return false;
    }
    final l$inMyList = inMyList;
    final lOther$inMyList = other.inMyList;
    if (l$inMyList != lOther$inMyList) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchEpisode$episode
    on Query$FetchEpisode$episode {
  CopyWith$Query$FetchEpisode$episode<Query$FetchEpisode$episode>
      get copyWith => CopyWith$Query$FetchEpisode$episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode<TRes> {
  factory CopyWith$Query$FetchEpisode$episode(
    Query$FetchEpisode$episode instance,
    TRes Function(Query$FetchEpisode$episode) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode;

  factory CopyWith$Query$FetchEpisode$episode.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode;

  TRes call({
    String? id,
    List<Fragment$BasicStream>? streams,
    Query$FetchEpisode$episode$context? context,
    String? title,
    String? image,
    int? duration,
    Query$FetchEpisode$episode$season? season,
    String? $__typename,
    String? uuid,
    Enum$Status? status,
    int? number,
    String? description,
    String? extraDescription,
    Enum$EpisodeType? type,
    int? progress,
    Enum$ShareRestriction? shareRestriction,
    String? ageRating,
    String? availableTo,
    List<Query$FetchEpisode$episode$chapters>? chapters,
    Query$FetchEpisode$episode$relatedItems? relatedItems,
    Query$FetchEpisode$episode$lessons? lessons,
    bool? inMyList,
  });
  TRes streams(
      Iterable<Fragment$BasicStream> Function(
              Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
          _fn);
  CopyWith$Query$FetchEpisode$episode$context<TRes> get context;
  CopyWith$Query$FetchEpisode$episode$season<TRes> get season;
  TRes chapters(
      Iterable<Query$FetchEpisode$episode$chapters> Function(
              Iterable<
                  CopyWith$Query$FetchEpisode$episode$chapters<
                      Query$FetchEpisode$episode$chapters>>)
          _fn);
  CopyWith$Query$FetchEpisode$episode$relatedItems<TRes> get relatedItems;
  CopyWith$Query$FetchEpisode$episode$lessons<TRes> get lessons;
}

class _CopyWithImpl$Query$FetchEpisode$episode<TRes>
    implements CopyWith$Query$FetchEpisode$episode<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode _instance;

  final TRes Function(Query$FetchEpisode$episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? streams = _undefined,
    Object? context = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? duration = _undefined,
    Object? season = _undefined,
    Object? $__typename = _undefined,
    Object? uuid = _undefined,
    Object? status = _undefined,
    Object? number = _undefined,
    Object? description = _undefined,
    Object? extraDescription = _undefined,
    Object? type = _undefined,
    Object? progress = _undefined,
    Object? shareRestriction = _undefined,
    Object? ageRating = _undefined,
    Object? availableTo = _undefined,
    Object? chapters = _undefined,
    Object? relatedItems = _undefined,
    Object? lessons = _undefined,
    Object? inMyList = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        streams: streams == _undefined || streams == null
            ? _instance.streams
            : (streams as List<Fragment$BasicStream>),
        context: context == _undefined
            ? _instance.context
            : (context as Query$FetchEpisode$episode$context?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        season: season == _undefined
            ? _instance.season
            : (season as Query$FetchEpisode$episode$season?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        uuid: uuid == _undefined || uuid == null
            ? _instance.uuid
            : (uuid as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$Status),
        number: number == _undefined ? _instance.number : (number as int?),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        extraDescription:
            extraDescription == _undefined || extraDescription == null
                ? _instance.extraDescription
                : (extraDescription as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$EpisodeType),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        shareRestriction:
            shareRestriction == _undefined || shareRestriction == null
                ? _instance.shareRestriction
                : (shareRestriction as Enum$ShareRestriction),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        availableTo: availableTo == _undefined || availableTo == null
            ? _instance.availableTo
            : (availableTo as String),
        chapters: chapters == _undefined || chapters == null
            ? _instance.chapters
            : (chapters as List<Query$FetchEpisode$episode$chapters>),
        relatedItems: relatedItems == _undefined
            ? _instance.relatedItems
            : (relatedItems as Query$FetchEpisode$episode$relatedItems?),
        lessons: lessons == _undefined || lessons == null
            ? _instance.lessons
            : (lessons as Query$FetchEpisode$episode$lessons),
        inMyList:
            inMyList == _undefined ? _instance.inMyList : (inMyList as bool?),
      ));
  TRes streams(
          Iterable<Fragment$BasicStream> Function(
                  Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
              _fn) =>
      call(
          streams:
              _fn(_instance.streams.map((e) => CopyWith$Fragment$BasicStream(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Query$FetchEpisode$episode$context<TRes> get context {
    final local$context = _instance.context;
    return local$context == null
        ? CopyWith$Query$FetchEpisode$episode$context.stub(_then(_instance))
        : CopyWith$Query$FetchEpisode$episode$context(
            local$context, (e) => call(context: e));
  }

  CopyWith$Query$FetchEpisode$episode$season<TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$FetchEpisode$episode$season.stub(_then(_instance))
        : CopyWith$Query$FetchEpisode$episode$season(
            local$season, (e) => call(season: e));
  }

  TRes chapters(
          Iterable<Query$FetchEpisode$episode$chapters> Function(
                  Iterable<
                      CopyWith$Query$FetchEpisode$episode$chapters<
                          Query$FetchEpisode$episode$chapters>>)
              _fn) =>
      call(
          chapters: _fn(_instance.chapters
              .map((e) => CopyWith$Query$FetchEpisode$episode$chapters(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Query$FetchEpisode$episode$relatedItems<TRes> get relatedItems {
    final local$relatedItems = _instance.relatedItems;
    return local$relatedItems == null
        ? CopyWith$Query$FetchEpisode$episode$relatedItems.stub(
            _then(_instance))
        : CopyWith$Query$FetchEpisode$episode$relatedItems(
            local$relatedItems, (e) => call(relatedItems: e));
  }

  CopyWith$Query$FetchEpisode$episode$lessons<TRes> get lessons {
    final local$lessons = _instance.lessons;
    return CopyWith$Query$FetchEpisode$episode$lessons(
        local$lessons, (e) => call(lessons: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode<TRes>
    implements CopyWith$Query$FetchEpisode$episode<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode(this._res);

  TRes _res;

  call({
    String? id,
    List<Fragment$BasicStream>? streams,
    Query$FetchEpisode$episode$context? context,
    String? title,
    String? image,
    int? duration,
    Query$FetchEpisode$episode$season? season,
    String? $__typename,
    String? uuid,
    Enum$Status? status,
    int? number,
    String? description,
    String? extraDescription,
    Enum$EpisodeType? type,
    int? progress,
    Enum$ShareRestriction? shareRestriction,
    String? ageRating,
    String? availableTo,
    List<Query$FetchEpisode$episode$chapters>? chapters,
    Query$FetchEpisode$episode$relatedItems? relatedItems,
    Query$FetchEpisode$episode$lessons? lessons,
    bool? inMyList,
  }) =>
      _res;
  streams(_fn) => _res;
  CopyWith$Query$FetchEpisode$episode$context<TRes> get context =>
      CopyWith$Query$FetchEpisode$episode$context.stub(_res);
  CopyWith$Query$FetchEpisode$episode$season<TRes> get season =>
      CopyWith$Query$FetchEpisode$episode$season.stub(_res);
  chapters(_fn) => _res;
  CopyWith$Query$FetchEpisode$episode$relatedItems<TRes> get relatedItems =>
      CopyWith$Query$FetchEpisode$episode$relatedItems.stub(_res);
  CopyWith$Query$FetchEpisode$episode$lessons<TRes> get lessons =>
      CopyWith$Query$FetchEpisode$episode$lessons.stub(_res);
}

class Query$FetchEpisode$episode$context
    implements Fragment$PlayableEpisode$context, Fragment$EpisodeContext {
  Query$FetchEpisode$episode$context({required this.$__typename});

  factory Query$FetchEpisode$episode$context.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ContextCollection":
        return Query$FetchEpisode$episode$context$$ContextCollection.fromJson(
            json);

      case "Season":
        return Query$FetchEpisode$episode$context$$Season.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchEpisode$episode$context(
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
    if (!(other is Query$FetchEpisode$episode$context) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context
    on Query$FetchEpisode$episode$context {
  CopyWith$Query$FetchEpisode$episode$context<
          Query$FetchEpisode$episode$context>
      get copyWith => CopyWith$Query$FetchEpisode$episode$context(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(Query$FetchEpisode$episode$context$$ContextCollection)
        contextCollection,
    required _T Function(Query$FetchEpisode$episode$context$$Season) season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        return contextCollection(
            this as Query$FetchEpisode$episode$context$$ContextCollection);

      case "Season":
        return season(this as Query$FetchEpisode$episode$context$$Season);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$FetchEpisode$episode$context$$ContextCollection)?
        contextCollection,
    _T Function(Query$FetchEpisode$episode$context$$Season)? season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        if (contextCollection != null) {
          return contextCollection(
              this as Query$FetchEpisode$episode$context$$ContextCollection);
        } else {
          return orElse();
        }

      case "Season":
        if (season != null) {
          return season(this as Query$FetchEpisode$episode$context$$Season);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$FetchEpisode$episode$context<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context(
    Query$FetchEpisode$episode$context instance,
    TRes Function(Query$FetchEpisode$episode$context) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context;

  factory CopyWith$Query$FetchEpisode$episode$context.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchEpisode$episode$context<TRes>
    implements CopyWith$Query$FetchEpisode$episode$context<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context _instance;

  final TRes Function(Query$FetchEpisode$episode$context) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$FetchEpisode$episode$context(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context<TRes>
    implements CopyWith$Query$FetchEpisode$episode$context<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchEpisode$episode$context$$ContextCollection
    implements
        Fragment$PlayableEpisode$context$$ContextCollection,
        Fragment$EpisodeContext$$ContextCollection,
        Query$FetchEpisode$episode$context {
  Query$FetchEpisode$episode$context$$ContextCollection({
    required this.id,
    this.$__typename = 'ContextCollection',
    this.items,
  });

  factory Query$FetchEpisode$episode$context$$ContextCollection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    final l$items = json['items'];
    return Query$FetchEpisode$episode$context$$ContextCollection(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
      items: l$items == null
          ? null
          : Query$FetchEpisode$episode$context$$ContextCollection$items
              .fromJson((l$items as Map<String, dynamic>)),
    );
  }

  final String id;

  final String $__typename;

  final Query$FetchEpisode$episode$context$$ContextCollection$items? items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$items = items;
    _resultData['items'] = l$items?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    final l$items = items;
    return Object.hashAll([
      l$id,
      l$$__typename,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode$context$$ContextCollection) ||
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
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection
    on Query$FetchEpisode$episode$context$$ContextCollection {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection<
          Query$FetchEpisode$episode$context$$ContextCollection>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection(
    Query$FetchEpisode$episode$context$$ContextCollection instance,
    TRes Function(Query$FetchEpisode$episode$context$$ContextCollection) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection;

  TRes call({
    String? id,
    String? $__typename,
    Query$FetchEpisode$episode$context$$ContextCollection$items? items,
  });
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection<TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection _instance;

  final TRes Function(Query$FetchEpisode$episode$context$$ContextCollection)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$context$$ContextCollection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        items: items == _undefined
            ? _instance.items
            : (items
                as Query$FetchEpisode$episode$context$$ContextCollection$items?),
      ));
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items<TRes>
      get items {
    final local$items = _instance.items;
    return local$items == null
        ? CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items
            .stub(_then(_instance))
        : CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items(
            local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
    Query$FetchEpisode$episode$context$$ContextCollection$items? items,
  }) =>
      _res;
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items<TRes>
      get items =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items
              .stub(_res);
}

class Query$FetchEpisode$episode$context$$Season
    implements
        Fragment$PlayableEpisode$context$$Season,
        Fragment$EpisodeContext$$Season,
        Query$FetchEpisode$episode$context {
  Query$FetchEpisode$episode$context$$Season({
    this.$__typename = 'Season',
    required this.id,
    required this.title,
    required this.number,
    required this.episodes,
    required this.$show,
  });

  factory Query$FetchEpisode$episode$context$$Season.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$title = json['title'];
    final l$number = json['number'];
    final l$episodes = json['episodes'];
    final l$$show = json['show'];
    return Query$FetchEpisode$episode$context$$Season(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      title: (l$title as String),
      number: (l$number as int),
      episodes: Query$FetchEpisode$episode$context$$Season$episodes.fromJson(
          (l$episodes as Map<String, dynamic>)),
      $show: Query$FetchEpisode$episode$context$$Season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final String title;

  final int number;

  final Query$FetchEpisode$episode$context$$Season$episodes episodes;

  final Query$FetchEpisode$episode$context$$Season$show $show;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes.toJson();
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$title = title;
    final l$number = number;
    final l$episodes = episodes;
    final l$$show = $show;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$title,
      l$number,
      l$episodes,
      l$$show,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode$context$$Season) ||
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
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$episodes = episodes;
    final lOther$episodes = other.episodes;
    if (l$episodes != lOther$episodes) {
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$Season
    on Query$FetchEpisode$episode$context$$Season {
  CopyWith$Query$FetchEpisode$episode$context$$Season<
          Query$FetchEpisode$episode$context$$Season>
      get copyWith => CopyWith$Query$FetchEpisode$episode$context$$Season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$Season<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$Season(
    Query$FetchEpisode$episode$context$$Season instance,
    TRes Function(Query$FetchEpisode$episode$context$$Season) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$Season;

  factory CopyWith$Query$FetchEpisode$episode$context$$Season.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season;

  TRes call({
    String? $__typename,
    String? id,
    String? title,
    int? number,
    Query$FetchEpisode$episode$context$$Season$episodes? episodes,
    Query$FetchEpisode$episode$context$$Season$show? $show,
  });
  CopyWith$Query$FetchEpisode$episode$context$$Season$episodes<TRes>
      get episodes;
  CopyWith$Query$FetchEpisode$episode$context$$Season$show<TRes> get $show;
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$Season<TRes>
    implements CopyWith$Query$FetchEpisode$episode$context$$Season<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$Season(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$Season _instance;

  final TRes Function(Query$FetchEpisode$episode$context$$Season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? title = _undefined,
    Object? number = _undefined,
    Object? episodes = _undefined,
    Object? $show = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$context$$Season(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        episodes: episodes == _undefined || episodes == null
            ? _instance.episodes
            : (episodes as Query$FetchEpisode$episode$context$$Season$episodes),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Query$FetchEpisode$episode$context$$Season$show),
      ));
  CopyWith$Query$FetchEpisode$episode$context$$Season$episodes<TRes>
      get episodes {
    final local$episodes = _instance.episodes;
    return CopyWith$Query$FetchEpisode$episode$context$$Season$episodes(
        local$episodes, (e) => call(episodes: e));
  }

  CopyWith$Query$FetchEpisode$episode$context$$Season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$FetchEpisode$episode$context$$Season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season<TRes>
    implements CopyWith$Query$FetchEpisode$episode$context$$Season<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    String? title,
    int? number,
    Query$FetchEpisode$episode$context$$Season$episodes? episodes,
    Query$FetchEpisode$episode$context$$Season$show? $show,
  }) =>
      _res;
  CopyWith$Query$FetchEpisode$episode$context$$Season$episodes<TRes>
      get episodes =>
          CopyWith$Query$FetchEpisode$episode$context$$Season$episodes.stub(
              _res);
  CopyWith$Query$FetchEpisode$episode$context$$Season$show<TRes> get $show =>
      CopyWith$Query$FetchEpisode$episode$context$$Season$show.stub(_res);
}

class Query$FetchEpisode$episode$season
    implements Fragment$PlayableEpisode$season {
  Query$FetchEpisode$episode$season({
    required this.id,
    required this.title,
    required this.$show,
    this.$__typename = 'Season',
    required this.number,
  });

  factory Query$FetchEpisode$episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    final l$number = json['number'];
    return Query$FetchEpisode$episode$season(
      id: (l$id as String),
      title: (l$title as String),
      $show: Query$FetchEpisode$episode$season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      number: (l$number as int),
    );
  }

  final String id;

  final String title;

  final Query$FetchEpisode$episode$season$show $show;

  final String $__typename;

  final int number;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$number = number;
    _resultData['number'] = l$number;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$show = $show;
    final l$$__typename = $__typename;
    final l$number = number;
    return Object.hashAll([
      l$id,
      l$title,
      l$$show,
      l$$__typename,
      l$number,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode$season) ||
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
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchEpisode$episode$season
    on Query$FetchEpisode$episode$season {
  CopyWith$Query$FetchEpisode$episode$season<Query$FetchEpisode$episode$season>
      get copyWith => CopyWith$Query$FetchEpisode$episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$season<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$season(
    Query$FetchEpisode$episode$season instance,
    TRes Function(Query$FetchEpisode$episode$season) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$season;

  factory CopyWith$Query$FetchEpisode$episode$season.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$season;

  TRes call({
    String? id,
    String? title,
    Query$FetchEpisode$episode$season$show? $show,
    String? $__typename,
    int? number,
  });
  CopyWith$Query$FetchEpisode$episode$season$show<TRes> get $show;
}

class _CopyWithImpl$Query$FetchEpisode$episode$season<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$season(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$season _instance;

  final TRes Function(Query$FetchEpisode$episode$season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$season(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Query$FetchEpisode$episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
      ));
  CopyWith$Query$FetchEpisode$episode$season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$FetchEpisode$episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$season<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$season(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    Query$FetchEpisode$episode$season$show? $show,
    String? $__typename,
    int? number,
  }) =>
      _res;
  CopyWith$Query$FetchEpisode$episode$season$show<TRes> get $show =>
      CopyWith$Query$FetchEpisode$episode$season$show.stub(_res);
}

class Query$FetchEpisode$episode$season$show
    implements Fragment$PlayableEpisode$season$show {
  Query$FetchEpisode$episode$season$show({
    required this.id,
    required this.title,
    this.$__typename = 'Show',
  });

  factory Query$FetchEpisode$episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$season$show(
      id: (l$id as String),
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

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
    if (!(other is Query$FetchEpisode$episode$season$show) ||
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
    return true;
  }
}

extension UtilityExtension$Query$FetchEpisode$episode$season$show
    on Query$FetchEpisode$episode$season$show {
  CopyWith$Query$FetchEpisode$episode$season$show<
          Query$FetchEpisode$episode$season$show>
      get copyWith => CopyWith$Query$FetchEpisode$episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$season$show<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$season$show(
    Query$FetchEpisode$episode$season$show instance,
    TRes Function(Query$FetchEpisode$episode$season$show) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$season$show;

  factory CopyWith$Query$FetchEpisode$episode$season$show.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$season$show;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchEpisode$episode$season$show<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season$show<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$season$show(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$season$show _instance;

  final TRes Function(Query$FetchEpisode$episode$season$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$season$show(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$season$show<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season$show<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$season$show(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchEpisode$episode$chapters {
  Query$FetchEpisode$episode$chapters({
    required this.id,
    required this.start,
    required this.title,
    this.description,
    this.$__typename = 'Chapter',
  });

  factory Query$FetchEpisode$episode$chapters.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$start = json['start'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$chapters(
      id: (l$id as String),
      start: (l$start as int),
      title: (l$title as String),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int start;

  final String title;

  final String? description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$start = start;
    _resultData['start'] = l$start;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$start = start;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$start,
      l$title,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode$chapters) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$start = start;
    final lOther$start = other.start;
    if (l$start != lOther$start) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchEpisode$episode$chapters
    on Query$FetchEpisode$episode$chapters {
  CopyWith$Query$FetchEpisode$episode$chapters<
          Query$FetchEpisode$episode$chapters>
      get copyWith => CopyWith$Query$FetchEpisode$episode$chapters(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$chapters<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$chapters(
    Query$FetchEpisode$episode$chapters instance,
    TRes Function(Query$FetchEpisode$episode$chapters) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$chapters;

  factory CopyWith$Query$FetchEpisode$episode$chapters.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$chapters;

  TRes call({
    String? id,
    int? start,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchEpisode$episode$chapters<TRes>
    implements CopyWith$Query$FetchEpisode$episode$chapters<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$chapters(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$chapters _instance;

  final TRes Function(Query$FetchEpisode$episode$chapters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? start = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$chapters(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        start: start == _undefined || start == null
            ? _instance.start
            : (start as int),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$chapters<TRes>
    implements CopyWith$Query$FetchEpisode$episode$chapters<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$chapters(this._res);

  TRes _res;

  call({
    String? id,
    int? start,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchEpisode$episode$context$$ContextCollection$items
    implements Fragment$EpisodeContext$$ContextCollection$items {
  Query$FetchEpisode$episode$context$$ContextCollection$items({
    required this.items,
    this.$__typename = 'SectionItemPagination',
  });

  factory Query$FetchEpisode$episode$context$$ContextCollection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$ContextCollection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchEpisode$episode$context$$ContextCollection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FetchEpisode$episode$context$$ContextCollection$items$items>
      items;

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
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items
    on Query$FetchEpisode$episode$context$$ContextCollection$items {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items<
          Query$FetchEpisode$episode$context$$ContextCollection$items>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items(
    Query$FetchEpisode$episode$context$$ContextCollection$items instance,
    TRes Function(Query$FetchEpisode$episode$context$$ContextCollection$items)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items;

  TRes call({
    List<Query$FetchEpisode$episode$context$$ContextCollection$items$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchEpisode$episode$context$$ContextCollection$items$items> Function(
              Iterable<
                  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items<
                      Query$FetchEpisode$episode$context$$ContextCollection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items _instance;

  final TRes Function(
      Query$FetchEpisode$episode$context$$ContextCollection$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$context$$ContextCollection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchEpisode$episode$context$$ContextCollection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchEpisode$episode$context$$ContextCollection$items$items> Function(
                  Iterable<
                      CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items<
                          Query$FetchEpisode$episode$context$$ContextCollection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items(
      this._res);

  TRes _res;

  call({
    List<Query$FetchEpisode$episode$context$$ContextCollection$items$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchEpisode$episode$context$$ContextCollection$items$items
    implements Fragment$EpisodeContext$$ContextCollection$items$items {
  Query$FetchEpisode$episode$context$$ContextCollection$items$items({
    required this.item,
    this.$__typename = 'SectionItem',
  });

  factory Query$FetchEpisode$episode$context$$ContextCollection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$ContextCollection$items$items(
      item:
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item
              .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items$item
      item;

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
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items$items) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items$items
    on Query$FetchEpisode$episode$context$$ContextCollection$items$items {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items<
          Query$FetchEpisode$episode$context$$ContextCollection$items$items>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items(
    Query$FetchEpisode$episode$context$$ContextCollection$items$items instance,
    TRes Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items;

  TRes call({
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item?
        item,
    String? $__typename,
  });
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items
      _instance;

  final TRes Function(
      Query$FetchEpisode$episode$context$$ContextCollection$items$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$context$$ContextCollection$items$items(
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items(
      this._res);

  TRes _res;

  call({
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item?
        item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item
              .stub(_res);
}

class Query$FetchEpisode$episode$context$$ContextCollection$items$items$item
    implements Fragment$EpisodeContext$$ContextCollection$items$items$item {
  Query$FetchEpisode$episode$context$$ContextCollection$items$items$item(
      {required this.$__typename});

  factory Query$FetchEpisode$episode$context$$ContextCollection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Show":
        return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show
            .fromJson(json);

      case "Season":
        return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season
            .fromJson(json);

      case "Episode":
        return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode
            .fromJson(json);

      case "Page":
        return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page
            .fromJson(json);

      case "Link":
        return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link
            .fromJson(json);

      case "StudyTopic":
        return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic
            .fromJson(json);

      case "Game":
        return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item(
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
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items$items$item) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item
    on Query$FetchEpisode$episode$context$$ContextCollection$items$items$item {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item<
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show)
        show,
    required _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season)
        season,
    required _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode)
        episode,
    required _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page)
        page,
    required _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link)
        link,
    required _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic)
        studyTopic,
    required _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game)
        game,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Show":
        return show(this
            as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show);

      case "Season":
        return season(this
            as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season);

      case "Episode":
        return episode(this
            as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode);

      case "Page":
        return page(this
            as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page);

      case "Link":
        return link(this
            as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link);

      case "StudyTopic":
        return studyTopic(this
            as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic);

      case "Game":
        return game(this
            as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show)?
        show,
    _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season)?
        season,
    _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode)?
        episode,
    _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page)?
        page,
    _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link)?
        link,
    _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic)?
        studyTopic,
    _T Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game)?
        game,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Show":
        if (show != null) {
          return show(this
              as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show);
        } else {
          return orElse();
        }

      case "Season":
        if (season != null) {
          return season(this
              as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season);
        } else {
          return orElse();
        }

      case "Episode":
        if (episode != null) {
          return episode(this
              as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode);
        } else {
          return orElse();
        }

      case "Page":
        if (page != null) {
          return page(this
              as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page);
        } else {
          return orElse();
        }

      case "Link":
        if (link != null) {
          return link(this
              as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link);
        } else {
          return orElse();
        }

      case "StudyTopic":
        if (studyTopic != null) {
          return studyTopic(this
              as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic);
        } else {
          return orElse();
        }

      case "Game":
        if (game != null) {
          return game(this
              as Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item(
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item
        instance,
    TRes Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items$item
      _instance;

  final TRes Function(
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchEpisode$episode$context$$ContextCollection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show
    implements
        Fragment$EpisodeContext$$ContextCollection$items$items$item$$Show,
        Query$FetchEpisode$episode$context$$ContextCollection$items$items$item {
  Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show(
      {this.$__typename = 'Show'});

  factory Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show(
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
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show
    on Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show<
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show(
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show
        instance,
    TRes Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season
    implements
        Fragment$EpisodeContext$$ContextCollection$items$items$item$$Season,
        Query$FetchEpisode$episode$context$$ContextCollection$items$items$item {
  Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season(
      {this.$__typename = 'Season'});

  factory Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season(
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
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season
    on Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season<
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season(
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season
        instance,
    TRes Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season
      _instance;

  final TRes Function(
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Season(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode
    implements
        Fragment$SeasonListEpisode,
        Query$FetchEpisode$episode$context$$ContextCollection$items$items$item {
  Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode({
    required this.id,
    this.image,
    this.number,
    required this.title,
    required this.publishDate,
    required this.ageRating,
    required this.duration,
    required this.locked,
    required this.lessons,
    this.$__typename = 'Episode',
  });

  factory Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$number = json['number'];
    final l$title = json['title'];
    final l$publishDate = json['publishDate'];
    final l$ageRating = json['ageRating'];
    final l$duration = json['duration'];
    final l$locked = json['locked'];
    final l$lessons = json['lessons'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode(
      id: (l$id as String),
      image: (l$image as String?),
      number: (l$number as int?),
      title: (l$title as String),
      publishDate: (l$publishDate as String),
      ageRating: (l$ageRating as String),
      duration: (l$duration as int),
      locked: (l$locked as bool),
      lessons: Fragment$SeasonListEpisode$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? image;

  final int? number;

  final String title;

  final String publishDate;

  final String ageRating;

  final int duration;

  final bool locked;

  final Fragment$SeasonListEpisode$lessons lessons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$locked = locked;
    _resultData['locked'] = l$locked;
    final l$lessons = lessons;
    _resultData['lessons'] = l$lessons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$number = number;
    final l$title = title;
    final l$publishDate = publishDate;
    final l$ageRating = ageRating;
    final l$duration = duration;
    final l$locked = locked;
    final l$lessons = lessons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$number,
      l$title,
      l$publishDate,
      l$ageRating,
      l$duration,
      l$locked,
      l$lessons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
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
    final l$locked = locked;
    final lOther$locked = other.locked;
    if (l$locked != lOther$locked) {
      return false;
    }
    final l$lessons = lessons;
    final lOther$lessons = other.lessons;
    if (l$lessons != lOther$lessons) {
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode
    on Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode<
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode(
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode;

  TRes call({
    String? id,
    String? image,
    int? number,
    String? title,
    String? publishDate,
    String? ageRating,
    int? duration,
    bool? locked,
    Fragment$SeasonListEpisode$lessons? lessons,
    String? $__typename,
  });
  CopyWith$Fragment$SeasonListEpisode$lessons<TRes> get lessons;
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? number = _undefined,
    Object? title = _undefined,
    Object? publishDate = _undefined,
    Object? ageRating = _undefined,
    Object? duration = _undefined,
    Object? locked = _undefined,
    Object? lessons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        number: number == _undefined ? _instance.number : (number as int?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        locked: locked == _undefined || locked == null
            ? _instance.locked
            : (locked as bool),
        lessons: lessons == _undefined || lessons == null
            ? _instance.lessons
            : (lessons as Fragment$SeasonListEpisode$lessons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$SeasonListEpisode$lessons<TRes> get lessons {
    final local$lessons = _instance.lessons;
    return CopyWith$Fragment$SeasonListEpisode$lessons(
        local$lessons, (e) => call(lessons: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? image,
    int? number,
    String? title,
    String? publishDate,
    String? ageRating,
    int? duration,
    bool? locked,
    Fragment$SeasonListEpisode$lessons? lessons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$SeasonListEpisode$lessons<TRes> get lessons =>
      CopyWith$Fragment$SeasonListEpisode$lessons.stub(_res);
}

class Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page
    implements
        Fragment$EpisodeContext$$ContextCollection$items$items$item$$Page,
        Query$FetchEpisode$episode$context$$ContextCollection$items$items$item {
  Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page(
      {this.$__typename = 'Page'});

  factory Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page(
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
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page
    on Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page<
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page(
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page
        instance,
    TRes Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link
    implements
        Fragment$EpisodeContext$$ContextCollection$items$items$item$$Link,
        Query$FetchEpisode$episode$context$$ContextCollection$items$items$item {
  Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link(
      {this.$__typename = 'Link'});

  factory Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link(
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
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link
    on Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link<
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link(
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link
        instance,
    TRes Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic
    implements
        Fragment$EpisodeContext$$ContextCollection$items$items$item$$StudyTopic,
        Query$FetchEpisode$episode$context$$ContextCollection$items$items$item {
  Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic(
      {this.$__typename = 'StudyTopic'});

  factory Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic(
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
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic
    on Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic<
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic(
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic
        instance,
    TRes Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic
      _instance;

  final TRes Function(
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$StudyTopic(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game
    implements
        Fragment$EpisodeContext$$ContextCollection$items$items$item$$Game,
        Query$FetchEpisode$episode$context$$ContextCollection$items$items$item {
  Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game(
      {this.$__typename = 'Game'});

  factory Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game(
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
    if (!(other
            is Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game
    on Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game {
  CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game<
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game(
    Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game
        instance,
    TRes Function(
            Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game;

  factory CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game
      _instance;

  final TRes Function(
          Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$ContextCollection$items$items$item$$Game(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchEpisode$episode$context$$Season$episodes
    implements Fragment$EpisodeContext$$Season$episodes {
  Query$FetchEpisode$episode$context$$Season$episodes({
    required this.items,
    this.$__typename = 'EpisodePagination',
  });

  factory Query$FetchEpisode$episode$context$$Season$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$Season$episodes(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$SeasonListEpisode.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$SeasonListEpisode> items;

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
    if (!(other is Query$FetchEpisode$episode$context$$Season$episodes) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$Season$episodes
    on Query$FetchEpisode$episode$context$$Season$episodes {
  CopyWith$Query$FetchEpisode$episode$context$$Season$episodes<
          Query$FetchEpisode$episode$context$$Season$episodes>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$Season$episodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$Season$episodes<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$Season$episodes(
    Query$FetchEpisode$episode$context$$Season$episodes instance,
    TRes Function(Query$FetchEpisode$episode$context$$Season$episodes) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$episodes;

  factory CopyWith$Query$FetchEpisode$episode$context$$Season$episodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$episodes;

  TRes call({
    List<Fragment$SeasonListEpisode>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$SeasonListEpisode> Function(
              Iterable<
                  CopyWith$Fragment$SeasonListEpisode<
                      Fragment$SeasonListEpisode>>)
          _fn);
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$episodes<TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$Season$episodes<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$episodes(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$Season$episodes _instance;

  final TRes Function(Query$FetchEpisode$episode$context$$Season$episodes)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$context$$Season$episodes(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$SeasonListEpisode>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$SeasonListEpisode> Function(
                  Iterable<
                      CopyWith$Fragment$SeasonListEpisode<
                          Fragment$SeasonListEpisode>>)
              _fn) =>
      call(
          items: _fn(
              _instance.items.map((e) => CopyWith$Fragment$SeasonListEpisode(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$episodes<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$Season$episodes<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$episodes(
      this._res);

  TRes _res;

  call({
    List<Fragment$SeasonListEpisode>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchEpisode$episode$context$$Season$show
    implements Fragment$EpisodeContext$$Season$show {
  Query$FetchEpisode$episode$context$$Season$show({
    required this.id,
    required this.title,
    required this.type,
    required this.seasons,
    this.$__typename = 'Show',
  });

  factory Query$FetchEpisode$episode$context$$Season$show.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$type = json['type'];
    final l$seasons = json['seasons'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$Season$show(
      id: (l$id as String),
      title: (l$title as String),
      type: fromJson$Enum$ShowType((l$type as String)),
      seasons: Query$FetchEpisode$episode$context$$Season$show$seasons.fromJson(
          (l$seasons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final Enum$ShowType type;

  final Query$FetchEpisode$episode$context$$Season$show$seasons seasons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$type = type;
    _resultData['type'] = toJson$Enum$ShowType(l$type);
    final l$seasons = seasons;
    _resultData['seasons'] = l$seasons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$type = type;
    final l$seasons = seasons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$type,
      l$seasons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode$context$$Season$show) ||
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
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$seasons = seasons;
    final lOther$seasons = other.seasons;
    if (l$seasons != lOther$seasons) {
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$Season$show
    on Query$FetchEpisode$episode$context$$Season$show {
  CopyWith$Query$FetchEpisode$episode$context$$Season$show<
          Query$FetchEpisode$episode$context$$Season$show>
      get copyWith => CopyWith$Query$FetchEpisode$episode$context$$Season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$Season$show<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$Season$show(
    Query$FetchEpisode$episode$context$$Season$show instance,
    TRes Function(Query$FetchEpisode$episode$context$$Season$show) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$show;

  factory CopyWith$Query$FetchEpisode$episode$context$$Season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$show;

  TRes call({
    String? id,
    String? title,
    Enum$ShowType? type,
    Query$FetchEpisode$episode$context$$Season$show$seasons? seasons,
    String? $__typename,
  });
  CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons<TRes>
      get seasons;
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$show<TRes>
    implements CopyWith$Query$FetchEpisode$episode$context$$Season$show<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$show(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$Season$show _instance;

  final TRes Function(Query$FetchEpisode$episode$context$$Season$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? type = _undefined,
    Object? seasons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$context$$Season$show(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$ShowType),
        seasons: seasons == _undefined || seasons == null
            ? _instance.seasons
            : (seasons
                as Query$FetchEpisode$episode$context$$Season$show$seasons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons<TRes>
      get seasons {
    final local$seasons = _instance.seasons;
    return CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons(
        local$seasons, (e) => call(seasons: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$show<TRes>
    implements CopyWith$Query$FetchEpisode$episode$context$$Season$show<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$show(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    Enum$ShowType? type,
    Query$FetchEpisode$episode$context$$Season$show$seasons? seasons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons<TRes>
      get seasons =>
          CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons.stub(
              _res);
}

class Query$FetchEpisode$episode$context$$Season$show$seasons
    implements Fragment$EpisodeContext$$Season$show$seasons {
  Query$FetchEpisode$episode$context$$Season$show$seasons({
    required this.items,
    this.$__typename = 'SeasonPagination',
  });

  factory Query$FetchEpisode$episode$context$$Season$show$seasons.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$Season$show$seasons(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchEpisode$episode$context$$Season$show$seasons$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FetchEpisode$episode$context$$Season$show$seasons$items>
      items;

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
    if (!(other is Query$FetchEpisode$episode$context$$Season$show$seasons) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$context$$Season$show$seasons
    on Query$FetchEpisode$episode$context$$Season$show$seasons {
  CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons<
          Query$FetchEpisode$episode$context$$Season$show$seasons>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons(
    Query$FetchEpisode$episode$context$$Season$show$seasons instance,
    TRes Function(Query$FetchEpisode$episode$context$$Season$show$seasons) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$show$seasons;

  factory CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$show$seasons;

  TRes call({
    List<Query$FetchEpisode$episode$context$$Season$show$seasons$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchEpisode$episode$context$$Season$show$seasons$items> Function(
              Iterable<
                  CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items<
                      Query$FetchEpisode$episode$context$$Season$show$seasons$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$show$seasons<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$show$seasons(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$Season$show$seasons _instance;

  final TRes Function(Query$FetchEpisode$episode$context$$Season$show$seasons)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$context$$Season$show$seasons(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchEpisode$episode$context$$Season$show$seasons$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchEpisode$episode$context$$Season$show$seasons$items> Function(
                  Iterable<
                      CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items<
                          Query$FetchEpisode$episode$context$$Season$show$seasons$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$show$seasons<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$show$seasons(
      this._res);

  TRes _res;

  call({
    List<Query$FetchEpisode$episode$context$$Season$show$seasons$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchEpisode$episode$context$$Season$show$seasons$items
    implements Fragment$EpisodeContext$$Season$show$seasons$items {
  Query$FetchEpisode$episode$context$$Season$show$seasons$items({
    required this.id,
    required this.title,
    this.$__typename = 'Season',
  });

  factory Query$FetchEpisode$episode$context$$Season$show$seasons$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$context$$Season$show$seasons$items(
      id: (l$id as String),
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

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
    if (!(other
            is Query$FetchEpisode$episode$context$$Season$show$seasons$items) ||
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
    return true;
  }
}

extension UtilityExtension$Query$FetchEpisode$episode$context$$Season$show$seasons$items
    on Query$FetchEpisode$episode$context$$Season$show$seasons$items {
  CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items<
          Query$FetchEpisode$episode$context$$Season$show$seasons$items>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items(
    Query$FetchEpisode$episode$context$$Season$show$seasons$items instance,
    TRes Function(Query$FetchEpisode$episode$context$$Season$show$seasons$items)
        then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$show$seasons$items;

  factory CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$show$seasons$items;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$show$seasons$items<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items<
            TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$context$$Season$show$seasons$items(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$context$$Season$show$seasons$items _instance;

  final TRes Function(
      Query$FetchEpisode$episode$context$$Season$show$seasons$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$context$$Season$show$seasons$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$show$seasons$items<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$context$$Season$show$seasons$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$context$$Season$show$seasons$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchEpisode$episode$relatedItems {
  Query$FetchEpisode$episode$relatedItems({
    required this.items,
    this.$__typename = 'SectionItemPagination',
  });

  factory Query$FetchEpisode$episode$relatedItems.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$relatedItems(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$GridSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$GridSectionItem> items;

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
    if (!(other is Query$FetchEpisode$episode$relatedItems) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$relatedItems
    on Query$FetchEpisode$episode$relatedItems {
  CopyWith$Query$FetchEpisode$episode$relatedItems<
          Query$FetchEpisode$episode$relatedItems>
      get copyWith => CopyWith$Query$FetchEpisode$episode$relatedItems(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$relatedItems<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$relatedItems(
    Query$FetchEpisode$episode$relatedItems instance,
    TRes Function(Query$FetchEpisode$episode$relatedItems) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$relatedItems;

  factory CopyWith$Query$FetchEpisode$episode$relatedItems.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$relatedItems;

  TRes call({
    List<Fragment$GridSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$GridSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$GridSectionItem<Fragment$GridSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$FetchEpisode$episode$relatedItems<TRes>
    implements CopyWith$Query$FetchEpisode$episode$relatedItems<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$relatedItems(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$relatedItems _instance;

  final TRes Function(Query$FetchEpisode$episode$relatedItems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$relatedItems(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$GridSectionItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$GridSectionItem> Function(
                  Iterable<
                      CopyWith$Fragment$GridSectionItem<
                          Fragment$GridSectionItem>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$GridSectionItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$relatedItems<TRes>
    implements CopyWith$Query$FetchEpisode$episode$relatedItems<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$relatedItems(this._res);

  TRes _res;

  call({
    List<Fragment$GridSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchEpisode$episode$lessons {
  Query$FetchEpisode$episode$lessons({
    required this.items,
    this.$__typename = 'LessonPagination',
  });

  factory Query$FetchEpisode$episode$lessons.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$lessons(
      items: (l$items as List<dynamic>)
          .map((e) => Query$FetchEpisode$episode$lessons$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FetchEpisode$episode$lessons$items> items;

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
    if (!(other is Query$FetchEpisode$episode$lessons) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$lessons
    on Query$FetchEpisode$episode$lessons {
  CopyWith$Query$FetchEpisode$episode$lessons<
          Query$FetchEpisode$episode$lessons>
      get copyWith => CopyWith$Query$FetchEpisode$episode$lessons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$lessons<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$lessons(
    Query$FetchEpisode$episode$lessons instance,
    TRes Function(Query$FetchEpisode$episode$lessons) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$lessons;

  factory CopyWith$Query$FetchEpisode$episode$lessons.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$lessons;

  TRes call({
    List<Query$FetchEpisode$episode$lessons$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchEpisode$episode$lessons$items> Function(
              Iterable<
                  CopyWith$Query$FetchEpisode$episode$lessons$items<
                      Query$FetchEpisode$episode$lessons$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchEpisode$episode$lessons<TRes>
    implements CopyWith$Query$FetchEpisode$episode$lessons<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$lessons(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$lessons _instance;

  final TRes Function(Query$FetchEpisode$episode$lessons) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$lessons(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$FetchEpisode$episode$lessons$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchEpisode$episode$lessons$items> Function(
                  Iterable<
                      CopyWith$Query$FetchEpisode$episode$lessons$items<
                          Query$FetchEpisode$episode$lessons$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Query$FetchEpisode$episode$lessons$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$lessons<TRes>
    implements CopyWith$Query$FetchEpisode$episode$lessons<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$lessons(this._res);

  TRes _res;

  call({
    List<Query$FetchEpisode$episode$lessons$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchEpisode$episode$lessons$items {
  Query$FetchEpisode$episode$lessons$items({
    required this.id,
    this.$__typename = 'Lesson',
  });

  factory Query$FetchEpisode$episode$lessons$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$lessons$items(
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
    if (!(other is Query$FetchEpisode$episode$lessons$items) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$lessons$items
    on Query$FetchEpisode$episode$lessons$items {
  CopyWith$Query$FetchEpisode$episode$lessons$items<
          Query$FetchEpisode$episode$lessons$items>
      get copyWith => CopyWith$Query$FetchEpisode$episode$lessons$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$lessons$items<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$lessons$items(
    Query$FetchEpisode$episode$lessons$items instance,
    TRes Function(Query$FetchEpisode$episode$lessons$items) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$lessons$items;

  factory CopyWith$Query$FetchEpisode$episode$lessons$items.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$lessons$items;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchEpisode$episode$lessons$items<TRes>
    implements CopyWith$Query$FetchEpisode$episode$lessons$items<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$lessons$items(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$lessons$items _instance;

  final TRes Function(Query$FetchEpisode$episode$lessons$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$lessons$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$lessons$items<TRes>
    implements CopyWith$Query$FetchEpisode$episode$lessons$items<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$lessons$items(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$legacyIDLookup {
  factory Variables$Query$legacyIDLookup({
    int? episodeId,
    int? programId,
  }) =>
      Variables$Query$legacyIDLookup._({
        if (episodeId != null) r'episodeId': episodeId,
        if (programId != null) r'programId': programId,
      });

  Variables$Query$legacyIDLookup._(this._$data);

  factory Variables$Query$legacyIDLookup.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('episodeId')) {
      final l$episodeId = data['episodeId'];
      result$data['episodeId'] = (l$episodeId as int?);
    }
    if (data.containsKey('programId')) {
      final l$programId = data['programId'];
      result$data['programId'] = (l$programId as int?);
    }
    return Variables$Query$legacyIDLookup._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get episodeId => (_$data['episodeId'] as int?);
  int? get programId => (_$data['programId'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('episodeId')) {
      final l$episodeId = episodeId;
      result$data['episodeId'] = l$episodeId;
    }
    if (_$data.containsKey('programId')) {
      final l$programId = programId;
      result$data['programId'] = l$programId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$legacyIDLookup<Variables$Query$legacyIDLookup>
      get copyWith => CopyWith$Variables$Query$legacyIDLookup(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$legacyIDLookup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$episodeId = episodeId;
    final lOther$episodeId = other.episodeId;
    if (_$data.containsKey('episodeId') !=
        other._$data.containsKey('episodeId')) {
      return false;
    }
    if (l$episodeId != lOther$episodeId) {
      return false;
    }
    final l$programId = programId;
    final lOther$programId = other.programId;
    if (_$data.containsKey('programId') !=
        other._$data.containsKey('programId')) {
      return false;
    }
    if (l$programId != lOther$programId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$episodeId = episodeId;
    final l$programId = programId;
    return Object.hashAll([
      _$data.containsKey('episodeId') ? l$episodeId : const {},
      _$data.containsKey('programId') ? l$programId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$legacyIDLookup<TRes> {
  factory CopyWith$Variables$Query$legacyIDLookup(
    Variables$Query$legacyIDLookup instance,
    TRes Function(Variables$Query$legacyIDLookup) then,
  ) = _CopyWithImpl$Variables$Query$legacyIDLookup;

  factory CopyWith$Variables$Query$legacyIDLookup.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$legacyIDLookup;

  TRes call({
    int? episodeId,
    int? programId,
  });
}

class _CopyWithImpl$Variables$Query$legacyIDLookup<TRes>
    implements CopyWith$Variables$Query$legacyIDLookup<TRes> {
  _CopyWithImpl$Variables$Query$legacyIDLookup(
    this._instance,
    this._then,
  );

  final Variables$Query$legacyIDLookup _instance;

  final TRes Function(Variables$Query$legacyIDLookup) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episodeId = _undefined,
    Object? programId = _undefined,
  }) =>
      _then(Variables$Query$legacyIDLookup._({
        ..._instance._$data,
        if (episodeId != _undefined) 'episodeId': (episodeId as int?),
        if (programId != _undefined) 'programId': (programId as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$legacyIDLookup<TRes>
    implements CopyWith$Variables$Query$legacyIDLookup<TRes> {
  _CopyWithStubImpl$Variables$Query$legacyIDLookup(this._res);

  TRes _res;

  call({
    int? episodeId,
    int? programId,
  }) =>
      _res;
}

class Query$legacyIDLookup {
  Query$legacyIDLookup({
    required this.legacyIDLookup,
    this.$__typename = 'QueryRoot',
  });

  factory Query$legacyIDLookup.fromJson(Map<String, dynamic> json) {
    final l$legacyIDLookup = json['legacyIDLookup'];
    final l$$__typename = json['__typename'];
    return Query$legacyIDLookup(
      legacyIDLookup: Query$legacyIDLookup$legacyIDLookup.fromJson(
          (l$legacyIDLookup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$legacyIDLookup$legacyIDLookup legacyIDLookup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$legacyIDLookup = legacyIDLookup;
    _resultData['legacyIDLookup'] = l$legacyIDLookup.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$legacyIDLookup = legacyIDLookup;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$legacyIDLookup,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$legacyIDLookup) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$legacyIDLookup = legacyIDLookup;
    final lOther$legacyIDLookup = other.legacyIDLookup;
    if (l$legacyIDLookup != lOther$legacyIDLookup) {
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

extension UtilityExtension$Query$legacyIDLookup on Query$legacyIDLookup {
  CopyWith$Query$legacyIDLookup<Query$legacyIDLookup> get copyWith =>
      CopyWith$Query$legacyIDLookup(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$legacyIDLookup<TRes> {
  factory CopyWith$Query$legacyIDLookup(
    Query$legacyIDLookup instance,
    TRes Function(Query$legacyIDLookup) then,
  ) = _CopyWithImpl$Query$legacyIDLookup;

  factory CopyWith$Query$legacyIDLookup.stub(TRes res) =
      _CopyWithStubImpl$Query$legacyIDLookup;

  TRes call({
    Query$legacyIDLookup$legacyIDLookup? legacyIDLookup,
    String? $__typename,
  });
  CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> get legacyIDLookup;
}

class _CopyWithImpl$Query$legacyIDLookup<TRes>
    implements CopyWith$Query$legacyIDLookup<TRes> {
  _CopyWithImpl$Query$legacyIDLookup(
    this._instance,
    this._then,
  );

  final Query$legacyIDLookup _instance;

  final TRes Function(Query$legacyIDLookup) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? legacyIDLookup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$legacyIDLookup(
        legacyIDLookup: legacyIDLookup == _undefined || legacyIDLookup == null
            ? _instance.legacyIDLookup
            : (legacyIDLookup as Query$legacyIDLookup$legacyIDLookup),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> get legacyIDLookup {
    final local$legacyIDLookup = _instance.legacyIDLookup;
    return CopyWith$Query$legacyIDLookup$legacyIDLookup(
        local$legacyIDLookup, (e) => call(legacyIDLookup: e));
  }
}

class _CopyWithStubImpl$Query$legacyIDLookup<TRes>
    implements CopyWith$Query$legacyIDLookup<TRes> {
  _CopyWithStubImpl$Query$legacyIDLookup(this._res);

  TRes _res;

  call({
    Query$legacyIDLookup$legacyIDLookup? legacyIDLookup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> get legacyIDLookup =>
      CopyWith$Query$legacyIDLookup$legacyIDLookup.stub(_res);
}

const documentNodeQuerylegacyIDLookup = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'legacyIDLookup'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'episodeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'programId')),
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
        name: NameNode(value: 'legacyIDLookup'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'options'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'episodeID'),
                value: VariableNode(name: NameNode(value: 'episodeId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'programID'),
                value: VariableNode(name: NameNode(value: 'programId')),
              ),
            ]),
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
Query$legacyIDLookup _parserFn$Query$legacyIDLookup(
        Map<String, dynamic> data) =>
    Query$legacyIDLookup.fromJson(data);
typedef OnQueryComplete$Query$legacyIDLookup = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$legacyIDLookup?,
);

class Options$Query$legacyIDLookup
    extends graphql.QueryOptions<Query$legacyIDLookup> {
  Options$Query$legacyIDLookup({
    String? operationName,
    Variables$Query$legacyIDLookup? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$legacyIDLookup? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$legacyIDLookup? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
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
                    data == null ? null : _parserFn$Query$legacyIDLookup(data),
                  ),
          onError: onError,
          document: documentNodeQuerylegacyIDLookup,
          parserFn: _parserFn$Query$legacyIDLookup,
        );

  final OnQueryComplete$Query$legacyIDLookup? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$legacyIDLookup
    extends graphql.WatchQueryOptions<Query$legacyIDLookup> {
  WatchOptions$Query$legacyIDLookup({
    String? operationName,
    Variables$Query$legacyIDLookup? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$legacyIDLookup? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerylegacyIDLookup,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$legacyIDLookup,
        );
}

class FetchMoreOptions$Query$legacyIDLookup extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$legacyIDLookup({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$legacyIDLookup? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerylegacyIDLookup,
        );
}

extension ClientExtension$Query$legacyIDLookup on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$legacyIDLookup>> query$legacyIDLookup(
          [Options$Query$legacyIDLookup? options]) async =>
      await this.query(options ?? Options$Query$legacyIDLookup());
  graphql.ObservableQuery<Query$legacyIDLookup> watchQuery$legacyIDLookup(
          [WatchOptions$Query$legacyIDLookup? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$legacyIDLookup());
  void writeQuery$legacyIDLookup({
    required Query$legacyIDLookup data,
    Variables$Query$legacyIDLookup? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerylegacyIDLookup),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$legacyIDLookup? readQuery$legacyIDLookup({
    Variables$Query$legacyIDLookup? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerylegacyIDLookup),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$legacyIDLookup.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$legacyIDLookup> useQuery$legacyIDLookup(
        [Options$Query$legacyIDLookup? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$legacyIDLookup());
graphql.ObservableQuery<Query$legacyIDLookup> useWatchQuery$legacyIDLookup(
        [WatchOptions$Query$legacyIDLookup? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$legacyIDLookup());

class Query$legacyIDLookup$Widget
    extends graphql_flutter.Query<Query$legacyIDLookup> {
  Query$legacyIDLookup$Widget({
    widgets.Key? key,
    Options$Query$legacyIDLookup? options,
    required graphql_flutter.QueryBuilder<Query$legacyIDLookup> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$legacyIDLookup(),
          builder: builder,
        );
}

class Query$legacyIDLookup$legacyIDLookup {
  Query$legacyIDLookup$legacyIDLookup({
    required this.id,
    this.$__typename = 'LegacyIDLookup',
  });

  factory Query$legacyIDLookup$legacyIDLookup.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$legacyIDLookup$legacyIDLookup(
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
    if (!(other is Query$legacyIDLookup$legacyIDLookup) ||
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

extension UtilityExtension$Query$legacyIDLookup$legacyIDLookup
    on Query$legacyIDLookup$legacyIDLookup {
  CopyWith$Query$legacyIDLookup$legacyIDLookup<
          Query$legacyIDLookup$legacyIDLookup>
      get copyWith => CopyWith$Query$legacyIDLookup$legacyIDLookup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> {
  factory CopyWith$Query$legacyIDLookup$legacyIDLookup(
    Query$legacyIDLookup$legacyIDLookup instance,
    TRes Function(Query$legacyIDLookup$legacyIDLookup) then,
  ) = _CopyWithImpl$Query$legacyIDLookup$legacyIDLookup;

  factory CopyWith$Query$legacyIDLookup$legacyIDLookup.stub(TRes res) =
      _CopyWithStubImpl$Query$legacyIDLookup$legacyIDLookup;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$legacyIDLookup$legacyIDLookup<TRes>
    implements CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> {
  _CopyWithImpl$Query$legacyIDLookup$legacyIDLookup(
    this._instance,
    this._then,
  );

  final Query$legacyIDLookup$legacyIDLookup _instance;

  final TRes Function(Query$legacyIDLookup$legacyIDLookup) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$legacyIDLookup$legacyIDLookup(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$legacyIDLookup$legacyIDLookup<TRes>
    implements CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> {
  _CopyWithStubImpl$Query$legacyIDLookup$legacyIDLookup(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$EpisodeDetails {
  factory Variables$Query$EpisodeDetails({required String id}) =>
      Variables$Query$EpisodeDetails._({
        r'id': id,
      });

  Variables$Query$EpisodeDetails._(this._$data);

  factory Variables$Query$EpisodeDetails.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$EpisodeDetails._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$EpisodeDetails<Variables$Query$EpisodeDetails>
      get copyWith => CopyWith$Variables$Query$EpisodeDetails(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$EpisodeDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$EpisodeDetails<TRes> {
  factory CopyWith$Variables$Query$EpisodeDetails(
    Variables$Query$EpisodeDetails instance,
    TRes Function(Variables$Query$EpisodeDetails) then,
  ) = _CopyWithImpl$Variables$Query$EpisodeDetails;

  factory CopyWith$Variables$Query$EpisodeDetails.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$EpisodeDetails;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$EpisodeDetails<TRes>
    implements CopyWith$Variables$Query$EpisodeDetails<TRes> {
  _CopyWithImpl$Variables$Query$EpisodeDetails(
    this._instance,
    this._then,
  );

  final Variables$Query$EpisodeDetails _instance;

  final TRes Function(Variables$Query$EpisodeDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$EpisodeDetails._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$EpisodeDetails<TRes>
    implements CopyWith$Variables$Query$EpisodeDetails<TRes> {
  _CopyWithStubImpl$Variables$Query$EpisodeDetails(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$EpisodeDetails {
  Query$EpisodeDetails({
    required this.episode,
    this.$__typename = 'QueryRoot',
  });

  factory Query$EpisodeDetails.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$EpisodeDetails(
      episode:
          Fragment$EpisodeDetails.fromJson((l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$EpisodeDetails episode;

  final String $__typename;

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
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$episode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$EpisodeDetails) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
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

extension UtilityExtension$Query$EpisodeDetails on Query$EpisodeDetails {
  CopyWith$Query$EpisodeDetails<Query$EpisodeDetails> get copyWith =>
      CopyWith$Query$EpisodeDetails(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$EpisodeDetails<TRes> {
  factory CopyWith$Query$EpisodeDetails(
    Query$EpisodeDetails instance,
    TRes Function(Query$EpisodeDetails) then,
  ) = _CopyWithImpl$Query$EpisodeDetails;

  factory CopyWith$Query$EpisodeDetails.stub(TRes res) =
      _CopyWithStubImpl$Query$EpisodeDetails;

  TRes call({
    Fragment$EpisodeDetails? episode,
    String? $__typename,
  });
  CopyWith$Fragment$EpisodeDetails<TRes> get episode;
}

class _CopyWithImpl$Query$EpisodeDetails<TRes>
    implements CopyWith$Query$EpisodeDetails<TRes> {
  _CopyWithImpl$Query$EpisodeDetails(
    this._instance,
    this._then,
  );

  final Query$EpisodeDetails _instance;

  final TRes Function(Query$EpisodeDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$EpisodeDetails(
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Fragment$EpisodeDetails),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EpisodeDetails<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Fragment$EpisodeDetails(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$EpisodeDetails<TRes>
    implements CopyWith$Query$EpisodeDetails<TRes> {
  _CopyWithStubImpl$Query$EpisodeDetails(this._res);

  TRes _res;

  call({
    Fragment$EpisodeDetails? episode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EpisodeDetails<TRes> get episode =>
      CopyWith$Fragment$EpisodeDetails.stub(_res);
}

const documentNodeQueryEpisodeDetails = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'EpisodeDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'episode'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'EpisodeDetails'),
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
  fragmentDefinitionEpisodeDetails,
]);
Query$EpisodeDetails _parserFn$Query$EpisodeDetails(
        Map<String, dynamic> data) =>
    Query$EpisodeDetails.fromJson(data);
typedef OnQueryComplete$Query$EpisodeDetails = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$EpisodeDetails?,
);

class Options$Query$EpisodeDetails
    extends graphql.QueryOptions<Query$EpisodeDetails> {
  Options$Query$EpisodeDetails({
    String? operationName,
    required Variables$Query$EpisodeDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$EpisodeDetails? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$EpisodeDetails? onComplete,
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
                    data == null ? null : _parserFn$Query$EpisodeDetails(data),
                  ),
          onError: onError,
          document: documentNodeQueryEpisodeDetails,
          parserFn: _parserFn$Query$EpisodeDetails,
        );

  final OnQueryComplete$Query$EpisodeDetails? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$EpisodeDetails
    extends graphql.WatchQueryOptions<Query$EpisodeDetails> {
  WatchOptions$Query$EpisodeDetails({
    String? operationName,
    required Variables$Query$EpisodeDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$EpisodeDetails? typedOptimisticResult,
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
          document: documentNodeQueryEpisodeDetails,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$EpisodeDetails,
        );
}

class FetchMoreOptions$Query$EpisodeDetails extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$EpisodeDetails({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$EpisodeDetails variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryEpisodeDetails,
        );
}

extension ClientExtension$Query$EpisodeDetails on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$EpisodeDetails>> query$EpisodeDetails(
          Options$Query$EpisodeDetails options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$EpisodeDetails> watchQuery$EpisodeDetails(
          WatchOptions$Query$EpisodeDetails options) =>
      this.watchQuery(options);
  void writeQuery$EpisodeDetails({
    required Query$EpisodeDetails data,
    required Variables$Query$EpisodeDetails variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryEpisodeDetails),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$EpisodeDetails? readQuery$EpisodeDetails({
    required Variables$Query$EpisodeDetails variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryEpisodeDetails),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$EpisodeDetails.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$EpisodeDetails> useQuery$EpisodeDetails(
        Options$Query$EpisodeDetails options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$EpisodeDetails> useWatchQuery$EpisodeDetails(
        WatchOptions$Query$EpisodeDetails options) =>
    graphql_flutter.useWatchQuery(options);

class Query$EpisodeDetails$Widget
    extends graphql_flutter.Query<Query$EpisodeDetails> {
  Query$EpisodeDetails$Widget({
    widgets.Key? key,
    required Options$Query$EpisodeDetails options,
    required graphql_flutter.QueryBuilder<Query$EpisodeDetails> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Variables$Query$getDefaultEpisodeForShow {
  factory Variables$Query$getDefaultEpisodeForShow({required String showId}) =>
      Variables$Query$getDefaultEpisodeForShow._({
        r'showId': showId,
      });

  Variables$Query$getDefaultEpisodeForShow._(this._$data);

  factory Variables$Query$getDefaultEpisodeForShow.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$showId = data['showId'];
    result$data['showId'] = (l$showId as String);
    return Variables$Query$getDefaultEpisodeForShow._(result$data);
  }

  Map<String, dynamic> _$data;

  String get showId => (_$data['showId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$showId = showId;
    result$data['showId'] = l$showId;
    return result$data;
  }

  CopyWith$Variables$Query$getDefaultEpisodeForShow<
          Variables$Query$getDefaultEpisodeForShow>
      get copyWith => CopyWith$Variables$Query$getDefaultEpisodeForShow(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getDefaultEpisodeForShow) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$showId = showId;
    final lOther$showId = other.showId;
    if (l$showId != lOther$showId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$showId = showId;
    return Object.hashAll([l$showId]);
  }
}

abstract class CopyWith$Variables$Query$getDefaultEpisodeForShow<TRes> {
  factory CopyWith$Variables$Query$getDefaultEpisodeForShow(
    Variables$Query$getDefaultEpisodeForShow instance,
    TRes Function(Variables$Query$getDefaultEpisodeForShow) then,
  ) = _CopyWithImpl$Variables$Query$getDefaultEpisodeForShow;

  factory CopyWith$Variables$Query$getDefaultEpisodeForShow.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getDefaultEpisodeForShow;

  TRes call({String? showId});
}

class _CopyWithImpl$Variables$Query$getDefaultEpisodeForShow<TRes>
    implements CopyWith$Variables$Query$getDefaultEpisodeForShow<TRes> {
  _CopyWithImpl$Variables$Query$getDefaultEpisodeForShow(
    this._instance,
    this._then,
  );

  final Variables$Query$getDefaultEpisodeForShow _instance;

  final TRes Function(Variables$Query$getDefaultEpisodeForShow) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? showId = _undefined}) =>
      _then(Variables$Query$getDefaultEpisodeForShow._({
        ..._instance._$data,
        if (showId != _undefined && showId != null)
          'showId': (showId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getDefaultEpisodeForShow<TRes>
    implements CopyWith$Variables$Query$getDefaultEpisodeForShow<TRes> {
  _CopyWithStubImpl$Variables$Query$getDefaultEpisodeForShow(this._res);

  TRes _res;

  call({String? showId}) => _res;
}

class Query$getDefaultEpisodeForShow {
  Query$getDefaultEpisodeForShow({
    required this.$show,
    this.$__typename = 'QueryRoot',
  });

  factory Query$getDefaultEpisodeForShow.fromJson(Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$getDefaultEpisodeForShow(
      $show: Query$getDefaultEpisodeForShow$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getDefaultEpisodeForShow$show $show;

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
    if (!(other is Query$getDefaultEpisodeForShow) ||
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

extension UtilityExtension$Query$getDefaultEpisodeForShow
    on Query$getDefaultEpisodeForShow {
  CopyWith$Query$getDefaultEpisodeForShow<Query$getDefaultEpisodeForShow>
      get copyWith => CopyWith$Query$getDefaultEpisodeForShow(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDefaultEpisodeForShow<TRes> {
  factory CopyWith$Query$getDefaultEpisodeForShow(
    Query$getDefaultEpisodeForShow instance,
    TRes Function(Query$getDefaultEpisodeForShow) then,
  ) = _CopyWithImpl$Query$getDefaultEpisodeForShow;

  factory CopyWith$Query$getDefaultEpisodeForShow.stub(TRes res) =
      _CopyWithStubImpl$Query$getDefaultEpisodeForShow;

  TRes call({
    Query$getDefaultEpisodeForShow$show? $show,
    String? $__typename,
  });
  CopyWith$Query$getDefaultEpisodeForShow$show<TRes> get $show;
}

class _CopyWithImpl$Query$getDefaultEpisodeForShow<TRes>
    implements CopyWith$Query$getDefaultEpisodeForShow<TRes> {
  _CopyWithImpl$Query$getDefaultEpisodeForShow(
    this._instance,
    this._then,
  );

  final Query$getDefaultEpisodeForShow _instance;

  final TRes Function(Query$getDefaultEpisodeForShow) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDefaultEpisodeForShow(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Query$getDefaultEpisodeForShow$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDefaultEpisodeForShow$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$getDefaultEpisodeForShow$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$getDefaultEpisodeForShow<TRes>
    implements CopyWith$Query$getDefaultEpisodeForShow<TRes> {
  _CopyWithStubImpl$Query$getDefaultEpisodeForShow(this._res);

  TRes _res;

  call({
    Query$getDefaultEpisodeForShow$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDefaultEpisodeForShow$show<TRes> get $show =>
      CopyWith$Query$getDefaultEpisodeForShow$show.stub(_res);
}

const documentNodeQuerygetDefaultEpisodeForShow = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getDefaultEpisodeForShow'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'showId')),
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
        name: NameNode(value: 'show'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'showId')),
          )
        ],
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
Query$getDefaultEpisodeForShow _parserFn$Query$getDefaultEpisodeForShow(
        Map<String, dynamic> data) =>
    Query$getDefaultEpisodeForShow.fromJson(data);
typedef OnQueryComplete$Query$getDefaultEpisodeForShow = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$getDefaultEpisodeForShow?,
);

class Options$Query$getDefaultEpisodeForShow
    extends graphql.QueryOptions<Query$getDefaultEpisodeForShow> {
  Options$Query$getDefaultEpisodeForShow({
    String? operationName,
    required Variables$Query$getDefaultEpisodeForShow variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getDefaultEpisodeForShow? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getDefaultEpisodeForShow? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$getDefaultEpisodeForShow(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetDefaultEpisodeForShow,
          parserFn: _parserFn$Query$getDefaultEpisodeForShow,
        );

  final OnQueryComplete$Query$getDefaultEpisodeForShow? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getDefaultEpisodeForShow
    extends graphql.WatchQueryOptions<Query$getDefaultEpisodeForShow> {
  WatchOptions$Query$getDefaultEpisodeForShow({
    String? operationName,
    required Variables$Query$getDefaultEpisodeForShow variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getDefaultEpisodeForShow? typedOptimisticResult,
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
          document: documentNodeQuerygetDefaultEpisodeForShow,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getDefaultEpisodeForShow,
        );
}

class FetchMoreOptions$Query$getDefaultEpisodeForShow
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getDefaultEpisodeForShow({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getDefaultEpisodeForShow variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetDefaultEpisodeForShow,
        );
}

extension ClientExtension$Query$getDefaultEpisodeForShow
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getDefaultEpisodeForShow>>
      query$getDefaultEpisodeForShow(
              Options$Query$getDefaultEpisodeForShow options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getDefaultEpisodeForShow>
      watchQuery$getDefaultEpisodeForShow(
              WatchOptions$Query$getDefaultEpisodeForShow options) =>
          this.watchQuery(options);
  void writeQuery$getDefaultEpisodeForShow({
    required Query$getDefaultEpisodeForShow data,
    required Variables$Query$getDefaultEpisodeForShow variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetDefaultEpisodeForShow),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getDefaultEpisodeForShow? readQuery$getDefaultEpisodeForShow({
    required Variables$Query$getDefaultEpisodeForShow variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetDefaultEpisodeForShow),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getDefaultEpisodeForShow.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getDefaultEpisodeForShow>
    useQuery$getDefaultEpisodeForShow(
            Options$Query$getDefaultEpisodeForShow options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getDefaultEpisodeForShow>
    useWatchQuery$getDefaultEpisodeForShow(
            WatchOptions$Query$getDefaultEpisodeForShow options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getDefaultEpisodeForShow$Widget
    extends graphql_flutter.Query<Query$getDefaultEpisodeForShow> {
  Query$getDefaultEpisodeForShow$Widget({
    widgets.Key? key,
    required Options$Query$getDefaultEpisodeForShow options,
    required graphql_flutter.QueryBuilder<Query$getDefaultEpisodeForShow>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getDefaultEpisodeForShow$show {
  Query$getDefaultEpisodeForShow$show({
    required this.defaultEpisode,
    this.$__typename = 'Show',
  });

  factory Query$getDefaultEpisodeForShow$show.fromJson(
      Map<String, dynamic> json) {
    final l$defaultEpisode = json['defaultEpisode'];
    final l$$__typename = json['__typename'];
    return Query$getDefaultEpisodeForShow$show(
      defaultEpisode:
          Query$getDefaultEpisodeForShow$show$defaultEpisode.fromJson(
              (l$defaultEpisode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getDefaultEpisodeForShow$show$defaultEpisode defaultEpisode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$defaultEpisode = defaultEpisode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$defaultEpisode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDefaultEpisodeForShow$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
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

extension UtilityExtension$Query$getDefaultEpisodeForShow$show
    on Query$getDefaultEpisodeForShow$show {
  CopyWith$Query$getDefaultEpisodeForShow$show<
          Query$getDefaultEpisodeForShow$show>
      get copyWith => CopyWith$Query$getDefaultEpisodeForShow$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDefaultEpisodeForShow$show<TRes> {
  factory CopyWith$Query$getDefaultEpisodeForShow$show(
    Query$getDefaultEpisodeForShow$show instance,
    TRes Function(Query$getDefaultEpisodeForShow$show) then,
  ) = _CopyWithImpl$Query$getDefaultEpisodeForShow$show;

  factory CopyWith$Query$getDefaultEpisodeForShow$show.stub(TRes res) =
      _CopyWithStubImpl$Query$getDefaultEpisodeForShow$show;

  TRes call({
    Query$getDefaultEpisodeForShow$show$defaultEpisode? defaultEpisode,
    String? $__typename,
  });
  CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode<TRes>
      get defaultEpisode;
}

class _CopyWithImpl$Query$getDefaultEpisodeForShow$show<TRes>
    implements CopyWith$Query$getDefaultEpisodeForShow$show<TRes> {
  _CopyWithImpl$Query$getDefaultEpisodeForShow$show(
    this._instance,
    this._then,
  );

  final Query$getDefaultEpisodeForShow$show _instance;

  final TRes Function(Query$getDefaultEpisodeForShow$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? defaultEpisode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDefaultEpisodeForShow$show(
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Query$getDefaultEpisodeForShow$show$defaultEpisode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode<TRes>
      get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Query$getDefaultEpisodeForShow$show<TRes>
    implements CopyWith$Query$getDefaultEpisodeForShow$show<TRes> {
  _CopyWithStubImpl$Query$getDefaultEpisodeForShow$show(this._res);

  TRes _res;

  call({
    Query$getDefaultEpisodeForShow$show$defaultEpisode? defaultEpisode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode<TRes>
      get defaultEpisode =>
          CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode.stub(
              _res);
}

class Query$getDefaultEpisodeForShow$show$defaultEpisode {
  Query$getDefaultEpisodeForShow$show$defaultEpisode({
    required this.id,
    this.$__typename = 'Episode',
  });

  factory Query$getDefaultEpisodeForShow$show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getDefaultEpisodeForShow$show$defaultEpisode(
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
    if (!(other is Query$getDefaultEpisodeForShow$show$defaultEpisode) ||
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

extension UtilityExtension$Query$getDefaultEpisodeForShow$show$defaultEpisode
    on Query$getDefaultEpisodeForShow$show$defaultEpisode {
  CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode<
          Query$getDefaultEpisodeForShow$show$defaultEpisode>
      get copyWith =>
          CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode<
    TRes> {
  factory CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode(
    Query$getDefaultEpisodeForShow$show$defaultEpisode instance,
    TRes Function(Query$getDefaultEpisodeForShow$show$defaultEpisode) then,
  ) = _CopyWithImpl$Query$getDefaultEpisodeForShow$show$defaultEpisode;

  factory CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getDefaultEpisodeForShow$show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDefaultEpisodeForShow$show$defaultEpisode<TRes>
    implements
        CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode<TRes> {
  _CopyWithImpl$Query$getDefaultEpisodeForShow$show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Query$getDefaultEpisodeForShow$show$defaultEpisode _instance;

  final TRes Function(Query$getDefaultEpisodeForShow$show$defaultEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDefaultEpisodeForShow$show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getDefaultEpisodeForShow$show$defaultEpisode<TRes>
    implements
        CopyWith$Query$getDefaultEpisodeForShow$show$defaultEpisode<TRes> {
  _CopyWithStubImpl$Query$getDefaultEpisodeForShow$show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getNextEpisodes {
  factory Variables$Query$getNextEpisodes({
    required String episodeId,
    Input$EpisodeContext? context,
  }) =>
      Variables$Query$getNextEpisodes._({
        r'episodeId': episodeId,
        if (context != null) r'context': context,
      });

  Variables$Query$getNextEpisodes._(this._$data);

  factory Variables$Query$getNextEpisodes.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$episodeId = data['episodeId'];
    result$data['episodeId'] = (l$episodeId as String);
    if (data.containsKey('context')) {
      final l$context = data['context'];
      result$data['context'] = l$context == null
          ? null
          : Input$EpisodeContext.fromJson((l$context as Map<String, dynamic>));
    }
    return Variables$Query$getNextEpisodes._(result$data);
  }

  Map<String, dynamic> _$data;

  String get episodeId => (_$data['episodeId'] as String);
  Input$EpisodeContext? get context =>
      (_$data['context'] as Input$EpisodeContext?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$episodeId = episodeId;
    result$data['episodeId'] = l$episodeId;
    if (_$data.containsKey('context')) {
      final l$context = context;
      result$data['context'] = l$context?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$getNextEpisodes<Variables$Query$getNextEpisodes>
      get copyWith => CopyWith$Variables$Query$getNextEpisodes(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getNextEpisodes) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$episodeId = episodeId;
    final lOther$episodeId = other.episodeId;
    if (l$episodeId != lOther$episodeId) {
      return false;
    }
    final l$context = context;
    final lOther$context = other.context;
    if (_$data.containsKey('context') != other._$data.containsKey('context')) {
      return false;
    }
    if (l$context != lOther$context) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$episodeId = episodeId;
    final l$context = context;
    return Object.hashAll([
      l$episodeId,
      _$data.containsKey('context') ? l$context : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getNextEpisodes<TRes> {
  factory CopyWith$Variables$Query$getNextEpisodes(
    Variables$Query$getNextEpisodes instance,
    TRes Function(Variables$Query$getNextEpisodes) then,
  ) = _CopyWithImpl$Variables$Query$getNextEpisodes;

  factory CopyWith$Variables$Query$getNextEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getNextEpisodes;

  TRes call({
    String? episodeId,
    Input$EpisodeContext? context,
  });
}

class _CopyWithImpl$Variables$Query$getNextEpisodes<TRes>
    implements CopyWith$Variables$Query$getNextEpisodes<TRes> {
  _CopyWithImpl$Variables$Query$getNextEpisodes(
    this._instance,
    this._then,
  );

  final Variables$Query$getNextEpisodes _instance;

  final TRes Function(Variables$Query$getNextEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episodeId = _undefined,
    Object? context = _undefined,
  }) =>
      _then(Variables$Query$getNextEpisodes._({
        ..._instance._$data,
        if (episodeId != _undefined && episodeId != null)
          'episodeId': (episodeId as String),
        if (context != _undefined)
          'context': (context as Input$EpisodeContext?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getNextEpisodes<TRes>
    implements CopyWith$Variables$Query$getNextEpisodes<TRes> {
  _CopyWithStubImpl$Variables$Query$getNextEpisodes(this._res);

  TRes _res;

  call({
    String? episodeId,
    Input$EpisodeContext? context,
  }) =>
      _res;
}

class Query$getNextEpisodes {
  Query$getNextEpisodes({
    required this.episode,
    this.$__typename = 'QueryRoot',
  });

  factory Query$getNextEpisodes.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$getNextEpisodes(
      episode: Query$getNextEpisodes$episode.fromJson(
          (l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getNextEpisodes$episode episode;

  final String $__typename;

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
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$episode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getNextEpisodes) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
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

extension UtilityExtension$Query$getNextEpisodes on Query$getNextEpisodes {
  CopyWith$Query$getNextEpisodes<Query$getNextEpisodes> get copyWith =>
      CopyWith$Query$getNextEpisodes(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getNextEpisodes<TRes> {
  factory CopyWith$Query$getNextEpisodes(
    Query$getNextEpisodes instance,
    TRes Function(Query$getNextEpisodes) then,
  ) = _CopyWithImpl$Query$getNextEpisodes;

  factory CopyWith$Query$getNextEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Query$getNextEpisodes;

  TRes call({
    Query$getNextEpisodes$episode? episode,
    String? $__typename,
  });
  CopyWith$Query$getNextEpisodes$episode<TRes> get episode;
}

class _CopyWithImpl$Query$getNextEpisodes<TRes>
    implements CopyWith$Query$getNextEpisodes<TRes> {
  _CopyWithImpl$Query$getNextEpisodes(
    this._instance,
    this._then,
  );

  final Query$getNextEpisodes _instance;

  final TRes Function(Query$getNextEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getNextEpisodes(
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Query$getNextEpisodes$episode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getNextEpisodes$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Query$getNextEpisodes$episode(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$getNextEpisodes<TRes>
    implements CopyWith$Query$getNextEpisodes<TRes> {
  _CopyWithStubImpl$Query$getNextEpisodes(this._res);

  TRes _res;

  call({
    Query$getNextEpisodes$episode? episode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getNextEpisodes$episode<TRes> get episode =>
      CopyWith$Query$getNextEpisodes$episode.stub(_res);
}

const documentNodeQuerygetNextEpisodes = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getNextEpisodes'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'episodeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'context')),
        type: NamedTypeNode(
          name: NameNode(value: 'EpisodeContext'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'episode'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'episodeId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'context'),
            value: VariableNode(name: NameNode(value: 'context')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'next'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'PlayableEpisode'),
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
  fragmentDefinitionPlayableEpisode,
  fragmentDefinitionBasicStream,
]);
Query$getNextEpisodes _parserFn$Query$getNextEpisodes(
        Map<String, dynamic> data) =>
    Query$getNextEpisodes.fromJson(data);
typedef OnQueryComplete$Query$getNextEpisodes = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getNextEpisodes?,
);

class Options$Query$getNextEpisodes
    extends graphql.QueryOptions<Query$getNextEpisodes> {
  Options$Query$getNextEpisodes({
    String? operationName,
    required Variables$Query$getNextEpisodes variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getNextEpisodes? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getNextEpisodes? onComplete,
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
                    data == null ? null : _parserFn$Query$getNextEpisodes(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetNextEpisodes,
          parserFn: _parserFn$Query$getNextEpisodes,
        );

  final OnQueryComplete$Query$getNextEpisodes? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getNextEpisodes
    extends graphql.WatchQueryOptions<Query$getNextEpisodes> {
  WatchOptions$Query$getNextEpisodes({
    String? operationName,
    required Variables$Query$getNextEpisodes variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getNextEpisodes? typedOptimisticResult,
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
          document: documentNodeQuerygetNextEpisodes,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getNextEpisodes,
        );
}

class FetchMoreOptions$Query$getNextEpisodes extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getNextEpisodes({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getNextEpisodes variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetNextEpisodes,
        );
}

extension ClientExtension$Query$getNextEpisodes on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getNextEpisodes>> query$getNextEpisodes(
          Options$Query$getNextEpisodes options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getNextEpisodes> watchQuery$getNextEpisodes(
          WatchOptions$Query$getNextEpisodes options) =>
      this.watchQuery(options);
  void writeQuery$getNextEpisodes({
    required Query$getNextEpisodes data,
    required Variables$Query$getNextEpisodes variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetNextEpisodes),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getNextEpisodes? readQuery$getNextEpisodes({
    required Variables$Query$getNextEpisodes variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetNextEpisodes),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getNextEpisodes.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getNextEpisodes> useQuery$getNextEpisodes(
        Options$Query$getNextEpisodes options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getNextEpisodes> useWatchQuery$getNextEpisodes(
        WatchOptions$Query$getNextEpisodes options) =>
    graphql_flutter.useWatchQuery(options);

class Query$getNextEpisodes$Widget
    extends graphql_flutter.Query<Query$getNextEpisodes> {
  Query$getNextEpisodes$Widget({
    widgets.Key? key,
    required Options$Query$getNextEpisodes options,
    required graphql_flutter.QueryBuilder<Query$getNextEpisodes> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getNextEpisodes$episode {
  Query$getNextEpisodes$episode({
    required this.next,
    this.$__typename = 'Episode',
  });

  factory Query$getNextEpisodes$episode.fromJson(Map<String, dynamic> json) {
    final l$next = json['next'];
    final l$$__typename = json['__typename'];
    return Query$getNextEpisodes$episode(
      next: (l$next as List<dynamic>)
          .map((e) =>
              Fragment$PlayableEpisode.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$PlayableEpisode> next;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$next = next;
    _resultData['next'] = l$next.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$next = next;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$next.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getNextEpisodes$episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$next = next;
    final lOther$next = other.next;
    if (l$next.length != lOther$next.length) {
      return false;
    }
    for (int i = 0; i < l$next.length; i++) {
      final l$next$entry = l$next[i];
      final lOther$next$entry = lOther$next[i];
      if (l$next$entry != lOther$next$entry) {
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

extension UtilityExtension$Query$getNextEpisodes$episode
    on Query$getNextEpisodes$episode {
  CopyWith$Query$getNextEpisodes$episode<Query$getNextEpisodes$episode>
      get copyWith => CopyWith$Query$getNextEpisodes$episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getNextEpisodes$episode<TRes> {
  factory CopyWith$Query$getNextEpisodes$episode(
    Query$getNextEpisodes$episode instance,
    TRes Function(Query$getNextEpisodes$episode) then,
  ) = _CopyWithImpl$Query$getNextEpisodes$episode;

  factory CopyWith$Query$getNextEpisodes$episode.stub(TRes res) =
      _CopyWithStubImpl$Query$getNextEpisodes$episode;

  TRes call({
    List<Fragment$PlayableEpisode>? next,
    String? $__typename,
  });
  TRes next(
      Iterable<Fragment$PlayableEpisode> Function(
              Iterable<
                  CopyWith$Fragment$PlayableEpisode<Fragment$PlayableEpisode>>)
          _fn);
}

class _CopyWithImpl$Query$getNextEpisodes$episode<TRes>
    implements CopyWith$Query$getNextEpisodes$episode<TRes> {
  _CopyWithImpl$Query$getNextEpisodes$episode(
    this._instance,
    this._then,
  );

  final Query$getNextEpisodes$episode _instance;

  final TRes Function(Query$getNextEpisodes$episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? next = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getNextEpisodes$episode(
        next: next == _undefined || next == null
            ? _instance.next
            : (next as List<Fragment$PlayableEpisode>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes next(
          Iterable<Fragment$PlayableEpisode> Function(
                  Iterable<
                      CopyWith$Fragment$PlayableEpisode<
                          Fragment$PlayableEpisode>>)
              _fn) =>
      call(
          next: _fn(_instance.next.map((e) => CopyWith$Fragment$PlayableEpisode(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getNextEpisodes$episode<TRes>
    implements CopyWith$Query$getNextEpisodes$episode<TRes> {
  _CopyWithStubImpl$Query$getNextEpisodes$episode(this._res);

  TRes _res;

  call({
    List<Fragment$PlayableEpisode>? next,
    String? $__typename,
  }) =>
      _res;
  next(_fn) => _res;
}

class Variables$Query$getEpisodeAvailability {
  factory Variables$Query$getEpisodeAvailability({required String episodeId}) =>
      Variables$Query$getEpisodeAvailability._({
        r'episodeId': episodeId,
      });

  Variables$Query$getEpisodeAvailability._(this._$data);

  factory Variables$Query$getEpisodeAvailability.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$episodeId = data['episodeId'];
    result$data['episodeId'] = (l$episodeId as String);
    return Variables$Query$getEpisodeAvailability._(result$data);
  }

  Map<String, dynamic> _$data;

  String get episodeId => (_$data['episodeId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$episodeId = episodeId;
    result$data['episodeId'] = l$episodeId;
    return result$data;
  }

  CopyWith$Variables$Query$getEpisodeAvailability<
          Variables$Query$getEpisodeAvailability>
      get copyWith => CopyWith$Variables$Query$getEpisodeAvailability(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getEpisodeAvailability) ||
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

abstract class CopyWith$Variables$Query$getEpisodeAvailability<TRes> {
  factory CopyWith$Variables$Query$getEpisodeAvailability(
    Variables$Query$getEpisodeAvailability instance,
    TRes Function(Variables$Query$getEpisodeAvailability) then,
  ) = _CopyWithImpl$Variables$Query$getEpisodeAvailability;

  factory CopyWith$Variables$Query$getEpisodeAvailability.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getEpisodeAvailability;

  TRes call({String? episodeId});
}

class _CopyWithImpl$Variables$Query$getEpisodeAvailability<TRes>
    implements CopyWith$Variables$Query$getEpisodeAvailability<TRes> {
  _CopyWithImpl$Variables$Query$getEpisodeAvailability(
    this._instance,
    this._then,
  );

  final Variables$Query$getEpisodeAvailability _instance;

  final TRes Function(Variables$Query$getEpisodeAvailability) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? episodeId = _undefined}) =>
      _then(Variables$Query$getEpisodeAvailability._({
        ..._instance._$data,
        if (episodeId != _undefined && episodeId != null)
          'episodeId': (episodeId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getEpisodeAvailability<TRes>
    implements CopyWith$Variables$Query$getEpisodeAvailability<TRes> {
  _CopyWithStubImpl$Variables$Query$getEpisodeAvailability(this._res);

  TRes _res;

  call({String? episodeId}) => _res;
}

class Query$getEpisodeAvailability {
  Query$getEpisodeAvailability({
    required this.episode,
    this.$__typename = 'QueryRoot',
  });

  factory Query$getEpisodeAvailability.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$getEpisodeAvailability(
      episode: Fragment$EpisodeAvailability.fromJson(
          (l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$EpisodeAvailability episode;

  final String $__typename;

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
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$episode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getEpisodeAvailability) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
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

extension UtilityExtension$Query$getEpisodeAvailability
    on Query$getEpisodeAvailability {
  CopyWith$Query$getEpisodeAvailability<Query$getEpisodeAvailability>
      get copyWith => CopyWith$Query$getEpisodeAvailability(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getEpisodeAvailability<TRes> {
  factory CopyWith$Query$getEpisodeAvailability(
    Query$getEpisodeAvailability instance,
    TRes Function(Query$getEpisodeAvailability) then,
  ) = _CopyWithImpl$Query$getEpisodeAvailability;

  factory CopyWith$Query$getEpisodeAvailability.stub(TRes res) =
      _CopyWithStubImpl$Query$getEpisodeAvailability;

  TRes call({
    Fragment$EpisodeAvailability? episode,
    String? $__typename,
  });
  CopyWith$Fragment$EpisodeAvailability<TRes> get episode;
}

class _CopyWithImpl$Query$getEpisodeAvailability<TRes>
    implements CopyWith$Query$getEpisodeAvailability<TRes> {
  _CopyWithImpl$Query$getEpisodeAvailability(
    this._instance,
    this._then,
  );

  final Query$getEpisodeAvailability _instance;

  final TRes Function(Query$getEpisodeAvailability) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getEpisodeAvailability(
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Fragment$EpisodeAvailability),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EpisodeAvailability<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Fragment$EpisodeAvailability(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$getEpisodeAvailability<TRes>
    implements CopyWith$Query$getEpisodeAvailability<TRes> {
  _CopyWithStubImpl$Query$getEpisodeAvailability(this._res);

  TRes _res;

  call({
    Fragment$EpisodeAvailability? episode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EpisodeAvailability<TRes> get episode =>
      CopyWith$Fragment$EpisodeAvailability.stub(_res);
}

const documentNodeQuerygetEpisodeAvailability = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getEpisodeAvailability'),
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
        name: NameNode(value: 'episode'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'episodeId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'EpisodeAvailability'),
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
  fragmentDefinitionEpisodeAvailability,
]);
Query$getEpisodeAvailability _parserFn$Query$getEpisodeAvailability(
        Map<String, dynamic> data) =>
    Query$getEpisodeAvailability.fromJson(data);
typedef OnQueryComplete$Query$getEpisodeAvailability = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getEpisodeAvailability?,
);

class Options$Query$getEpisodeAvailability
    extends graphql.QueryOptions<Query$getEpisodeAvailability> {
  Options$Query$getEpisodeAvailability({
    String? operationName,
    required Variables$Query$getEpisodeAvailability variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getEpisodeAvailability? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getEpisodeAvailability? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$getEpisodeAvailability(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetEpisodeAvailability,
          parserFn: _parserFn$Query$getEpisodeAvailability,
        );

  final OnQueryComplete$Query$getEpisodeAvailability? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getEpisodeAvailability
    extends graphql.WatchQueryOptions<Query$getEpisodeAvailability> {
  WatchOptions$Query$getEpisodeAvailability({
    String? operationName,
    required Variables$Query$getEpisodeAvailability variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getEpisodeAvailability? typedOptimisticResult,
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
          document: documentNodeQuerygetEpisodeAvailability,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getEpisodeAvailability,
        );
}

class FetchMoreOptions$Query$getEpisodeAvailability
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getEpisodeAvailability({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getEpisodeAvailability variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetEpisodeAvailability,
        );
}

extension ClientExtension$Query$getEpisodeAvailability
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getEpisodeAvailability>>
      query$getEpisodeAvailability(
              Options$Query$getEpisodeAvailability options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getEpisodeAvailability>
      watchQuery$getEpisodeAvailability(
              WatchOptions$Query$getEpisodeAvailability options) =>
          this.watchQuery(options);
  void writeQuery$getEpisodeAvailability({
    required Query$getEpisodeAvailability data,
    required Variables$Query$getEpisodeAvailability variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetEpisodeAvailability),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getEpisodeAvailability? readQuery$getEpisodeAvailability({
    required Variables$Query$getEpisodeAvailability variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetEpisodeAvailability),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getEpisodeAvailability.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getEpisodeAvailability>
    useQuery$getEpisodeAvailability(
            Options$Query$getEpisodeAvailability options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getEpisodeAvailability>
    useWatchQuery$getEpisodeAvailability(
            WatchOptions$Query$getEpisodeAvailability options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getEpisodeAvailability$Widget
    extends graphql_flutter.Query<Query$getEpisodeAvailability> {
  Query$getEpisodeAvailability$Widget({
    widgets.Key? key,
    required Options$Query$getEpisodeAvailability options,
    required graphql_flutter.QueryBuilder<Query$getEpisodeAvailability> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}
