import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetRedirectUrl {
  factory Variables$Query$GetRedirectUrl({required String id}) =>
      Variables$Query$GetRedirectUrl._({
        r'id': id,
      });

  Variables$Query$GetRedirectUrl._(this._$data);

  factory Variables$Query$GetRedirectUrl.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetRedirectUrl._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetRedirectUrl<Variables$Query$GetRedirectUrl>
      get copyWith => CopyWith$Variables$Query$GetRedirectUrl(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetRedirectUrl) ||
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

abstract class CopyWith$Variables$Query$GetRedirectUrl<TRes> {
  factory CopyWith$Variables$Query$GetRedirectUrl(
    Variables$Query$GetRedirectUrl instance,
    TRes Function(Variables$Query$GetRedirectUrl) then,
  ) = _CopyWithImpl$Variables$Query$GetRedirectUrl;

  factory CopyWith$Variables$Query$GetRedirectUrl.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetRedirectUrl;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetRedirectUrl<TRes>
    implements CopyWith$Variables$Query$GetRedirectUrl<TRes> {
  _CopyWithImpl$Variables$Query$GetRedirectUrl(
    this._instance,
    this._then,
  );

  final Variables$Query$GetRedirectUrl _instance;

  final TRes Function(Variables$Query$GetRedirectUrl) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetRedirectUrl._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetRedirectUrl<TRes>
    implements CopyWith$Variables$Query$GetRedirectUrl<TRes> {
  _CopyWithStubImpl$Variables$Query$GetRedirectUrl(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetRedirectUrl {
  Query$GetRedirectUrl({
    required this.redirect,
    required this.$__typename,
  });

  factory Query$GetRedirectUrl.fromJson(Map<String, dynamic> json) {
    final l$redirect = json['redirect'];
    final l$$__typename = json['__typename'];
    return Query$GetRedirectUrl(
      redirect: Query$GetRedirectUrl$redirect.fromJson(
          (l$redirect as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRedirectUrl$redirect redirect;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$redirect = redirect;
    _resultData['redirect'] = l$redirect.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$redirect = redirect;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$redirect,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRedirectUrl) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$redirect = redirect;
    final lOther$redirect = other.redirect;
    if (l$redirect != lOther$redirect) {
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

extension UtilityExtension$Query$GetRedirectUrl on Query$GetRedirectUrl {
  CopyWith$Query$GetRedirectUrl<Query$GetRedirectUrl> get copyWith =>
      CopyWith$Query$GetRedirectUrl(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRedirectUrl<TRes> {
  factory CopyWith$Query$GetRedirectUrl(
    Query$GetRedirectUrl instance,
    TRes Function(Query$GetRedirectUrl) then,
  ) = _CopyWithImpl$Query$GetRedirectUrl;

  factory CopyWith$Query$GetRedirectUrl.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRedirectUrl;

  TRes call({
    Query$GetRedirectUrl$redirect? redirect,
    String? $__typename,
  });
  CopyWith$Query$GetRedirectUrl$redirect<TRes> get redirect;
}

class _CopyWithImpl$Query$GetRedirectUrl<TRes>
    implements CopyWith$Query$GetRedirectUrl<TRes> {
  _CopyWithImpl$Query$GetRedirectUrl(
    this._instance,
    this._then,
  );

  final Query$GetRedirectUrl _instance;

  final TRes Function(Query$GetRedirectUrl) _then;

  static const _undefined = {};

  TRes call({
    Object? redirect = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRedirectUrl(
        redirect: redirect == _undefined || redirect == null
            ? _instance.redirect
            : (redirect as Query$GetRedirectUrl$redirect),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetRedirectUrl$redirect<TRes> get redirect {
    final local$redirect = _instance.redirect;
    return CopyWith$Query$GetRedirectUrl$redirect(
        local$redirect, (e) => call(redirect: e));
  }
}

class _CopyWithStubImpl$Query$GetRedirectUrl<TRes>
    implements CopyWith$Query$GetRedirectUrl<TRes> {
  _CopyWithStubImpl$Query$GetRedirectUrl(this._res);

  TRes _res;

  call({
    Query$GetRedirectUrl$redirect? redirect,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetRedirectUrl$redirect<TRes> get redirect =>
      CopyWith$Query$GetRedirectUrl$redirect.stub(_res);
}

const documentNodeQueryGetRedirectUrl = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetRedirectUrl'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'redirect'),
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
Query$GetRedirectUrl _parserFn$Query$GetRedirectUrl(
        Map<String, dynamic> data) =>
    Query$GetRedirectUrl.fromJson(data);

class Options$Query$GetRedirectUrl
    extends graphql.QueryOptions<Query$GetRedirectUrl> {
  Options$Query$GetRedirectUrl({
    String? operationName,
    required Variables$Query$GetRedirectUrl variables,
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
          document: documentNodeQueryGetRedirectUrl,
          parserFn: _parserFn$Query$GetRedirectUrl,
        );
}

class WatchOptions$Query$GetRedirectUrl
    extends graphql.WatchQueryOptions<Query$GetRedirectUrl> {
  WatchOptions$Query$GetRedirectUrl({
    String? operationName,
    required Variables$Query$GetRedirectUrl variables,
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
          document: documentNodeQueryGetRedirectUrl,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetRedirectUrl,
        );
}

class FetchMoreOptions$Query$GetRedirectUrl extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetRedirectUrl({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetRedirectUrl variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetRedirectUrl,
        );
}

extension ClientExtension$Query$GetRedirectUrl on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetRedirectUrl>> query$GetRedirectUrl(
          Options$Query$GetRedirectUrl options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetRedirectUrl> watchQuery$GetRedirectUrl(
          WatchOptions$Query$GetRedirectUrl options) =>
      this.watchQuery(options);
  void writeQuery$GetRedirectUrl({
    required Query$GetRedirectUrl data,
    required Variables$Query$GetRedirectUrl variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetRedirectUrl),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetRedirectUrl? readQuery$GetRedirectUrl({
    required Variables$Query$GetRedirectUrl variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetRedirectUrl),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetRedirectUrl.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetRedirectUrl> useQuery$GetRedirectUrl(
        Options$Query$GetRedirectUrl options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetRedirectUrl> useWatchQuery$GetRedirectUrl(
        WatchOptions$Query$GetRedirectUrl options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetRedirectUrl$Widget
    extends graphql_flutter.Query<Query$GetRedirectUrl> {
  Query$GetRedirectUrl$Widget({
    widgets.Key? key,
    required Options$Query$GetRedirectUrl options,
    required graphql_flutter.QueryBuilder<Query$GetRedirectUrl> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetRedirectUrl$redirect {
  Query$GetRedirectUrl$redirect({
    required this.url,
    required this.$__typename,
  });

  factory Query$GetRedirectUrl$redirect.fromJson(Map<String, dynamic> json) {
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$GetRedirectUrl$redirect(
      url: (l$url as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetRedirectUrl$redirect) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetRedirectUrl$redirect
    on Query$GetRedirectUrl$redirect {
  CopyWith$Query$GetRedirectUrl$redirect<Query$GetRedirectUrl$redirect>
      get copyWith => CopyWith$Query$GetRedirectUrl$redirect(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetRedirectUrl$redirect<TRes> {
  factory CopyWith$Query$GetRedirectUrl$redirect(
    Query$GetRedirectUrl$redirect instance,
    TRes Function(Query$GetRedirectUrl$redirect) then,
  ) = _CopyWithImpl$Query$GetRedirectUrl$redirect;

  factory CopyWith$Query$GetRedirectUrl$redirect.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRedirectUrl$redirect;

  TRes call({
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetRedirectUrl$redirect<TRes>
    implements CopyWith$Query$GetRedirectUrl$redirect<TRes> {
  _CopyWithImpl$Query$GetRedirectUrl$redirect(
    this._instance,
    this._then,
  );

  final Query$GetRedirectUrl$redirect _instance;

  final TRes Function(Query$GetRedirectUrl$redirect) _then;

  static const _undefined = {};

  TRes call({
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetRedirectUrl$redirect(
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetRedirectUrl$redirect<TRes>
    implements CopyWith$Query$GetRedirectUrl$redirect<TRes> {
  _CopyWithStubImpl$Query$GetRedirectUrl$redirect(this._res);

  TRes _res;

  call({
    String? url,
    String? $__typename,
  }) =>
      _res;
}
