import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$UrlGame {
  Fragment$UrlGame({
    required this.id,
    required this.url,
    this.$__typename = 'Game',
  });

  factory Fragment$UrlGame.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Fragment$UrlGame(
      id: (l$id as String),
      url: (l$url as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$UrlGame) || runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$UrlGame on Fragment$UrlGame {
  CopyWith$Fragment$UrlGame<Fragment$UrlGame> get copyWith =>
      CopyWith$Fragment$UrlGame(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$UrlGame<TRes> {
  factory CopyWith$Fragment$UrlGame(
    Fragment$UrlGame instance,
    TRes Function(Fragment$UrlGame) then,
  ) = _CopyWithImpl$Fragment$UrlGame;

  factory CopyWith$Fragment$UrlGame.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UrlGame;

  TRes call({
    String? id,
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$UrlGame<TRes>
    implements CopyWith$Fragment$UrlGame<TRes> {
  _CopyWithImpl$Fragment$UrlGame(
    this._instance,
    this._then,
  );

  final Fragment$UrlGame _instance;

  final TRes Function(Fragment$UrlGame) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UrlGame(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$UrlGame<TRes>
    implements CopyWith$Fragment$UrlGame<TRes> {
  _CopyWithStubImpl$Fragment$UrlGame(this._res);

  TRes _res;

  call({
    String? id,
    String? url,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionUrlGame = FragmentDefinitionNode(
  name: NameNode(value: 'UrlGame'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Game'),
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
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentUrlGame = DocumentNode(definitions: [
  fragmentDefinitionUrlGame,
]);

extension ClientExtension$Fragment$UrlGame on graphql.GraphQLClient {
  void writeFragment$UrlGame({
    required Fragment$UrlGame data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'UrlGame',
            document: documentNodeFragmentUrlGame,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$UrlGame? readFragment$UrlGame({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'UrlGame',
          document: documentNodeFragmentUrlGame,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$UrlGame.fromJson(result);
  }
}

class Variables$Query$GetGame {
  factory Variables$Query$GetGame({required String id}) =>
      Variables$Query$GetGame._({
        r'id': id,
      });

  Variables$Query$GetGame._(this._$data);

  factory Variables$Query$GetGame.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetGame._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetGame<Variables$Query$GetGame> get copyWith =>
      CopyWith$Variables$Query$GetGame(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetGame) ||
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

abstract class CopyWith$Variables$Query$GetGame<TRes> {
  factory CopyWith$Variables$Query$GetGame(
    Variables$Query$GetGame instance,
    TRes Function(Variables$Query$GetGame) then,
  ) = _CopyWithImpl$Variables$Query$GetGame;

  factory CopyWith$Variables$Query$GetGame.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetGame;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetGame<TRes>
    implements CopyWith$Variables$Query$GetGame<TRes> {
  _CopyWithImpl$Variables$Query$GetGame(
    this._instance,
    this._then,
  );

  final Variables$Query$GetGame _instance;

  final TRes Function(Variables$Query$GetGame) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$GetGame._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetGame<TRes>
    implements CopyWith$Variables$Query$GetGame<TRes> {
  _CopyWithStubImpl$Variables$Query$GetGame(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetGame {
  Query$GetGame({
    required this.game,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetGame.fromJson(Map<String, dynamic> json) {
    final l$game = json['game'];
    final l$$__typename = json['__typename'];
    return Query$GetGame(
      game: Query$GetGame$game.fromJson((l$game as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetGame$game game;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$game = game;
    _resultData['game'] = l$game.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$game = game;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$game,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetGame) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$game = game;
    final lOther$game = other.game;
    if (l$game != lOther$game) {
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

extension UtilityExtension$Query$GetGame on Query$GetGame {
  CopyWith$Query$GetGame<Query$GetGame> get copyWith => CopyWith$Query$GetGame(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetGame<TRes> {
  factory CopyWith$Query$GetGame(
    Query$GetGame instance,
    TRes Function(Query$GetGame) then,
  ) = _CopyWithImpl$Query$GetGame;

  factory CopyWith$Query$GetGame.stub(TRes res) =
      _CopyWithStubImpl$Query$GetGame;

  TRes call({
    Query$GetGame$game? game,
    String? $__typename,
  });
  CopyWith$Query$GetGame$game<TRes> get game;
}

class _CopyWithImpl$Query$GetGame<TRes>
    implements CopyWith$Query$GetGame<TRes> {
  _CopyWithImpl$Query$GetGame(
    this._instance,
    this._then,
  );

  final Query$GetGame _instance;

  final TRes Function(Query$GetGame) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? game = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetGame(
        game: game == _undefined || game == null
            ? _instance.game
            : (game as Query$GetGame$game),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetGame$game<TRes> get game {
    final local$game = _instance.game;
    return CopyWith$Query$GetGame$game(local$game, (e) => call(game: e));
  }
}

class _CopyWithStubImpl$Query$GetGame<TRes>
    implements CopyWith$Query$GetGame<TRes> {
  _CopyWithStubImpl$Query$GetGame(this._res);

  TRes _res;

  call({
    Query$GetGame$game? game,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetGame$game<TRes> get game =>
      CopyWith$Query$GetGame$game.stub(_res);
}

const documentNodeQueryGetGame = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetGame'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'game'),
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
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FragmentSpreadNode(
            name: NameNode(value: 'UrlGame'),
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
  fragmentDefinitionUrlGame,
]);
Query$GetGame _parserFn$Query$GetGame(Map<String, dynamic> data) =>
    Query$GetGame.fromJson(data);
typedef OnQueryComplete$Query$GetGame = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetGame?,
);

class Options$Query$GetGame extends graphql.QueryOptions<Query$GetGame> {
  Options$Query$GetGame({
    String? operationName,
    required Variables$Query$GetGame variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGame? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetGame? onComplete,
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
                    data == null ? null : _parserFn$Query$GetGame(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetGame,
          parserFn: _parserFn$Query$GetGame,
        );

  final OnQueryComplete$Query$GetGame? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetGame
    extends graphql.WatchQueryOptions<Query$GetGame> {
  WatchOptions$Query$GetGame({
    String? operationName,
    required Variables$Query$GetGame variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGame? typedOptimisticResult,
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
          document: documentNodeQueryGetGame,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetGame,
        );
}

class FetchMoreOptions$Query$GetGame extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetGame({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetGame variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetGame,
        );
}

extension ClientExtension$Query$GetGame on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetGame>> query$GetGame(
          Options$Query$GetGame options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetGame> watchQuery$GetGame(
          WatchOptions$Query$GetGame options) =>
      this.watchQuery(options);
  void writeQuery$GetGame({
    required Query$GetGame data,
    required Variables$Query$GetGame variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetGame),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetGame? readQuery$GetGame({
    required Variables$Query$GetGame variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetGame),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetGame.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetGame> useQuery$GetGame(
        Options$Query$GetGame options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetGame> useWatchQuery$GetGame(
        WatchOptions$Query$GetGame options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetGame$Widget extends graphql_flutter.Query<Query$GetGame> {
  Query$GetGame$Widget({
    widgets.Key? key,
    required Options$Query$GetGame options,
    required graphql_flutter.QueryBuilder<Query$GetGame> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetGame$game implements Fragment$UrlGame {
  Query$GetGame$game({
    required this.id,
    required this.title,
    required this.url,
    this.$__typename = 'Game',
  });

  factory Query$GetGame$game.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$GetGame$game(
      id: (l$id as String),
      title: (l$title as String),
      url: (l$url as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetGame$game) || runtimeType != other.runtimeType) {
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
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
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

extension UtilityExtension$Query$GetGame$game on Query$GetGame$game {
  CopyWith$Query$GetGame$game<Query$GetGame$game> get copyWith =>
      CopyWith$Query$GetGame$game(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetGame$game<TRes> {
  factory CopyWith$Query$GetGame$game(
    Query$GetGame$game instance,
    TRes Function(Query$GetGame$game) then,
  ) = _CopyWithImpl$Query$GetGame$game;

  factory CopyWith$Query$GetGame$game.stub(TRes res) =
      _CopyWithStubImpl$Query$GetGame$game;

  TRes call({
    String? id,
    String? title,
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetGame$game<TRes>
    implements CopyWith$Query$GetGame$game<TRes> {
  _CopyWithImpl$Query$GetGame$game(
    this._instance,
    this._then,
  );

  final Query$GetGame$game _instance;

  final TRes Function(Query$GetGame$game) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetGame$game(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetGame$game<TRes>
    implements CopyWith$Query$GetGame$game<TRes> {
  _CopyWithStubImpl$Query$GetGame$game(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? url,
    String? $__typename,
  }) =>
      _res;
}
