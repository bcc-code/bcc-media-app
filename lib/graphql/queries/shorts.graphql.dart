import 'episode.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$ShortsEpisode {
  Fragment$ShortsEpisode({required this.$__typename});

  factory Fragment$ShortsEpisode.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "EpisodeItem":
        return Fragment$ShortsEpisode$$EpisodeItem.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$ShortsEpisode($__typename: (l$$__typename as String));
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
    if (!(other is Fragment$ShortsEpisode) ||
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

extension UtilityExtension$Fragment$ShortsEpisode on Fragment$ShortsEpisode {
  CopyWith$Fragment$ShortsEpisode<Fragment$ShortsEpisode> get copyWith =>
      CopyWith$Fragment$ShortsEpisode(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ShortsEpisode<TRes> {
  factory CopyWith$Fragment$ShortsEpisode(
    Fragment$ShortsEpisode instance,
    TRes Function(Fragment$ShortsEpisode) then,
  ) = _CopyWithImpl$Fragment$ShortsEpisode;

  factory CopyWith$Fragment$ShortsEpisode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ShortsEpisode;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$ShortsEpisode<TRes>
    implements CopyWith$Fragment$ShortsEpisode<TRes> {
  _CopyWithImpl$Fragment$ShortsEpisode(
    this._instance,
    this._then,
  );

  final Fragment$ShortsEpisode _instance;

  final TRes Function(Fragment$ShortsEpisode) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(Fragment$ShortsEpisode(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ShortsEpisode<TRes>
    implements CopyWith$Fragment$ShortsEpisode<TRes> {
  _CopyWithStubImpl$Fragment$ShortsEpisode(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

const fragmentDefinitionShortsEpisode = FragmentDefinitionNode(
  name: NameNode(value: 'ShortsEpisode'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'CollectionItem'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'EpisodeItem'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'episode'),
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
const documentNodeFragmentShortsEpisode = DocumentNode(definitions: [
  fragmentDefinitionShortsEpisode,
]);

extension ClientExtension$Fragment$ShortsEpisode on graphql.GraphQLClient {
  void writeFragment$ShortsEpisode({
    required Fragment$ShortsEpisode data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ShortsEpisode',
            document: documentNodeFragmentShortsEpisode,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ShortsEpisode? readFragment$ShortsEpisode({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ShortsEpisode',
          document: documentNodeFragmentShortsEpisode,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ShortsEpisode.fromJson(result);
  }
}

class Fragment$ShortsEpisode$$EpisodeItem implements Fragment$ShortsEpisode {
  Fragment$ShortsEpisode$$EpisodeItem({
    required this.$__typename,
    required this.episode,
  });

  factory Fragment$ShortsEpisode$$EpisodeItem.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$episode = json['episode'];
    return Fragment$ShortsEpisode$$EpisodeItem(
      $__typename: (l$$__typename as String),
      episode: Fragment$ShortsEpisode$$EpisodeItem$episode.fromJson(
          (l$episode as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final Fragment$ShortsEpisode$$EpisodeItem$episode episode;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$episode = episode;
    _resultData['episode'] = l$episode.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$episode = episode;
    return Object.hashAll([
      l$$__typename,
      l$episode,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ShortsEpisode$$EpisodeItem) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$ShortsEpisode$$EpisodeItem
    on Fragment$ShortsEpisode$$EpisodeItem {
  CopyWith$Fragment$ShortsEpisode$$EpisodeItem<
          Fragment$ShortsEpisode$$EpisodeItem>
      get copyWith => CopyWith$Fragment$ShortsEpisode$$EpisodeItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ShortsEpisode$$EpisodeItem<TRes> {
  factory CopyWith$Fragment$ShortsEpisode$$EpisodeItem(
    Fragment$ShortsEpisode$$EpisodeItem instance,
    TRes Function(Fragment$ShortsEpisode$$EpisodeItem) then,
  ) = _CopyWithImpl$Fragment$ShortsEpisode$$EpisodeItem;

  factory CopyWith$Fragment$ShortsEpisode$$EpisodeItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ShortsEpisode$$EpisodeItem;

  TRes call({
    String? $__typename,
    Fragment$ShortsEpisode$$EpisodeItem$episode? episode,
  });
  CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode<TRes> get episode;
}

class _CopyWithImpl$Fragment$ShortsEpisode$$EpisodeItem<TRes>
    implements CopyWith$Fragment$ShortsEpisode$$EpisodeItem<TRes> {
  _CopyWithImpl$Fragment$ShortsEpisode$$EpisodeItem(
    this._instance,
    this._then,
  );

  final Fragment$ShortsEpisode$$EpisodeItem _instance;

  final TRes Function(Fragment$ShortsEpisode$$EpisodeItem) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? episode = _undefined,
  }) =>
      _then(Fragment$ShortsEpisode$$EpisodeItem(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Fragment$ShortsEpisode$$EpisodeItem$episode),
      ));
  CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Fragment$ShortsEpisode$$EpisodeItem<TRes>
    implements CopyWith$Fragment$ShortsEpisode$$EpisodeItem<TRes> {
  _CopyWithStubImpl$Fragment$ShortsEpisode$$EpisodeItem(this._res);

  TRes _res;

  call({
    String? $__typename,
    Fragment$ShortsEpisode$$EpisodeItem$episode? episode,
  }) =>
      _res;
  CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode<TRes> get episode =>
      CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode.stub(_res);
}

class Fragment$ShortsEpisode$$EpisodeItem$episode {
  Fragment$ShortsEpisode$$EpisodeItem$episode({
    required this.id,
    required this.title,
    required this.$__typename,
  });

  factory Fragment$ShortsEpisode$$EpisodeItem$episode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$ShortsEpisode$$EpisodeItem$episode(
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
    if (!(other is Fragment$ShortsEpisode$$EpisodeItem$episode) ||
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

extension UtilityExtension$Fragment$ShortsEpisode$$EpisodeItem$episode
    on Fragment$ShortsEpisode$$EpisodeItem$episode {
  CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode<
          Fragment$ShortsEpisode$$EpisodeItem$episode>
      get copyWith => CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode<TRes> {
  factory CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode(
    Fragment$ShortsEpisode$$EpisodeItem$episode instance,
    TRes Function(Fragment$ShortsEpisode$$EpisodeItem$episode) then,
  ) = _CopyWithImpl$Fragment$ShortsEpisode$$EpisodeItem$episode;

  factory CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ShortsEpisode$$EpisodeItem$episode;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ShortsEpisode$$EpisodeItem$episode<TRes>
    implements CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode<TRes> {
  _CopyWithImpl$Fragment$ShortsEpisode$$EpisodeItem$episode(
    this._instance,
    this._then,
  );

  final Fragment$ShortsEpisode$$EpisodeItem$episode _instance;

  final TRes Function(Fragment$ShortsEpisode$$EpisodeItem$episode) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ShortsEpisode$$EpisodeItem$episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ShortsEpisode$$EpisodeItem$episode<TRes>
    implements CopyWith$Fragment$ShortsEpisode$$EpisodeItem$episode<TRes> {
  _CopyWithStubImpl$Fragment$ShortsEpisode$$EpisodeItem$episode(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetEpisodesForShorts {
  factory Variables$Query$GetEpisodesForShorts({
    required int first,
    required int offset,
  }) =>
      Variables$Query$GetEpisodesForShorts._({
        r'first': first,
        r'offset': offset,
      });

  Variables$Query$GetEpisodesForShorts._(this._$data);

  factory Variables$Query$GetEpisodesForShorts.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$first = data['first'];
    result$data['first'] = (l$first as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    return Variables$Query$GetEpisodesForShorts._(result$data);
  }

  Map<String, dynamic> _$data;

  int get first => (_$data['first'] as int);
  int get offset => (_$data['offset'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$first = first;
    result$data['first'] = l$first;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    return result$data;
  }

  CopyWith$Variables$Query$GetEpisodesForShorts<
          Variables$Query$GetEpisodesForShorts>
      get copyWith => CopyWith$Variables$Query$GetEpisodesForShorts(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetEpisodesForShorts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$offset = offset;
    return Object.hashAll([
      l$first,
      l$offset,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetEpisodesForShorts<TRes> {
  factory CopyWith$Variables$Query$GetEpisodesForShorts(
    Variables$Query$GetEpisodesForShorts instance,
    TRes Function(Variables$Query$GetEpisodesForShorts) then,
  ) = _CopyWithImpl$Variables$Query$GetEpisodesForShorts;

  factory CopyWith$Variables$Query$GetEpisodesForShorts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetEpisodesForShorts;

  TRes call({
    int? first,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$GetEpisodesForShorts<TRes>
    implements CopyWith$Variables$Query$GetEpisodesForShorts<TRes> {
  _CopyWithImpl$Variables$Query$GetEpisodesForShorts(
    this._instance,
    this._then,
  );

  final Variables$Query$GetEpisodesForShorts _instance;

  final TRes Function(Variables$Query$GetEpisodesForShorts) _then;

  static const _undefined = {};

  TRes call({
    Object? first = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$GetEpisodesForShorts._({
        ..._instance._$data,
        if (first != _undefined && first != null) 'first': (first as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetEpisodesForShorts<TRes>
    implements CopyWith$Variables$Query$GetEpisodesForShorts<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEpisodesForShorts(this._res);

  TRes _res;

  call({
    int? first,
    int? offset,
  }) =>
      _res;
}

class Query$GetEpisodesForShorts {
  Query$GetEpisodesForShorts({
    required this.collection,
    required this.$__typename,
  });

  factory Query$GetEpisodesForShorts.fromJson(Map<String, dynamic> json) {
    final l$collection = json['collection'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodesForShorts(
      collection: Query$GetEpisodesForShorts$collection.fromJson(
          (l$collection as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEpisodesForShorts$collection collection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$collection = collection;
    _resultData['collection'] = l$collection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$collection = collection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$collection,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetEpisodesForShorts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$collection = collection;
    final lOther$collection = other.collection;
    if (l$collection != lOther$collection) {
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

extension UtilityExtension$Query$GetEpisodesForShorts
    on Query$GetEpisodesForShorts {
  CopyWith$Query$GetEpisodesForShorts<Query$GetEpisodesForShorts>
      get copyWith => CopyWith$Query$GetEpisodesForShorts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodesForShorts<TRes> {
  factory CopyWith$Query$GetEpisodesForShorts(
    Query$GetEpisodesForShorts instance,
    TRes Function(Query$GetEpisodesForShorts) then,
  ) = _CopyWithImpl$Query$GetEpisodesForShorts;

  factory CopyWith$Query$GetEpisodesForShorts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodesForShorts;

  TRes call({
    Query$GetEpisodesForShorts$collection? collection,
    String? $__typename,
  });
  CopyWith$Query$GetEpisodesForShorts$collection<TRes> get collection;
}

class _CopyWithImpl$Query$GetEpisodesForShorts<TRes>
    implements CopyWith$Query$GetEpisodesForShorts<TRes> {
  _CopyWithImpl$Query$GetEpisodesForShorts(
    this._instance,
    this._then,
  );

  final Query$GetEpisodesForShorts _instance;

  final TRes Function(Query$GetEpisodesForShorts) _then;

  static const _undefined = {};

  TRes call({
    Object? collection = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodesForShorts(
        collection: collection == _undefined || collection == null
            ? _instance.collection
            : (collection as Query$GetEpisodesForShorts$collection),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetEpisodesForShorts$collection<TRes> get collection {
    final local$collection = _instance.collection;
    return CopyWith$Query$GetEpisodesForShorts$collection(
        local$collection, (e) => call(collection: e));
  }
}

class _CopyWithStubImpl$Query$GetEpisodesForShorts<TRes>
    implements CopyWith$Query$GetEpisodesForShorts<TRes> {
  _CopyWithStubImpl$Query$GetEpisodesForShorts(this._res);

  TRes _res;

  call({
    Query$GetEpisodesForShorts$collection? collection,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetEpisodesForShorts$collection<TRes> get collection =>
      CopyWith$Query$GetEpisodesForShorts$collection.stub(_res);
}

const documentNodeQueryGetEpisodesForShorts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetEpisodesForShorts'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'collection'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'slug'),
            value: StringValueNode(
              value: 'shorts-proof-of-concept',
              isBlock: false,
            ),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [
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
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'ShortsEpisode'),
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
  fragmentDefinitionShortsEpisode,
]);
Query$GetEpisodesForShorts _parserFn$Query$GetEpisodesForShorts(
        Map<String, dynamic> data) =>
    Query$GetEpisodesForShorts.fromJson(data);

class Options$Query$GetEpisodesForShorts
    extends graphql.QueryOptions<Query$GetEpisodesForShorts> {
  Options$Query$GetEpisodesForShorts({
    String? operationName,
    required Variables$Query$GetEpisodesForShorts variables,
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
          document: documentNodeQueryGetEpisodesForShorts,
          parserFn: _parserFn$Query$GetEpisodesForShorts,
        );
}

class WatchOptions$Query$GetEpisodesForShorts
    extends graphql.WatchQueryOptions<Query$GetEpisodesForShorts> {
  WatchOptions$Query$GetEpisodesForShorts({
    String? operationName,
    required Variables$Query$GetEpisodesForShorts variables,
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
          document: documentNodeQueryGetEpisodesForShorts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetEpisodesForShorts,
        );
}

class FetchMoreOptions$Query$GetEpisodesForShorts
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEpisodesForShorts({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetEpisodesForShorts variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetEpisodesForShorts,
        );
}

extension ClientExtension$Query$GetEpisodesForShorts on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEpisodesForShorts>>
      query$GetEpisodesForShorts(
              Options$Query$GetEpisodesForShorts options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetEpisodesForShorts>
      watchQuery$GetEpisodesForShorts(
              WatchOptions$Query$GetEpisodesForShorts options) =>
          this.watchQuery(options);
  void writeQuery$GetEpisodesForShorts({
    required Query$GetEpisodesForShorts data,
    required Variables$Query$GetEpisodesForShorts variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetEpisodesForShorts),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetEpisodesForShorts? readQuery$GetEpisodesForShorts({
    required Variables$Query$GetEpisodesForShorts variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetEpisodesForShorts),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEpisodesForShorts.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetEpisodesForShorts>
    useQuery$GetEpisodesForShorts(Options$Query$GetEpisodesForShorts options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetEpisodesForShorts>
    useWatchQuery$GetEpisodesForShorts(
            WatchOptions$Query$GetEpisodesForShorts options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetEpisodesForShorts$Widget
    extends graphql_flutter.Query<Query$GetEpisodesForShorts> {
  Query$GetEpisodesForShorts$Widget({
    widgets.Key? key,
    required Options$Query$GetEpisodesForShorts options,
    required graphql_flutter.QueryBuilder<Query$GetEpisodesForShorts> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetEpisodesForShorts$collection {
  Query$GetEpisodesForShorts$collection({
    this.items,
    required this.$__typename,
  });

  factory Query$GetEpisodesForShorts$collection.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodesForShorts$collection(
      items: l$items == null
          ? null
          : Query$GetEpisodesForShorts$collection$items.fromJson(
              (l$items as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEpisodesForShorts$collection$items? items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$items,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetEpisodesForShorts$collection) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetEpisodesForShorts$collection
    on Query$GetEpisodesForShorts$collection {
  CopyWith$Query$GetEpisodesForShorts$collection<
          Query$GetEpisodesForShorts$collection>
      get copyWith => CopyWith$Query$GetEpisodesForShorts$collection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodesForShorts$collection<TRes> {
  factory CopyWith$Query$GetEpisodesForShorts$collection(
    Query$GetEpisodesForShorts$collection instance,
    TRes Function(Query$GetEpisodesForShorts$collection) then,
  ) = _CopyWithImpl$Query$GetEpisodesForShorts$collection;

  factory CopyWith$Query$GetEpisodesForShorts$collection.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodesForShorts$collection;

  TRes call({
    Query$GetEpisodesForShorts$collection$items? items,
    String? $__typename,
  });
  CopyWith$Query$GetEpisodesForShorts$collection$items<TRes> get items;
}

class _CopyWithImpl$Query$GetEpisodesForShorts$collection<TRes>
    implements CopyWith$Query$GetEpisodesForShorts$collection<TRes> {
  _CopyWithImpl$Query$GetEpisodesForShorts$collection(
    this._instance,
    this._then,
  );

  final Query$GetEpisodesForShorts$collection _instance;

  final TRes Function(Query$GetEpisodesForShorts$collection) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodesForShorts$collection(
        items: items == _undefined
            ? _instance.items
            : (items as Query$GetEpisodesForShorts$collection$items?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetEpisodesForShorts$collection$items<TRes> get items {
    final local$items = _instance.items;
    return local$items == null
        ? CopyWith$Query$GetEpisodesForShorts$collection$items.stub(
            _then(_instance))
        : CopyWith$Query$GetEpisodesForShorts$collection$items(
            local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$GetEpisodesForShorts$collection<TRes>
    implements CopyWith$Query$GetEpisodesForShorts$collection<TRes> {
  _CopyWithStubImpl$Query$GetEpisodesForShorts$collection(this._res);

  TRes _res;

  call({
    Query$GetEpisodesForShorts$collection$items? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetEpisodesForShorts$collection$items<TRes> get items =>
      CopyWith$Query$GetEpisodesForShorts$collection$items.stub(_res);
}

class Query$GetEpisodesForShorts$collection$items {
  Query$GetEpisodesForShorts$collection$items({
    required this.items,
    required this.$__typename,
  });

  factory Query$GetEpisodesForShorts$collection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodesForShorts$collection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ShortsEpisode.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ShortsEpisode> items;

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
    if (!(other is Query$GetEpisodesForShorts$collection$items) ||
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

extension UtilityExtension$Query$GetEpisodesForShorts$collection$items
    on Query$GetEpisodesForShorts$collection$items {
  CopyWith$Query$GetEpisodesForShorts$collection$items<
          Query$GetEpisodesForShorts$collection$items>
      get copyWith => CopyWith$Query$GetEpisodesForShorts$collection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodesForShorts$collection$items<TRes> {
  factory CopyWith$Query$GetEpisodesForShorts$collection$items(
    Query$GetEpisodesForShorts$collection$items instance,
    TRes Function(Query$GetEpisodesForShorts$collection$items) then,
  ) = _CopyWithImpl$Query$GetEpisodesForShorts$collection$items;

  factory CopyWith$Query$GetEpisodesForShorts$collection$items.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodesForShorts$collection$items;

  TRes call({
    List<Fragment$ShortsEpisode>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ShortsEpisode> Function(
              Iterable<CopyWith$Fragment$ShortsEpisode<Fragment$ShortsEpisode>>)
          _fn);
}

class _CopyWithImpl$Query$GetEpisodesForShorts$collection$items<TRes>
    implements CopyWith$Query$GetEpisodesForShorts$collection$items<TRes> {
  _CopyWithImpl$Query$GetEpisodesForShorts$collection$items(
    this._instance,
    this._then,
  );

  final Query$GetEpisodesForShorts$collection$items _instance;

  final TRes Function(Query$GetEpisodesForShorts$collection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodesForShorts$collection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ShortsEpisode>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$ShortsEpisode> Function(
                  Iterable<
                      CopyWith$Fragment$ShortsEpisode<Fragment$ShortsEpisode>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$ShortsEpisode(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetEpisodesForShorts$collection$items<TRes>
    implements CopyWith$Query$GetEpisodesForShorts$collection$items<TRes> {
  _CopyWithStubImpl$Query$GetEpisodesForShorts$collection$items(this._res);

  TRes _res;

  call({
    List<Fragment$ShortsEpisode>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Variables$Query$GetStreamsForEpisode {
  factory Variables$Query$GetStreamsForEpisode({required String id}) =>
      Variables$Query$GetStreamsForEpisode._({
        r'id': id,
      });

  Variables$Query$GetStreamsForEpisode._(this._$data);

  factory Variables$Query$GetStreamsForEpisode.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetStreamsForEpisode._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetStreamsForEpisode<
          Variables$Query$GetStreamsForEpisode>
      get copyWith => CopyWith$Variables$Query$GetStreamsForEpisode(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetStreamsForEpisode) ||
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

abstract class CopyWith$Variables$Query$GetStreamsForEpisode<TRes> {
  factory CopyWith$Variables$Query$GetStreamsForEpisode(
    Variables$Query$GetStreamsForEpisode instance,
    TRes Function(Variables$Query$GetStreamsForEpisode) then,
  ) = _CopyWithImpl$Variables$Query$GetStreamsForEpisode;

  factory CopyWith$Variables$Query$GetStreamsForEpisode.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetStreamsForEpisode;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetStreamsForEpisode<TRes>
    implements CopyWith$Variables$Query$GetStreamsForEpisode<TRes> {
  _CopyWithImpl$Variables$Query$GetStreamsForEpisode(
    this._instance,
    this._then,
  );

  final Variables$Query$GetStreamsForEpisode _instance;

  final TRes Function(Variables$Query$GetStreamsForEpisode) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetStreamsForEpisode._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetStreamsForEpisode<TRes>
    implements CopyWith$Variables$Query$GetStreamsForEpisode<TRes> {
  _CopyWithStubImpl$Variables$Query$GetStreamsForEpisode(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetStreamsForEpisode {
  Query$GetStreamsForEpisode({
    required this.episode,
    required this.$__typename,
  });

  factory Query$GetStreamsForEpisode.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$GetStreamsForEpisode(
      episode: Query$GetStreamsForEpisode$episode.fromJson(
          (l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetStreamsForEpisode$episode episode;

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
    if (!(other is Query$GetStreamsForEpisode) ||
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

extension UtilityExtension$Query$GetStreamsForEpisode
    on Query$GetStreamsForEpisode {
  CopyWith$Query$GetStreamsForEpisode<Query$GetStreamsForEpisode>
      get copyWith => CopyWith$Query$GetStreamsForEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStreamsForEpisode<TRes> {
  factory CopyWith$Query$GetStreamsForEpisode(
    Query$GetStreamsForEpisode instance,
    TRes Function(Query$GetStreamsForEpisode) then,
  ) = _CopyWithImpl$Query$GetStreamsForEpisode;

  factory CopyWith$Query$GetStreamsForEpisode.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStreamsForEpisode;

  TRes call({
    Query$GetStreamsForEpisode$episode? episode,
    String? $__typename,
  });
  CopyWith$Query$GetStreamsForEpisode$episode<TRes> get episode;
}

class _CopyWithImpl$Query$GetStreamsForEpisode<TRes>
    implements CopyWith$Query$GetStreamsForEpisode<TRes> {
  _CopyWithImpl$Query$GetStreamsForEpisode(
    this._instance,
    this._then,
  );

  final Query$GetStreamsForEpisode _instance;

  final TRes Function(Query$GetStreamsForEpisode) _then;

  static const _undefined = {};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStreamsForEpisode(
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Query$GetStreamsForEpisode$episode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetStreamsForEpisode$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Query$GetStreamsForEpisode$episode(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$GetStreamsForEpisode<TRes>
    implements CopyWith$Query$GetStreamsForEpisode<TRes> {
  _CopyWithStubImpl$Query$GetStreamsForEpisode(this._res);

  TRes _res;

  call({
    Query$GetStreamsForEpisode$episode? episode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetStreamsForEpisode$episode<TRes> get episode =>
      CopyWith$Query$GetStreamsForEpisode$episode.stub(_res);
}

const documentNodeQueryGetStreamsForEpisode = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetStreamsForEpisode'),
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
          FieldNode(
            name: NameNode(value: 'duration'),
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
  fragmentDefinitionBasicStream,
]);
Query$GetStreamsForEpisode _parserFn$Query$GetStreamsForEpisode(
        Map<String, dynamic> data) =>
    Query$GetStreamsForEpisode.fromJson(data);

class Options$Query$GetStreamsForEpisode
    extends graphql.QueryOptions<Query$GetStreamsForEpisode> {
  Options$Query$GetStreamsForEpisode({
    String? operationName,
    required Variables$Query$GetStreamsForEpisode variables,
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
          document: documentNodeQueryGetStreamsForEpisode,
          parserFn: _parserFn$Query$GetStreamsForEpisode,
        );
}

class WatchOptions$Query$GetStreamsForEpisode
    extends graphql.WatchQueryOptions<Query$GetStreamsForEpisode> {
  WatchOptions$Query$GetStreamsForEpisode({
    String? operationName,
    required Variables$Query$GetStreamsForEpisode variables,
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
          document: documentNodeQueryGetStreamsForEpisode,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetStreamsForEpisode,
        );
}

class FetchMoreOptions$Query$GetStreamsForEpisode
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetStreamsForEpisode({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetStreamsForEpisode variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetStreamsForEpisode,
        );
}

extension ClientExtension$Query$GetStreamsForEpisode on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetStreamsForEpisode>>
      query$GetStreamsForEpisode(
              Options$Query$GetStreamsForEpisode options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetStreamsForEpisode>
      watchQuery$GetStreamsForEpisode(
              WatchOptions$Query$GetStreamsForEpisode options) =>
          this.watchQuery(options);
  void writeQuery$GetStreamsForEpisode({
    required Query$GetStreamsForEpisode data,
    required Variables$Query$GetStreamsForEpisode variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetStreamsForEpisode),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetStreamsForEpisode? readQuery$GetStreamsForEpisode({
    required Variables$Query$GetStreamsForEpisode variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetStreamsForEpisode),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetStreamsForEpisode.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetStreamsForEpisode>
    useQuery$GetStreamsForEpisode(Options$Query$GetStreamsForEpisode options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetStreamsForEpisode>
    useWatchQuery$GetStreamsForEpisode(
            WatchOptions$Query$GetStreamsForEpisode options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetStreamsForEpisode$Widget
    extends graphql_flutter.Query<Query$GetStreamsForEpisode> {
  Query$GetStreamsForEpisode$Widget({
    widgets.Key? key,
    required Options$Query$GetStreamsForEpisode options,
    required graphql_flutter.QueryBuilder<Query$GetStreamsForEpisode> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetStreamsForEpisode$episode {
  Query$GetStreamsForEpisode$episode({
    required this.duration,
    required this.streams,
    required this.$__typename,
  });

  factory Query$GetStreamsForEpisode$episode.fromJson(
      Map<String, dynamic> json) {
    final l$duration = json['duration'];
    final l$streams = json['streams'];
    final l$$__typename = json['__typename'];
    return Query$GetStreamsForEpisode$episode(
      duration: (l$duration as int),
      streams: (l$streams as List<dynamic>)
          .map(
              (e) => Fragment$BasicStream.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int duration;

  final List<Fragment$BasicStream> streams;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$streams = streams;
    _resultData['streams'] = l$streams.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$duration = duration;
    final l$streams = streams;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$duration,
      Object.hashAll(l$streams.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetStreamsForEpisode$episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetStreamsForEpisode$episode
    on Query$GetStreamsForEpisode$episode {
  CopyWith$Query$GetStreamsForEpisode$episode<
          Query$GetStreamsForEpisode$episode>
      get copyWith => CopyWith$Query$GetStreamsForEpisode$episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStreamsForEpisode$episode<TRes> {
  factory CopyWith$Query$GetStreamsForEpisode$episode(
    Query$GetStreamsForEpisode$episode instance,
    TRes Function(Query$GetStreamsForEpisode$episode) then,
  ) = _CopyWithImpl$Query$GetStreamsForEpisode$episode;

  factory CopyWith$Query$GetStreamsForEpisode$episode.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStreamsForEpisode$episode;

  TRes call({
    int? duration,
    List<Fragment$BasicStream>? streams,
    String? $__typename,
  });
  TRes streams(
      Iterable<Fragment$BasicStream> Function(
              Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
          _fn);
}

class _CopyWithImpl$Query$GetStreamsForEpisode$episode<TRes>
    implements CopyWith$Query$GetStreamsForEpisode$episode<TRes> {
  _CopyWithImpl$Query$GetStreamsForEpisode$episode(
    this._instance,
    this._then,
  );

  final Query$GetStreamsForEpisode$episode _instance;

  final TRes Function(Query$GetStreamsForEpisode$episode) _then;

  static const _undefined = {};

  TRes call({
    Object? duration = _undefined,
    Object? streams = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStreamsForEpisode$episode(
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        streams: streams == _undefined || streams == null
            ? _instance.streams
            : (streams as List<Fragment$BasicStream>),
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
}

class _CopyWithStubImpl$Query$GetStreamsForEpisode$episode<TRes>
    implements CopyWith$Query$GetStreamsForEpisode$episode<TRes> {
  _CopyWithStubImpl$Query$GetStreamsForEpisode$episode(this._res);

  TRes _res;

  call({
    int? duration,
    List<Fragment$BasicStream>? streams,
    String? $__typename,
  }) =>
      _res;
  streams(_fn) => _res;
}
