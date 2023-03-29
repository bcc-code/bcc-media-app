import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$me {
  Query$me({
    required this.me,
    this.$__typename = 'QueryRoot',
  });

  factory Query$me.fromJson(Map<String, dynamic> json) {
    final l$me = json['me'];
    final l$$__typename = json['__typename'];
    return Query$me(
      me: Query$me$me.fromJson((l$me as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$me$me me;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$me = me;
    _resultData['me'] = l$me.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$me = me;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$me,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$me) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$me = me;
    final lOther$me = other.me;
    if (l$me != lOther$me) {
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

extension UtilityExtension$Query$me on Query$me {
  CopyWith$Query$me<Query$me> get copyWith => CopyWith$Query$me(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$me<TRes> {
  factory CopyWith$Query$me(
    Query$me instance,
    TRes Function(Query$me) then,
  ) = _CopyWithImpl$Query$me;

  factory CopyWith$Query$me.stub(TRes res) = _CopyWithStubImpl$Query$me;

  TRes call({
    Query$me$me? me,
    String? $__typename,
  });
  CopyWith$Query$me$me<TRes> get me;
}

class _CopyWithImpl$Query$me<TRes> implements CopyWith$Query$me<TRes> {
  _CopyWithImpl$Query$me(
    this._instance,
    this._then,
  );

  final Query$me _instance;

  final TRes Function(Query$me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? me = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$me(
        me: me == _undefined || me == null ? _instance.me : (me as Query$me$me),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$me$me<TRes> get me {
    final local$me = _instance.me;
    return CopyWith$Query$me$me(local$me, (e) => call(me: e));
  }
}

class _CopyWithStubImpl$Query$me<TRes> implements CopyWith$Query$me<TRes> {
  _CopyWithStubImpl$Query$me(this._res);

  TRes _res;

  call({
    Query$me$me? me,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$me$me<TRes> get me => CopyWith$Query$me$me.stub(_res);
}

const documentNodeQueryme = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'me'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'me'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'analytics'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'anonymousId'),
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
            name: NameNode(value: 'completedRegistration'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'emailVerified'),
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
Query$me _parserFn$Query$me(Map<String, dynamic> data) =>
    Query$me.fromJson(data);

class Options$Query$me extends graphql.QueryOptions<Query$me> {
  Options$Query$me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryme,
          parserFn: _parserFn$Query$me,
        );
}

class WatchOptions$Query$me extends graphql.WatchQueryOptions<Query$me> {
  WatchOptions$Query$me({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryme,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$me,
        );
}

class FetchMoreOptions$Query$me extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$me({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryme,
        );
}

extension ClientExtension$Query$me on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$me>> query$me(
          [Options$Query$me? options]) async =>
      await this.query(options ?? Options$Query$me());
  graphql.ObservableQuery<Query$me> watchQuery$me(
          [WatchOptions$Query$me? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$me());
  void writeQuery$me({
    required Query$me data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryme)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$me? readQuery$me({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryme)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$me.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$me> useQuery$me(
        [Options$Query$me? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$me());
graphql.ObservableQuery<Query$me> useWatchQuery$me(
        [WatchOptions$Query$me? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$me());

class Query$me$Widget extends graphql_flutter.Query<Query$me> {
  Query$me$Widget({
    widgets.Key? key,
    Options$Query$me? options,
    required graphql_flutter.QueryBuilder<Query$me> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$me(),
          builder: builder,
        );
}

class Query$me$me {
  Query$me$me({
    required this.analytics,
    required this.completedRegistration,
    required this.emailVerified,
    this.$__typename = 'User',
  });

  factory Query$me$me.fromJson(Map<String, dynamic> json) {
    final l$analytics = json['analytics'];
    final l$completedRegistration = json['completedRegistration'];
    final l$emailVerified = json['emailVerified'];
    final l$$__typename = json['__typename'];
    return Query$me$me(
      analytics:
          Query$me$me$analytics.fromJson((l$analytics as Map<String, dynamic>)),
      completedRegistration: (l$completedRegistration as bool),
      emailVerified: (l$emailVerified as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$me$me$analytics analytics;

  final bool completedRegistration;

  final bool emailVerified;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$analytics = analytics;
    _resultData['analytics'] = l$analytics.toJson();
    final l$completedRegistration = completedRegistration;
    _resultData['completedRegistration'] = l$completedRegistration;
    final l$emailVerified = emailVerified;
    _resultData['emailVerified'] = l$emailVerified;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$analytics = analytics;
    final l$completedRegistration = completedRegistration;
    final l$emailVerified = emailVerified;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$analytics,
      l$completedRegistration,
      l$emailVerified,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$me$me) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$analytics = analytics;
    final lOther$analytics = other.analytics;
    if (l$analytics != lOther$analytics) {
      return false;
    }
    final l$completedRegistration = completedRegistration;
    final lOther$completedRegistration = other.completedRegistration;
    if (l$completedRegistration != lOther$completedRegistration) {
      return false;
    }
    final l$emailVerified = emailVerified;
    final lOther$emailVerified = other.emailVerified;
    if (l$emailVerified != lOther$emailVerified) {
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

extension UtilityExtension$Query$me$me on Query$me$me {
  CopyWith$Query$me$me<Query$me$me> get copyWith => CopyWith$Query$me$me(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$me$me<TRes> {
  factory CopyWith$Query$me$me(
    Query$me$me instance,
    TRes Function(Query$me$me) then,
  ) = _CopyWithImpl$Query$me$me;

  factory CopyWith$Query$me$me.stub(TRes res) = _CopyWithStubImpl$Query$me$me;

  TRes call({
    Query$me$me$analytics? analytics,
    bool? completedRegistration,
    bool? emailVerified,
    String? $__typename,
  });
  CopyWith$Query$me$me$analytics<TRes> get analytics;
}

class _CopyWithImpl$Query$me$me<TRes> implements CopyWith$Query$me$me<TRes> {
  _CopyWithImpl$Query$me$me(
    this._instance,
    this._then,
  );

  final Query$me$me _instance;

  final TRes Function(Query$me$me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? analytics = _undefined,
    Object? completedRegistration = _undefined,
    Object? emailVerified = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$me$me(
        analytics: analytics == _undefined || analytics == null
            ? _instance.analytics
            : (analytics as Query$me$me$analytics),
        completedRegistration:
            completedRegistration == _undefined || completedRegistration == null
                ? _instance.completedRegistration
                : (completedRegistration as bool),
        emailVerified: emailVerified == _undefined || emailVerified == null
            ? _instance.emailVerified
            : (emailVerified as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$me$me$analytics<TRes> get analytics {
    final local$analytics = _instance.analytics;
    return CopyWith$Query$me$me$analytics(
        local$analytics, (e) => call(analytics: e));
  }
}

class _CopyWithStubImpl$Query$me$me<TRes>
    implements CopyWith$Query$me$me<TRes> {
  _CopyWithStubImpl$Query$me$me(this._res);

  TRes _res;

  call({
    Query$me$me$analytics? analytics,
    bool? completedRegistration,
    bool? emailVerified,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$me$me$analytics<TRes> get analytics =>
      CopyWith$Query$me$me$analytics.stub(_res);
}

class Query$me$me$analytics {
  Query$me$me$analytics({
    required this.anonymousId,
    this.$__typename = 'Analytics',
  });

  factory Query$me$me$analytics.fromJson(Map<String, dynamic> json) {
    final l$anonymousId = json['anonymousId'];
    final l$$__typename = json['__typename'];
    return Query$me$me$analytics(
      anonymousId: (l$anonymousId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String anonymousId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$anonymousId = anonymousId;
    _resultData['anonymousId'] = l$anonymousId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$anonymousId = anonymousId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$anonymousId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$me$me$analytics) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$anonymousId = anonymousId;
    final lOther$anonymousId = other.anonymousId;
    if (l$anonymousId != lOther$anonymousId) {
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

extension UtilityExtension$Query$me$me$analytics on Query$me$me$analytics {
  CopyWith$Query$me$me$analytics<Query$me$me$analytics> get copyWith =>
      CopyWith$Query$me$me$analytics(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$me$me$analytics<TRes> {
  factory CopyWith$Query$me$me$analytics(
    Query$me$me$analytics instance,
    TRes Function(Query$me$me$analytics) then,
  ) = _CopyWithImpl$Query$me$me$analytics;

  factory CopyWith$Query$me$me$analytics.stub(TRes res) =
      _CopyWithStubImpl$Query$me$me$analytics;

  TRes call({
    String? anonymousId,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$me$me$analytics<TRes>
    implements CopyWith$Query$me$me$analytics<TRes> {
  _CopyWithImpl$Query$me$me$analytics(
    this._instance,
    this._then,
  );

  final Query$me$me$analytics _instance;

  final TRes Function(Query$me$me$analytics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? anonymousId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$me$me$analytics(
        anonymousId: anonymousId == _undefined || anonymousId == null
            ? _instance.anonymousId
            : (anonymousId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$me$me$analytics<TRes>
    implements CopyWith$Query$me$me$analytics<TRes> {
  _CopyWithStubImpl$Query$me$me$analytics(this._res);

  TRes _res;

  call({
    String? anonymousId,
    String? $__typename,
  }) =>
      _res;
}
