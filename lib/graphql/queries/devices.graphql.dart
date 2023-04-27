import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$SetDeviceToken {
  factory Variables$Mutation$SetDeviceToken({
    required String token,
    required List<String> languages,
  }) =>
      Variables$Mutation$SetDeviceToken._({
        r'token': token,
        r'languages': languages,
      });

  Variables$Mutation$SetDeviceToken._(this._$data);

  factory Variables$Mutation$SetDeviceToken.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    final l$languages = data['languages'];
    result$data['languages'] =
        (l$languages as List<dynamic>).map((e) => (e as String)).toList();
    return Variables$Mutation$SetDeviceToken._(result$data);
  }

  Map<String, dynamic> _$data;

  String get token => (_$data['token'] as String);
  List<String> get languages => (_$data['languages'] as List<String>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$token = token;
    result$data['token'] = l$token;
    final l$languages = languages;
    result$data['languages'] = l$languages.map((e) => e).toList();
    return result$data;
  }

  CopyWith$Variables$Mutation$SetDeviceToken<Variables$Mutation$SetDeviceToken>
      get copyWith => CopyWith$Variables$Mutation$SetDeviceToken(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SetDeviceToken) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$languages = languages;
    final lOther$languages = other.languages;
    if (l$languages.length != lOther$languages.length) {
      return false;
    }
    for (int i = 0; i < l$languages.length; i++) {
      final l$languages$entry = l$languages[i];
      final lOther$languages$entry = lOther$languages[i];
      if (l$languages$entry != lOther$languages$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$languages = languages;
    return Object.hashAll([
      l$token,
      Object.hashAll(l$languages.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SetDeviceToken<TRes> {
  factory CopyWith$Variables$Mutation$SetDeviceToken(
    Variables$Mutation$SetDeviceToken instance,
    TRes Function(Variables$Mutation$SetDeviceToken) then,
  ) = _CopyWithImpl$Variables$Mutation$SetDeviceToken;

  factory CopyWith$Variables$Mutation$SetDeviceToken.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SetDeviceToken;

  TRes call({
    String? token,
    List<String>? languages,
  });
}

class _CopyWithImpl$Variables$Mutation$SetDeviceToken<TRes>
    implements CopyWith$Variables$Mutation$SetDeviceToken<TRes> {
  _CopyWithImpl$Variables$Mutation$SetDeviceToken(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SetDeviceToken _instance;

  final TRes Function(Variables$Mutation$SetDeviceToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? languages = _undefined,
  }) =>
      _then(Variables$Mutation$SetDeviceToken._({
        ..._instance._$data,
        if (token != _undefined && token != null) 'token': (token as String),
        if (languages != _undefined && languages != null)
          'languages': (languages as List<String>),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SetDeviceToken<TRes>
    implements CopyWith$Variables$Mutation$SetDeviceToken<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SetDeviceToken(this._res);

  TRes _res;

  call({
    String? token,
    List<String>? languages,
  }) =>
      _res;
}

class Mutation$SetDeviceToken {
  Mutation$SetDeviceToken({
    this.setDevicePushToken,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$SetDeviceToken.fromJson(Map<String, dynamic> json) {
    final l$setDevicePushToken = json['setDevicePushToken'];
    final l$$__typename = json['__typename'];
    return Mutation$SetDeviceToken(
      setDevicePushToken: l$setDevicePushToken == null
          ? null
          : Mutation$SetDeviceToken$setDevicePushToken.fromJson(
              (l$setDevicePushToken as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SetDeviceToken$setDevicePushToken? setDevicePushToken;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$setDevicePushToken = setDevicePushToken;
    _resultData['setDevicePushToken'] = l$setDevicePushToken?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$setDevicePushToken = setDevicePushToken;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$setDevicePushToken,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SetDeviceToken) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$setDevicePushToken = setDevicePushToken;
    final lOther$setDevicePushToken = other.setDevicePushToken;
    if (l$setDevicePushToken != lOther$setDevicePushToken) {
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

extension UtilityExtension$Mutation$SetDeviceToken on Mutation$SetDeviceToken {
  CopyWith$Mutation$SetDeviceToken<Mutation$SetDeviceToken> get copyWith =>
      CopyWith$Mutation$SetDeviceToken(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SetDeviceToken<TRes> {
  factory CopyWith$Mutation$SetDeviceToken(
    Mutation$SetDeviceToken instance,
    TRes Function(Mutation$SetDeviceToken) then,
  ) = _CopyWithImpl$Mutation$SetDeviceToken;

  factory CopyWith$Mutation$SetDeviceToken.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetDeviceToken;

  TRes call({
    Mutation$SetDeviceToken$setDevicePushToken? setDevicePushToken,
    String? $__typename,
  });
  CopyWith$Mutation$SetDeviceToken$setDevicePushToken<TRes>
      get setDevicePushToken;
}

class _CopyWithImpl$Mutation$SetDeviceToken<TRes>
    implements CopyWith$Mutation$SetDeviceToken<TRes> {
  _CopyWithImpl$Mutation$SetDeviceToken(
    this._instance,
    this._then,
  );

  final Mutation$SetDeviceToken _instance;

  final TRes Function(Mutation$SetDeviceToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? setDevicePushToken = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SetDeviceToken(
        setDevicePushToken: setDevicePushToken == _undefined
            ? _instance.setDevicePushToken
            : (setDevicePushToken
                as Mutation$SetDeviceToken$setDevicePushToken?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$SetDeviceToken$setDevicePushToken<TRes>
      get setDevicePushToken {
    final local$setDevicePushToken = _instance.setDevicePushToken;
    return local$setDevicePushToken == null
        ? CopyWith$Mutation$SetDeviceToken$setDevicePushToken.stub(
            _then(_instance))
        : CopyWith$Mutation$SetDeviceToken$setDevicePushToken(
            local$setDevicePushToken, (e) => call(setDevicePushToken: e));
  }
}

class _CopyWithStubImpl$Mutation$SetDeviceToken<TRes>
    implements CopyWith$Mutation$SetDeviceToken<TRes> {
  _CopyWithStubImpl$Mutation$SetDeviceToken(this._res);

  TRes _res;

  call({
    Mutation$SetDeviceToken$setDevicePushToken? setDevicePushToken,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$SetDeviceToken$setDevicePushToken<TRes>
      get setDevicePushToken =>
          CopyWith$Mutation$SetDeviceToken$setDevicePushToken.stub(_res);
}

const documentNodeMutationSetDeviceToken = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SetDeviceToken'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'token')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'languages')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'setDevicePushToken'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'token'),
            value: VariableNode(name: NameNode(value: 'token')),
          ),
          ArgumentNode(
            name: NameNode(value: 'languages'),
            value: VariableNode(name: NameNode(value: 'languages')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
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
Mutation$SetDeviceToken _parserFn$Mutation$SetDeviceToken(
        Map<String, dynamic> data) =>
    Mutation$SetDeviceToken.fromJson(data);
typedef OnMutationCompleted$Mutation$SetDeviceToken = FutureOr<void> Function(
  dynamic,
  Mutation$SetDeviceToken?,
);

class Options$Mutation$SetDeviceToken
    extends graphql.MutationOptions<Mutation$SetDeviceToken> {
  Options$Mutation$SetDeviceToken({
    String? operationName,
    required Variables$Mutation$SetDeviceToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetDeviceToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetDeviceToken>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SetDeviceToken(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetDeviceToken,
          parserFn: _parserFn$Mutation$SetDeviceToken,
        );

  final OnMutationCompleted$Mutation$SetDeviceToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SetDeviceToken
    extends graphql.WatchQueryOptions<Mutation$SetDeviceToken> {
  WatchOptions$Mutation$SetDeviceToken({
    String? operationName,
    required Variables$Mutation$SetDeviceToken variables,
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
          document: documentNodeMutationSetDeviceToken,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SetDeviceToken,
        );
}

extension ClientExtension$Mutation$SetDeviceToken on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SetDeviceToken>> mutate$SetDeviceToken(
          Options$Mutation$SetDeviceToken options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SetDeviceToken> watchMutation$SetDeviceToken(
          WatchOptions$Mutation$SetDeviceToken options) =>
      this.watchMutation(options);
}

class Mutation$SetDeviceToken$HookResult {
  Mutation$SetDeviceToken$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SetDeviceToken runMutation;

  final graphql.QueryResult<Mutation$SetDeviceToken> result;
}

Mutation$SetDeviceToken$HookResult useMutation$SetDeviceToken(
    [WidgetOptions$Mutation$SetDeviceToken? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SetDeviceToken());
  return Mutation$SetDeviceToken$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SetDeviceToken>
    useWatchMutation$SetDeviceToken(
            WatchOptions$Mutation$SetDeviceToken options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SetDeviceToken
    extends graphql.MutationOptions<Mutation$SetDeviceToken> {
  WidgetOptions$Mutation$SetDeviceToken({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SetDeviceToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$SetDeviceToken>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SetDeviceToken(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSetDeviceToken,
          parserFn: _parserFn$Mutation$SetDeviceToken,
        );

  final OnMutationCompleted$Mutation$SetDeviceToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SetDeviceToken
    = graphql.MultiSourceResult<Mutation$SetDeviceToken> Function(
  Variables$Mutation$SetDeviceToken, {
  Object? optimisticResult,
});
typedef Builder$Mutation$SetDeviceToken = widgets.Widget Function(
  RunMutation$Mutation$SetDeviceToken,
  graphql.QueryResult<Mutation$SetDeviceToken>?,
);

class Mutation$SetDeviceToken$Widget
    extends graphql_flutter.Mutation<Mutation$SetDeviceToken> {
  Mutation$SetDeviceToken$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SetDeviceToken? options,
    required Builder$Mutation$SetDeviceToken builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SetDeviceToken(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult: optimisticResult,
            ),
            result,
          ),
        );
}

class Mutation$SetDeviceToken$setDevicePushToken {
  Mutation$SetDeviceToken$setDevicePushToken({
    this.$__typename = 'Device',
    required this.token,
    required this.updatedAt,
  });

  factory Mutation$SetDeviceToken$setDevicePushToken.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$token = json['token'];
    final l$updatedAt = json['updatedAt'];
    return Mutation$SetDeviceToken$setDevicePushToken(
      $__typename: (l$$__typename as String),
      token: (l$token as String),
      updatedAt: (l$updatedAt as String),
    );
  }

  final String $__typename;

  final String token;

  final String updatedAt;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$token = token;
    _resultData['token'] = l$token;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$token = token;
    final l$updatedAt = updatedAt;
    return Object.hashAll([
      l$$__typename,
      l$token,
      l$updatedAt,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SetDeviceToken$setDevicePushToken) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SetDeviceToken$setDevicePushToken
    on Mutation$SetDeviceToken$setDevicePushToken {
  CopyWith$Mutation$SetDeviceToken$setDevicePushToken<
          Mutation$SetDeviceToken$setDevicePushToken>
      get copyWith => CopyWith$Mutation$SetDeviceToken$setDevicePushToken(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SetDeviceToken$setDevicePushToken<TRes> {
  factory CopyWith$Mutation$SetDeviceToken$setDevicePushToken(
    Mutation$SetDeviceToken$setDevicePushToken instance,
    TRes Function(Mutation$SetDeviceToken$setDevicePushToken) then,
  ) = _CopyWithImpl$Mutation$SetDeviceToken$setDevicePushToken;

  factory CopyWith$Mutation$SetDeviceToken$setDevicePushToken.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SetDeviceToken$setDevicePushToken;

  TRes call({
    String? $__typename,
    String? token,
    String? updatedAt,
  });
}

class _CopyWithImpl$Mutation$SetDeviceToken$setDevicePushToken<TRes>
    implements CopyWith$Mutation$SetDeviceToken$setDevicePushToken<TRes> {
  _CopyWithImpl$Mutation$SetDeviceToken$setDevicePushToken(
    this._instance,
    this._then,
  );

  final Mutation$SetDeviceToken$setDevicePushToken _instance;

  final TRes Function(Mutation$SetDeviceToken$setDevicePushToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $__typename = _undefined,
    Object? token = _undefined,
    Object? updatedAt = _undefined,
  }) =>
      _then(Mutation$SetDeviceToken$setDevicePushToken(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
      ));
}

class _CopyWithStubImpl$Mutation$SetDeviceToken$setDevicePushToken<TRes>
    implements CopyWith$Mutation$SetDeviceToken$setDevicePushToken<TRes> {
  _CopyWithStubImpl$Mutation$SetDeviceToken$setDevicePushToken(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? token,
    String? updatedAt,
  }) =>
      _res;
}
