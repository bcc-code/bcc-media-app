import '../schema/mutations.graphql.dart';
import 'dart:async';
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
            name: NameNode(value: 'roles'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
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
            name: NameNode(value: 'completedRegistration'),
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
typedef OnQueryComplete$Query$me = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$me?,
);

class Options$Query$me extends graphql.QueryOptions<Query$me> {
  Options$Query$me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$me? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$me? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
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
                    data == null ? null : _parserFn$Query$me(data),
                  ),
          onError: onError,
          document: documentNodeQueryme,
          parserFn: _parserFn$Query$me,
        );

  final OnQueryComplete$Query$me? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$me extends graphql.WatchQueryOptions<Query$me> {
  WatchOptions$Query$me({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$me? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
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
    required this.roles,
    this.email,
    required this.emailVerified,
    required this.completedRegistration,
    this.$__typename = 'User',
  });

  factory Query$me$me.fromJson(Map<String, dynamic> json) {
    final l$analytics = json['analytics'];
    final l$roles = json['roles'];
    final l$email = json['email'];
    final l$emailVerified = json['emailVerified'];
    final l$completedRegistration = json['completedRegistration'];
    final l$$__typename = json['__typename'];
    return Query$me$me(
      analytics:
          Query$me$me$analytics.fromJson((l$analytics as Map<String, dynamic>)),
      roles: (l$roles as List<dynamic>).map((e) => (e as String)).toList(),
      email: (l$email as String?),
      emailVerified: (l$emailVerified as bool),
      completedRegistration: (l$completedRegistration as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$me$me$analytics analytics;

  final List<String> roles;

  final String? email;

  final bool emailVerified;

  final bool completedRegistration;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$analytics = analytics;
    _resultData['analytics'] = l$analytics.toJson();
    final l$roles = roles;
    _resultData['roles'] = l$roles.map((e) => e).toList();
    final l$email = email;
    _resultData['email'] = l$email;
    final l$emailVerified = emailVerified;
    _resultData['emailVerified'] = l$emailVerified;
    final l$completedRegistration = completedRegistration;
    _resultData['completedRegistration'] = l$completedRegistration;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$analytics = analytics;
    final l$roles = roles;
    final l$email = email;
    final l$emailVerified = emailVerified;
    final l$completedRegistration = completedRegistration;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$analytics,
      Object.hashAll(l$roles.map((v) => v)),
      l$email,
      l$emailVerified,
      l$completedRegistration,
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
    final l$roles = roles;
    final lOther$roles = other.roles;
    if (l$roles.length != lOther$roles.length) {
      return false;
    }
    for (int i = 0; i < l$roles.length; i++) {
      final l$roles$entry = l$roles[i];
      final lOther$roles$entry = lOther$roles[i];
      if (l$roles$entry != lOther$roles$entry) {
        return false;
      }
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$emailVerified = emailVerified;
    final lOther$emailVerified = other.emailVerified;
    if (l$emailVerified != lOther$emailVerified) {
      return false;
    }
    final l$completedRegistration = completedRegistration;
    final lOther$completedRegistration = other.completedRegistration;
    if (l$completedRegistration != lOther$completedRegistration) {
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
    List<String>? roles,
    String? email,
    bool? emailVerified,
    bool? completedRegistration,
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
    Object? roles = _undefined,
    Object? email = _undefined,
    Object? emailVerified = _undefined,
    Object? completedRegistration = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$me$me(
        analytics: analytics == _undefined || analytics == null
            ? _instance.analytics
            : (analytics as Query$me$me$analytics),
        roles: roles == _undefined || roles == null
            ? _instance.roles
            : (roles as List<String>),
        email: email == _undefined ? _instance.email : (email as String?),
        emailVerified: emailVerified == _undefined || emailVerified == null
            ? _instance.emailVerified
            : (emailVerified as bool),
        completedRegistration:
            completedRegistration == _undefined || completedRegistration == null
                ? _instance.completedRegistration
                : (completedRegistration as bool),
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
    List<String>? roles,
    String? email,
    bool? emailVerified,
    bool? completedRegistration,
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

class Mutation$sendVerificationEmail {
  Mutation$sendVerificationEmail({
    required this.sendVerificationEmail,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$sendVerificationEmail.fromJson(Map<String, dynamic> json) {
    final l$sendVerificationEmail = json['sendVerificationEmail'];
    final l$$__typename = json['__typename'];
    return Mutation$sendVerificationEmail(
      sendVerificationEmail: (l$sendVerificationEmail as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool sendVerificationEmail;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendVerificationEmail = sendVerificationEmail;
    _resultData['sendVerificationEmail'] = l$sendVerificationEmail;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendVerificationEmail = sendVerificationEmail;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sendVerificationEmail,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$sendVerificationEmail) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendVerificationEmail = sendVerificationEmail;
    final lOther$sendVerificationEmail = other.sendVerificationEmail;
    if (l$sendVerificationEmail != lOther$sendVerificationEmail) {
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

extension UtilityExtension$Mutation$sendVerificationEmail
    on Mutation$sendVerificationEmail {
  CopyWith$Mutation$sendVerificationEmail<Mutation$sendVerificationEmail>
      get copyWith => CopyWith$Mutation$sendVerificationEmail(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$sendVerificationEmail<TRes> {
  factory CopyWith$Mutation$sendVerificationEmail(
    Mutation$sendVerificationEmail instance,
    TRes Function(Mutation$sendVerificationEmail) then,
  ) = _CopyWithImpl$Mutation$sendVerificationEmail;

  factory CopyWith$Mutation$sendVerificationEmail.stub(TRes res) =
      _CopyWithStubImpl$Mutation$sendVerificationEmail;

  TRes call({
    bool? sendVerificationEmail,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$sendVerificationEmail<TRes>
    implements CopyWith$Mutation$sendVerificationEmail<TRes> {
  _CopyWithImpl$Mutation$sendVerificationEmail(
    this._instance,
    this._then,
  );

  final Mutation$sendVerificationEmail _instance;

  final TRes Function(Mutation$sendVerificationEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendVerificationEmail = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendVerificationEmail(
        sendVerificationEmail:
            sendVerificationEmail == _undefined || sendVerificationEmail == null
                ? _instance.sendVerificationEmail
                : (sendVerificationEmail as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$sendVerificationEmail<TRes>
    implements CopyWith$Mutation$sendVerificationEmail<TRes> {
  _CopyWithStubImpl$Mutation$sendVerificationEmail(this._res);

  TRes _res;

  call({
    bool? sendVerificationEmail,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationsendVerificationEmail = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'sendVerificationEmail'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'sendVerificationEmail'),
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
]);
Mutation$sendVerificationEmail _parserFn$Mutation$sendVerificationEmail(
        Map<String, dynamic> data) =>
    Mutation$sendVerificationEmail.fromJson(data);
typedef OnMutationCompleted$Mutation$sendVerificationEmail = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$sendVerificationEmail?,
);

class Options$Mutation$sendVerificationEmail
    extends graphql.MutationOptions<Mutation$sendVerificationEmail> {
  Options$Mutation$sendVerificationEmail({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendVerificationEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendVerificationEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendVerificationEmail>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$sendVerificationEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendVerificationEmail,
          parserFn: _parserFn$Mutation$sendVerificationEmail,
        );

  final OnMutationCompleted$Mutation$sendVerificationEmail?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$sendVerificationEmail
    extends graphql.WatchQueryOptions<Mutation$sendVerificationEmail> {
  WatchOptions$Mutation$sendVerificationEmail({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendVerificationEmail? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationsendVerificationEmail,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$sendVerificationEmail,
        );
}

extension ClientExtension$Mutation$sendVerificationEmail
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$sendVerificationEmail>>
      mutate$sendVerificationEmail(
              [Options$Mutation$sendVerificationEmail? options]) async =>
          await this
              .mutate(options ?? Options$Mutation$sendVerificationEmail());
  graphql.ObservableQuery<Mutation$sendVerificationEmail>
      watchMutation$sendVerificationEmail(
              [WatchOptions$Mutation$sendVerificationEmail? options]) =>
          this.watchMutation(
              options ?? WatchOptions$Mutation$sendVerificationEmail());
}

class Mutation$sendVerificationEmail$HookResult {
  Mutation$sendVerificationEmail$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$sendVerificationEmail runMutation;

  final graphql.QueryResult<Mutation$sendVerificationEmail> result;
}

Mutation$sendVerificationEmail$HookResult useMutation$sendVerificationEmail(
    [WidgetOptions$Mutation$sendVerificationEmail? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$sendVerificationEmail());
  return Mutation$sendVerificationEmail$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$sendVerificationEmail>
    useWatchMutation$sendVerificationEmail(
            [WatchOptions$Mutation$sendVerificationEmail? options]) =>
        graphql_flutter.useWatchMutation(
            options ?? WatchOptions$Mutation$sendVerificationEmail());

class WidgetOptions$Mutation$sendVerificationEmail
    extends graphql.MutationOptions<Mutation$sendVerificationEmail> {
  WidgetOptions$Mutation$sendVerificationEmail({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$sendVerificationEmail? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendVerificationEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendVerificationEmail>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$sendVerificationEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendVerificationEmail,
          parserFn: _parserFn$Mutation$sendVerificationEmail,
        );

  final OnMutationCompleted$Mutation$sendVerificationEmail?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$sendVerificationEmail
    = graphql.MultiSourceResult<Mutation$sendVerificationEmail> Function({
  Object? optimisticResult,
  Mutation$sendVerificationEmail? typedOptimisticResult,
});
typedef Builder$Mutation$sendVerificationEmail = widgets.Widget Function(
  RunMutation$Mutation$sendVerificationEmail,
  graphql.QueryResult<Mutation$sendVerificationEmail>?,
);

class Mutation$sendVerificationEmail$Widget
    extends graphql_flutter.Mutation<Mutation$sendVerificationEmail> {
  Mutation$sendVerificationEmail$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$sendVerificationEmail? options,
    required Builder$Mutation$sendVerificationEmail builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$sendVerificationEmail(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Variables$Mutation$updateUserMetadata {
  factory Variables$Mutation$updateUserMetadata({
    required Input$NameOptions nameData,
    required Input$BirthOptions birthData,
  }) =>
      Variables$Mutation$updateUserMetadata._({
        r'nameData': nameData,
        r'birthData': birthData,
      });

  Variables$Mutation$updateUserMetadata._(this._$data);

  factory Variables$Mutation$updateUserMetadata.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$nameData = data['nameData'];
    result$data['nameData'] =
        Input$NameOptions.fromJson((l$nameData as Map<String, dynamic>));
    final l$birthData = data['birthData'];
    result$data['birthData'] =
        Input$BirthOptions.fromJson((l$birthData as Map<String, dynamic>));
    return Variables$Mutation$updateUserMetadata._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$NameOptions get nameData => (_$data['nameData'] as Input$NameOptions);
  Input$BirthOptions get birthData =>
      (_$data['birthData'] as Input$BirthOptions);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$nameData = nameData;
    result$data['nameData'] = l$nameData.toJson();
    final l$birthData = birthData;
    result$data['birthData'] = l$birthData.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateUserMetadata<
          Variables$Mutation$updateUserMetadata>
      get copyWith => CopyWith$Variables$Mutation$updateUserMetadata(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateUserMetadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$nameData = nameData;
    final lOther$nameData = other.nameData;
    if (l$nameData != lOther$nameData) {
      return false;
    }
    final l$birthData = birthData;
    final lOther$birthData = other.birthData;
    if (l$birthData != lOther$birthData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$nameData = nameData;
    final l$birthData = birthData;
    return Object.hashAll([
      l$nameData,
      l$birthData,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateUserMetadata<TRes> {
  factory CopyWith$Variables$Mutation$updateUserMetadata(
    Variables$Mutation$updateUserMetadata instance,
    TRes Function(Variables$Mutation$updateUserMetadata) then,
  ) = _CopyWithImpl$Variables$Mutation$updateUserMetadata;

  factory CopyWith$Variables$Mutation$updateUserMetadata.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateUserMetadata;

  TRes call({
    Input$NameOptions? nameData,
    Input$BirthOptions? birthData,
  });
}

class _CopyWithImpl$Variables$Mutation$updateUserMetadata<TRes>
    implements CopyWith$Variables$Mutation$updateUserMetadata<TRes> {
  _CopyWithImpl$Variables$Mutation$updateUserMetadata(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateUserMetadata _instance;

  final TRes Function(Variables$Mutation$updateUserMetadata) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nameData = _undefined,
    Object? birthData = _undefined,
  }) =>
      _then(Variables$Mutation$updateUserMetadata._({
        ..._instance._$data,
        if (nameData != _undefined && nameData != null)
          'nameData': (nameData as Input$NameOptions),
        if (birthData != _undefined && birthData != null)
          'birthData': (birthData as Input$BirthOptions),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateUserMetadata<TRes>
    implements CopyWith$Variables$Mutation$updateUserMetadata<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateUserMetadata(this._res);

  TRes _res;

  call({
    Input$NameOptions? nameData,
    Input$BirthOptions? birthData,
  }) =>
      _res;
}

class Mutation$updateUserMetadata {
  Mutation$updateUserMetadata({
    required this.updateUserMetadata,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$updateUserMetadata.fromJson(Map<String, dynamic> json) {
    final l$updateUserMetadata = json['updateUserMetadata'];
    final l$$__typename = json['__typename'];
    return Mutation$updateUserMetadata(
      updateUserMetadata: (l$updateUserMetadata as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool updateUserMetadata;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateUserMetadata = updateUserMetadata;
    _resultData['updateUserMetadata'] = l$updateUserMetadata;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateUserMetadata = updateUserMetadata;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateUserMetadata,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateUserMetadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateUserMetadata = updateUserMetadata;
    final lOther$updateUserMetadata = other.updateUserMetadata;
    if (l$updateUserMetadata != lOther$updateUserMetadata) {
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

extension UtilityExtension$Mutation$updateUserMetadata
    on Mutation$updateUserMetadata {
  CopyWith$Mutation$updateUserMetadata<Mutation$updateUserMetadata>
      get copyWith => CopyWith$Mutation$updateUserMetadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateUserMetadata<TRes> {
  factory CopyWith$Mutation$updateUserMetadata(
    Mutation$updateUserMetadata instance,
    TRes Function(Mutation$updateUserMetadata) then,
  ) = _CopyWithImpl$Mutation$updateUserMetadata;

  factory CopyWith$Mutation$updateUserMetadata.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateUserMetadata;

  TRes call({
    bool? updateUserMetadata,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateUserMetadata<TRes>
    implements CopyWith$Mutation$updateUserMetadata<TRes> {
  _CopyWithImpl$Mutation$updateUserMetadata(
    this._instance,
    this._then,
  );

  final Mutation$updateUserMetadata _instance;

  final TRes Function(Mutation$updateUserMetadata) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateUserMetadata = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateUserMetadata(
        updateUserMetadata:
            updateUserMetadata == _undefined || updateUserMetadata == null
                ? _instance.updateUserMetadata
                : (updateUserMetadata as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateUserMetadata<TRes>
    implements CopyWith$Mutation$updateUserMetadata<TRes> {
  _CopyWithStubImpl$Mutation$updateUserMetadata(this._res);

  TRes _res;

  call({
    bool? updateUserMetadata,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationupdateUserMetadata = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateUserMetadata'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'nameData')),
        type: NamedTypeNode(
          name: NameNode(value: 'NameOptions'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'birthData')),
        type: NamedTypeNode(
          name: NameNode(value: 'BirthOptions'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateUserMetadata'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'nameData'),
            value: VariableNode(name: NameNode(value: 'nameData')),
          ),
          ArgumentNode(
            name: NameNode(value: 'birthData'),
            value: VariableNode(name: NameNode(value: 'birthData')),
          ),
        ],
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
]);
Mutation$updateUserMetadata _parserFn$Mutation$updateUserMetadata(
        Map<String, dynamic> data) =>
    Mutation$updateUserMetadata.fromJson(data);
typedef OnMutationCompleted$Mutation$updateUserMetadata = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$updateUserMetadata?,
);

class Options$Mutation$updateUserMetadata
    extends graphql.MutationOptions<Mutation$updateUserMetadata> {
  Options$Mutation$updateUserMetadata({
    String? operationName,
    required Variables$Mutation$updateUserMetadata variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateUserMetadata? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateUserMetadata? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateUserMetadata>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$updateUserMetadata(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateUserMetadata,
          parserFn: _parserFn$Mutation$updateUserMetadata,
        );

  final OnMutationCompleted$Mutation$updateUserMetadata? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateUserMetadata
    extends graphql.WatchQueryOptions<Mutation$updateUserMetadata> {
  WatchOptions$Mutation$updateUserMetadata({
    String? operationName,
    required Variables$Mutation$updateUserMetadata variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateUserMetadata? typedOptimisticResult,
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
          document: documentNodeMutationupdateUserMetadata,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateUserMetadata,
        );
}

extension ClientExtension$Mutation$updateUserMetadata on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateUserMetadata>>
      mutate$updateUserMetadata(
              Options$Mutation$updateUserMetadata options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateUserMetadata>
      watchMutation$updateUserMetadata(
              WatchOptions$Mutation$updateUserMetadata options) =>
          this.watchMutation(options);
}

class Mutation$updateUserMetadata$HookResult {
  Mutation$updateUserMetadata$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$updateUserMetadata runMutation;

  final graphql.QueryResult<Mutation$updateUserMetadata> result;
}

Mutation$updateUserMetadata$HookResult useMutation$updateUserMetadata(
    [WidgetOptions$Mutation$updateUserMetadata? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$updateUserMetadata());
  return Mutation$updateUserMetadata$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$updateUserMetadata>
    useWatchMutation$updateUserMetadata(
            WatchOptions$Mutation$updateUserMetadata options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$updateUserMetadata
    extends graphql.MutationOptions<Mutation$updateUserMetadata> {
  WidgetOptions$Mutation$updateUserMetadata({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateUserMetadata? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateUserMetadata? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateUserMetadata>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$updateUserMetadata(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateUserMetadata,
          parserFn: _parserFn$Mutation$updateUserMetadata,
        );

  final OnMutationCompleted$Mutation$updateUserMetadata? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$updateUserMetadata
    = graphql.MultiSourceResult<Mutation$updateUserMetadata> Function(
  Variables$Mutation$updateUserMetadata, {
  Object? optimisticResult,
  Mutation$updateUserMetadata? typedOptimisticResult,
});
typedef Builder$Mutation$updateUserMetadata = widgets.Widget Function(
  RunMutation$Mutation$updateUserMetadata,
  graphql.QueryResult<Mutation$updateUserMetadata>?,
);

class Mutation$updateUserMetadata$Widget
    extends graphql_flutter.Mutation<Mutation$updateUserMetadata> {
  Mutation$updateUserMetadata$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$updateUserMetadata? options,
    required Builder$Mutation$updateUserMetadata builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$updateUserMetadata(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}
