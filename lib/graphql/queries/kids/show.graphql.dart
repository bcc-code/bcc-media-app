import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetEpisodesForShow {
  factory Variables$Query$GetEpisodesForShow({required String id}) =>
      Variables$Query$GetEpisodesForShow._({
        r'id': id,
      });

  Variables$Query$GetEpisodesForShow._(this._$data);

  factory Variables$Query$GetEpisodesForShow.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetEpisodesForShow._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetEpisodesForShow<
          Variables$Query$GetEpisodesForShow>
      get copyWith => CopyWith$Variables$Query$GetEpisodesForShow(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetEpisodesForShow) ||
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

abstract class CopyWith$Variables$Query$GetEpisodesForShow<TRes> {
  factory CopyWith$Variables$Query$GetEpisodesForShow(
    Variables$Query$GetEpisodesForShow instance,
    TRes Function(Variables$Query$GetEpisodesForShow) then,
  ) = _CopyWithImpl$Variables$Query$GetEpisodesForShow;

  factory CopyWith$Variables$Query$GetEpisodesForShow.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetEpisodesForShow;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetEpisodesForShow<TRes>
    implements CopyWith$Variables$Query$GetEpisodesForShow<TRes> {
  _CopyWithImpl$Variables$Query$GetEpisodesForShow(
    this._instance,
    this._then,
  );

  final Variables$Query$GetEpisodesForShow _instance;

  final TRes Function(Variables$Query$GetEpisodesForShow) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetEpisodesForShow._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetEpisodesForShow<TRes>
    implements CopyWith$Variables$Query$GetEpisodesForShow<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEpisodesForShow(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetEpisodesForShow {
  Query$GetEpisodesForShow({
    required this.$show,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetEpisodesForShow.fromJson(Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodesForShow(
      $show: Query$GetEpisodesForShow$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEpisodesForShow$show $show;

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
    if (!(other is Query$GetEpisodesForShow) ||
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

extension UtilityExtension$Query$GetEpisodesForShow
    on Query$GetEpisodesForShow {
  CopyWith$Query$GetEpisodesForShow<Query$GetEpisodesForShow> get copyWith =>
      CopyWith$Query$GetEpisodesForShow(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetEpisodesForShow<TRes> {
  factory CopyWith$Query$GetEpisodesForShow(
    Query$GetEpisodesForShow instance,
    TRes Function(Query$GetEpisodesForShow) then,
  ) = _CopyWithImpl$Query$GetEpisodesForShow;

  factory CopyWith$Query$GetEpisodesForShow.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodesForShow;

  TRes call({
    Query$GetEpisodesForShow$show? $show,
    String? $__typename,
  });
  CopyWith$Query$GetEpisodesForShow$show<TRes> get $show;
}

class _CopyWithImpl$Query$GetEpisodesForShow<TRes>
    implements CopyWith$Query$GetEpisodesForShow<TRes> {
  _CopyWithImpl$Query$GetEpisodesForShow(
    this._instance,
    this._then,
  );

  final Query$GetEpisodesForShow _instance;

  final TRes Function(Query$GetEpisodesForShow) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodesForShow(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Query$GetEpisodesForShow$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetEpisodesForShow$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$GetEpisodesForShow$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$GetEpisodesForShow<TRes>
    implements CopyWith$Query$GetEpisodesForShow<TRes> {
  _CopyWithStubImpl$Query$GetEpisodesForShow(this._res);

  TRes _res;

  call({
    Query$GetEpisodesForShow$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetEpisodesForShow$show<TRes> get $show =>
      CopyWith$Query$GetEpisodesForShow$show.stub(_res);
}

const documentNodeQueryGetEpisodesForShow = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetEpisodesForShow'),
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
        name: NameNode(value: 'show'),
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
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'episodeCount'),
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
]);
Query$GetEpisodesForShow _parserFn$Query$GetEpisodesForShow(
        Map<String, dynamic> data) =>
    Query$GetEpisodesForShow.fromJson(data);
typedef OnQueryComplete$Query$GetEpisodesForShow = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetEpisodesForShow?,
);

class Options$Query$GetEpisodesForShow
    extends graphql.QueryOptions<Query$GetEpisodesForShow> {
  Options$Query$GetEpisodesForShow({
    String? operationName,
    required Variables$Query$GetEpisodesForShow variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEpisodesForShow? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetEpisodesForShow? onComplete,
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
                        : _parserFn$Query$GetEpisodesForShow(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetEpisodesForShow,
          parserFn: _parserFn$Query$GetEpisodesForShow,
        );

  final OnQueryComplete$Query$GetEpisodesForShow? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetEpisodesForShow
    extends graphql.WatchQueryOptions<Query$GetEpisodesForShow> {
  WatchOptions$Query$GetEpisodesForShow({
    String? operationName,
    required Variables$Query$GetEpisodesForShow variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEpisodesForShow? typedOptimisticResult,
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
          document: documentNodeQueryGetEpisodesForShow,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetEpisodesForShow,
        );
}

class FetchMoreOptions$Query$GetEpisodesForShow
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEpisodesForShow({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetEpisodesForShow variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetEpisodesForShow,
        );
}

extension ClientExtension$Query$GetEpisodesForShow on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEpisodesForShow>>
      query$GetEpisodesForShow(
              Options$Query$GetEpisodesForShow options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetEpisodesForShow>
      watchQuery$GetEpisodesForShow(
              WatchOptions$Query$GetEpisodesForShow options) =>
          this.watchQuery(options);
  void writeQuery$GetEpisodesForShow({
    required Query$GetEpisodesForShow data,
    required Variables$Query$GetEpisodesForShow variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetEpisodesForShow),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetEpisodesForShow? readQuery$GetEpisodesForShow({
    required Variables$Query$GetEpisodesForShow variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetEpisodesForShow),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEpisodesForShow.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetEpisodesForShow>
    useQuery$GetEpisodesForShow(Options$Query$GetEpisodesForShow options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetEpisodesForShow>
    useWatchQuery$GetEpisodesForShow(
            WatchOptions$Query$GetEpisodesForShow options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetEpisodesForShow$Widget
    extends graphql_flutter.Query<Query$GetEpisodesForShow> {
  Query$GetEpisodesForShow$Widget({
    widgets.Key? key,
    required Options$Query$GetEpisodesForShow options,
    required graphql_flutter.QueryBuilder<Query$GetEpisodesForShow> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetEpisodesForShow$show {
  Query$GetEpisodesForShow$show({
    required this.title,
    required this.episodeCount,
    required this.seasons,
    this.$__typename = 'Show',
  });

  factory Query$GetEpisodesForShow$show.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$episodeCount = json['episodeCount'];
    final l$seasons = json['seasons'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodesForShow$show(
      title: (l$title as String),
      episodeCount: (l$episodeCount as int),
      seasons: Query$GetEpisodesForShow$show$seasons.fromJson(
          (l$seasons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final int episodeCount;

  final Query$GetEpisodesForShow$show$seasons seasons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasons = seasons;
    _resultData['seasons'] = l$seasons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$episodeCount = episodeCount;
    final l$seasons = seasons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$episodeCount,
      l$seasons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetEpisodesForShow$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
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

extension UtilityExtension$Query$GetEpisodesForShow$show
    on Query$GetEpisodesForShow$show {
  CopyWith$Query$GetEpisodesForShow$show<Query$GetEpisodesForShow$show>
      get copyWith => CopyWith$Query$GetEpisodesForShow$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodesForShow$show<TRes> {
  factory CopyWith$Query$GetEpisodesForShow$show(
    Query$GetEpisodesForShow$show instance,
    TRes Function(Query$GetEpisodesForShow$show) then,
  ) = _CopyWithImpl$Query$GetEpisodesForShow$show;

  factory CopyWith$Query$GetEpisodesForShow$show.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodesForShow$show;

  TRes call({
    String? title,
    int? episodeCount,
    Query$GetEpisodesForShow$show$seasons? seasons,
    String? $__typename,
  });
  CopyWith$Query$GetEpisodesForShow$show$seasons<TRes> get seasons;
}

class _CopyWithImpl$Query$GetEpisodesForShow$show<TRes>
    implements CopyWith$Query$GetEpisodesForShow$show<TRes> {
  _CopyWithImpl$Query$GetEpisodesForShow$show(
    this._instance,
    this._then,
  );

  final Query$GetEpisodesForShow$show _instance;

  final TRes Function(Query$GetEpisodesForShow$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? episodeCount = _undefined,
    Object? seasons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodesForShow$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasons: seasons == _undefined || seasons == null
            ? _instance.seasons
            : (seasons as Query$GetEpisodesForShow$show$seasons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetEpisodesForShow$show$seasons<TRes> get seasons {
    final local$seasons = _instance.seasons;
    return CopyWith$Query$GetEpisodesForShow$show$seasons(
        local$seasons, (e) => call(seasons: e));
  }
}

class _CopyWithStubImpl$Query$GetEpisodesForShow$show<TRes>
    implements CopyWith$Query$GetEpisodesForShow$show<TRes> {
  _CopyWithStubImpl$Query$GetEpisodesForShow$show(this._res);

  TRes _res;

  call({
    String? title,
    int? episodeCount,
    Query$GetEpisodesForShow$show$seasons? seasons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetEpisodesForShow$show$seasons<TRes> get seasons =>
      CopyWith$Query$GetEpisodesForShow$show$seasons.stub(_res);
}

class Query$GetEpisodesForShow$show$seasons {
  Query$GetEpisodesForShow$show$seasons({
    required this.items,
    this.$__typename = 'SeasonPagination',
  });

  factory Query$GetEpisodesForShow$show$seasons.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodesForShow$show$seasons(
      items: (l$items as List<dynamic>)
          .map((e) => Query$GetEpisodesForShow$show$seasons$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetEpisodesForShow$show$seasons$items> items;

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
    if (!(other is Query$GetEpisodesForShow$show$seasons) ||
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

extension UtilityExtension$Query$GetEpisodesForShow$show$seasons
    on Query$GetEpisodesForShow$show$seasons {
  CopyWith$Query$GetEpisodesForShow$show$seasons<
          Query$GetEpisodesForShow$show$seasons>
      get copyWith => CopyWith$Query$GetEpisodesForShow$show$seasons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodesForShow$show$seasons<TRes> {
  factory CopyWith$Query$GetEpisodesForShow$show$seasons(
    Query$GetEpisodesForShow$show$seasons instance,
    TRes Function(Query$GetEpisodesForShow$show$seasons) then,
  ) = _CopyWithImpl$Query$GetEpisodesForShow$show$seasons;

  factory CopyWith$Query$GetEpisodesForShow$show$seasons.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons;

  TRes call({
    List<Query$GetEpisodesForShow$show$seasons$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$GetEpisodesForShow$show$seasons$items> Function(
              Iterable<
                  CopyWith$Query$GetEpisodesForShow$show$seasons$items<
                      Query$GetEpisodesForShow$show$seasons$items>>)
          _fn);
}

class _CopyWithImpl$Query$GetEpisodesForShow$show$seasons<TRes>
    implements CopyWith$Query$GetEpisodesForShow$show$seasons<TRes> {
  _CopyWithImpl$Query$GetEpisodesForShow$show$seasons(
    this._instance,
    this._then,
  );

  final Query$GetEpisodesForShow$show$seasons _instance;

  final TRes Function(Query$GetEpisodesForShow$show$seasons) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodesForShow$show$seasons(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$GetEpisodesForShow$show$seasons$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$GetEpisodesForShow$show$seasons$items> Function(
                  Iterable<
                      CopyWith$Query$GetEpisodesForShow$show$seasons$items<
                          Query$GetEpisodesForShow$show$seasons$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Query$GetEpisodesForShow$show$seasons$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons<TRes>
    implements CopyWith$Query$GetEpisodesForShow$show$seasons<TRes> {
  _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons(this._res);

  TRes _res;

  call({
    List<Query$GetEpisodesForShow$show$seasons$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetEpisodesForShow$show$seasons$items {
  Query$GetEpisodesForShow$show$seasons$items({
    required this.episodes,
    this.$__typename = 'Season',
  });

  factory Query$GetEpisodesForShow$show$seasons$items.fromJson(
      Map<String, dynamic> json) {
    final l$episodes = json['episodes'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodesForShow$show$seasons$items(
      episodes: Query$GetEpisodesForShow$show$seasons$items$episodes.fromJson(
          (l$episodes as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEpisodesForShow$show$seasons$items$episodes episodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$episodes = episodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$episodes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetEpisodesForShow$show$seasons$items) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetEpisodesForShow$show$seasons$items
    on Query$GetEpisodesForShow$show$seasons$items {
  CopyWith$Query$GetEpisodesForShow$show$seasons$items<
          Query$GetEpisodesForShow$show$seasons$items>
      get copyWith => CopyWith$Query$GetEpisodesForShow$show$seasons$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodesForShow$show$seasons$items<TRes> {
  factory CopyWith$Query$GetEpisodesForShow$show$seasons$items(
    Query$GetEpisodesForShow$show$seasons$items instance,
    TRes Function(Query$GetEpisodesForShow$show$seasons$items) then,
  ) = _CopyWithImpl$Query$GetEpisodesForShow$show$seasons$items;

  factory CopyWith$Query$GetEpisodesForShow$show$seasons$items.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons$items;

  TRes call({
    Query$GetEpisodesForShow$show$seasons$items$episodes? episodes,
    String? $__typename,
  });
  CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes<TRes>
      get episodes;
}

class _CopyWithImpl$Query$GetEpisodesForShow$show$seasons$items<TRes>
    implements CopyWith$Query$GetEpisodesForShow$show$seasons$items<TRes> {
  _CopyWithImpl$Query$GetEpisodesForShow$show$seasons$items(
    this._instance,
    this._then,
  );

  final Query$GetEpisodesForShow$show$seasons$items _instance;

  final TRes Function(Query$GetEpisodesForShow$show$seasons$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodesForShow$show$seasons$items(
        episodes: episodes == _undefined || episodes == null
            ? _instance.episodes
            : (episodes
                as Query$GetEpisodesForShow$show$seasons$items$episodes),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes<TRes>
      get episodes {
    final local$episodes = _instance.episodes;
    return CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes(
        local$episodes, (e) => call(episodes: e));
  }
}

class _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons$items<TRes>
    implements CopyWith$Query$GetEpisodesForShow$show$seasons$items<TRes> {
  _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons$items(this._res);

  TRes _res;

  call({
    Query$GetEpisodesForShow$show$seasons$items$episodes? episodes,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes<TRes>
      get episodes =>
          CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes.stub(
              _res);
}

class Query$GetEpisodesForShow$show$seasons$items$episodes {
  Query$GetEpisodesForShow$show$seasons$items$episodes({
    required this.items,
    this.$__typename = 'EpisodePagination',
  });

  factory Query$GetEpisodesForShow$show$seasons$items$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodesForShow$show$seasons$items$episodes(
      items: (l$items as List<dynamic>)
          .map((e) => Query$GetEpisodesForShow$show$seasons$items$episodes$items
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetEpisodesForShow$show$seasons$items$episodes$items> items;

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
    if (!(other is Query$GetEpisodesForShow$show$seasons$items$episodes) ||
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

extension UtilityExtension$Query$GetEpisodesForShow$show$seasons$items$episodes
    on Query$GetEpisodesForShow$show$seasons$items$episodes {
  CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes<
          Query$GetEpisodesForShow$show$seasons$items$episodes>
      get copyWith =>
          CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes<
    TRes> {
  factory CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes(
    Query$GetEpisodesForShow$show$seasons$items$episodes instance,
    TRes Function(Query$GetEpisodesForShow$show$seasons$items$episodes) then,
  ) = _CopyWithImpl$Query$GetEpisodesForShow$show$seasons$items$episodes;

  factory CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons$items$episodes;

  TRes call({
    List<Query$GetEpisodesForShow$show$seasons$items$episodes$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$GetEpisodesForShow$show$seasons$items$episodes$items> Function(
              Iterable<
                  CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items<
                      Query$GetEpisodesForShow$show$seasons$items$episodes$items>>)
          _fn);
}

class _CopyWithImpl$Query$GetEpisodesForShow$show$seasons$items$episodes<TRes>
    implements
        CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes<TRes> {
  _CopyWithImpl$Query$GetEpisodesForShow$show$seasons$items$episodes(
    this._instance,
    this._then,
  );

  final Query$GetEpisodesForShow$show$seasons$items$episodes _instance;

  final TRes Function(Query$GetEpisodesForShow$show$seasons$items$episodes)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodesForShow$show$seasons$items$episodes(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$GetEpisodesForShow$show$seasons$items$episodes$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$GetEpisodesForShow$show$seasons$items$episodes$items> Function(
                  Iterable<
                      CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items<
                          Query$GetEpisodesForShow$show$seasons$items$episodes$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons$items$episodes<
        TRes>
    implements
        CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes<TRes> {
  _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons$items$episodes(
      this._res);

  TRes _res;

  call({
    List<Query$GetEpisodesForShow$show$seasons$items$episodes$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetEpisodesForShow$show$seasons$items$episodes$items {
  Query$GetEpisodesForShow$show$seasons$items$episodes$items({
    required this.title,
    required this.description,
    required this.duration,
    this.image,
    this.$__typename = 'Episode',
  });

  factory Query$GetEpisodesForShow$show$seasons$items$episodes$items.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$description = json['description'];
    final l$duration = json['duration'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodesForShow$show$seasons$items$episodes$items(
      title: (l$title as String),
      description: (l$description as String),
      duration: (l$duration as int),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String description;

  final int duration;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$description = description;
    final l$duration = duration;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$description,
      l$duration,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetEpisodesForShow$show$seasons$items$episodes$items) ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetEpisodesForShow$show$seasons$items$episodes$items
    on Query$GetEpisodesForShow$show$seasons$items$episodes$items {
  CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items<
          Query$GetEpisodesForShow$show$seasons$items$episodes$items>
      get copyWith =>
          CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items<
    TRes> {
  factory CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items(
    Query$GetEpisodesForShow$show$seasons$items$episodes$items instance,
    TRes Function(Query$GetEpisodesForShow$show$seasons$items$episodes$items)
        then,
  ) = _CopyWithImpl$Query$GetEpisodesForShow$show$seasons$items$episodes$items;

  factory CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons$items$episodes$items;

  TRes call({
    String? title,
    String? description,
    int? duration,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetEpisodesForShow$show$seasons$items$episodes$items<
        TRes>
    implements
        CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items<
            TRes> {
  _CopyWithImpl$Query$GetEpisodesForShow$show$seasons$items$episodes$items(
    this._instance,
    this._then,
  );

  final Query$GetEpisodesForShow$show$seasons$items$episodes$items _instance;

  final TRes Function(
      Query$GetEpisodesForShow$show$seasons$items$episodes$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? description = _undefined,
    Object? duration = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodesForShow$show$seasons$items$episodes$items(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons$items$episodes$items<
        TRes>
    implements
        CopyWith$Query$GetEpisodesForShow$show$seasons$items$episodes$items<
            TRes> {
  _CopyWithStubImpl$Query$GetEpisodesForShow$show$seasons$items$episodes$items(
      this._res);

  TRes _res;

  call({
    String? title,
    String? description,
    int? duration,
    String? image,
    String? $__typename,
  }) =>
      _res;
}
