import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$KidsPage {
  factory Variables$Query$KidsPage({required String code}) =>
      Variables$Query$KidsPage._({
        r'code': code,
      });

  Variables$Query$KidsPage._(this._$data);

  factory Variables$Query$KidsPage.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$code = data['code'];
    result$data['code'] = (l$code as String);
    return Variables$Query$KidsPage._(result$data);
  }

  Map<String, dynamic> _$data;

  String get code => (_$data['code'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$code = code;
    result$data['code'] = l$code;
    return result$data;
  }

  CopyWith$Variables$Query$KidsPage<Variables$Query$KidsPage> get copyWith =>
      CopyWith$Variables$Query$KidsPage(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$KidsPage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$code = code;
    return Object.hashAll([l$code]);
  }
}

abstract class CopyWith$Variables$Query$KidsPage<TRes> {
  factory CopyWith$Variables$Query$KidsPage(
    Variables$Query$KidsPage instance,
    TRes Function(Variables$Query$KidsPage) then,
  ) = _CopyWithImpl$Variables$Query$KidsPage;

  factory CopyWith$Variables$Query$KidsPage.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$KidsPage;

  TRes call({String? code});
}

class _CopyWithImpl$Variables$Query$KidsPage<TRes>
    implements CopyWith$Variables$Query$KidsPage<TRes> {
  _CopyWithImpl$Variables$Query$KidsPage(
    this._instance,
    this._then,
  );

  final Variables$Query$KidsPage _instance;

  final TRes Function(Variables$Query$KidsPage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? code = _undefined}) => _then(Variables$Query$KidsPage._({
        ..._instance._$data,
        if (code != _undefined && code != null) 'code': (code as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$KidsPage<TRes>
    implements CopyWith$Variables$Query$KidsPage<TRes> {
  _CopyWithStubImpl$Variables$Query$KidsPage(this._res);

  TRes _res;

  call({String? code}) => _res;
}

class Query$KidsPage {
  Query$KidsPage({
    required this.page,
    this.$__typename = 'QueryRoot',
  });

  factory Query$KidsPage.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$$__typename = json['__typename'];
    return Query$KidsPage(
      page: Query$KidsPage$page.fromJson((l$page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$KidsPage$page page;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$page,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$KidsPage) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
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

extension UtilityExtension$Query$KidsPage on Query$KidsPage {
  CopyWith$Query$KidsPage<Query$KidsPage> get copyWith =>
      CopyWith$Query$KidsPage(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$KidsPage<TRes> {
  factory CopyWith$Query$KidsPage(
    Query$KidsPage instance,
    TRes Function(Query$KidsPage) then,
  ) = _CopyWithImpl$Query$KidsPage;

  factory CopyWith$Query$KidsPage.stub(TRes res) =
      _CopyWithStubImpl$Query$KidsPage;

  TRes call({
    Query$KidsPage$page? page,
    String? $__typename,
  });
  CopyWith$Query$KidsPage$page<TRes> get page;
}

class _CopyWithImpl$Query$KidsPage<TRes>
    implements CopyWith$Query$KidsPage<TRes> {
  _CopyWithImpl$Query$KidsPage(
    this._instance,
    this._then,
  );

  final Query$KidsPage _instance;

  final TRes Function(Query$KidsPage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsPage(
        page: page == _undefined || page == null
            ? _instance.page
            : (page as Query$KidsPage$page),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$KidsPage$page<TRes> get page {
    final local$page = _instance.page;
    return CopyWith$Query$KidsPage$page(local$page, (e) => call(page: e));
  }
}

class _CopyWithStubImpl$Query$KidsPage<TRes>
    implements CopyWith$Query$KidsPage<TRes> {
  _CopyWithStubImpl$Query$KidsPage(this._res);

  TRes _res;

  call({
    Query$KidsPage$page? page,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$KidsPage$page<TRes> get page =>
      CopyWith$Query$KidsPage$page.stub(_res);
}

const documentNodeQueryKidsPage = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'KidsPage'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'code')),
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
        name: NameNode(value: 'page'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'code'),
            value: VariableNode(name: NameNode(value: 'code')),
          )
        ],
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
            name: NameNode(value: 'sections'),
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
                  InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                      name: NameNode(value: 'CardSection'),
                      isNonNull: false,
                    )),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'items'),
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
                                name: NameNode(value: 'image'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'item'),
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
                                        name: NameNode(value: 'duration'),
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
Query$KidsPage _parserFn$Query$KidsPage(Map<String, dynamic> data) =>
    Query$KidsPage.fromJson(data);
typedef OnQueryComplete$Query$KidsPage = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$KidsPage?,
);

class Options$Query$KidsPage extends graphql.QueryOptions<Query$KidsPage> {
  Options$Query$KidsPage({
    String? operationName,
    required Variables$Query$KidsPage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$KidsPage? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$KidsPage? onComplete,
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
                    data == null ? null : _parserFn$Query$KidsPage(data),
                  ),
          onError: onError,
          document: documentNodeQueryKidsPage,
          parserFn: _parserFn$Query$KidsPage,
        );

  final OnQueryComplete$Query$KidsPage? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$KidsPage
    extends graphql.WatchQueryOptions<Query$KidsPage> {
  WatchOptions$Query$KidsPage({
    String? operationName,
    required Variables$Query$KidsPage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$KidsPage? typedOptimisticResult,
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
          document: documentNodeQueryKidsPage,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$KidsPage,
        );
}

class FetchMoreOptions$Query$KidsPage extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$KidsPage({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$KidsPage variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryKidsPage,
        );
}

extension ClientExtension$Query$KidsPage on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$KidsPage>> query$KidsPage(
          Options$Query$KidsPage options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$KidsPage> watchQuery$KidsPage(
          WatchOptions$Query$KidsPage options) =>
      this.watchQuery(options);
  void writeQuery$KidsPage({
    required Query$KidsPage data,
    required Variables$Query$KidsPage variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryKidsPage),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$KidsPage? readQuery$KidsPage({
    required Variables$Query$KidsPage variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryKidsPage),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$KidsPage.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$KidsPage> useQuery$KidsPage(
        Options$Query$KidsPage options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$KidsPage> useWatchQuery$KidsPage(
        WatchOptions$Query$KidsPage options) =>
    graphql_flutter.useWatchQuery(options);

class Query$KidsPage$Widget extends graphql_flutter.Query<Query$KidsPage> {
  Query$KidsPage$Widget({
    widgets.Key? key,
    required Options$Query$KidsPage options,
    required graphql_flutter.QueryBuilder<Query$KidsPage> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$KidsPage$page {
  Query$KidsPage$page({
    required this.code,
    required this.title,
    this.description,
    required this.sections,
    this.$__typename = 'Page',
  });

  factory Query$KidsPage$page.fromJson(Map<String, dynamic> json) {
    final l$code = json['code'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$sections = json['sections'];
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page(
      code: (l$code as String),
      title: (l$title as String),
      description: (l$description as String?),
      sections: Query$KidsPage$page$sections.fromJson(
          (l$sections as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String code;

  final String title;

  final String? description;

  final Query$KidsPage$page$sections sections;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$sections = sections;
    _resultData['sections'] = l$sections.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$title = title;
    final l$description = description;
    final l$sections = sections;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$title,
      l$description,
      l$sections,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$KidsPage$page) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
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
    final l$sections = sections;
    final lOther$sections = other.sections;
    if (l$sections != lOther$sections) {
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

extension UtilityExtension$Query$KidsPage$page on Query$KidsPage$page {
  CopyWith$Query$KidsPage$page<Query$KidsPage$page> get copyWith =>
      CopyWith$Query$KidsPage$page(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$KidsPage$page<TRes> {
  factory CopyWith$Query$KidsPage$page(
    Query$KidsPage$page instance,
    TRes Function(Query$KidsPage$page) then,
  ) = _CopyWithImpl$Query$KidsPage$page;

  factory CopyWith$Query$KidsPage$page.stub(TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page;

  TRes call({
    String? code,
    String? title,
    String? description,
    Query$KidsPage$page$sections? sections,
    String? $__typename,
  });
  CopyWith$Query$KidsPage$page$sections<TRes> get sections;
}

class _CopyWithImpl$Query$KidsPage$page<TRes>
    implements CopyWith$Query$KidsPage$page<TRes> {
  _CopyWithImpl$Query$KidsPage$page(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page _instance;

  final TRes Function(Query$KidsPage$page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? sections = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsPage$page(
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        sections: sections == _undefined || sections == null
            ? _instance.sections
            : (sections as Query$KidsPage$page$sections),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$KidsPage$page$sections<TRes> get sections {
    final local$sections = _instance.sections;
    return CopyWith$Query$KidsPage$page$sections(
        local$sections, (e) => call(sections: e));
  }
}

class _CopyWithStubImpl$Query$KidsPage$page<TRes>
    implements CopyWith$Query$KidsPage$page<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page(this._res);

  TRes _res;

  call({
    String? code,
    String? title,
    String? description,
    Query$KidsPage$page$sections? sections,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$KidsPage$page$sections<TRes> get sections =>
      CopyWith$Query$KidsPage$page$sections.stub(_res);
}

class Query$KidsPage$page$sections {
  Query$KidsPage$page$sections({
    required this.items,
    this.$__typename = 'SectionPagination',
  });

  factory Query$KidsPage$page$sections.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections(
      items: (l$items as List<dynamic>)
          .map((e) => Query$KidsPage$page$sections$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$KidsPage$page$sections$items> items;

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
    if (!(other is Query$KidsPage$page$sections) ||
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

extension UtilityExtension$Query$KidsPage$page$sections
    on Query$KidsPage$page$sections {
  CopyWith$Query$KidsPage$page$sections<Query$KidsPage$page$sections>
      get copyWith => CopyWith$Query$KidsPage$page$sections(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections<TRes> {
  factory CopyWith$Query$KidsPage$page$sections(
    Query$KidsPage$page$sections instance,
    TRes Function(Query$KidsPage$page$sections) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections;

  factory CopyWith$Query$KidsPage$page$sections.stub(TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections;

  TRes call({
    List<Query$KidsPage$page$sections$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$KidsPage$page$sections$items> Function(
              Iterable<
                  CopyWith$Query$KidsPage$page$sections$items<
                      Query$KidsPage$page$sections$items>>)
          _fn);
}

class _CopyWithImpl$Query$KidsPage$page$sections<TRes>
    implements CopyWith$Query$KidsPage$page$sections<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections _instance;

  final TRes Function(Query$KidsPage$page$sections) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsPage$page$sections(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$KidsPage$page$sections$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Query$KidsPage$page$sections$items> Function(
                  Iterable<
                      CopyWith$Query$KidsPage$page$sections$items<
                          Query$KidsPage$page$sections$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Query$KidsPage$page$sections$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$KidsPage$page$sections<TRes>
    implements CopyWith$Query$KidsPage$page$sections<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections(this._res);

  TRes _res;

  call({
    List<Query$KidsPage$page$sections$items>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}

class Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items({required this.$__typename});

  factory Query$KidsPage$page$sections$items.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "CardSection":
        return Query$KidsPage$page$sections$items$$CardSection.fromJson(json);

      case "PosterSection":
        return Query$KidsPage$page$sections$items$$PosterSection.fromJson(json);

      case "FeaturedSection":
        return Query$KidsPage$page$sections$items$$FeaturedSection.fromJson(
            json);

      case "DefaultSection":
        return Query$KidsPage$page$sections$items$$DefaultSection.fromJson(
            json);

      case "ListSection":
        return Query$KidsPage$page$sections$items$$ListSection.fromJson(json);

      case "CardListSection":
        return Query$KidsPage$page$sections$items$$CardListSection.fromJson(
            json);

      case "DefaultGridSection":
        return Query$KidsPage$page$sections$items$$DefaultGridSection.fromJson(
            json);

      case "PosterGridSection":
        return Query$KidsPage$page$sections$items$$PosterGridSection.fromJson(
            json);

      case "IconGridSection":
        return Query$KidsPage$page$sections$items$$IconGridSection.fromJson(
            json);

      case "IconSection":
        return Query$KidsPage$page$sections$items$$IconSection.fromJson(json);

      case "LabelSection":
        return Query$KidsPage$page$sections$items$$LabelSection.fromJson(json);

      case "MessageSection":
        return Query$KidsPage$page$sections$items$$MessageSection.fromJson(
            json);

      case "WebSection":
        return Query$KidsPage$page$sections$items$$WebSection.fromJson(json);

      case "AchievementSection":
        return Query$KidsPage$page$sections$items$$AchievementSection.fromJson(
            json);

      case "PageDetailsSection":
        return Query$KidsPage$page$sections$items$$PageDetailsSection.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Query$KidsPage$page$sections$items(
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
    if (!(other is Query$KidsPage$page$sections$items) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items
    on Query$KidsPage$page$sections$items {
  CopyWith$Query$KidsPage$page$sections$items<
          Query$KidsPage$page$sections$items>
      get copyWith => CopyWith$Query$KidsPage$page$sections$items(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(Query$KidsPage$page$sections$items$$CardSection)
        cardSection,
    required _T Function(Query$KidsPage$page$sections$items$$PosterSection)
        posterSection,
    required _T Function(Query$KidsPage$page$sections$items$$FeaturedSection)
        featuredSection,
    required _T Function(Query$KidsPage$page$sections$items$$DefaultSection)
        defaultSection,
    required _T Function(Query$KidsPage$page$sections$items$$ListSection)
        listSection,
    required _T Function(Query$KidsPage$page$sections$items$$CardListSection)
        cardListSection,
    required _T Function(Query$KidsPage$page$sections$items$$DefaultGridSection)
        defaultGridSection,
    required _T Function(Query$KidsPage$page$sections$items$$PosterGridSection)
        posterGridSection,
    required _T Function(Query$KidsPage$page$sections$items$$IconGridSection)
        iconGridSection,
    required _T Function(Query$KidsPage$page$sections$items$$IconSection)
        iconSection,
    required _T Function(Query$KidsPage$page$sections$items$$LabelSection)
        labelSection,
    required _T Function(Query$KidsPage$page$sections$items$$MessageSection)
        messageSection,
    required _T Function(Query$KidsPage$page$sections$items$$WebSection)
        webSection,
    required _T Function(Query$KidsPage$page$sections$items$$AchievementSection)
        achievementSection,
    required _T Function(Query$KidsPage$page$sections$items$$PageDetailsSection)
        pageDetailsSection,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "CardSection":
        return cardSection(
            this as Query$KidsPage$page$sections$items$$CardSection);

      case "PosterSection":
        return posterSection(
            this as Query$KidsPage$page$sections$items$$PosterSection);

      case "FeaturedSection":
        return featuredSection(
            this as Query$KidsPage$page$sections$items$$FeaturedSection);

      case "DefaultSection":
        return defaultSection(
            this as Query$KidsPage$page$sections$items$$DefaultSection);

      case "ListSection":
        return listSection(
            this as Query$KidsPage$page$sections$items$$ListSection);

      case "CardListSection":
        return cardListSection(
            this as Query$KidsPage$page$sections$items$$CardListSection);

      case "DefaultGridSection":
        return defaultGridSection(
            this as Query$KidsPage$page$sections$items$$DefaultGridSection);

      case "PosterGridSection":
        return posterGridSection(
            this as Query$KidsPage$page$sections$items$$PosterGridSection);

      case "IconGridSection":
        return iconGridSection(
            this as Query$KidsPage$page$sections$items$$IconGridSection);

      case "IconSection":
        return iconSection(
            this as Query$KidsPage$page$sections$items$$IconSection);

      case "LabelSection":
        return labelSection(
            this as Query$KidsPage$page$sections$items$$LabelSection);

      case "MessageSection":
        return messageSection(
            this as Query$KidsPage$page$sections$items$$MessageSection);

      case "WebSection":
        return webSection(
            this as Query$KidsPage$page$sections$items$$WebSection);

      case "AchievementSection":
        return achievementSection(
            this as Query$KidsPage$page$sections$items$$AchievementSection);

      case "PageDetailsSection":
        return pageDetailsSection(
            this as Query$KidsPage$page$sections$items$$PageDetailsSection);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$KidsPage$page$sections$items$$CardSection)? cardSection,
    _T Function(Query$KidsPage$page$sections$items$$PosterSection)?
        posterSection,
    _T Function(Query$KidsPage$page$sections$items$$FeaturedSection)?
        featuredSection,
    _T Function(Query$KidsPage$page$sections$items$$DefaultSection)?
        defaultSection,
    _T Function(Query$KidsPage$page$sections$items$$ListSection)? listSection,
    _T Function(Query$KidsPage$page$sections$items$$CardListSection)?
        cardListSection,
    _T Function(Query$KidsPage$page$sections$items$$DefaultGridSection)?
        defaultGridSection,
    _T Function(Query$KidsPage$page$sections$items$$PosterGridSection)?
        posterGridSection,
    _T Function(Query$KidsPage$page$sections$items$$IconGridSection)?
        iconGridSection,
    _T Function(Query$KidsPage$page$sections$items$$IconSection)? iconSection,
    _T Function(Query$KidsPage$page$sections$items$$LabelSection)? labelSection,
    _T Function(Query$KidsPage$page$sections$items$$MessageSection)?
        messageSection,
    _T Function(Query$KidsPage$page$sections$items$$WebSection)? webSection,
    _T Function(Query$KidsPage$page$sections$items$$AchievementSection)?
        achievementSection,
    _T Function(Query$KidsPage$page$sections$items$$PageDetailsSection)?
        pageDetailsSection,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "CardSection":
        if (cardSection != null) {
          return cardSection(
              this as Query$KidsPage$page$sections$items$$CardSection);
        } else {
          return orElse();
        }

      case "PosterSection":
        if (posterSection != null) {
          return posterSection(
              this as Query$KidsPage$page$sections$items$$PosterSection);
        } else {
          return orElse();
        }

      case "FeaturedSection":
        if (featuredSection != null) {
          return featuredSection(
              this as Query$KidsPage$page$sections$items$$FeaturedSection);
        } else {
          return orElse();
        }

      case "DefaultSection":
        if (defaultSection != null) {
          return defaultSection(
              this as Query$KidsPage$page$sections$items$$DefaultSection);
        } else {
          return orElse();
        }

      case "ListSection":
        if (listSection != null) {
          return listSection(
              this as Query$KidsPage$page$sections$items$$ListSection);
        } else {
          return orElse();
        }

      case "CardListSection":
        if (cardListSection != null) {
          return cardListSection(
              this as Query$KidsPage$page$sections$items$$CardListSection);
        } else {
          return orElse();
        }

      case "DefaultGridSection":
        if (defaultGridSection != null) {
          return defaultGridSection(
              this as Query$KidsPage$page$sections$items$$DefaultGridSection);
        } else {
          return orElse();
        }

      case "PosterGridSection":
        if (posterGridSection != null) {
          return posterGridSection(
              this as Query$KidsPage$page$sections$items$$PosterGridSection);
        } else {
          return orElse();
        }

      case "IconGridSection":
        if (iconGridSection != null) {
          return iconGridSection(
              this as Query$KidsPage$page$sections$items$$IconGridSection);
        } else {
          return orElse();
        }

      case "IconSection":
        if (iconSection != null) {
          return iconSection(
              this as Query$KidsPage$page$sections$items$$IconSection);
        } else {
          return orElse();
        }

      case "LabelSection":
        if (labelSection != null) {
          return labelSection(
              this as Query$KidsPage$page$sections$items$$LabelSection);
        } else {
          return orElse();
        }

      case "MessageSection":
        if (messageSection != null) {
          return messageSection(
              this as Query$KidsPage$page$sections$items$$MessageSection);
        } else {
          return orElse();
        }

      case "WebSection":
        if (webSection != null) {
          return webSection(
              this as Query$KidsPage$page$sections$items$$WebSection);
        } else {
          return orElse();
        }

      case "AchievementSection":
        if (achievementSection != null) {
          return achievementSection(
              this as Query$KidsPage$page$sections$items$$AchievementSection);
        } else {
          return orElse();
        }

      case "PageDetailsSection":
        if (pageDetailsSection != null) {
          return pageDetailsSection(
              this as Query$KidsPage$page$sections$items$$PageDetailsSection);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$KidsPage$page$sections$items<TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items(
    Query$KidsPage$page$sections$items instance,
    TRes Function(Query$KidsPage$page$sections$items) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items;

  factory CopyWith$Query$KidsPage$page$sections$items.stub(TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items _instance;

  final TRes Function(Query$KidsPage$page$sections$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$CardSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$CardSection({
    required this.items,
    this.$__typename = 'CardSection',
  });

  factory Query$KidsPage$page$sections$items$$CardSection.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection(
      items: Query$KidsPage$page$sections$items$$CardSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$KidsPage$page$sections$items$$CardSection$items items;

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
    if (!(other is Query$KidsPage$page$sections$items$$CardSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection
    on Query$KidsPage$page$sections$items$$CardSection {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection<
          Query$KidsPage$page$sections$items$$CardSection>
      get copyWith => CopyWith$Query$KidsPage$page$sections$items$$CardSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection<TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection(
    Query$KidsPage$page$sections$items$$CardSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$CardSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection;

  TRes call({
    Query$KidsPage$page$sections$items$$CardSection$items? items,
    String? $__typename,
  });
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$CardSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$CardSection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsPage$page$sections$items$$CardSection(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Query$KidsPage$page$sections$items$$CardSection$items),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$KidsPage$page$sections$items$$CardSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$CardSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection(this._res);

  TRes _res;

  call({
    Query$KidsPage$page$sections$items$$CardSection$items? items,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items<TRes>
      get items =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items.stub(
              _res);
}

class Query$KidsPage$page$sections$items$$CardSection$items {
  Query$KidsPage$page$sections$items$$CardSection$items({
    required this.items,
    this.$__typename = 'SectionItemPagination',
  });

  factory Query$KidsPage$page$sections$items$$CardSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$KidsPage$page$sections$items$$CardSection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$KidsPage$page$sections$items$$CardSection$items$items> items;

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
    if (!(other is Query$KidsPage$page$sections$items$$CardSection$items) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items
    on Query$KidsPage$page$sections$items$$CardSection$items {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items<
          Query$KidsPage$page$sections$items$$CardSection$items>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items(
    Query$KidsPage$page$sections$items$$CardSection$items instance,
    TRes Function(Query$KidsPage$page$sections$items$$CardSection$items) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items;

  TRes call({
    List<Query$KidsPage$page$sections$items$$CardSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$KidsPage$page$sections$items$$CardSection$items$items> Function(
              Iterable<
                  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items<
                      Query$KidsPage$page$sections$items$$CardSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$CardSection$items)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsPage$page$sections$items$$CardSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$KidsPage$page$sections$items$$CardSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes items(
          Iterable<Query$KidsPage$page$sections$items$$CardSection$items$items> Function(
                  Iterable<
                      CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items<
                          Query$KidsPage$page$sections$items$$CardSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items(
      this._res);

  TRes _res;

  call({
    List<Query$KidsPage$page$sections$items$$CardSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;

  items(_fn) => _res;
}

class Query$KidsPage$page$sections$items$$CardSection$items$items {
  Query$KidsPage$page$sections$items$$CardSection$items$items({
    required this.title,
    required this.description,
    this.image,
    required this.item,
    this.$__typename = 'SectionItem',
  });

  factory Query$KidsPage$page$sections$items$$CardSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$description = json['description'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items$items(
      title: (l$title as String),
      description: (l$description as String),
      image: (l$image as String?),
      item: Query$KidsPage$page$sections$items$$CardSection$items$items$item
          .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String description;

  final String? image;

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$description = description;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$description,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items) ||
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
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items
    on Query$KidsPage$page$sections$items$$CardSection$items$items {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items<
          Query$KidsPage$page$sections$items$$CardSection$items$items>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items(
    Query$KidsPage$page$sections$items$$CardSection$items$items instance,
    TRes Function(Query$KidsPage$page$sections$items$$CardSection$items$items)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items;

  TRes call({
    String? title,
    String? description,
    String? image,
    Query$KidsPage$page$sections$items$$CardSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items _instance;

  final TRes Function(
      Query$KidsPage$page$sections$items$$CardSection$items$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? description = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$KidsPage$page$sections$items$$CardSection$items$items(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$KidsPage$page$sections$items$$CardSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items(
      this._res);

  TRes _res;

  call({
    String? title,
    String? description,
    String? image,
    Query$KidsPage$page$sections$items$$CardSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item
              .stub(_res);
}

class Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  Query$KidsPage$page$sections$items$$CardSection$items$items$item(
      {required this.$__typename});

  factory Query$KidsPage$page$sections$items$$CardSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Episode":
        return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show
            .fromJson(json);

      case "Season":
        return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season
            .fromJson(json);

      case "Page":
        return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page
            .fromJson(json);

      case "Link":
        return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link
            .fromJson(json);

      case "StudyTopic":
        return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic
            .fromJson(json);

      case "Game":
        return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game
            .fromJson(json);

      case "Playlist":
        return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$KidsPage$page$sections$items$$CardSection$items$items$item(
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
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items$item) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items$item
    on Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item<
          Query$KidsPage$page$sections$items$$CardSection$items$items$item>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode)
        episode,
    required _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show)
        show,
    required _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season)
        season,
    required _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page)
        page,
    required _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link)
        link,
    required _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic)
        studyTopic,
    required _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game)
        game,
    required _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist)
        playlist,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        return episode(this
            as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode);

      case "Show":
        return show(this
            as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show);

      case "Season":
        return season(this
            as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season);

      case "Page":
        return page(this
            as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page);

      case "Link":
        return link(this
            as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link);

      case "StudyTopic":
        return studyTopic(this
            as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic);

      case "Game":
        return game(this
            as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game);

      case "Playlist":
        return playlist(this
            as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode)?
        episode,
    _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show)?
        show,
    _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season)?
        season,
    _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page)?
        page,
    _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link)?
        link,
    _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic)?
        studyTopic,
    _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game)?
        game,
    _T Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist)?
        playlist,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        if (episode != null) {
          return episode(this
              as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode);
        } else {
          return orElse();
        }

      case "Show":
        if (show != null) {
          return show(this
              as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show);
        } else {
          return orElse();
        }

      case "Season":
        if (season != null) {
          return season(this
              as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season);
        } else {
          return orElse();
        }

      case "Page":
        if (page != null) {
          return page(this
              as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page);
        } else {
          return orElse();
        }

      case "Link":
        if (link != null) {
          return link(this
              as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link);
        } else {
          return orElse();
        }

      case "StudyTopic":
        if (studyTopic != null) {
          return studyTopic(this
              as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic);
        } else {
          return orElse();
        }

      case "Game":
        if (game != null) {
          return game(this
              as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game);
        } else {
          return orElse();
        }

      case "Playlist":
        if (playlist != null) {
          return playlist(this
              as Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item(
    Query$KidsPage$page$sections$items$$CardSection$items$items$item instance,
    TRes Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item
      _instance;

  final TRes Function(
      Query$KidsPage$page$sections$items$$CardSection$items$items$item) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$CardSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode
    implements
        Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode({
    required this.duration,
    this.$__typename = 'Episode',
  });

  factory Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$duration = json['duration'];
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode(
      duration: (l$duration as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int duration;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$duration = duration;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$duration,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode
    on Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode<
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode(
    Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode;

  TRes call({
    int? duration,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? duration = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode(
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    int? duration,
    String? $__typename,
  }) =>
      _res;
}

class Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show
    implements
        Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show(
      {this.$__typename = 'Show'});

  factory Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show(
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
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show
    on Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show<
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show(
    Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show
        instance,
    TRes Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season
    implements
        Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season(
      {this.$__typename = 'Season'});

  factory Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season(
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
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season
    on Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season<
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season(
    Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season
        instance,
    TRes Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season
      _instance;

  final TRes Function(
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Season(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page
    implements
        Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page(
      {this.$__typename = 'Page'});

  factory Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page(
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
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page
    on Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page<
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page(
    Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page
        instance,
    TRes Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link
    implements
        Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link(
      {this.$__typename = 'Link'});

  factory Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link(
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
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link
    on Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link<
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link(
    Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link
        instance,
    TRes Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic
    implements
        Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic(
      {this.$__typename = 'StudyTopic'});

  factory Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic(
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
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic
    on Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic<
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic(
    Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic
        instance,
    TRes Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic
      _instance;

  final TRes Function(
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$StudyTopic(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game
    implements
        Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game(
      {this.$__typename = 'Game'});

  factory Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game(
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
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game
    on Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game<
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game(
    Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game
        instance,
    TRes Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game
      _instance;

  final TRes Function(
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Game(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist
    implements
        Query$KidsPage$page$sections$items$$CardSection$items$items$item {
  Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist(
      {this.$__typename = 'Playlist'});

  factory Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist(
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
    if (!(other
            is Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist
    on Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist {
  CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist<
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist(
    Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist
        instance,
    TRes Function(
            Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist)
        then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist<
            TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist
      _instance;

  final TRes Function(
          Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist<
            TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardSection$items$items$item$$Playlist(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$PosterSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$PosterSection(
      {this.$__typename = 'PosterSection'});

  factory Query$KidsPage$page$sections$items$$PosterSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$PosterSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$PosterSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$PosterSection
    on Query$KidsPage$page$sections$items$$PosterSection {
  CopyWith$Query$KidsPage$page$sections$items$$PosterSection<
          Query$KidsPage$page$sections$items$$PosterSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$PosterSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$PosterSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$PosterSection(
    Query$KidsPage$page$sections$items$$PosterSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$PosterSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$PosterSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$PosterSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$PosterSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$PosterSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$PosterSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$PosterSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$PosterSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$PosterSection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$PosterSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$PosterSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$PosterSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$PosterSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$FeaturedSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$FeaturedSection(
      {this.$__typename = 'FeaturedSection'});

  factory Query$KidsPage$page$sections$items$$FeaturedSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$FeaturedSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$FeaturedSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$FeaturedSection
    on Query$KidsPage$page$sections$items$$FeaturedSection {
  CopyWith$Query$KidsPage$page$sections$items$$FeaturedSection<
          Query$KidsPage$page$sections$items$$FeaturedSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$FeaturedSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$FeaturedSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$FeaturedSection(
    Query$KidsPage$page$sections$items$$FeaturedSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$FeaturedSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$FeaturedSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$FeaturedSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$FeaturedSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$FeaturedSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$FeaturedSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$FeaturedSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$FeaturedSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$FeaturedSection)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$FeaturedSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$FeaturedSection<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$FeaturedSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$FeaturedSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$DefaultSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$DefaultSection(
      {this.$__typename = 'DefaultSection'});

  factory Query$KidsPage$page$sections$items$$DefaultSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$DefaultSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$DefaultSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$DefaultSection
    on Query$KidsPage$page$sections$items$$DefaultSection {
  CopyWith$Query$KidsPage$page$sections$items$$DefaultSection<
          Query$KidsPage$page$sections$items$$DefaultSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$DefaultSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$DefaultSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$DefaultSection(
    Query$KidsPage$page$sections$items$$DefaultSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$DefaultSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$DefaultSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$DefaultSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$DefaultSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$DefaultSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$DefaultSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$DefaultSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$DefaultSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$DefaultSection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$DefaultSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$DefaultSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$DefaultSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$DefaultSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$ListSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$ListSection(
      {this.$__typename = 'ListSection'});

  factory Query$KidsPage$page$sections$items$$ListSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$ListSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$ListSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$ListSection
    on Query$KidsPage$page$sections$items$$ListSection {
  CopyWith$Query$KidsPage$page$sections$items$$ListSection<
          Query$KidsPage$page$sections$items$$ListSection>
      get copyWith => CopyWith$Query$KidsPage$page$sections$items$$ListSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$ListSection<TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$ListSection(
    Query$KidsPage$page$sections$items$$ListSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$ListSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$ListSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$ListSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$ListSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$ListSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$ListSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$ListSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$ListSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$ListSection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$ListSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$ListSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$ListSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$ListSection(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$CardListSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$CardListSection(
      {this.$__typename = 'CardListSection'});

  factory Query$KidsPage$page$sections$items$$CardListSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$CardListSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$CardListSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$CardListSection
    on Query$KidsPage$page$sections$items$$CardListSection {
  CopyWith$Query$KidsPage$page$sections$items$$CardListSection<
          Query$KidsPage$page$sections$items$$CardListSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$CardListSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$CardListSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$CardListSection(
    Query$KidsPage$page$sections$items$$CardListSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$CardListSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$CardListSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$CardListSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardListSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$CardListSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardListSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$CardListSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$CardListSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$CardListSection)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$CardListSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardListSection<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$CardListSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$CardListSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$DefaultGridSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$DefaultGridSection(
      {this.$__typename = 'DefaultGridSection'});

  factory Query$KidsPage$page$sections$items$$DefaultGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$DefaultGridSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$DefaultGridSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$DefaultGridSection
    on Query$KidsPage$page$sections$items$$DefaultGridSection {
  CopyWith$Query$KidsPage$page$sections$items$$DefaultGridSection<
          Query$KidsPage$page$sections$items$$DefaultGridSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$DefaultGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$DefaultGridSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$DefaultGridSection(
    Query$KidsPage$page$sections$items$$DefaultGridSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$DefaultGridSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$DefaultGridSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$DefaultGridSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$DefaultGridSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$DefaultGridSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$DefaultGridSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$DefaultGridSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$DefaultGridSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$DefaultGridSection)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$DefaultGridSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$DefaultGridSection<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$DefaultGridSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$DefaultGridSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$PosterGridSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$PosterGridSection(
      {this.$__typename = 'PosterGridSection'});

  factory Query$KidsPage$page$sections$items$$PosterGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$PosterGridSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$PosterGridSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$PosterGridSection
    on Query$KidsPage$page$sections$items$$PosterGridSection {
  CopyWith$Query$KidsPage$page$sections$items$$PosterGridSection<
          Query$KidsPage$page$sections$items$$PosterGridSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$PosterGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$PosterGridSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$PosterGridSection(
    Query$KidsPage$page$sections$items$$PosterGridSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$PosterGridSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$PosterGridSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$PosterGridSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$PosterGridSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$PosterGridSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$PosterGridSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$PosterGridSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$PosterGridSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$PosterGridSection)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$PosterGridSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$PosterGridSection<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$PosterGridSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$PosterGridSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$IconGridSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$IconGridSection(
      {this.$__typename = 'IconGridSection'});

  factory Query$KidsPage$page$sections$items$$IconGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$IconGridSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$IconGridSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$IconGridSection
    on Query$KidsPage$page$sections$items$$IconGridSection {
  CopyWith$Query$KidsPage$page$sections$items$$IconGridSection<
          Query$KidsPage$page$sections$items$$IconGridSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$IconGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$IconGridSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$IconGridSection(
    Query$KidsPage$page$sections$items$$IconGridSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$IconGridSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$IconGridSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$IconGridSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$IconGridSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$IconGridSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$IconGridSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$IconGridSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$IconGridSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$IconGridSection)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$IconGridSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$IconGridSection<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$IconGridSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$IconGridSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$IconSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$IconSection(
      {this.$__typename = 'IconSection'});

  factory Query$KidsPage$page$sections$items$$IconSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$IconSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$IconSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$IconSection
    on Query$KidsPage$page$sections$items$$IconSection {
  CopyWith$Query$KidsPage$page$sections$items$$IconSection<
          Query$KidsPage$page$sections$items$$IconSection>
      get copyWith => CopyWith$Query$KidsPage$page$sections$items$$IconSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$IconSection<TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$IconSection(
    Query$KidsPage$page$sections$items$$IconSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$IconSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$IconSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$IconSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$IconSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$IconSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$IconSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$IconSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$IconSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$IconSection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$IconSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$IconSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$IconSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$IconSection(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$LabelSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$LabelSection(
      {this.$__typename = 'LabelSection'});

  factory Query$KidsPage$page$sections$items$$LabelSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$LabelSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$LabelSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$LabelSection
    on Query$KidsPage$page$sections$items$$LabelSection {
  CopyWith$Query$KidsPage$page$sections$items$$LabelSection<
          Query$KidsPage$page$sections$items$$LabelSection>
      get copyWith => CopyWith$Query$KidsPage$page$sections$items$$LabelSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$LabelSection<TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$LabelSection(
    Query$KidsPage$page$sections$items$$LabelSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$LabelSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$LabelSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$LabelSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$LabelSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$LabelSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$LabelSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$LabelSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$LabelSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$LabelSection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$LabelSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$LabelSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$LabelSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$LabelSection(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$MessageSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$MessageSection(
      {this.$__typename = 'MessageSection'});

  factory Query$KidsPage$page$sections$items$$MessageSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$MessageSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$MessageSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$MessageSection
    on Query$KidsPage$page$sections$items$$MessageSection {
  CopyWith$Query$KidsPage$page$sections$items$$MessageSection<
          Query$KidsPage$page$sections$items$$MessageSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$MessageSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$MessageSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$MessageSection(
    Query$KidsPage$page$sections$items$$MessageSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$MessageSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$MessageSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$MessageSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$MessageSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$MessageSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$MessageSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$MessageSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$MessageSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$MessageSection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$MessageSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$MessageSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$MessageSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$MessageSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$WebSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$WebSection(
      {this.$__typename = 'WebSection'});

  factory Query$KidsPage$page$sections$items$$WebSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$WebSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$WebSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$WebSection
    on Query$KidsPage$page$sections$items$$WebSection {
  CopyWith$Query$KidsPage$page$sections$items$$WebSection<
          Query$KidsPage$page$sections$items$$WebSection>
      get copyWith => CopyWith$Query$KidsPage$page$sections$items$$WebSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$WebSection<TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$WebSection(
    Query$KidsPage$page$sections$items$$WebSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$WebSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$WebSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$WebSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$WebSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$WebSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$WebSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$WebSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$WebSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$WebSection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$WebSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$WebSection<TRes>
    implements CopyWith$Query$KidsPage$page$sections$items$$WebSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$WebSection(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$AchievementSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$AchievementSection(
      {this.$__typename = 'AchievementSection'});

  factory Query$KidsPage$page$sections$items$$AchievementSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$AchievementSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$AchievementSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$AchievementSection
    on Query$KidsPage$page$sections$items$$AchievementSection {
  CopyWith$Query$KidsPage$page$sections$items$$AchievementSection<
          Query$KidsPage$page$sections$items$$AchievementSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$AchievementSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$AchievementSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$AchievementSection(
    Query$KidsPage$page$sections$items$$AchievementSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$AchievementSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$AchievementSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$AchievementSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$AchievementSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$AchievementSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$AchievementSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$AchievementSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$AchievementSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$AchievementSection)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$AchievementSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$AchievementSection<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$AchievementSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$AchievementSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$KidsPage$page$sections$items$$PageDetailsSection
    implements Query$KidsPage$page$sections$items {
  Query$KidsPage$page$sections$items$$PageDetailsSection(
      {this.$__typename = 'PageDetailsSection'});

  factory Query$KidsPage$page$sections$items$$PageDetailsSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$KidsPage$page$sections$items$$PageDetailsSection(
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
    if (!(other is Query$KidsPage$page$sections$items$$PageDetailsSection) ||
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

extension UtilityExtension$Query$KidsPage$page$sections$items$$PageDetailsSection
    on Query$KidsPage$page$sections$items$$PageDetailsSection {
  CopyWith$Query$KidsPage$page$sections$items$$PageDetailsSection<
          Query$KidsPage$page$sections$items$$PageDetailsSection>
      get copyWith =>
          CopyWith$Query$KidsPage$page$sections$items$$PageDetailsSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$KidsPage$page$sections$items$$PageDetailsSection<
    TRes> {
  factory CopyWith$Query$KidsPage$page$sections$items$$PageDetailsSection(
    Query$KidsPage$page$sections$items$$PageDetailsSection instance,
    TRes Function(Query$KidsPage$page$sections$items$$PageDetailsSection) then,
  ) = _CopyWithImpl$Query$KidsPage$page$sections$items$$PageDetailsSection;

  factory CopyWith$Query$KidsPage$page$sections$items$$PageDetailsSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$KidsPage$page$sections$items$$PageDetailsSection;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$KidsPage$page$sections$items$$PageDetailsSection<TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$PageDetailsSection<TRes> {
  _CopyWithImpl$Query$KidsPage$page$sections$items$$PageDetailsSection(
    this._instance,
    this._then,
  );

  final Query$KidsPage$page$sections$items$$PageDetailsSection _instance;

  final TRes Function(Query$KidsPage$page$sections$items$$PageDetailsSection)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$KidsPage$page$sections$items$$PageDetailsSection(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$KidsPage$page$sections$items$$PageDetailsSection<
        TRes>
    implements
        CopyWith$Query$KidsPage$page$sections$items$$PageDetailsSection<TRes> {
  _CopyWithStubImpl$Query$KidsPage$page$sections$items$$PageDetailsSection(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}
