import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$getAchievementGroups {
  Query$getAchievementGroups({
    required this.achievementGroups,
    required this.$__typename,
  });

  factory Query$getAchievementGroups.fromJson(Map<String, dynamic> json) {
    final l$achievementGroups = json['achievementGroups'];
    final l$$__typename = json['__typename'];
    return Query$getAchievementGroups(
      achievementGroups: Query$getAchievementGroups$achievementGroups.fromJson(
          (l$achievementGroups as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getAchievementGroups$achievementGroups achievementGroups;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$achievementGroups = achievementGroups;
    _resultData['achievementGroups'] = l$achievementGroups.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$achievementGroups = achievementGroups;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$achievementGroups,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getAchievementGroups) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$achievementGroups = achievementGroups;
    final lOther$achievementGroups = other.achievementGroups;
    if (l$achievementGroups != lOther$achievementGroups) {
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

extension UtilityExtension$Query$getAchievementGroups
    on Query$getAchievementGroups {
  CopyWith$Query$getAchievementGroups<Query$getAchievementGroups>
      get copyWith => CopyWith$Query$getAchievementGroups(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getAchievementGroups<TRes> {
  factory CopyWith$Query$getAchievementGroups(
    Query$getAchievementGroups instance,
    TRes Function(Query$getAchievementGroups) then,
  ) = _CopyWithImpl$Query$getAchievementGroups;

  factory CopyWith$Query$getAchievementGroups.stub(TRes res) =
      _CopyWithStubImpl$Query$getAchievementGroups;

  TRes call({
    Query$getAchievementGroups$achievementGroups? achievementGroups,
    String? $__typename,
  });
  CopyWith$Query$getAchievementGroups$achievementGroups<TRes>
      get achievementGroups;
}

class _CopyWithImpl$Query$getAchievementGroups<TRes>
    implements CopyWith$Query$getAchievementGroups<TRes> {
  _CopyWithImpl$Query$getAchievementGroups(
    this._instance,
    this._then,
  );

  final Query$getAchievementGroups _instance;

  final TRes Function(Query$getAchievementGroups) _then;

  static const _undefined = {};

  TRes call({
    Object? achievementGroups = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAchievementGroups(
        achievementGroups:
            achievementGroups == _undefined || achievementGroups == null
                ? _instance.achievementGroups
                : (achievementGroups
                    as Query$getAchievementGroups$achievementGroups),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getAchievementGroups$achievementGroups<TRes>
      get achievementGroups {
    final local$achievementGroups = _instance.achievementGroups;
    return CopyWith$Query$getAchievementGroups$achievementGroups(
        local$achievementGroups, (e) => call(achievementGroups: e));
  }
}

class _CopyWithStubImpl$Query$getAchievementGroups<TRes>
    implements CopyWith$Query$getAchievementGroups<TRes> {
  _CopyWithStubImpl$Query$getAchievementGroups(this._res);

  TRes _res;

  call({
    Query$getAchievementGroups$achievementGroups? achievementGroups,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getAchievementGroups$achievementGroups<TRes>
      get achievementGroups =>
          CopyWith$Query$getAchievementGroups$achievementGroups.stub(_res);
}

const documentNodeQuerygetAchievementGroups = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getAchievementGroups'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'achievementGroups'),
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
                name: NameNode(value: 'achievements'),
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
                        name: NameNode(value: 'image'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'achieved'),
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
]);
Query$getAchievementGroups _parserFn$Query$getAchievementGroups(
        Map<String, dynamic> data) =>
    Query$getAchievementGroups.fromJson(data);

class Options$Query$getAchievementGroups
    extends graphql.QueryOptions<Query$getAchievementGroups> {
  Options$Query$getAchievementGroups({
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
          document: documentNodeQuerygetAchievementGroups,
          parserFn: _parserFn$Query$getAchievementGroups,
        );
}

class WatchOptions$Query$getAchievementGroups
    extends graphql.WatchQueryOptions<Query$getAchievementGroups> {
  WatchOptions$Query$getAchievementGroups({
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
          document: documentNodeQuerygetAchievementGroups,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getAchievementGroups,
        );
}

class FetchMoreOptions$Query$getAchievementGroups
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getAchievementGroups(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetAchievementGroups,
        );
}

extension ClientExtension$Query$getAchievementGroups on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getAchievementGroups>>
      query$getAchievementGroups(
              [Options$Query$getAchievementGroups? options]) async =>
          await this.query(options ?? Options$Query$getAchievementGroups());
  graphql.ObservableQuery<Query$getAchievementGroups>
      watchQuery$getAchievementGroups(
              [WatchOptions$Query$getAchievementGroups? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$getAchievementGroups());
  void writeQuery$getAchievementGroups({
    required Query$getAchievementGroups data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerygetAchievementGroups)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getAchievementGroups? readQuery$getAchievementGroups(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetAchievementGroups)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getAchievementGroups.fromJson(result);
  }
}

graphql_flutter
    .QueryHookResult<Query$getAchievementGroups> useQuery$getAchievementGroups(
        [Options$Query$getAchievementGroups? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$getAchievementGroups());
graphql.ObservableQuery<Query$getAchievementGroups>
    useWatchQuery$getAchievementGroups(
            [WatchOptions$Query$getAchievementGroups? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$getAchievementGroups());

class Query$getAchievementGroups$Widget
    extends graphql_flutter.Query<Query$getAchievementGroups> {
  Query$getAchievementGroups$Widget({
    widgets.Key? key,
    Options$Query$getAchievementGroups? options,
    required graphql_flutter.QueryBuilder<Query$getAchievementGroups> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getAchievementGroups(),
          builder: builder,
        );
}

class Query$getAchievementGroups$achievementGroups {
  Query$getAchievementGroups$achievementGroups({
    required this.items,
    required this.$__typename,
  });

  factory Query$getAchievementGroups$achievementGroups.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getAchievementGroups$achievementGroups(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$getAchievementGroups$achievementGroups$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getAchievementGroups$achievementGroups$items> items;

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
    if (!(other is Query$getAchievementGroups$achievementGroups) ||
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

extension UtilityExtension$Query$getAchievementGroups$achievementGroups
    on Query$getAchievementGroups$achievementGroups {
  CopyWith$Query$getAchievementGroups$achievementGroups<
          Query$getAchievementGroups$achievementGroups>
      get copyWith => CopyWith$Query$getAchievementGroups$achievementGroups(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getAchievementGroups$achievementGroups<TRes> {
  factory CopyWith$Query$getAchievementGroups$achievementGroups(
    Query$getAchievementGroups$achievementGroups instance,
    TRes Function(Query$getAchievementGroups$achievementGroups) then,
  ) = _CopyWithImpl$Query$getAchievementGroups$achievementGroups;

  factory CopyWith$Query$getAchievementGroups$achievementGroups.stub(TRes res) =
      _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups;

  TRes call({
    List<Query$getAchievementGroups$achievementGroups$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$getAchievementGroups$achievementGroups$items> Function(
              Iterable<
                  CopyWith$Query$getAchievementGroups$achievementGroups$items<
                      Query$getAchievementGroups$achievementGroups$items>>)
          _fn);
}

class _CopyWithImpl$Query$getAchievementGroups$achievementGroups<TRes>
    implements CopyWith$Query$getAchievementGroups$achievementGroups<TRes> {
  _CopyWithImpl$Query$getAchievementGroups$achievementGroups(
    this._instance,
    this._then,
  );

  final Query$getAchievementGroups$achievementGroups _instance;

  final TRes Function(Query$getAchievementGroups$achievementGroups) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAchievementGroups$achievementGroups(
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as List<Query$getAchievementGroups$achievementGroups$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$getAchievementGroups$achievementGroups$items> Function(
                  Iterable<
                      CopyWith$Query$getAchievementGroups$achievementGroups$items<
                          Query$getAchievementGroups$achievementGroups$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$getAchievementGroups$achievementGroups$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups<TRes>
    implements CopyWith$Query$getAchievementGroups$achievementGroups<TRes> {
  _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups(this._res);

  TRes _res;

  call({
    List<Query$getAchievementGroups$achievementGroups$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$getAchievementGroups$achievementGroups$items {
  Query$getAchievementGroups$achievementGroups$items({
    required this.title,
    required this.achievements,
    required this.$__typename,
  });

  factory Query$getAchievementGroups$achievementGroups$items.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$achievements = json['achievements'];
    final l$$__typename = json['__typename'];
    return Query$getAchievementGroups$achievementGroups$items(
      title: (l$title as String),
      achievements:
          Query$getAchievementGroups$achievementGroups$items$achievements
              .fromJson((l$achievements as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final Query$getAchievementGroups$achievementGroups$items$achievements
      achievements;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$achievements = achievements;
    _resultData['achievements'] = l$achievements.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$achievements = achievements;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$achievements,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getAchievementGroups$achievementGroups$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$achievements = achievements;
    final lOther$achievements = other.achievements;
    if (l$achievements != lOther$achievements) {
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

extension UtilityExtension$Query$getAchievementGroups$achievementGroups$items
    on Query$getAchievementGroups$achievementGroups$items {
  CopyWith$Query$getAchievementGroups$achievementGroups$items<
          Query$getAchievementGroups$achievementGroups$items>
      get copyWith =>
          CopyWith$Query$getAchievementGroups$achievementGroups$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getAchievementGroups$achievementGroups$items<
    TRes> {
  factory CopyWith$Query$getAchievementGroups$achievementGroups$items(
    Query$getAchievementGroups$achievementGroups$items instance,
    TRes Function(Query$getAchievementGroups$achievementGroups$items) then,
  ) = _CopyWithImpl$Query$getAchievementGroups$achievementGroups$items;

  factory CopyWith$Query$getAchievementGroups$achievementGroups$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups$items;

  TRes call({
    String? title,
    Query$getAchievementGroups$achievementGroups$items$achievements?
        achievements,
    String? $__typename,
  });
  CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements<TRes>
      get achievements;
}

class _CopyWithImpl$Query$getAchievementGroups$achievementGroups$items<TRes>
    implements
        CopyWith$Query$getAchievementGroups$achievementGroups$items<TRes> {
  _CopyWithImpl$Query$getAchievementGroups$achievementGroups$items(
    this._instance,
    this._then,
  );

  final Query$getAchievementGroups$achievementGroups$items _instance;

  final TRes Function(Query$getAchievementGroups$achievementGroups$items) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? achievements = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAchievementGroups$achievementGroups$items(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        achievements: achievements == _undefined || achievements == null
            ? _instance.achievements
            : (achievements
                as Query$getAchievementGroups$achievementGroups$items$achievements),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements<TRes>
      get achievements {
    final local$achievements = _instance.achievements;
    return CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements(
        local$achievements, (e) => call(achievements: e));
  }
}

class _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups$items<TRes>
    implements
        CopyWith$Query$getAchievementGroups$achievementGroups$items<TRes> {
  _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups$items(
      this._res);

  TRes _res;

  call({
    String? title,
    Query$getAchievementGroups$achievementGroups$items$achievements?
        achievements,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements<TRes>
      get achievements =>
          CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements
              .stub(_res);
}

class Query$getAchievementGroups$achievementGroups$items$achievements {
  Query$getAchievementGroups$achievementGroups$items$achievements({
    required this.items,
    required this.$__typename,
  });

  factory Query$getAchievementGroups$achievementGroups$items$achievements.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getAchievementGroups$achievementGroups$items$achievements(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$getAchievementGroups$achievementGroups$items$achievements$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$getAchievementGroups$achievementGroups$items$achievements$items>
      items;

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
    if (!(other
            is Query$getAchievementGroups$achievementGroups$items$achievements) ||
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

extension UtilityExtension$Query$getAchievementGroups$achievementGroups$items$achievements
    on Query$getAchievementGroups$achievementGroups$items$achievements {
  CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements<
          Query$getAchievementGroups$achievementGroups$items$achievements>
      get copyWith =>
          CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements<
    TRes> {
  factory CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements(
    Query$getAchievementGroups$achievementGroups$items$achievements instance,
    TRes Function(
            Query$getAchievementGroups$achievementGroups$items$achievements)
        then,
  ) = _CopyWithImpl$Query$getAchievementGroups$achievementGroups$items$achievements;

  factory CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups$items$achievements;

  TRes call({
    List<Query$getAchievementGroups$achievementGroups$items$achievements$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$getAchievementGroups$achievementGroups$items$achievements$items> Function(
              Iterable<
                  CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items<
                      Query$getAchievementGroups$achievementGroups$items$achievements$items>>)
          _fn);
}

class _CopyWithImpl$Query$getAchievementGroups$achievementGroups$items$achievements<
        TRes>
    implements
        CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements<
            TRes> {
  _CopyWithImpl$Query$getAchievementGroups$achievementGroups$items$achievements(
    this._instance,
    this._then,
  );

  final Query$getAchievementGroups$achievementGroups$items$achievements
      _instance;

  final TRes Function(
      Query$getAchievementGroups$achievementGroups$items$achievements) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAchievementGroups$achievementGroups$items$achievements(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$getAchievementGroups$achievementGroups$items$achievements$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$getAchievementGroups$achievementGroups$items$achievements$items> Function(
                  Iterable<
                      CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items<
                          Query$getAchievementGroups$achievementGroups$items$achievements$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups$items$achievements<
        TRes>
    implements
        CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements<
            TRes> {
  _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups$items$achievements(
      this._res);

  TRes _res;

  call({
    List<Query$getAchievementGroups$achievementGroups$items$achievements$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$getAchievementGroups$achievementGroups$items$achievements$items {
  Query$getAchievementGroups$achievementGroups$items$achievements$items({
    required this.title,
    this.image,
    required this.achieved,
    required this.$__typename,
  });

  factory Query$getAchievementGroups$achievementGroups$items$achievements$items.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$image = json['image'];
    final l$achieved = json['achieved'];
    final l$$__typename = json['__typename'];
    return Query$getAchievementGroups$achievementGroups$items$achievements$items(
      title: (l$title as String),
      image: (l$image as String?),
      achieved: (l$achieved as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String? image;

  final bool achieved;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$achieved = achieved;
    _resultData['achieved'] = l$achieved;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$image = image;
    final l$achieved = achieved;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$image,
      l$achieved,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getAchievementGroups$achievementGroups$items$achievements$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$achieved = achieved;
    final lOther$achieved = other.achieved;
    if (l$achieved != lOther$achieved) {
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

extension UtilityExtension$Query$getAchievementGroups$achievementGroups$items$achievements$items
    on Query$getAchievementGroups$achievementGroups$items$achievements$items {
  CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items<
          Query$getAchievementGroups$achievementGroups$items$achievements$items>
      get copyWith =>
          CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items<
    TRes> {
  factory CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items(
    Query$getAchievementGroups$achievementGroups$items$achievements$items
        instance,
    TRes Function(
            Query$getAchievementGroups$achievementGroups$items$achievements$items)
        then,
  ) = _CopyWithImpl$Query$getAchievementGroups$achievementGroups$items$achievements$items;

  factory CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups$items$achievements$items;

  TRes call({
    String? title,
    String? image,
    bool? achieved,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getAchievementGroups$achievementGroups$items$achievements$items<
        TRes>
    implements
        CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items<
            TRes> {
  _CopyWithImpl$Query$getAchievementGroups$achievementGroups$items$achievements$items(
    this._instance,
    this._then,
  );

  final Query$getAchievementGroups$achievementGroups$items$achievements$items
      _instance;

  final TRes Function(
          Query$getAchievementGroups$achievementGroups$items$achievements$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? image = _undefined,
    Object? achieved = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getAchievementGroups$achievementGroups$items$achievements$items(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        achieved: achieved == _undefined || achieved == null
            ? _instance.achieved
            : (achieved as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups$items$achievements$items<
        TRes>
    implements
        CopyWith$Query$getAchievementGroups$achievementGroups$items$achievements$items<
            TRes> {
  _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups$items$achievements$items(
      this._res);

  TRes _res;

  call({
    String? title,
    String? image,
    bool? achieved,
    String? $__typename,
  }) =>
      _res;
}

class Query$getPendingAchievements {
  Query$getPendingAchievements({
    required this.pendingAchievements,
    required this.$__typename,
  });

  factory Query$getPendingAchievements.fromJson(Map<String, dynamic> json) {
    final l$pendingAchievements = json['pendingAchievements'];
    final l$$__typename = json['__typename'];
    return Query$getPendingAchievements(
      pendingAchievements: (l$pendingAchievements as List<dynamic>)
          .map((e) => Query$getPendingAchievements$pendingAchievements.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getPendingAchievements$pendingAchievements>
      pendingAchievements;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pendingAchievements = pendingAchievements;
    _resultData['pendingAchievements'] =
        l$pendingAchievements.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pendingAchievements = pendingAchievements;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$pendingAchievements.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getPendingAchievements) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pendingAchievements = pendingAchievements;
    final lOther$pendingAchievements = other.pendingAchievements;
    if (l$pendingAchievements.length != lOther$pendingAchievements.length) {
      return false;
    }
    for (int i = 0; i < l$pendingAchievements.length; i++) {
      final l$pendingAchievements$entry = l$pendingAchievements[i];
      final lOther$pendingAchievements$entry = lOther$pendingAchievements[i];
      if (l$pendingAchievements$entry != lOther$pendingAchievements$entry) {
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

extension UtilityExtension$Query$getPendingAchievements
    on Query$getPendingAchievements {
  CopyWith$Query$getPendingAchievements<Query$getPendingAchievements>
      get copyWith => CopyWith$Query$getPendingAchievements(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getPendingAchievements<TRes> {
  factory CopyWith$Query$getPendingAchievements(
    Query$getPendingAchievements instance,
    TRes Function(Query$getPendingAchievements) then,
  ) = _CopyWithImpl$Query$getPendingAchievements;

  factory CopyWith$Query$getPendingAchievements.stub(TRes res) =
      _CopyWithStubImpl$Query$getPendingAchievements;

  TRes call({
    List<Query$getPendingAchievements$pendingAchievements>? pendingAchievements,
    String? $__typename,
  });
  TRes pendingAchievements(
      Iterable<Query$getPendingAchievements$pendingAchievements> Function(
              Iterable<
                  CopyWith$Query$getPendingAchievements$pendingAchievements<
                      Query$getPendingAchievements$pendingAchievements>>)
          _fn);
}

class _CopyWithImpl$Query$getPendingAchievements<TRes>
    implements CopyWith$Query$getPendingAchievements<TRes> {
  _CopyWithImpl$Query$getPendingAchievements(
    this._instance,
    this._then,
  );

  final Query$getPendingAchievements _instance;

  final TRes Function(Query$getPendingAchievements) _then;

  static const _undefined = {};

  TRes call({
    Object? pendingAchievements = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getPendingAchievements(
        pendingAchievements:
            pendingAchievements == _undefined || pendingAchievements == null
                ? _instance.pendingAchievements
                : (pendingAchievements
                    as List<Query$getPendingAchievements$pendingAchievements>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes pendingAchievements(
          Iterable<Query$getPendingAchievements$pendingAchievements> Function(
                  Iterable<
                      CopyWith$Query$getPendingAchievements$pendingAchievements<
                          Query$getPendingAchievements$pendingAchievements>>)
              _fn) =>
      call(
          pendingAchievements: _fn(_instance.pendingAchievements.map(
              (e) => CopyWith$Query$getPendingAchievements$pendingAchievements(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getPendingAchievements<TRes>
    implements CopyWith$Query$getPendingAchievements<TRes> {
  _CopyWithStubImpl$Query$getPendingAchievements(this._res);

  TRes _res;

  call({
    List<Query$getPendingAchievements$pendingAchievements>? pendingAchievements,
    String? $__typename,
  }) =>
      _res;
  pendingAchievements(_fn) => _res;
}

const documentNodeQuerygetPendingAchievements = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getPendingAchievements'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'pendingAchievements'),
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
            name: NameNode(value: 'title'),
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
]);
Query$getPendingAchievements _parserFn$Query$getPendingAchievements(
        Map<String, dynamic> data) =>
    Query$getPendingAchievements.fromJson(data);

class Options$Query$getPendingAchievements
    extends graphql.QueryOptions<Query$getPendingAchievements> {
  Options$Query$getPendingAchievements({
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
          document: documentNodeQuerygetPendingAchievements,
          parserFn: _parserFn$Query$getPendingAchievements,
        );
}

class WatchOptions$Query$getPendingAchievements
    extends graphql.WatchQueryOptions<Query$getPendingAchievements> {
  WatchOptions$Query$getPendingAchievements({
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
          document: documentNodeQuerygetPendingAchievements,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getPendingAchievements,
        );
}

class FetchMoreOptions$Query$getPendingAchievements
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getPendingAchievements(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetPendingAchievements,
        );
}

extension ClientExtension$Query$getPendingAchievements
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getPendingAchievements>>
      query$getPendingAchievements(
              [Options$Query$getPendingAchievements? options]) async =>
          await this.query(options ?? Options$Query$getPendingAchievements());
  graphql.ObservableQuery<
      Query$getPendingAchievements> watchQuery$getPendingAchievements(
          [WatchOptions$Query$getPendingAchievements? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getPendingAchievements());
  void writeQuery$getPendingAchievements({
    required Query$getPendingAchievements data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerygetPendingAchievements)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getPendingAchievements? readQuery$getPendingAchievements(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetPendingAchievements)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getPendingAchievements.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getPendingAchievements>
    useQuery$getPendingAchievements(
            [Options$Query$getPendingAchievements? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$getPendingAchievements());
graphql.ObservableQuery<Query$getPendingAchievements>
    useWatchQuery$getPendingAchievements(
            [WatchOptions$Query$getPendingAchievements? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$getPendingAchievements());

class Query$getPendingAchievements$Widget
    extends graphql_flutter.Query<Query$getPendingAchievements> {
  Query$getPendingAchievements$Widget({
    widgets.Key? key,
    Options$Query$getPendingAchievements? options,
    required graphql_flutter.QueryBuilder<Query$getPendingAchievements> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getPendingAchievements(),
          builder: builder,
        );
}

class Query$getPendingAchievements$pendingAchievements {
  Query$getPendingAchievements$pendingAchievements({
    required this.id,
    required this.title,
    this.image,
    required this.$__typename,
  });

  factory Query$getPendingAchievements$pendingAchievements.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getPendingAchievements$pendingAchievements(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getPendingAchievements$pendingAchievements) ||
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

extension UtilityExtension$Query$getPendingAchievements$pendingAchievements
    on Query$getPendingAchievements$pendingAchievements {
  CopyWith$Query$getPendingAchievements$pendingAchievements<
          Query$getPendingAchievements$pendingAchievements>
      get copyWith => CopyWith$Query$getPendingAchievements$pendingAchievements(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getPendingAchievements$pendingAchievements<TRes> {
  factory CopyWith$Query$getPendingAchievements$pendingAchievements(
    Query$getPendingAchievements$pendingAchievements instance,
    TRes Function(Query$getPendingAchievements$pendingAchievements) then,
  ) = _CopyWithImpl$Query$getPendingAchievements$pendingAchievements;

  factory CopyWith$Query$getPendingAchievements$pendingAchievements.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getPendingAchievements$pendingAchievements;

  TRes call({
    String? id,
    String? title,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getPendingAchievements$pendingAchievements<TRes>
    implements CopyWith$Query$getPendingAchievements$pendingAchievements<TRes> {
  _CopyWithImpl$Query$getPendingAchievements$pendingAchievements(
    this._instance,
    this._then,
  );

  final Query$getPendingAchievements$pendingAchievements _instance;

  final TRes Function(Query$getPendingAchievements$pendingAchievements) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getPendingAchievements$pendingAchievements(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getPendingAchievements$pendingAchievements<TRes>
    implements CopyWith$Query$getPendingAchievements$pendingAchievements<TRes> {
  _CopyWithStubImpl$Query$getPendingAchievements$pendingAchievements(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$confirmAchievement {
  factory Variables$Mutation$confirmAchievement({required String id}) =>
      Variables$Mutation$confirmAchievement._({
        r'id': id,
      });

  Variables$Mutation$confirmAchievement._(this._$data);

  factory Variables$Mutation$confirmAchievement.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$confirmAchievement._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$confirmAchievement<
          Variables$Mutation$confirmAchievement>
      get copyWith => CopyWith$Variables$Mutation$confirmAchievement(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$confirmAchievement) ||
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

abstract class CopyWith$Variables$Mutation$confirmAchievement<TRes> {
  factory CopyWith$Variables$Mutation$confirmAchievement(
    Variables$Mutation$confirmAchievement instance,
    TRes Function(Variables$Mutation$confirmAchievement) then,
  ) = _CopyWithImpl$Variables$Mutation$confirmAchievement;

  factory CopyWith$Variables$Mutation$confirmAchievement.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$confirmAchievement;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$confirmAchievement<TRes>
    implements CopyWith$Variables$Mutation$confirmAchievement<TRes> {
  _CopyWithImpl$Variables$Mutation$confirmAchievement(
    this._instance,
    this._then,
  );

  final Variables$Mutation$confirmAchievement _instance;

  final TRes Function(Variables$Mutation$confirmAchievement) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$confirmAchievement._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$confirmAchievement<TRes>
    implements CopyWith$Variables$Mutation$confirmAchievement<TRes> {
  _CopyWithStubImpl$Variables$Mutation$confirmAchievement(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$confirmAchievement {
  Mutation$confirmAchievement({
    required this.confirmAchievement,
    required this.$__typename,
  });

  factory Mutation$confirmAchievement.fromJson(Map<String, dynamic> json) {
    final l$confirmAchievement = json['confirmAchievement'];
    final l$$__typename = json['__typename'];
    return Mutation$confirmAchievement(
      confirmAchievement: (l$confirmAchievement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool confirmAchievement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$confirmAchievement = confirmAchievement;
    _resultData['confirmAchievement'] = l$confirmAchievement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$confirmAchievement = confirmAchievement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$confirmAchievement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$confirmAchievement) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$confirmAchievement = confirmAchievement;
    final lOther$confirmAchievement = other.confirmAchievement;
    if (l$confirmAchievement != lOther$confirmAchievement) {
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

extension UtilityExtension$Mutation$confirmAchievement
    on Mutation$confirmAchievement {
  CopyWith$Mutation$confirmAchievement<Mutation$confirmAchievement>
      get copyWith => CopyWith$Mutation$confirmAchievement(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$confirmAchievement<TRes> {
  factory CopyWith$Mutation$confirmAchievement(
    Mutation$confirmAchievement instance,
    TRes Function(Mutation$confirmAchievement) then,
  ) = _CopyWithImpl$Mutation$confirmAchievement;

  factory CopyWith$Mutation$confirmAchievement.stub(TRes res) =
      _CopyWithStubImpl$Mutation$confirmAchievement;

  TRes call({
    bool? confirmAchievement,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$confirmAchievement<TRes>
    implements CopyWith$Mutation$confirmAchievement<TRes> {
  _CopyWithImpl$Mutation$confirmAchievement(
    this._instance,
    this._then,
  );

  final Mutation$confirmAchievement _instance;

  final TRes Function(Mutation$confirmAchievement) _then;

  static const _undefined = {};

  TRes call({
    Object? confirmAchievement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$confirmAchievement(
        confirmAchievement:
            confirmAchievement == _undefined || confirmAchievement == null
                ? _instance.confirmAchievement
                : (confirmAchievement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$confirmAchievement<TRes>
    implements CopyWith$Mutation$confirmAchievement<TRes> {
  _CopyWithStubImpl$Mutation$confirmAchievement(this._res);

  TRes _res;

  call({
    bool? confirmAchievement,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationconfirmAchievement = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'confirmAchievement'),
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
        name: NameNode(value: 'confirmAchievement'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
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
Mutation$confirmAchievement _parserFn$Mutation$confirmAchievement(
        Map<String, dynamic> data) =>
    Mutation$confirmAchievement.fromJson(data);
typedef OnMutationCompleted$Mutation$confirmAchievement = FutureOr<void>
    Function(
  dynamic,
  Mutation$confirmAchievement?,
);

class Options$Mutation$confirmAchievement
    extends graphql.MutationOptions<Mutation$confirmAchievement> {
  Options$Mutation$confirmAchievement({
    String? operationName,
    required Variables$Mutation$confirmAchievement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$confirmAchievement? onCompleted,
    graphql.OnMutationUpdate<Mutation$confirmAchievement>? update,
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
                        : _parserFn$Mutation$confirmAchievement(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationconfirmAchievement,
          parserFn: _parserFn$Mutation$confirmAchievement,
        );

  final OnMutationCompleted$Mutation$confirmAchievement? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$confirmAchievement
    extends graphql.WatchQueryOptions<Mutation$confirmAchievement> {
  WatchOptions$Mutation$confirmAchievement({
    String? operationName,
    required Variables$Mutation$confirmAchievement variables,
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
          document: documentNodeMutationconfirmAchievement,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$confirmAchievement,
        );
}

extension ClientExtension$Mutation$confirmAchievement on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$confirmAchievement>>
      mutate$confirmAchievement(
              Options$Mutation$confirmAchievement options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$confirmAchievement>
      watchMutation$confirmAchievement(
              WatchOptions$Mutation$confirmAchievement options) =>
          this.watchMutation(options);
}

class Mutation$confirmAchievement$HookResult {
  Mutation$confirmAchievement$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$confirmAchievement runMutation;

  final graphql.QueryResult<Mutation$confirmAchievement> result;
}

Mutation$confirmAchievement$HookResult useMutation$confirmAchievement(
    [WidgetOptions$Mutation$confirmAchievement? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$confirmAchievement());
  return Mutation$confirmAchievement$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$confirmAchievement>
    useWatchMutation$confirmAchievement(
            WatchOptions$Mutation$confirmAchievement options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$confirmAchievement
    extends graphql.MutationOptions<Mutation$confirmAchievement> {
  WidgetOptions$Mutation$confirmAchievement({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$confirmAchievement? onCompleted,
    graphql.OnMutationUpdate<Mutation$confirmAchievement>? update,
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
                        : _parserFn$Mutation$confirmAchievement(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationconfirmAchievement,
          parserFn: _parserFn$Mutation$confirmAchievement,
        );

  final OnMutationCompleted$Mutation$confirmAchievement? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$confirmAchievement
    = graphql.MultiSourceResult<Mutation$confirmAchievement> Function(
  Variables$Mutation$confirmAchievement, {
  Object? optimisticResult,
});
typedef Builder$Mutation$confirmAchievement = widgets.Widget Function(
  RunMutation$Mutation$confirmAchievement,
  graphql.QueryResult<Mutation$confirmAchievement>?,
);

class Mutation$confirmAchievement$Widget
    extends graphql_flutter.Mutation<Mutation$confirmAchievement> {
  Mutation$confirmAchievement$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$confirmAchievement? options,
    required Builder$Mutation$confirmAchievement builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$confirmAchievement(),
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
