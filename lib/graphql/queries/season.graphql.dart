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

  static const _undefined = {};

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
    required this.$__typename,
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

  static const _undefined = {};

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
    required this.$__typename,
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

  static const _undefined = {};

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
    required this.$__typename,
  });

  factory Query$GetSeasonEpisodes$season$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetSeasonEpisodes$season$episodes(
      items: (l$items as List<dynamic>)
          .map((e) => Query$GetSeasonEpisodes$season$episodes$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetSeasonEpisodes$season$episodes$items> items;

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
    List<Query$GetSeasonEpisodes$season$episodes$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$GetSeasonEpisodes$season$episodes$items> Function(
              Iterable<
                  CopyWith$Query$GetSeasonEpisodes$season$episodes$items<
                      Query$GetSeasonEpisodes$season$episodes$items>>)
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

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSeasonEpisodes$season$episodes(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$GetSeasonEpisodes$season$episodes$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$GetSeasonEpisodes$season$episodes$items> Function(
                  Iterable<
                      CopyWith$Query$GetSeasonEpisodes$season$episodes$items<
                          Query$GetSeasonEpisodes$season$episodes$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Query$GetSeasonEpisodes$season$episodes$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes<TRes>
    implements CopyWith$Query$GetSeasonEpisodes$season$episodes<TRes> {
  _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes(this._res);

  TRes _res;

  call({
    List<Query$GetSeasonEpisodes$season$episodes$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetSeasonEpisodes$season$episodes$items
    implements Fragment$SeasonListEpisode {
  Query$GetSeasonEpisodes$season$episodes$items({
    required this.id,
    required this.lessons,
    this.image,
    this.number,
    required this.title,
    required this.publishDate,
    required this.ageRating,
    required this.duration,
    required this.$__typename,
  });

  factory Query$GetSeasonEpisodes$season$episodes$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$lessons = json['lessons'];
    final l$image = json['image'];
    final l$number = json['number'];
    final l$title = json['title'];
    final l$publishDate = json['publishDate'];
    final l$ageRating = json['ageRating'];
    final l$duration = json['duration'];
    final l$$__typename = json['__typename'];
    return Query$GetSeasonEpisodes$season$episodes$items(
      id: (l$id as String),
      lessons: Query$GetSeasonEpisodes$season$episodes$items$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      image: (l$image as String?),
      number: (l$number as int?),
      title: (l$title as String),
      publishDate: (l$publishDate as String),
      ageRating: (l$ageRating as String),
      duration: (l$duration as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetSeasonEpisodes$season$episodes$items$lessons lessons;

  final String? image;

  final int? number;

  final String title;

  final String publishDate;

  final String ageRating;

  final int duration;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$lessons = lessons;
    _resultData['lessons'] = l$lessons.toJson();
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
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$lessons = lessons;
    final l$image = image;
    final l$number = number;
    final l$title = title;
    final l$publishDate = publishDate;
    final l$ageRating = ageRating;
    final l$duration = duration;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$lessons,
      l$image,
      l$number,
      l$title,
      l$publishDate,
      l$ageRating,
      l$duration,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSeasonEpisodes$season$episodes$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$lessons = lessons;
    final lOther$lessons = other.lessons;
    if (l$lessons != lOther$lessons) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSeasonEpisodes$season$episodes$items
    on Query$GetSeasonEpisodes$season$episodes$items {
  CopyWith$Query$GetSeasonEpisodes$season$episodes$items<
          Query$GetSeasonEpisodes$season$episodes$items>
      get copyWith => CopyWith$Query$GetSeasonEpisodes$season$episodes$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSeasonEpisodes$season$episodes$items<TRes> {
  factory CopyWith$Query$GetSeasonEpisodes$season$episodes$items(
    Query$GetSeasonEpisodes$season$episodes$items instance,
    TRes Function(Query$GetSeasonEpisodes$season$episodes$items) then,
  ) = _CopyWithImpl$Query$GetSeasonEpisodes$season$episodes$items;

  factory CopyWith$Query$GetSeasonEpisodes$season$episodes$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes$items;

  TRes call({
    String? id,
    Query$GetSeasonEpisodes$season$episodes$items$lessons? lessons,
    String? image,
    int? number,
    String? title,
    String? publishDate,
    String? ageRating,
    int? duration,
    String? $__typename,
  });
  CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons<TRes>
      get lessons;
}

class _CopyWithImpl$Query$GetSeasonEpisodes$season$episodes$items<TRes>
    implements CopyWith$Query$GetSeasonEpisodes$season$episodes$items<TRes> {
  _CopyWithImpl$Query$GetSeasonEpisodes$season$episodes$items(
    this._instance,
    this._then,
  );

  final Query$GetSeasonEpisodes$season$episodes$items _instance;

  final TRes Function(Query$GetSeasonEpisodes$season$episodes$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? lessons = _undefined,
    Object? image = _undefined,
    Object? number = _undefined,
    Object? title = _undefined,
    Object? publishDate = _undefined,
    Object? ageRating = _undefined,
    Object? duration = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSeasonEpisodes$season$episodes$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        lessons: lessons == _undefined || lessons == null
            ? _instance.lessons
            : (lessons
                as Query$GetSeasonEpisodes$season$episodes$items$lessons),
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons<TRes>
      get lessons {
    final local$lessons = _instance.lessons;
    return CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons(
        local$lessons, (e) => call(lessons: e));
  }
}

class _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes$items<TRes>
    implements CopyWith$Query$GetSeasonEpisodes$season$episodes$items<TRes> {
  _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes$items(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetSeasonEpisodes$season$episodes$items$lessons? lessons,
    String? image,
    int? number,
    String? title,
    String? publishDate,
    String? ageRating,
    int? duration,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons<TRes>
      get lessons =>
          CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons.stub(
              _res);
}

class Query$GetSeasonEpisodes$season$episodes$items$lessons {
  Query$GetSeasonEpisodes$season$episodes$items$lessons({
    required this.total,
    required this.$__typename,
  });

  factory Query$GetSeasonEpisodes$season$episodes$items$lessons.fromJson(
      Map<String, dynamic> json) {
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$GetSeasonEpisodes$season$episodes$items$lessons(
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
    if (!(other is Query$GetSeasonEpisodes$season$episodes$items$lessons) ||
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

extension UtilityExtension$Query$GetSeasonEpisodes$season$episodes$items$lessons
    on Query$GetSeasonEpisodes$season$episodes$items$lessons {
  CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons<
          Query$GetSeasonEpisodes$season$episodes$items$lessons>
      get copyWith =>
          CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons<
    TRes> {
  factory CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons(
    Query$GetSeasonEpisodes$season$episodes$items$lessons instance,
    TRes Function(Query$GetSeasonEpisodes$season$episodes$items$lessons) then,
  ) = _CopyWithImpl$Query$GetSeasonEpisodes$season$episodes$items$lessons;

  factory CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes$items$lessons;

  TRes call({
    int? total,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSeasonEpisodes$season$episodes$items$lessons<TRes>
    implements
        CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons<TRes> {
  _CopyWithImpl$Query$GetSeasonEpisodes$season$episodes$items$lessons(
    this._instance,
    this._then,
  );

  final Query$GetSeasonEpisodes$season$episodes$items$lessons _instance;

  final TRes Function(Query$GetSeasonEpisodes$season$episodes$items$lessons)
      _then;

  static const _undefined = {};

  TRes call({
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSeasonEpisodes$season$episodes$items$lessons(
        total: total == _undefined || total == null
            ? _instance.total
            : (total as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes$items$lessons<
        TRes>
    implements
        CopyWith$Query$GetSeasonEpisodes$season$episodes$items$lessons<TRes> {
  _CopyWithStubImpl$Query$GetSeasonEpisodes$season$episodes$items$lessons(
      this._res);

  TRes _res;

  call({
    int? total,
    String? $__typename,
  }) =>
      _res;
}
