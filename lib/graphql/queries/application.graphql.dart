import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$Application {
  Query$Application({
    required this.application,
    this.$__typename = 'QueryRoot',
  });

  factory Query$Application.fromJson(Map<String, dynamic> json) {
    final l$application = json['application'];
    final l$$__typename = json['__typename'];
    return Query$Application(
      application: Query$Application$application.fromJson(
          (l$application as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Application$application application;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$application = application;
    _resultData['application'] = l$application.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$application = application;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$application,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Application) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$application = application;
    final lOther$application = other.application;
    if (l$application != lOther$application) {
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

extension UtilityExtension$Query$Application on Query$Application {
  CopyWith$Query$Application<Query$Application> get copyWith =>
      CopyWith$Query$Application(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Application<TRes> {
  factory CopyWith$Query$Application(
    Query$Application instance,
    TRes Function(Query$Application) then,
  ) = _CopyWithImpl$Query$Application;

  factory CopyWith$Query$Application.stub(TRes res) =
      _CopyWithStubImpl$Query$Application;

  TRes call({
    Query$Application$application? application,
    String? $__typename,
  });
  CopyWith$Query$Application$application<TRes> get application;
}

class _CopyWithImpl$Query$Application<TRes>
    implements CopyWith$Query$Application<TRes> {
  _CopyWithImpl$Query$Application(
    this._instance,
    this._then,
  );

  final Query$Application _instance;

  final TRes Function(Query$Application) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? application = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Application(
        application: application == _undefined || application == null
            ? _instance.application
            : (application as Query$Application$application),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Application$application<TRes> get application {
    final local$application = _instance.application;
    return CopyWith$Query$Application$application(
        local$application, (e) => call(application: e));
  }
}

class _CopyWithStubImpl$Query$Application<TRes>
    implements CopyWith$Query$Application<TRes> {
  _CopyWithStubImpl$Query$Application(this._res);

  TRes _res;

  call({
    Query$Application$application? application,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Application$application<TRes> get application =>
      CopyWith$Query$Application$application.stub(_res);
}

const documentNodeQueryApplication = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Application'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'application'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'clientVersion'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'page'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'code'),
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
            name: NameNode(value: 'searchPage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'code'),
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
            name: NameNode(value: 'gamesPage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'code'),
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
]);
Query$Application _parserFn$Query$Application(Map<String, dynamic> data) =>
    Query$Application.fromJson(data);
typedef OnQueryComplete$Query$Application = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Application?,
);

class Options$Query$Application
    extends graphql.QueryOptions<Query$Application> {
  Options$Query$Application({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Application? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Application? onComplete,
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
                    data == null ? null : _parserFn$Query$Application(data),
                  ),
          onError: onError,
          document: documentNodeQueryApplication,
          parserFn: _parserFn$Query$Application,
        );

  final OnQueryComplete$Query$Application? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Application
    extends graphql.WatchQueryOptions<Query$Application> {
  WatchOptions$Query$Application({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Application? typedOptimisticResult,
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
          document: documentNodeQueryApplication,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Application,
        );
}

class FetchMoreOptions$Query$Application extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Application({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryApplication,
        );
}

extension ClientExtension$Query$Application on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Application>> query$Application(
          [Options$Query$Application? options]) async =>
      await this.query(options ?? Options$Query$Application());
  graphql.ObservableQuery<Query$Application> watchQuery$Application(
          [WatchOptions$Query$Application? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Application());
  void writeQuery$Application({
    required Query$Application data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryApplication)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Application? readQuery$Application({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryApplication)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Application.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Application> useQuery$Application(
        [Options$Query$Application? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Application());
graphql.ObservableQuery<Query$Application> useWatchQuery$Application(
        [WatchOptions$Query$Application? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Application());

class Query$Application$Widget
    extends graphql_flutter.Query<Query$Application> {
  Query$Application$Widget({
    widgets.Key? key,
    Options$Query$Application? options,
    required graphql_flutter.QueryBuilder<Query$Application> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$Application(),
          builder: builder,
        );
}

class Query$Application$application {
  Query$Application$application({
    required this.clientVersion,
    this.page,
    this.searchPage,
    this.gamesPage,
    this.$__typename = 'Application',
  });

  factory Query$Application$application.fromJson(Map<String, dynamic> json) {
    final l$clientVersion = json['clientVersion'];
    final l$page = json['page'];
    final l$searchPage = json['searchPage'];
    final l$gamesPage = json['gamesPage'];
    final l$$__typename = json['__typename'];
    return Query$Application$application(
      clientVersion: (l$clientVersion as String),
      page: l$page == null
          ? null
          : Query$Application$application$page.fromJson(
              (l$page as Map<String, dynamic>)),
      searchPage: l$searchPage == null
          ? null
          : Query$Application$application$searchPage.fromJson(
              (l$searchPage as Map<String, dynamic>)),
      gamesPage: l$gamesPage == null
          ? null
          : Query$Application$application$gamesPage.fromJson(
              (l$gamesPage as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String clientVersion;

  final Query$Application$application$page? page;

  final Query$Application$application$searchPage? searchPage;

  final Query$Application$application$gamesPage? gamesPage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$clientVersion = clientVersion;
    _resultData['clientVersion'] = l$clientVersion;
    final l$page = page;
    _resultData['page'] = l$page?.toJson();
    final l$searchPage = searchPage;
    _resultData['searchPage'] = l$searchPage?.toJson();
    final l$gamesPage = gamesPage;
    _resultData['gamesPage'] = l$gamesPage?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$clientVersion = clientVersion;
    final l$page = page;
    final l$searchPage = searchPage;
    final l$gamesPage = gamesPage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$clientVersion,
      l$page,
      l$searchPage,
      l$gamesPage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Application$application) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$clientVersion = clientVersion;
    final lOther$clientVersion = other.clientVersion;
    if (l$clientVersion != lOther$clientVersion) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$searchPage = searchPage;
    final lOther$searchPage = other.searchPage;
    if (l$searchPage != lOther$searchPage) {
      return false;
    }
    final l$gamesPage = gamesPage;
    final lOther$gamesPage = other.gamesPage;
    if (l$gamesPage != lOther$gamesPage) {
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

extension UtilityExtension$Query$Application$application
    on Query$Application$application {
  CopyWith$Query$Application$application<Query$Application$application>
      get copyWith => CopyWith$Query$Application$application(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Application$application<TRes> {
  factory CopyWith$Query$Application$application(
    Query$Application$application instance,
    TRes Function(Query$Application$application) then,
  ) = _CopyWithImpl$Query$Application$application;

  factory CopyWith$Query$Application$application.stub(TRes res) =
      _CopyWithStubImpl$Query$Application$application;

  TRes call({
    String? clientVersion,
    Query$Application$application$page? page,
    Query$Application$application$searchPage? searchPage,
    Query$Application$application$gamesPage? gamesPage,
    String? $__typename,
  });
  CopyWith$Query$Application$application$page<TRes> get page;
  CopyWith$Query$Application$application$searchPage<TRes> get searchPage;
  CopyWith$Query$Application$application$gamesPage<TRes> get gamesPage;
}

class _CopyWithImpl$Query$Application$application<TRes>
    implements CopyWith$Query$Application$application<TRes> {
  _CopyWithImpl$Query$Application$application(
    this._instance,
    this._then,
  );

  final Query$Application$application _instance;

  final TRes Function(Query$Application$application) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? clientVersion = _undefined,
    Object? page = _undefined,
    Object? searchPage = _undefined,
    Object? gamesPage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Application$application(
        clientVersion: clientVersion == _undefined || clientVersion == null
            ? _instance.clientVersion
            : (clientVersion as String),
        page: page == _undefined
            ? _instance.page
            : (page as Query$Application$application$page?),
        searchPage: searchPage == _undefined
            ? _instance.searchPage
            : (searchPage as Query$Application$application$searchPage?),
        gamesPage: gamesPage == _undefined
            ? _instance.gamesPage
            : (gamesPage as Query$Application$application$gamesPage?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Application$application$page<TRes> get page {
    final local$page = _instance.page;
    return local$page == null
        ? CopyWith$Query$Application$application$page.stub(_then(_instance))
        : CopyWith$Query$Application$application$page(
            local$page, (e) => call(page: e));
  }

  CopyWith$Query$Application$application$searchPage<TRes> get searchPage {
    final local$searchPage = _instance.searchPage;
    return local$searchPage == null
        ? CopyWith$Query$Application$application$searchPage.stub(
            _then(_instance))
        : CopyWith$Query$Application$application$searchPage(
            local$searchPage, (e) => call(searchPage: e));
  }

  CopyWith$Query$Application$application$gamesPage<TRes> get gamesPage {
    final local$gamesPage = _instance.gamesPage;
    return local$gamesPage == null
        ? CopyWith$Query$Application$application$gamesPage.stub(
            _then(_instance))
        : CopyWith$Query$Application$application$gamesPage(
            local$gamesPage, (e) => call(gamesPage: e));
  }
}

class _CopyWithStubImpl$Query$Application$application<TRes>
    implements CopyWith$Query$Application$application<TRes> {
  _CopyWithStubImpl$Query$Application$application(this._res);

  TRes _res;

  call({
    String? clientVersion,
    Query$Application$application$page? page,
    Query$Application$application$searchPage? searchPage,
    Query$Application$application$gamesPage? gamesPage,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Application$application$page<TRes> get page =>
      CopyWith$Query$Application$application$page.stub(_res);
  CopyWith$Query$Application$application$searchPage<TRes> get searchPage =>
      CopyWith$Query$Application$application$searchPage.stub(_res);
  CopyWith$Query$Application$application$gamesPage<TRes> get gamesPage =>
      CopyWith$Query$Application$application$gamesPage.stub(_res);
}

class Query$Application$application$page {
  Query$Application$application$page({
    required this.code,
    this.$__typename = 'Page',
  });

  factory Query$Application$application$page.fromJson(
      Map<String, dynamic> json) {
    final l$code = json['code'];
    final l$$__typename = json['__typename'];
    return Query$Application$application$page(
      code: (l$code as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String code;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Application$application$page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
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

extension UtilityExtension$Query$Application$application$page
    on Query$Application$application$page {
  CopyWith$Query$Application$application$page<
          Query$Application$application$page>
      get copyWith => CopyWith$Query$Application$application$page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Application$application$page<TRes> {
  factory CopyWith$Query$Application$application$page(
    Query$Application$application$page instance,
    TRes Function(Query$Application$application$page) then,
  ) = _CopyWithImpl$Query$Application$application$page;

  factory CopyWith$Query$Application$application$page.stub(TRes res) =
      _CopyWithStubImpl$Query$Application$application$page;

  TRes call({
    String? code,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Application$application$page<TRes>
    implements CopyWith$Query$Application$application$page<TRes> {
  _CopyWithImpl$Query$Application$application$page(
    this._instance,
    this._then,
  );

  final Query$Application$application$page _instance;

  final TRes Function(Query$Application$application$page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Application$application$page(
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Application$application$page<TRes>
    implements CopyWith$Query$Application$application$page<TRes> {
  _CopyWithStubImpl$Query$Application$application$page(this._res);

  TRes _res;

  call({
    String? code,
    String? $__typename,
  }) =>
      _res;
}

class Query$Application$application$searchPage {
  Query$Application$application$searchPage({
    required this.code,
    this.$__typename = 'Page',
  });

  factory Query$Application$application$searchPage.fromJson(
      Map<String, dynamic> json) {
    final l$code = json['code'];
    final l$$__typename = json['__typename'];
    return Query$Application$application$searchPage(
      code: (l$code as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String code;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Application$application$searchPage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
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

extension UtilityExtension$Query$Application$application$searchPage
    on Query$Application$application$searchPage {
  CopyWith$Query$Application$application$searchPage<
          Query$Application$application$searchPage>
      get copyWith => CopyWith$Query$Application$application$searchPage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Application$application$searchPage<TRes> {
  factory CopyWith$Query$Application$application$searchPage(
    Query$Application$application$searchPage instance,
    TRes Function(Query$Application$application$searchPage) then,
  ) = _CopyWithImpl$Query$Application$application$searchPage;

  factory CopyWith$Query$Application$application$searchPage.stub(TRes res) =
      _CopyWithStubImpl$Query$Application$application$searchPage;

  TRes call({
    String? code,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Application$application$searchPage<TRes>
    implements CopyWith$Query$Application$application$searchPage<TRes> {
  _CopyWithImpl$Query$Application$application$searchPage(
    this._instance,
    this._then,
  );

  final Query$Application$application$searchPage _instance;

  final TRes Function(Query$Application$application$searchPage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Application$application$searchPage(
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Application$application$searchPage<TRes>
    implements CopyWith$Query$Application$application$searchPage<TRes> {
  _CopyWithStubImpl$Query$Application$application$searchPage(this._res);

  TRes _res;

  call({
    String? code,
    String? $__typename,
  }) =>
      _res;
}

class Query$Application$application$gamesPage {
  Query$Application$application$gamesPage({
    required this.code,
    this.$__typename = 'Page',
  });

  factory Query$Application$application$gamesPage.fromJson(
      Map<String, dynamic> json) {
    final l$code = json['code'];
    final l$$__typename = json['__typename'];
    return Query$Application$application$gamesPage(
      code: (l$code as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String code;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Application$application$gamesPage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
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

extension UtilityExtension$Query$Application$application$gamesPage
    on Query$Application$application$gamesPage {
  CopyWith$Query$Application$application$gamesPage<
          Query$Application$application$gamesPage>
      get copyWith => CopyWith$Query$Application$application$gamesPage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Application$application$gamesPage<TRes> {
  factory CopyWith$Query$Application$application$gamesPage(
    Query$Application$application$gamesPage instance,
    TRes Function(Query$Application$application$gamesPage) then,
  ) = _CopyWithImpl$Query$Application$application$gamesPage;

  factory CopyWith$Query$Application$application$gamesPage.stub(TRes res) =
      _CopyWithStubImpl$Query$Application$application$gamesPage;

  TRes call({
    String? code,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Application$application$gamesPage<TRes>
    implements CopyWith$Query$Application$application$gamesPage<TRes> {
  _CopyWithImpl$Query$Application$application$gamesPage(
    this._instance,
    this._then,
  );

  final Query$Application$application$gamesPage _instance;

  final TRes Function(Query$Application$application$gamesPage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Application$application$gamesPage(
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Application$application$gamesPage<TRes>
    implements CopyWith$Query$Application$application$gamesPage<TRes> {
  _CopyWithStubImpl$Query$Application$application$gamesPage(this._res);

  TRes _res;

  call({
    String? code,
    String? $__typename,
  }) =>
      _res;
}
