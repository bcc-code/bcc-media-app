import '../../schema/schema.graphql.dart';
import '../episode.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'show.graphql.dart';

class Variables$Query$KidsGetNextEpisodes {
  factory Variables$Query$KidsGetNextEpisodes({
    required String episodeId,
    Input$EpisodeContext? context,
  }) =>
      Variables$Query$KidsGetNextEpisodes._({
        r'episodeId': episodeId,
        if (context != null) r'context': context,
      });

  Variables$Query$KidsGetNextEpisodes._(this._$data);

  factory Variables$Query$KidsGetNextEpisodes.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$episodeId = data['episodeId'];
    result$data['episodeId'] = (l$episodeId as String);
    if (data.containsKey('context')) {
      final l$context = data['context'];
      result$data['context'] = l$context == null
          ? null
          : Input$EpisodeContext.fromJson((l$context as Map<String, dynamic>));
    }
    return Variables$Query$KidsGetNextEpisodes._(result$data);
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

  CopyWith$Variables$Query$KidsGetNextEpisodes<
          Variables$Query$KidsGetNextEpisodes>
      get copyWith => CopyWith$Variables$Query$KidsGetNextEpisodes(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$KidsGetNextEpisodes) ||
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

abstract class CopyWith$Variables$Query$KidsGetNextEpisodes<TRes> {
  factory CopyWith$Variables$Query$KidsGetNextEpisodes(
    Variables$Query$KidsGetNextEpisodes instance,
    TRes Function(Variables$Query$KidsGetNextEpisodes) then,
  ) = _CopyWithImpl$Variables$Query$KidsGetNextEpisodes;

  factory CopyWith$Variables$Query$KidsGetNextEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$KidsGetNextEpisodes;

  TRes call({
    String? episodeId,
    Input$EpisodeContext? context,
  });
}

class _CopyWithImpl$Variables$Query$KidsGetNextEpisodes<TRes>
    implements CopyWith$Variables$Query$KidsGetNextEpisodes<TRes> {
  _CopyWithImpl$Variables$Query$KidsGetNextEpisodes(
    this._instance,
    this._then,
  );

  final Variables$Query$KidsGetNextEpisodes _instance;

  final TRes Function(Variables$Query$KidsGetNextEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episodeId = _undefined,
    Object? context = _undefined,
  }) =>
      _then(Variables$Query$KidsGetNextEpisodes._({
        ..._instance._$data,
        if (episodeId != _undefined && episodeId != null)
          'episodeId': (episodeId as String),
        if (context != _undefined)
          'context': (context as Input$EpisodeContext?),
      }));
}

class _CopyWithStubImpl$Variables$Query$KidsGetNextEpisodes<TRes>
    implements CopyWith$Variables$Query$KidsGetNextEpisodes<TRes> {
  _CopyWithStubImpl$Variables$Query$KidsGetNextEpisodes(this._res);

  TRes _res;

  call({
    String? episodeId,
    Input$EpisodeContext? context,
  }) =>
      _res;
}

class Query$KidsGetNextEpisodes {
  Query$KidsGetNextEpisodes({
    required this.episode,
    this.$__typename = 'QueryRoot',
  });

  factory Query$KidsGetNextEpisodes.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$KidsGetNextEpisodes(
      episode: Query$KidsGetNextEpisodes$episode.fromJson(
          (l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$KidsGetNextEpisodes$episode episode;

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
    if (!(other is Query$KidsGetNextEpisodes) ||
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

extension UtilityExtension$Query$KidsGetNextEpisodes
    on Query$KidsGetNextEpisodes {
  CopyWith$Query$KidsGetNextEpisodes<Query$KidsGetNextEpisodes> get copyWith =>
      CopyWith$Query$KidsGetNextEpisodes(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$KidsGetNextEpisodes<TRes> {
  factory CopyWith$Query$KidsGetNextEpisodes(
    Query$KidsGetNextEpisodes instance,
    TRes Function(Query$KidsGetNextEpisodes) then,
  ) = _CopyWithImpl$Query$KidsGetNextEpisodes;

  factory CopyWith$Query$KidsGetNextEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Query$KidsGetNextEpisodes;

  TRes call({
    Query$KidsGetNextEpisodes$episode? episode,
    String? $__typename,
  });
  CopyWith$Query$KidsGetNextEpisodes$episode<TRes> get episode;
}

class _CopyWithImpl$Query$KidsGetNextEpisodes<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes<TRes> {
  _CopyWithImpl$Query$KidsGetNextEpisodes(
    this._instance,
    this._then,
  );

  final Query$KidsGetNextEpisodes _instance;

  final TRes Function(Query$KidsGetNextEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsGetNextEpisodes(
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Query$KidsGetNextEpisodes$episode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$KidsGetNextEpisodes$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Query$KidsGetNextEpisodes$episode(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$KidsGetNextEpisodes<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes<TRes> {
  _CopyWithStubImpl$Query$KidsGetNextEpisodes(this._res);

  TRes _res;

  call({
    Query$KidsGetNextEpisodes$episode? episode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$KidsGetNextEpisodes$episode<TRes> get episode =>
      CopyWith$Query$KidsGetNextEpisodes$episode.stub(_res);
}

const documentNodeQueryKidsGetNextEpisodes = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'KidsGetNextEpisodes'),
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
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: IntValueNode(value: '20'),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'KidsEpisodeThumbnail'),
                directives: [],
              ),
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
  fragmentDefinitionKidsEpisodeThumbnail,
  fragmentDefinitionPlayableEpisode,
  fragmentDefinitionBasicStream,
]);
Query$KidsGetNextEpisodes _parserFn$Query$KidsGetNextEpisodes(
        Map<String, dynamic> data) =>
    Query$KidsGetNextEpisodes.fromJson(data);
typedef OnQueryComplete$Query$KidsGetNextEpisodes = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$KidsGetNextEpisodes?,
);

class Options$Query$KidsGetNextEpisodes
    extends graphql.QueryOptions<Query$KidsGetNextEpisodes> {
  Options$Query$KidsGetNextEpisodes({
    String? operationName,
    required Variables$Query$KidsGetNextEpisodes variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$KidsGetNextEpisodes? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$KidsGetNextEpisodes? onComplete,
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
                        : _parserFn$Query$KidsGetNextEpisodes(data),
                  ),
          onError: onError,
          document: documentNodeQueryKidsGetNextEpisodes,
          parserFn: _parserFn$Query$KidsGetNextEpisodes,
        );

  final OnQueryComplete$Query$KidsGetNextEpisodes? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$KidsGetNextEpisodes
    extends graphql.WatchQueryOptions<Query$KidsGetNextEpisodes> {
  WatchOptions$Query$KidsGetNextEpisodes({
    String? operationName,
    required Variables$Query$KidsGetNextEpisodes variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$KidsGetNextEpisodes? typedOptimisticResult,
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
          document: documentNodeQueryKidsGetNextEpisodes,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$KidsGetNextEpisodes,
        );
}

class FetchMoreOptions$Query$KidsGetNextEpisodes
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$KidsGetNextEpisodes({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$KidsGetNextEpisodes variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryKidsGetNextEpisodes,
        );
}

extension ClientExtension$Query$KidsGetNextEpisodes on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$KidsGetNextEpisodes>>
      query$KidsGetNextEpisodes(
              Options$Query$KidsGetNextEpisodes options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$KidsGetNextEpisodes>
      watchQuery$KidsGetNextEpisodes(
              WatchOptions$Query$KidsGetNextEpisodes options) =>
          this.watchQuery(options);
  void writeQuery$KidsGetNextEpisodes({
    required Query$KidsGetNextEpisodes data,
    required Variables$Query$KidsGetNextEpisodes variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryKidsGetNextEpisodes),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$KidsGetNextEpisodes? readQuery$KidsGetNextEpisodes({
    required Variables$Query$KidsGetNextEpisodes variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryKidsGetNextEpisodes),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$KidsGetNextEpisodes.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$KidsGetNextEpisodes>
    useQuery$KidsGetNextEpisodes(Options$Query$KidsGetNextEpisodes options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$KidsGetNextEpisodes>
    useWatchQuery$KidsGetNextEpisodes(
            WatchOptions$Query$KidsGetNextEpisodes options) =>
        graphql_flutter.useWatchQuery(options);

class Query$KidsGetNextEpisodes$Widget
    extends graphql_flutter.Query<Query$KidsGetNextEpisodes> {
  Query$KidsGetNextEpisodes$Widget({
    widgets.Key? key,
    required Options$Query$KidsGetNextEpisodes options,
    required graphql_flutter.QueryBuilder<Query$KidsGetNextEpisodes> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$KidsGetNextEpisodes$episode {
  Query$KidsGetNextEpisodes$episode({
    required this.next,
    this.$__typename = 'Episode',
  });

  factory Query$KidsGetNextEpisodes$episode.fromJson(
      Map<String, dynamic> json) {
    final l$next = json['next'];
    final l$$__typename = json['__typename'];
    return Query$KidsGetNextEpisodes$episode(
      next: (l$next as List<dynamic>)
          .map((e) => Query$KidsGetNextEpisodes$episode$next.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$KidsGetNextEpisodes$episode$next> next;

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
    if (!(other is Query$KidsGetNextEpisodes$episode) ||
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

extension UtilityExtension$Query$KidsGetNextEpisodes$episode
    on Query$KidsGetNextEpisodes$episode {
  CopyWith$Query$KidsGetNextEpisodes$episode<Query$KidsGetNextEpisodes$episode>
      get copyWith => CopyWith$Query$KidsGetNextEpisodes$episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsGetNextEpisodes$episode<TRes> {
  factory CopyWith$Query$KidsGetNextEpisodes$episode(
    Query$KidsGetNextEpisodes$episode instance,
    TRes Function(Query$KidsGetNextEpisodes$episode) then,
  ) = _CopyWithImpl$Query$KidsGetNextEpisodes$episode;

  factory CopyWith$Query$KidsGetNextEpisodes$episode.stub(TRes res) =
      _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode;

  TRes call({
    List<Query$KidsGetNextEpisodes$episode$next>? next,
    String? $__typename,
  });
  TRes next(
      Iterable<Query$KidsGetNextEpisodes$episode$next> Function(
              Iterable<
                  CopyWith$Query$KidsGetNextEpisodes$episode$next<
                      Query$KidsGetNextEpisodes$episode$next>>)
          _fn);
}

class _CopyWithImpl$Query$KidsGetNextEpisodes$episode<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes$episode<TRes> {
  _CopyWithImpl$Query$KidsGetNextEpisodes$episode(
    this._instance,
    this._then,
  );

  final Query$KidsGetNextEpisodes$episode _instance;

  final TRes Function(Query$KidsGetNextEpisodes$episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? next = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsGetNextEpisodes$episode(
        next: next == _undefined || next == null
            ? _instance.next
            : (next as List<Query$KidsGetNextEpisodes$episode$next>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes next(
          Iterable<Query$KidsGetNextEpisodes$episode$next> Function(
                  Iterable<
                      CopyWith$Query$KidsGetNextEpisodes$episode$next<
                          Query$KidsGetNextEpisodes$episode$next>>)
              _fn) =>
      call(
          next: _fn(_instance.next
              .map((e) => CopyWith$Query$KidsGetNextEpisodes$episode$next(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes$episode<TRes> {
  _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode(this._res);

  TRes _res;

  call({
    List<Query$KidsGetNextEpisodes$episode$next>? next,
    String? $__typename,
  }) =>
      _res;
  next(_fn) => _res;
}

class Query$KidsGetNextEpisodes$episode$next
    implements Fragment$KidsEpisodeThumbnail, Fragment$PlayableEpisode {
  Query$KidsGetNextEpisodes$episode$next({
    required this.id,
    required this.title,
    required this.duration,
    this.image,
    this.$__typename = 'Episode',
    required this.streams,
    required this.cursor,
    this.context,
    this.season,
  });

  factory Query$KidsGetNextEpisodes$episode$next.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$duration = json['duration'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    final l$streams = json['streams'];
    final l$cursor = json['cursor'];
    final l$context = json['context'];
    final l$season = json['season'];
    return Query$KidsGetNextEpisodes$episode$next(
      id: (l$id as String),
      title: (l$title as String),
      duration: (l$duration as int),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
      streams: (l$streams as List<dynamic>)
          .map(
              (e) => Fragment$BasicStream.fromJson((e as Map<String, dynamic>)))
          .toList(),
      cursor: (l$cursor as String),
      context: l$context == null
          ? null
          : Query$KidsGetNextEpisodes$episode$next$context.fromJson(
              (l$context as Map<String, dynamic>)),
      season: l$season == null
          ? null
          : Query$KidsGetNextEpisodes$episode$next$season.fromJson(
              (l$season as Map<String, dynamic>)),
    );
  }

  final String id;

  final String title;

  final int duration;

  final String? image;

  final String $__typename;

  final List<Fragment$BasicStream> streams;

  final String cursor;

  final Query$KidsGetNextEpisodes$episode$next$context? context;

  final Query$KidsGetNextEpisodes$episode$next$season? season;

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
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$streams = streams;
    _resultData['streams'] = l$streams.map((e) => e.toJson()).toList();
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$context = context;
    _resultData['context'] = l$context?.toJson();
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$duration = duration;
    final l$image = image;
    final l$$__typename = $__typename;
    final l$streams = streams;
    final l$cursor = cursor;
    final l$context = context;
    final l$season = season;
    return Object.hashAll([
      l$id,
      l$title,
      l$duration,
      l$image,
      l$$__typename,
      Object.hashAll(l$streams.map((v) => v)),
      l$cursor,
      l$context,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$KidsGetNextEpisodes$episode$next) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
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
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
      return false;
    }
    final l$context = context;
    final lOther$context = other.context;
    if (l$context != lOther$context) {
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

extension UtilityExtension$Query$KidsGetNextEpisodes$episode$next
    on Query$KidsGetNextEpisodes$episode$next {
  CopyWith$Query$KidsGetNextEpisodes$episode$next<
          Query$KidsGetNextEpisodes$episode$next>
      get copyWith => CopyWith$Query$KidsGetNextEpisodes$episode$next(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsGetNextEpisodes$episode$next<TRes> {
  factory CopyWith$Query$KidsGetNextEpisodes$episode$next(
    Query$KidsGetNextEpisodes$episode$next instance,
    TRes Function(Query$KidsGetNextEpisodes$episode$next) then,
  ) = _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next;

  factory CopyWith$Query$KidsGetNextEpisodes$episode$next.stub(TRes res) =
      _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next;

  TRes call({
    String? id,
    String? title,
    int? duration,
    String? image,
    String? $__typename,
    List<Fragment$BasicStream>? streams,
    String? cursor,
    Query$KidsGetNextEpisodes$episode$next$context? context,
    Query$KidsGetNextEpisodes$episode$next$season? season,
  });
  TRes streams(
      Iterable<Fragment$BasicStream> Function(
              Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
          _fn);
  CopyWith$Query$KidsGetNextEpisodes$episode$next$context<TRes> get context;
  CopyWith$Query$KidsGetNextEpisodes$episode$next$season<TRes> get season;
}

class _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes$episode$next<TRes> {
  _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next(
    this._instance,
    this._then,
  );

  final Query$KidsGetNextEpisodes$episode$next _instance;

  final TRes Function(Query$KidsGetNextEpisodes$episode$next) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? duration = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
    Object? streams = _undefined,
    Object? cursor = _undefined,
    Object? context = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Query$KidsGetNextEpisodes$episode$next(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        streams: streams == _undefined || streams == null
            ? _instance.streams
            : (streams as List<Fragment$BasicStream>),
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        context: context == _undefined
            ? _instance.context
            : (context as Query$KidsGetNextEpisodes$episode$next$context?),
        season: season == _undefined
            ? _instance.season
            : (season as Query$KidsGetNextEpisodes$episode$next$season?),
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
  CopyWith$Query$KidsGetNextEpisodes$episode$next$context<TRes> get context {
    final local$context = _instance.context;
    return local$context == null
        ? CopyWith$Query$KidsGetNextEpisodes$episode$next$context.stub(
            _then(_instance))
        : CopyWith$Query$KidsGetNextEpisodes$episode$next$context(
            local$context, (e) => call(context: e));
  }

  CopyWith$Query$KidsGetNextEpisodes$episode$next$season<TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$KidsGetNextEpisodes$episode$next$season.stub(
            _then(_instance))
        : CopyWith$Query$KidsGetNextEpisodes$episode$next$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes$episode$next<TRes> {
  _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    int? duration,
    String? image,
    String? $__typename,
    List<Fragment$BasicStream>? streams,
    String? cursor,
    Query$KidsGetNextEpisodes$episode$next$context? context,
    Query$KidsGetNextEpisodes$episode$next$season? season,
  }) =>
      _res;
  streams(_fn) => _res;
  CopyWith$Query$KidsGetNextEpisodes$episode$next$context<TRes> get context =>
      CopyWith$Query$KidsGetNextEpisodes$episode$next$context.stub(_res);
  CopyWith$Query$KidsGetNextEpisodes$episode$next$season<TRes> get season =>
      CopyWith$Query$KidsGetNextEpisodes$episode$next$season.stub(_res);
}

class Query$KidsGetNextEpisodes$episode$next$context
    implements Fragment$PlayableEpisode$context {
  Query$KidsGetNextEpisodes$episode$next$context({required this.$__typename});

  factory Query$KidsGetNextEpisodes$episode$next$context.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ContextCollection":
        return Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection
            .fromJson(json);

      case "Season":
        return Query$KidsGetNextEpisodes$episode$next$context$$Season.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Query$KidsGetNextEpisodes$episode$next$context(
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
    if (!(other is Query$KidsGetNextEpisodes$episode$next$context) ||
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

extension UtilityExtension$Query$KidsGetNextEpisodes$episode$next$context
    on Query$KidsGetNextEpisodes$episode$next$context {
  CopyWith$Query$KidsGetNextEpisodes$episode$next$context<
          Query$KidsGetNextEpisodes$episode$next$context>
      get copyWith => CopyWith$Query$KidsGetNextEpisodes$episode$next$context(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(
            Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection)
        contextCollection,
    required _T Function(Query$KidsGetNextEpisodes$episode$next$context$$Season)
        season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        return contextCollection(this
            as Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection);

      case "Season":
        return season(
            this as Query$KidsGetNextEpisodes$episode$next$context$$Season);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection)?
        contextCollection,
    _T Function(Query$KidsGetNextEpisodes$episode$next$context$$Season)? season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        if (contextCollection != null) {
          return contextCollection(this
              as Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection);
        } else {
          return orElse();
        }

      case "Season":
        if (season != null) {
          return season(
              this as Query$KidsGetNextEpisodes$episode$next$context$$Season);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$KidsGetNextEpisodes$episode$next$context<TRes> {
  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$context(
    Query$KidsGetNextEpisodes$episode$next$context instance,
    TRes Function(Query$KidsGetNextEpisodes$episode$next$context) then,
  ) = _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$context;

  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$context.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$context;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$context<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes$episode$next$context<TRes> {
  _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$context(
    this._instance,
    this._then,
  );

  final Query$KidsGetNextEpisodes$episode$next$context _instance;

  final TRes Function(Query$KidsGetNextEpisodes$episode$next$context) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsGetNextEpisodes$episode$next$context(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$context<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes$episode$next$context<TRes> {
  _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$context(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection
    implements
        Fragment$PlayableEpisode$context$$ContextCollection,
        Query$KidsGetNextEpisodes$episode$next$context {
  Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection({
    required this.id,
    this.$__typename = 'ContextCollection',
  });

  factory Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection(
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
            is Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection) ||
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

extension UtilityExtension$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection
    on Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection {
  CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection<
          Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection>
      get copyWith =>
          CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection<
    TRes> {
  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection(
    Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection instance,
    TRes Function(
            Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection)
        then,
  ) = _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection;

  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection<
        TRes>
    implements
        CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection<
            TRes> {
  _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection(
    this._instance,
    this._then,
  );

  final Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection
      _instance;

  final TRes Function(
      Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection<
        TRes>
    implements
        CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection<
            TRes> {
  _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$context$$ContextCollection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$KidsGetNextEpisodes$episode$next$context$$Season
    implements
        Fragment$PlayableEpisode$context$$Season,
        Query$KidsGetNextEpisodes$episode$next$context {
  Query$KidsGetNextEpisodes$episode$next$context$$Season(
      {this.$__typename = 'Season'});

  factory Query$KidsGetNextEpisodes$episode$next$context$$Season.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsGetNextEpisodes$episode$next$context$$Season(
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
    if (!(other is Query$KidsGetNextEpisodes$episode$next$context$$Season) ||
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

extension UtilityExtension$Query$KidsGetNextEpisodes$episode$next$context$$Season
    on Query$KidsGetNextEpisodes$episode$next$context$$Season {
  CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$Season<
          Query$KidsGetNextEpisodes$episode$next$context$$Season>
      get copyWith =>
          CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$Season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$Season<
    TRes> {
  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$Season(
    Query$KidsGetNextEpisodes$episode$next$context$$Season instance,
    TRes Function(Query$KidsGetNextEpisodes$episode$next$context$$Season) then,
  ) = _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$context$$Season;

  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$Season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$context$$Season;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$context$$Season<TRes>
    implements
        CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$Season<TRes> {
  _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$context$$Season(
    this._instance,
    this._then,
  );

  final Query$KidsGetNextEpisodes$episode$next$context$$Season _instance;

  final TRes Function(Query$KidsGetNextEpisodes$episode$next$context$$Season)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsGetNextEpisodes$episode$next$context$$Season(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$context$$Season<
        TRes>
    implements
        CopyWith$Query$KidsGetNextEpisodes$episode$next$context$$Season<TRes> {
  _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$context$$Season(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsGetNextEpisodes$episode$next$season
    implements Fragment$PlayableEpisode$season {
  Query$KidsGetNextEpisodes$episode$next$season({
    required this.id,
    required this.title,
    required this.$show,
    this.$__typename = 'Season',
  });

  factory Query$KidsGetNextEpisodes$episode$next$season.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$KidsGetNextEpisodes$episode$next$season(
      id: (l$id as String),
      title: (l$title as String),
      $show: Query$KidsGetNextEpisodes$episode$next$season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final Query$KidsGetNextEpisodes$episode$next$season$show $show;

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
    if (!(other is Query$KidsGetNextEpisodes$episode$next$season) ||
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

extension UtilityExtension$Query$KidsGetNextEpisodes$episode$next$season
    on Query$KidsGetNextEpisodes$episode$next$season {
  CopyWith$Query$KidsGetNextEpisodes$episode$next$season<
          Query$KidsGetNextEpisodes$episode$next$season>
      get copyWith => CopyWith$Query$KidsGetNextEpisodes$episode$next$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsGetNextEpisodes$episode$next$season<TRes> {
  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$season(
    Query$KidsGetNextEpisodes$episode$next$season instance,
    TRes Function(Query$KidsGetNextEpisodes$episode$next$season) then,
  ) = _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$season;

  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$season;

  TRes call({
    String? id,
    String? title,
    Query$KidsGetNextEpisodes$episode$next$season$show? $show,
    String? $__typename,
  });
  CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show<TRes> get $show;
}

class _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$season<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes$episode$next$season<TRes> {
  _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$season(
    this._instance,
    this._then,
  );

  final Query$KidsGetNextEpisodes$episode$next$season _instance;

  final TRes Function(Query$KidsGetNextEpisodes$episode$next$season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsGetNextEpisodes$episode$next$season(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Query$KidsGetNextEpisodes$episode$next$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$season<TRes>
    implements CopyWith$Query$KidsGetNextEpisodes$episode$next$season<TRes> {
  _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$season(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    Query$KidsGetNextEpisodes$episode$next$season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show<TRes> get $show =>
      CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show.stub(_res);
}

class Query$KidsGetNextEpisodes$episode$next$season$show
    implements Fragment$PlayableEpisode$season$show {
  Query$KidsGetNextEpisodes$episode$next$season$show({
    required this.id,
    required this.title,
    this.$__typename = 'Show',
  });

  factory Query$KidsGetNextEpisodes$episode$next$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$KidsGetNextEpisodes$episode$next$season$show(
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
    if (!(other is Query$KidsGetNextEpisodes$episode$next$season$show) ||
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

extension UtilityExtension$Query$KidsGetNextEpisodes$episode$next$season$show
    on Query$KidsGetNextEpisodes$episode$next$season$show {
  CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show<
          Query$KidsGetNextEpisodes$episode$next$season$show>
      get copyWith =>
          CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show<
    TRes> {
  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show(
    Query$KidsGetNextEpisodes$episode$next$season$show instance,
    TRes Function(Query$KidsGetNextEpisodes$episode$next$season$show) then,
  ) = _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$season$show;

  factory CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$season$show;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$season$show<TRes>
    implements
        CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show<TRes> {
  _CopyWithImpl$Query$KidsGetNextEpisodes$episode$next$season$show(
    this._instance,
    this._then,
  );

  final Query$KidsGetNextEpisodes$episode$next$season$show _instance;

  final TRes Function(Query$KidsGetNextEpisodes$episode$next$season$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsGetNextEpisodes$episode$next$season$show(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$season$show<TRes>
    implements
        CopyWith$Query$KidsGetNextEpisodes$episode$next$season$show<TRes> {
  _CopyWithStubImpl$Query$KidsGetNextEpisodes$episode$next$season$show(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetManyEpisodeIdsForPlaylist {
  factory Variables$Query$GetManyEpisodeIdsForPlaylist({required String id}) =>
      Variables$Query$GetManyEpisodeIdsForPlaylist._({
        r'id': id,
      });

  Variables$Query$GetManyEpisodeIdsForPlaylist._(this._$data);

  factory Variables$Query$GetManyEpisodeIdsForPlaylist.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetManyEpisodeIdsForPlaylist._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetManyEpisodeIdsForPlaylist<
          Variables$Query$GetManyEpisodeIdsForPlaylist>
      get copyWith => CopyWith$Variables$Query$GetManyEpisodeIdsForPlaylist(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetManyEpisodeIdsForPlaylist) ||
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

abstract class CopyWith$Variables$Query$GetManyEpisodeIdsForPlaylist<TRes> {
  factory CopyWith$Variables$Query$GetManyEpisodeIdsForPlaylist(
    Variables$Query$GetManyEpisodeIdsForPlaylist instance,
    TRes Function(Variables$Query$GetManyEpisodeIdsForPlaylist) then,
  ) = _CopyWithImpl$Variables$Query$GetManyEpisodeIdsForPlaylist;

  factory CopyWith$Variables$Query$GetManyEpisodeIdsForPlaylist.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetManyEpisodeIdsForPlaylist;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetManyEpisodeIdsForPlaylist<TRes>
    implements CopyWith$Variables$Query$GetManyEpisodeIdsForPlaylist<TRes> {
  _CopyWithImpl$Variables$Query$GetManyEpisodeIdsForPlaylist(
    this._instance,
    this._then,
  );

  final Variables$Query$GetManyEpisodeIdsForPlaylist _instance;

  final TRes Function(Variables$Query$GetManyEpisodeIdsForPlaylist) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetManyEpisodeIdsForPlaylist._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetManyEpisodeIdsForPlaylist<TRes>
    implements CopyWith$Variables$Query$GetManyEpisodeIdsForPlaylist<TRes> {
  _CopyWithStubImpl$Variables$Query$GetManyEpisodeIdsForPlaylist(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetManyEpisodeIdsForPlaylist {
  Query$GetManyEpisodeIdsForPlaylist({
    required this.playlist,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetManyEpisodeIdsForPlaylist.fromJson(
      Map<String, dynamic> json) {
    final l$playlist = json['playlist'];
    final l$$__typename = json['__typename'];
    return Query$GetManyEpisodeIdsForPlaylist(
      playlist: Query$GetManyEpisodeIdsForPlaylist$playlist.fromJson(
          (l$playlist as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetManyEpisodeIdsForPlaylist$playlist playlist;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$playlist = playlist;
    _resultData['playlist'] = l$playlist.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$playlist = playlist;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$playlist,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetManyEpisodeIdsForPlaylist) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$playlist = playlist;
    final lOther$playlist = other.playlist;
    if (l$playlist != lOther$playlist) {
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

extension UtilityExtension$Query$GetManyEpisodeIdsForPlaylist
    on Query$GetManyEpisodeIdsForPlaylist {
  CopyWith$Query$GetManyEpisodeIdsForPlaylist<
          Query$GetManyEpisodeIdsForPlaylist>
      get copyWith => CopyWith$Query$GetManyEpisodeIdsForPlaylist(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetManyEpisodeIdsForPlaylist<TRes> {
  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist(
    Query$GetManyEpisodeIdsForPlaylist instance,
    TRes Function(Query$GetManyEpisodeIdsForPlaylist) then,
  ) = _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist;

  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist.stub(TRes res) =
      _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist;

  TRes call({
    Query$GetManyEpisodeIdsForPlaylist$playlist? playlist,
    String? $__typename,
  });
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist<TRes> get playlist;
}

class _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist<TRes>
    implements CopyWith$Query$GetManyEpisodeIdsForPlaylist<TRes> {
  _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist(
    this._instance,
    this._then,
  );

  final Query$GetManyEpisodeIdsForPlaylist _instance;

  final TRes Function(Query$GetManyEpisodeIdsForPlaylist) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? playlist = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetManyEpisodeIdsForPlaylist(
        playlist: playlist == _undefined || playlist == null
            ? _instance.playlist
            : (playlist as Query$GetManyEpisodeIdsForPlaylist$playlist),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist<TRes> get playlist {
    final local$playlist = _instance.playlist;
    return CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist(
        local$playlist, (e) => call(playlist: e));
  }
}

class _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist<TRes>
    implements CopyWith$Query$GetManyEpisodeIdsForPlaylist<TRes> {
  _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist(this._res);

  TRes _res;

  call({
    Query$GetManyEpisodeIdsForPlaylist$playlist? playlist,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist<TRes> get playlist =>
      CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist.stub(_res);
}

const documentNodeQueryGetManyEpisodeIdsForPlaylist =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetManyEpisodeIdsForPlaylist'),
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
        name: NameNode(value: 'playlist'),
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
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '100'),
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
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
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
                        name: NameNode(value: 'cursor'),
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
Query$GetManyEpisodeIdsForPlaylist _parserFn$Query$GetManyEpisodeIdsForPlaylist(
        Map<String, dynamic> data) =>
    Query$GetManyEpisodeIdsForPlaylist.fromJson(data);
typedef OnQueryComplete$Query$GetManyEpisodeIdsForPlaylist = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$GetManyEpisodeIdsForPlaylist?,
);

class Options$Query$GetManyEpisodeIdsForPlaylist
    extends graphql.QueryOptions<Query$GetManyEpisodeIdsForPlaylist> {
  Options$Query$GetManyEpisodeIdsForPlaylist({
    String? operationName,
    required Variables$Query$GetManyEpisodeIdsForPlaylist variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetManyEpisodeIdsForPlaylist? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetManyEpisodeIdsForPlaylist? onComplete,
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
                        : _parserFn$Query$GetManyEpisodeIdsForPlaylist(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetManyEpisodeIdsForPlaylist,
          parserFn: _parserFn$Query$GetManyEpisodeIdsForPlaylist,
        );

  final OnQueryComplete$Query$GetManyEpisodeIdsForPlaylist?
      onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetManyEpisodeIdsForPlaylist
    extends graphql.WatchQueryOptions<Query$GetManyEpisodeIdsForPlaylist> {
  WatchOptions$Query$GetManyEpisodeIdsForPlaylist({
    String? operationName,
    required Variables$Query$GetManyEpisodeIdsForPlaylist variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetManyEpisodeIdsForPlaylist? typedOptimisticResult,
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
          document: documentNodeQueryGetManyEpisodeIdsForPlaylist,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetManyEpisodeIdsForPlaylist,
        );
}

class FetchMoreOptions$Query$GetManyEpisodeIdsForPlaylist
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetManyEpisodeIdsForPlaylist({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetManyEpisodeIdsForPlaylist variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetManyEpisodeIdsForPlaylist,
        );
}

extension ClientExtension$Query$GetManyEpisodeIdsForPlaylist
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetManyEpisodeIdsForPlaylist>>
      query$GetManyEpisodeIdsForPlaylist(
              Options$Query$GetManyEpisodeIdsForPlaylist options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetManyEpisodeIdsForPlaylist>
      watchQuery$GetManyEpisodeIdsForPlaylist(
              WatchOptions$Query$GetManyEpisodeIdsForPlaylist options) =>
          this.watchQuery(options);
  void writeQuery$GetManyEpisodeIdsForPlaylist({
    required Query$GetManyEpisodeIdsForPlaylist data,
    required Variables$Query$GetManyEpisodeIdsForPlaylist variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetManyEpisodeIdsForPlaylist),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetManyEpisodeIdsForPlaylist? readQuery$GetManyEpisodeIdsForPlaylist({
    required Variables$Query$GetManyEpisodeIdsForPlaylist variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetManyEpisodeIdsForPlaylist),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetManyEpisodeIdsForPlaylist.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetManyEpisodeIdsForPlaylist>
    useQuery$GetManyEpisodeIdsForPlaylist(
            Options$Query$GetManyEpisodeIdsForPlaylist options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetManyEpisodeIdsForPlaylist>
    useWatchQuery$GetManyEpisodeIdsForPlaylist(
            WatchOptions$Query$GetManyEpisodeIdsForPlaylist options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetManyEpisodeIdsForPlaylist$Widget
    extends graphql_flutter.Query<Query$GetManyEpisodeIdsForPlaylist> {
  Query$GetManyEpisodeIdsForPlaylist$Widget({
    widgets.Key? key,
    required Options$Query$GetManyEpisodeIdsForPlaylist options,
    required graphql_flutter.QueryBuilder<Query$GetManyEpisodeIdsForPlaylist>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetManyEpisodeIdsForPlaylist$playlist {
  Query$GetManyEpisodeIdsForPlaylist$playlist({
    required this.items,
    this.$__typename = 'Playlist',
  });

  factory Query$GetManyEpisodeIdsForPlaylist$playlist.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetManyEpisodeIdsForPlaylist$playlist(
      items: Query$GetManyEpisodeIdsForPlaylist$playlist$items.fromJson(
          (l$items as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetManyEpisodeIdsForPlaylist$playlist$items items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.toJson();
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
    if (!(other is Query$GetManyEpisodeIdsForPlaylist$playlist) ||
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

extension UtilityExtension$Query$GetManyEpisodeIdsForPlaylist$playlist
    on Query$GetManyEpisodeIdsForPlaylist$playlist {
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist<
          Query$GetManyEpisodeIdsForPlaylist$playlist>
      get copyWith => CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist<TRes> {
  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist(
    Query$GetManyEpisodeIdsForPlaylist$playlist instance,
    TRes Function(Query$GetManyEpisodeIdsForPlaylist$playlist) then,
  ) = _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist;

  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist.stub(TRes res) =
      _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist;

  TRes call({
    Query$GetManyEpisodeIdsForPlaylist$playlist$items? items,
    String? $__typename,
  });
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items<TRes> get items;
}

class _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist<TRes>
    implements CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist<TRes> {
  _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist(
    this._instance,
    this._then,
  );

  final Query$GetManyEpisodeIdsForPlaylist$playlist _instance;

  final TRes Function(Query$GetManyEpisodeIdsForPlaylist$playlist) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetManyEpisodeIdsForPlaylist$playlist(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Query$GetManyEpisodeIdsForPlaylist$playlist$items),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist<TRes>
    implements CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist<TRes> {
  _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist(this._res);

  TRes _res;

  call({
    Query$GetManyEpisodeIdsForPlaylist$playlist$items? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items<TRes> get items =>
      CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items.stub(_res);
}

class Query$GetManyEpisodeIdsForPlaylist$playlist$items {
  Query$GetManyEpisodeIdsForPlaylist$playlist$items({
    required this.items,
    this.$__typename = 'PlaylistItemPagination',
  });

  factory Query$GetManyEpisodeIdsForPlaylist$playlist$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetManyEpisodeIdsForPlaylist$playlist$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$GetManyEpisodeIdsForPlaylist$playlist$items$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetManyEpisodeIdsForPlaylist$playlist$items$items> items;

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
    if (!(other is Query$GetManyEpisodeIdsForPlaylist$playlist$items) ||
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

extension UtilityExtension$Query$GetManyEpisodeIdsForPlaylist$playlist$items
    on Query$GetManyEpisodeIdsForPlaylist$playlist$items {
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items<
          Query$GetManyEpisodeIdsForPlaylist$playlist$items>
      get copyWith =>
          CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items<
    TRes> {
  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items(
    Query$GetManyEpisodeIdsForPlaylist$playlist$items instance,
    TRes Function(Query$GetManyEpisodeIdsForPlaylist$playlist$items) then,
  ) = _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items;

  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items;

  TRes call({
    List<Query$GetManyEpisodeIdsForPlaylist$playlist$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$GetManyEpisodeIdsForPlaylist$playlist$items$items> Function(
              Iterable<
                  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items<
                      Query$GetManyEpisodeIdsForPlaylist$playlist$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items<TRes>
    implements
        CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items<TRes> {
  _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items(
    this._instance,
    this._then,
  );

  final Query$GetManyEpisodeIdsForPlaylist$playlist$items _instance;

  final TRes Function(Query$GetManyEpisodeIdsForPlaylist$playlist$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetManyEpisodeIdsForPlaylist$playlist$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$GetManyEpisodeIdsForPlaylist$playlist$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$GetManyEpisodeIdsForPlaylist$playlist$items$items> Function(
                  Iterable<
                      CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items<
                          Query$GetManyEpisodeIdsForPlaylist$playlist$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items<TRes>
    implements
        CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items<TRes> {
  _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items(
      this._res);

  TRes _res;

  call({
    List<Query$GetManyEpisodeIdsForPlaylist$playlist$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetManyEpisodeIdsForPlaylist$playlist$items$items {
  Query$GetManyEpisodeIdsForPlaylist$playlist$items$items(
      {required this.$__typename});

  factory Query$GetManyEpisodeIdsForPlaylist$playlist$items$items.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Episode":
        return Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$GetManyEpisodeIdsForPlaylist$playlist$items$items(
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
    if (!(other is Query$GetManyEpisodeIdsForPlaylist$playlist$items$items) ||
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

extension UtilityExtension$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items
    on Query$GetManyEpisodeIdsForPlaylist$playlist$items$items {
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items<
          Query$GetManyEpisodeIdsForPlaylist$playlist$items$items>
      get copyWith =>
          CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(
            Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode)
        episode,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        return episode(this
            as Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode)?
        episode,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        if (episode != null) {
          return episode(this
              as Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items<
    TRes> {
  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items(
    Query$GetManyEpisodeIdsForPlaylist$playlist$items$items instance,
    TRes Function(Query$GetManyEpisodeIdsForPlaylist$playlist$items$items) then,
  ) = _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items;

  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items<
        TRes>
    implements
        CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items<TRes> {
  _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items(
    this._instance,
    this._then,
  );

  final Query$GetManyEpisodeIdsForPlaylist$playlist$items$items _instance;

  final TRes Function(Query$GetManyEpisodeIdsForPlaylist$playlist$items$items)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$GetManyEpisodeIdsForPlaylist$playlist$items$items(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items<
        TRes>
    implements
        CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items<TRes> {
  _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode
    implements Query$GetManyEpisodeIdsForPlaylist$playlist$items$items {
  Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode({
    required this.id,
    required this.cursor,
    this.$__typename = 'Episode',
  });

  factory Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$cursor = json['cursor'];
    final l$$__typename = json['__typename'];
    return Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode(
      id: (l$id as String),
      cursor: (l$cursor as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String cursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$cursor = cursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$cursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
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

extension UtilityExtension$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode
    on Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode {
  CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode<
          Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode>
      get copyWith =>
          CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode<
    TRes> {
  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode(
    Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode instance,
    TRes Function(
            Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode)
        then,
  ) = _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode;

  factory CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode;

  TRes call({
    String? id,
    String? cursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode<
        TRes>
    implements
        CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode<
            TRes> {
  _CopyWithImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode(
    this._instance,
    this._then,
  );

  final Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode
      _instance;

  final TRes Function(
      Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? cursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode<
        TRes>
    implements
        CopyWith$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$GetManyEpisodeIdsForPlaylist$playlist$items$items$$Episode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? cursor,
    String? $__typename,
  }) =>
      _res;
}
