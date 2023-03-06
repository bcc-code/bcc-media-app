import 'episode.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetSeasonEpisodes {
  factory Variables$Query$GetSeasonEpisodes({required String id}) =>
      Variables$Query$GetSeasonEpisodes._({
        r'id': id,
      });

  Variables$Query$GetSeasonEpisodes._(this._$data);

  factory Variables$Query$GetSeasonEpisodes.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetSeasonEpisodes._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetSeasonEpisodes<Variables$Query$GetSeasonEpisodes>
      get copyWith => CopyWith$Variables$Query$GetSeasonEpisodes(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetSeasonEpisodes) ||
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

abstract class CopyWith$Variables$Query$GetSeasonEpisodes<TRes> {
  factory CopyWith$Variables$Query$GetSeasonEpisodes(
    Variables$Query$GetSeasonEpisodes instance,
    TRes Function(Variables$Query$GetSeasonEpisodes) then,
  ) = _CopyWithImpl$Variables$Query$GetSeasonEpisodes;

  factory CopyWith$Variables$Query$GetSeasonEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetSeasonEpisodes;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetSeasonEpisodes<TRes>
    implements CopyWith$Variables$Query$GetSeasonEpisodes<TRes> {
  _CopyWithImpl$Variables$Query$GetSeasonEpisodes(
    this._instance,
    this._then,
  );

  final Variables$Query$GetSeasonEpisodes _instance;

  final TRes Function(Variables$Query$GetSeasonEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetSeasonEpisodes._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetSeasonEpisodes<TRes>
    implements CopyWith$Variables$Query$GetSeasonEpisodes<TRes> {
  _CopyWithStubImpl$Variables$Query$GetSeasonEpisodes(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetSeasonEpisodes {
  Query$GetSeasonEpisodes({
    required this.season,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetSeasonEpisodes.fromJson(Map<String, dynamic> json) {
    final l$season = json['season'];
    final l$$__typename = json['__typename'];
    return Query$GetSeasonEpisodes(
      season: Query$GetSeasonEpisodes$season.fromJson(
          (l$season as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetSeasonEpisodes$season season;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$season = season;
    _resultData['season'] = l$season.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$season = season;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$season,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSeasonEpisodes) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetSeasonEpisodes on Query$GetSeasonEpisodes {
  CopyWith$Query$GetSeasonEpisodes<Query$GetSeasonEpisodes> get copyWith =>
      CopyWith$Query$GetSeasonEpisodes(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetSeasonEpisodes<TRes> {
  factory CopyWith$Query$GetSeasonEpisodes(
    Query$GetSeasonEpisodes instance,
    TRes Function(Query$GetSeasonEpisodes) then,
  ) = _CopyWithImpl$Query$GetSeasonEpisodes;

  factory CopyWith$Query$GetSeasonEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSeasonEpisodes;

  TRes call({
    Query$GetSeasonEpisodes$season? season,
    String? $__typename,
  });
  CopyWith$Query$GetSeasonEpisodes$season<TRes> get season;
}

class _CopyWithImpl$Query$GetSeasonEpisodes<TRes>
    implements CopyWith$Query$GetSeasonEpisodes<TRes> {
  _CopyWithImpl$Query$GetSeasonEpisodes(
    this._instance,
    this._then,
  );

  final Query$GetSeasonEpisodes _instance;

  final TRes Function(Query$GetSeasonEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? season = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSeasonEpisodes(
        season: season == _undefined || season == null
            ? _instance.season
            : (season as Query$GetSeasonEpisodes$season),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetSeasonEpisodes$season<TRes> get season {
    final local$season = _instance.season;
    return CopyWith$Query$GetSeasonEpisodes$season(
        local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$GetSeasonEpisodes<TRes>
    implements CopyWith$Query$GetSeasonEpisodes<TRes> {
  _CopyWithStubImpl$Query$GetSeasonEpisodes(this._res);

  TRes _res;

  call({
    Query$GetSeasonEpisodes$season? season,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetSeasonEpisodes$season<TRes> get season =>
      CopyWith$Query$GetSeasonEpisodes$season.stub(_res);
}

const documentNodeQueryGetSeasonEpisodes = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSeasonEpisodes'),
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
        name: NameNode(value: 'season'),
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
            name: NameNode(value: 'episodes'),
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
  fragmentDefinitionSeasonListEpisode,
]);
Query$GetSeasonEpisodes _parserFn$Query$GetSeasonEpisodes(
        Map<String, dynamic> data) =>
    Query$GetSeasonEpisodes.fromJson(data);

class Options$Query$GetSeasonEpisodes
    extends graphql.QueryOptions<Query$GetSeasonEpisodes> {
  Options$Query$GetSeasonEpisodes({
    String? operationName,
    required Variables$Query$GetSeasonEpisodes variables,
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
          document: documentNodeQueryGetSeasonEpisodes,
          parserFn: _parserFn$Query$GetSeasonEpisodes,
        );
}

class WatchOptions$Query$GetSeasonEpisodes
    extends graphql.WatchQueryOptions<Query$GetSeasonEpisodes> {
  WatchOptions$Query$GetSeasonEpisodes({
    String? operationName,
    required Variables$Query$GetSeasonEpisodes variables,
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
          document: documentNodeQueryGetSeasonEpisodes,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSeasonEpisodes,
        );
}

class FetchMoreOptions$Query$GetSeasonEpisodes
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSeasonEpisodes({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetSeasonEpisodes variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetSeasonEpisodes,
        );
}

extension ClientExtension$Query$GetSeasonEpisodes on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSeasonEpisodes>> query$GetSeasonEpisodes(
          Options$Query$GetSeasonEpisodes options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetSeasonEpisodes> watchQuery$GetSeasonEpisodes(
          WatchOptions$Query$GetSeasonEpisodes options) =>
      this.watchQuery(options);
  void writeQuery$GetSeasonEpisodes({
    required Query$GetSeasonEpisodes data,
    required Variables$Query$GetSeasonEpisodes variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetSeasonEpisodes),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSeasonEpisodes? readQuery$GetSeasonEpisodes({
    required Variables$Query$GetSeasonEpisodes variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetSeasonEpisodes),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetSeasonEpisodes.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSeasonEpisodes>
    useQuery$GetSeasonEpisodes(Options$Query$GetSeasonEpisodes options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetSeasonEpisodes>
    useWatchQuery$GetSeasonEpisodes(
            WatchOptions$Query$GetSeasonEpisodes options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetSeasonEpisodes$Widget
    extends graphql_flutter.Query<Query$GetSeasonEpisodes> {
  Query$GetSeasonEpisodes$Widget({
    widgets.Key? key,
    required Options$Query$GetSeasonEpisodes options,
    required graphql_flutter.QueryBuilder<Query$GetSeasonEpisodes> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetSeasonEpisodes$season {
  Query$GetSeasonEpisodes$season({
    required this.id,
    required this.number,
    required this.episodes,
    this.$__typename = 'Season',
  });

  factory Query$GetSeasonEpisodes$season.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$number = json['number'];
    final l$episodes = json['episodes'];
    final l$$__typename = json['__typename'];
    return Query$GetSeasonEpisodes$season(
      id: (l$id as String),
      number: (l$number as int),
      episodes: Query$GetSeasonEpisodes$season$episodes.fromJson(
          (l$episodes as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int number;

  final Query$GetSeasonEpisodes$season$episodes episodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$number = number;
    final l$episodes = episodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$number,
      l$episodes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSeasonEpisodes$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSeasonEpisodes$season
    on Query$GetSeasonEpisodes$season {
  CopyWith$Query$GetSeasonEpisodes$season<Query$GetSeasonEpisodes$season>
      get copyWith => CopyWith$Query$GetSeasonEpisodes$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSeasonEpisodes$season<TRes> {
  factory CopyWith$Query$GetSeasonEpisodes$season(
    Query$GetSeasonEpisodes$season instance,
    TRes Function(Query$GetSeasonEpisodes$season) then,
  ) = _CopyWithImpl$Query$GetSeasonEpisodes$season;

  factory CopyWith$Query$GetSeasonEpisodes$season.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSeasonEpisodes$season;

  TRes call({
    String? id,
    int? number,
    Query$GetSeasonEpisodes$season$episodes? episodes,
    String? $__typename,
  });
  CopyWith$Query$GetSeasonEpisodes$season$episodes<TRes> get episodes;
}

class _CopyWithImpl$Query$GetSeasonEpisodes$season<TRes>
    implements CopyWith$Query$GetSeasonEpisodes$season<TRes> {
  _CopyWithImpl$Query$GetSeasonEpisodes$season(
    this._instance,
    this._then,
  );

  final Query$GetSeasonEpisodes$season _instance;

  final TRes Function(Query$GetSeasonEpisodes$season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? number = _undefined,
    Object? episodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSeasonEpisodes$season(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        episodes: episodes == _undefined || episodes == null
            ? _instance.episodes
            : (episodes as Query$GetSeasonEpisodes$season$episodes),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetSeasonEpisodes$season$episodes<TRes> get episodes {
    final local$episodes = _instance.episodes;
    return CopyWith$Query$GetSeasonEpisodes$season$episodes(
        local$episodes, (e) => call(episodes: e));
  }
}

class _CopyWithStubImpl$Query$GetSeasonEpisodes$season<TRes>
    implements CopyWith$Query$GetSeasonEpisodes$season<TRes> {
  _CopyWithStubImpl$Query$GetSeasonEpisodes$season(this._res);

  TRes _res;

  call({
    String? id,
    int? number,
    Query$GetSeasonEpisodes$season$episodes? episodes,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetSeasonEpisodes$season$episodes<TRes> get episodes =>
      CopyWith$Query$GetSeasonEpisodes$season$episodes.stub(_res);
}

class Query$GetSeasonEpisodes$season$episodes {
  Query$GetSeasonEpisodes$season$episodes({
    required this.items,
    this.$__typename = 'EpisodePagination',
  });

  factory Query$GetSeasonEpisodes$season$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetSeasonEpisodes$season$episodes(
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
    if (!(other is Query$GetSeasonEpisodes$season$episodes) ||
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

extension UtilityExtension$Query$GetSeasonEpisodes$season$episodes
    on Query$GetSeasonEpisodes$season$episodes {
  CopyWith$Query$GetSeasonEpisodes$season$episodes<
          Query$GetSeasonEpisodes$season$episodes>
      get copyWith => CopyWith$Query$GetSeasonEpisodes$season$episodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSeasonEpisodes$season$episodes<TRes> {
  factory CopyWith$Query$GetSeasonEpisodes$season$episodes(
    Query$GetSeasonEpisodes$season$episodes instance,
    TRes Function(Query$GetSeasonEpisodes$season$episodes) then,
  ) = _CopyWithImpl$Query$GetSeasonEpisodes$season$episodes;

  factory CopyWith$Query$GetSeasonEpisodes$season$episodes.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes;

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

class _CopyWithImpl$Query$GetSeasonEpisodes$season$episodes<TRes>
    implements CopyWith$Query$GetSeasonEpisodes$season$episodes<TRes> {
  _CopyWithImpl$Query$GetSeasonEpisodes$season$episodes(
    this._instance,
    this._then,
  );

  final Query$GetSeasonEpisodes$season$episodes _instance;

  final TRes Function(Query$GetSeasonEpisodes$season$episodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSeasonEpisodes$season$episodes(
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

class _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes<TRes>
    implements CopyWith$Query$GetSeasonEpisodes$season$episodes<TRes> {
  _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes(this._res);

  TRes _res;

  call({
    List<Fragment$SeasonListEpisode>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}
