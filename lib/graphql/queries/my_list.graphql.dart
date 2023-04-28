import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$addEpisodeToMyList {
  factory Variables$Mutation$addEpisodeToMyList({required String episodeId}) =>
      Variables$Mutation$addEpisodeToMyList._({
        r'episodeId': episodeId,
      });

  Variables$Mutation$addEpisodeToMyList._(this._$data);

  factory Variables$Mutation$addEpisodeToMyList.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$episodeId = data['episodeId'];
    result$data['episodeId'] = (l$episodeId as String);
    return Variables$Mutation$addEpisodeToMyList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get episodeId => (_$data['episodeId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$episodeId = episodeId;
    result$data['episodeId'] = l$episodeId;
    return result$data;
  }

  CopyWith$Variables$Mutation$addEpisodeToMyList<
          Variables$Mutation$addEpisodeToMyList>
      get copyWith => CopyWith$Variables$Mutation$addEpisodeToMyList(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addEpisodeToMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$episodeId = episodeId;
    final lOther$episodeId = other.episodeId;
    if (l$episodeId != lOther$episodeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$episodeId = episodeId;
    return Object.hashAll([l$episodeId]);
  }
}

abstract class CopyWith$Variables$Mutation$addEpisodeToMyList<TRes> {
  factory CopyWith$Variables$Mutation$addEpisodeToMyList(
    Variables$Mutation$addEpisodeToMyList instance,
    TRes Function(Variables$Mutation$addEpisodeToMyList) then,
  ) = _CopyWithImpl$Variables$Mutation$addEpisodeToMyList;

  factory CopyWith$Variables$Mutation$addEpisodeToMyList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addEpisodeToMyList;

  TRes call({String? episodeId});
}

class _CopyWithImpl$Variables$Mutation$addEpisodeToMyList<TRes>
    implements CopyWith$Variables$Mutation$addEpisodeToMyList<TRes> {
  _CopyWithImpl$Variables$Mutation$addEpisodeToMyList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addEpisodeToMyList _instance;

  final TRes Function(Variables$Mutation$addEpisodeToMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? episodeId = _undefined}) =>
      _then(Variables$Mutation$addEpisodeToMyList._({
        ..._instance._$data,
        if (episodeId != _undefined && episodeId != null)
          'episodeId': (episodeId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addEpisodeToMyList<TRes>
    implements CopyWith$Variables$Mutation$addEpisodeToMyList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addEpisodeToMyList(this._res);

  TRes _res;

  call({String? episodeId}) => _res;
}

class Mutation$addEpisodeToMyList {
  Mutation$addEpisodeToMyList({
    required this.addEpisodeToMyList,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$addEpisodeToMyList.fromJson(Map<String, dynamic> json) {
    final l$addEpisodeToMyList = json['addEpisodeToMyList'];
    final l$$__typename = json['__typename'];
    return Mutation$addEpisodeToMyList(
      addEpisodeToMyList:
          Mutation$addEpisodeToMyList$addEpisodeToMyList.fromJson(
              (l$addEpisodeToMyList as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$addEpisodeToMyList$addEpisodeToMyList addEpisodeToMyList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addEpisodeToMyList = addEpisodeToMyList;
    _resultData['addEpisodeToMyList'] = l$addEpisodeToMyList.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addEpisodeToMyList = addEpisodeToMyList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addEpisodeToMyList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addEpisodeToMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addEpisodeToMyList = addEpisodeToMyList;
    final lOther$addEpisodeToMyList = other.addEpisodeToMyList;
    if (l$addEpisodeToMyList != lOther$addEpisodeToMyList) {
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

extension UtilityExtension$Mutation$addEpisodeToMyList
    on Mutation$addEpisodeToMyList {
  CopyWith$Mutation$addEpisodeToMyList<Mutation$addEpisodeToMyList>
      get copyWith => CopyWith$Mutation$addEpisodeToMyList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addEpisodeToMyList<TRes> {
  factory CopyWith$Mutation$addEpisodeToMyList(
    Mutation$addEpisodeToMyList instance,
    TRes Function(Mutation$addEpisodeToMyList) then,
  ) = _CopyWithImpl$Mutation$addEpisodeToMyList;

  factory CopyWith$Mutation$addEpisodeToMyList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addEpisodeToMyList;

  TRes call({
    Mutation$addEpisodeToMyList$addEpisodeToMyList? addEpisodeToMyList,
    String? $__typename,
  });
  CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
      get addEpisodeToMyList;
}

class _CopyWithImpl$Mutation$addEpisodeToMyList<TRes>
    implements CopyWith$Mutation$addEpisodeToMyList<TRes> {
  _CopyWithImpl$Mutation$addEpisodeToMyList(
    this._instance,
    this._then,
  );

  final Mutation$addEpisodeToMyList _instance;

  final TRes Function(Mutation$addEpisodeToMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addEpisodeToMyList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addEpisodeToMyList(
        addEpisodeToMyList:
            addEpisodeToMyList == _undefined || addEpisodeToMyList == null
                ? _instance.addEpisodeToMyList
                : (addEpisodeToMyList
                    as Mutation$addEpisodeToMyList$addEpisodeToMyList),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
      get addEpisodeToMyList {
    final local$addEpisodeToMyList = _instance.addEpisodeToMyList;
    return CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList(
        local$addEpisodeToMyList, (e) => call(addEpisodeToMyList: e));
  }
}

class _CopyWithStubImpl$Mutation$addEpisodeToMyList<TRes>
    implements CopyWith$Mutation$addEpisodeToMyList<TRes> {
  _CopyWithStubImpl$Mutation$addEpisodeToMyList(this._res);

  TRes _res;

  call({
    Mutation$addEpisodeToMyList$addEpisodeToMyList? addEpisodeToMyList,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
      get addEpisodeToMyList =>
          CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList.stub(_res);
}

const documentNodeMutationaddEpisodeToMyList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addEpisodeToMyList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'episodeId')),
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
        name: NameNode(value: 'addEpisodeToMyList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'episodeId'),
            value: VariableNode(name: NameNode(value: 'episodeId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'entryId'),
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
Mutation$addEpisodeToMyList _parserFn$Mutation$addEpisodeToMyList(
        Map<String, dynamic> data) =>
    Mutation$addEpisodeToMyList.fromJson(data);
typedef OnMutationCompleted$Mutation$addEpisodeToMyList = FutureOr<void>
    Function(
  dynamic,
  Mutation$addEpisodeToMyList?,
);

class Options$Mutation$addEpisodeToMyList
    extends graphql.MutationOptions<Mutation$addEpisodeToMyList> {
  Options$Mutation$addEpisodeToMyList({
    String? operationName,
    required Variables$Mutation$addEpisodeToMyList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addEpisodeToMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$addEpisodeToMyList>? update,
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
                        : _parserFn$Mutation$addEpisodeToMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddEpisodeToMyList,
          parserFn: _parserFn$Mutation$addEpisodeToMyList,
        );

  final OnMutationCompleted$Mutation$addEpisodeToMyList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addEpisodeToMyList
    extends graphql.WatchQueryOptions<Mutation$addEpisodeToMyList> {
  WatchOptions$Mutation$addEpisodeToMyList({
    String? operationName,
    required Variables$Mutation$addEpisodeToMyList variables,
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
          document: documentNodeMutationaddEpisodeToMyList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addEpisodeToMyList,
        );
}

extension ClientExtension$Mutation$addEpisodeToMyList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addEpisodeToMyList>>
      mutate$addEpisodeToMyList(
              Options$Mutation$addEpisodeToMyList options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$addEpisodeToMyList>
      watchMutation$addEpisodeToMyList(
              WatchOptions$Mutation$addEpisodeToMyList options) =>
          this.watchMutation(options);
}

class Mutation$addEpisodeToMyList$HookResult {
  Mutation$addEpisodeToMyList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$addEpisodeToMyList runMutation;

  final graphql.QueryResult<Mutation$addEpisodeToMyList> result;
}

Mutation$addEpisodeToMyList$HookResult useMutation$addEpisodeToMyList(
    [WidgetOptions$Mutation$addEpisodeToMyList? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$addEpisodeToMyList());
  return Mutation$addEpisodeToMyList$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$addEpisodeToMyList>
    useWatchMutation$addEpisodeToMyList(
            WatchOptions$Mutation$addEpisodeToMyList options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$addEpisodeToMyList
    extends graphql.MutationOptions<Mutation$addEpisodeToMyList> {
  WidgetOptions$Mutation$addEpisodeToMyList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addEpisodeToMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$addEpisodeToMyList>? update,
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
                        : _parserFn$Mutation$addEpisodeToMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddEpisodeToMyList,
          parserFn: _parserFn$Mutation$addEpisodeToMyList,
        );

  final OnMutationCompleted$Mutation$addEpisodeToMyList? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$addEpisodeToMyList
    = graphql.MultiSourceResult<Mutation$addEpisodeToMyList> Function(
  Variables$Mutation$addEpisodeToMyList, {
  Object? optimisticResult,
});
typedef Builder$Mutation$addEpisodeToMyList = widgets.Widget Function(
  RunMutation$Mutation$addEpisodeToMyList,
  graphql.QueryResult<Mutation$addEpisodeToMyList>?,
);

class Mutation$addEpisodeToMyList$Widget
    extends graphql_flutter.Mutation<Mutation$addEpisodeToMyList> {
  Mutation$addEpisodeToMyList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$addEpisodeToMyList? options,
    required Builder$Mutation$addEpisodeToMyList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$addEpisodeToMyList(),
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

class Mutation$addEpisodeToMyList$addEpisodeToMyList {
  Mutation$addEpisodeToMyList$addEpisodeToMyList({
    required this.entryId,
    this.$__typename = 'AddToCollectionResult',
  });

  factory Mutation$addEpisodeToMyList$addEpisodeToMyList.fromJson(
      Map<String, dynamic> json) {
    final l$entryId = json['entryId'];
    final l$$__typename = json['__typename'];
    return Mutation$addEpisodeToMyList$addEpisodeToMyList(
      entryId: (l$entryId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String entryId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$entryId = entryId;
    _resultData['entryId'] = l$entryId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$entryId = entryId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$entryId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addEpisodeToMyList$addEpisodeToMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$entryId = entryId;
    final lOther$entryId = other.entryId;
    if (l$entryId != lOther$entryId) {
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

extension UtilityExtension$Mutation$addEpisodeToMyList$addEpisodeToMyList
    on Mutation$addEpisodeToMyList$addEpisodeToMyList {
  CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<
          Mutation$addEpisodeToMyList$addEpisodeToMyList>
      get copyWith => CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes> {
  factory CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList(
    Mutation$addEpisodeToMyList$addEpisodeToMyList instance,
    TRes Function(Mutation$addEpisodeToMyList$addEpisodeToMyList) then,
  ) = _CopyWithImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList;

  factory CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList;

  TRes call({
    String? entryId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
    implements CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes> {
  _CopyWithImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList(
    this._instance,
    this._then,
  );

  final Mutation$addEpisodeToMyList$addEpisodeToMyList _instance;

  final TRes Function(Mutation$addEpisodeToMyList$addEpisodeToMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? entryId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addEpisodeToMyList$addEpisodeToMyList(
        entryId: entryId == _undefined || entryId == null
            ? _instance.entryId
            : (entryId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes>
    implements CopyWith$Mutation$addEpisodeToMyList$addEpisodeToMyList<TRes> {
  _CopyWithStubImpl$Mutation$addEpisodeToMyList$addEpisodeToMyList(this._res);

  TRes _res;

  call({
    String? entryId,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$removeEntryFromMyList {
  factory Variables$Mutation$removeEntryFromMyList({required String entryId}) =>
      Variables$Mutation$removeEntryFromMyList._({
        r'entryId': entryId,
      });

  Variables$Mutation$removeEntryFromMyList._(this._$data);

  factory Variables$Mutation$removeEntryFromMyList.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$entryId = data['entryId'];
    result$data['entryId'] = (l$entryId as String);
    return Variables$Mutation$removeEntryFromMyList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get entryId => (_$data['entryId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$entryId = entryId;
    result$data['entryId'] = l$entryId;
    return result$data;
  }

  CopyWith$Variables$Mutation$removeEntryFromMyList<
          Variables$Mutation$removeEntryFromMyList>
      get copyWith => CopyWith$Variables$Mutation$removeEntryFromMyList(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$removeEntryFromMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$entryId = entryId;
    final lOther$entryId = other.entryId;
    if (l$entryId != lOther$entryId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$entryId = entryId;
    return Object.hashAll([l$entryId]);
  }
}

abstract class CopyWith$Variables$Mutation$removeEntryFromMyList<TRes> {
  factory CopyWith$Variables$Mutation$removeEntryFromMyList(
    Variables$Mutation$removeEntryFromMyList instance,
    TRes Function(Variables$Mutation$removeEntryFromMyList) then,
  ) = _CopyWithImpl$Variables$Mutation$removeEntryFromMyList;

  factory CopyWith$Variables$Mutation$removeEntryFromMyList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$removeEntryFromMyList;

  TRes call({String? entryId});
}

class _CopyWithImpl$Variables$Mutation$removeEntryFromMyList<TRes>
    implements CopyWith$Variables$Mutation$removeEntryFromMyList<TRes> {
  _CopyWithImpl$Variables$Mutation$removeEntryFromMyList(
    this._instance,
    this._then,
  );

  final Variables$Mutation$removeEntryFromMyList _instance;

  final TRes Function(Variables$Mutation$removeEntryFromMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? entryId = _undefined}) =>
      _then(Variables$Mutation$removeEntryFromMyList._({
        ..._instance._$data,
        if (entryId != _undefined && entryId != null)
          'entryId': (entryId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$removeEntryFromMyList<TRes>
    implements CopyWith$Variables$Mutation$removeEntryFromMyList<TRes> {
  _CopyWithStubImpl$Variables$Mutation$removeEntryFromMyList(this._res);

  TRes _res;

  call({String? entryId}) => _res;
}

class Mutation$removeEntryFromMyList {
  Mutation$removeEntryFromMyList({
    required this.removeEntryFromMyList,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$removeEntryFromMyList.fromJson(Map<String, dynamic> json) {
    final l$removeEntryFromMyList = json['removeEntryFromMyList'];
    final l$$__typename = json['__typename'];
    return Mutation$removeEntryFromMyList(
      removeEntryFromMyList:
          Mutation$removeEntryFromMyList$removeEntryFromMyList.fromJson(
              (l$removeEntryFromMyList as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$removeEntryFromMyList$removeEntryFromMyList
      removeEntryFromMyList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$removeEntryFromMyList = removeEntryFromMyList;
    _resultData['removeEntryFromMyList'] = l$removeEntryFromMyList.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$removeEntryFromMyList = removeEntryFromMyList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$removeEntryFromMyList,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$removeEntryFromMyList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$removeEntryFromMyList = removeEntryFromMyList;
    final lOther$removeEntryFromMyList = other.removeEntryFromMyList;
    if (l$removeEntryFromMyList != lOther$removeEntryFromMyList) {
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

extension UtilityExtension$Mutation$removeEntryFromMyList
    on Mutation$removeEntryFromMyList {
  CopyWith$Mutation$removeEntryFromMyList<Mutation$removeEntryFromMyList>
      get copyWith => CopyWith$Mutation$removeEntryFromMyList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$removeEntryFromMyList<TRes> {
  factory CopyWith$Mutation$removeEntryFromMyList(
    Mutation$removeEntryFromMyList instance,
    TRes Function(Mutation$removeEntryFromMyList) then,
  ) = _CopyWithImpl$Mutation$removeEntryFromMyList;

  factory CopyWith$Mutation$removeEntryFromMyList.stub(TRes res) =
      _CopyWithStubImpl$Mutation$removeEntryFromMyList;

  TRes call({
    Mutation$removeEntryFromMyList$removeEntryFromMyList? removeEntryFromMyList,
    String? $__typename,
  });
  CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes>
      get removeEntryFromMyList;
}

class _CopyWithImpl$Mutation$removeEntryFromMyList<TRes>
    implements CopyWith$Mutation$removeEntryFromMyList<TRes> {
  _CopyWithImpl$Mutation$removeEntryFromMyList(
    this._instance,
    this._then,
  );

  final Mutation$removeEntryFromMyList _instance;

  final TRes Function(Mutation$removeEntryFromMyList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? removeEntryFromMyList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$removeEntryFromMyList(
        removeEntryFromMyList:
            removeEntryFromMyList == _undefined || removeEntryFromMyList == null
                ? _instance.removeEntryFromMyList
                : (removeEntryFromMyList
                    as Mutation$removeEntryFromMyList$removeEntryFromMyList),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes>
      get removeEntryFromMyList {
    final local$removeEntryFromMyList = _instance.removeEntryFromMyList;
    return CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList(
        local$removeEntryFromMyList, (e) => call(removeEntryFromMyList: e));
  }
}

class _CopyWithStubImpl$Mutation$removeEntryFromMyList<TRes>
    implements CopyWith$Mutation$removeEntryFromMyList<TRes> {
  _CopyWithStubImpl$Mutation$removeEntryFromMyList(this._res);

  TRes _res;

  call({
    Mutation$removeEntryFromMyList$removeEntryFromMyList? removeEntryFromMyList,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes>
      get removeEntryFromMyList =>
          CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList.stub(
              _res);
}

const documentNodeMutationremoveEntryFromMyList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'removeEntryFromMyList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'entryId')),
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
        name: NameNode(value: 'removeEntryFromMyList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'entryId'),
            value: VariableNode(name: NameNode(value: 'entryId')),
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
Mutation$removeEntryFromMyList _parserFn$Mutation$removeEntryFromMyList(
        Map<String, dynamic> data) =>
    Mutation$removeEntryFromMyList.fromJson(data);
typedef OnMutationCompleted$Mutation$removeEntryFromMyList = FutureOr<void>
    Function(
  dynamic,
  Mutation$removeEntryFromMyList?,
);

class Options$Mutation$removeEntryFromMyList
    extends graphql.MutationOptions<Mutation$removeEntryFromMyList> {
  Options$Mutation$removeEntryFromMyList({
    String? operationName,
    required Variables$Mutation$removeEntryFromMyList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$removeEntryFromMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$removeEntryFromMyList>? update,
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
                        : _parserFn$Mutation$removeEntryFromMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationremoveEntryFromMyList,
          parserFn: _parserFn$Mutation$removeEntryFromMyList,
        );

  final OnMutationCompleted$Mutation$removeEntryFromMyList?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$removeEntryFromMyList
    extends graphql.WatchQueryOptions<Mutation$removeEntryFromMyList> {
  WatchOptions$Mutation$removeEntryFromMyList({
    String? operationName,
    required Variables$Mutation$removeEntryFromMyList variables,
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
          document: documentNodeMutationremoveEntryFromMyList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$removeEntryFromMyList,
        );
}

extension ClientExtension$Mutation$removeEntryFromMyList
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$removeEntryFromMyList>>
      mutate$removeEntryFromMyList(
              Options$Mutation$removeEntryFromMyList options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$removeEntryFromMyList>
      watchMutation$removeEntryFromMyList(
              WatchOptions$Mutation$removeEntryFromMyList options) =>
          this.watchMutation(options);
}

class Mutation$removeEntryFromMyList$HookResult {
  Mutation$removeEntryFromMyList$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$removeEntryFromMyList runMutation;

  final graphql.QueryResult<Mutation$removeEntryFromMyList> result;
}

Mutation$removeEntryFromMyList$HookResult useMutation$removeEntryFromMyList(
    [WidgetOptions$Mutation$removeEntryFromMyList? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$removeEntryFromMyList());
  return Mutation$removeEntryFromMyList$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$removeEntryFromMyList>
    useWatchMutation$removeEntryFromMyList(
            WatchOptions$Mutation$removeEntryFromMyList options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$removeEntryFromMyList
    extends graphql.MutationOptions<Mutation$removeEntryFromMyList> {
  WidgetOptions$Mutation$removeEntryFromMyList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$removeEntryFromMyList? onCompleted,
    graphql.OnMutationUpdate<Mutation$removeEntryFromMyList>? update,
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
                        : _parserFn$Mutation$removeEntryFromMyList(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationremoveEntryFromMyList,
          parserFn: _parserFn$Mutation$removeEntryFromMyList,
        );

  final OnMutationCompleted$Mutation$removeEntryFromMyList?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$removeEntryFromMyList
    = graphql.MultiSourceResult<Mutation$removeEntryFromMyList> Function(
  Variables$Mutation$removeEntryFromMyList, {
  Object? optimisticResult,
});
typedef Builder$Mutation$removeEntryFromMyList = widgets.Widget Function(
  RunMutation$Mutation$removeEntryFromMyList,
  graphql.QueryResult<Mutation$removeEntryFromMyList>?,
);

class Mutation$removeEntryFromMyList$Widget
    extends graphql_flutter.Mutation<Mutation$removeEntryFromMyList> {
  Mutation$removeEntryFromMyList$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$removeEntryFromMyList? options,
    required Builder$Mutation$removeEntryFromMyList builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$removeEntryFromMyList(),
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

class Mutation$removeEntryFromMyList$removeEntryFromMyList {
  Mutation$removeEntryFromMyList$removeEntryFromMyList({
    required this.id,
    this.$__typename = 'UserCollection',
  });

  factory Mutation$removeEntryFromMyList$removeEntryFromMyList.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$removeEntryFromMyList$removeEntryFromMyList(
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
    if (!(other is Mutation$removeEntryFromMyList$removeEntryFromMyList) ||
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

extension UtilityExtension$Mutation$removeEntryFromMyList$removeEntryFromMyList
    on Mutation$removeEntryFromMyList$removeEntryFromMyList {
  CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<
          Mutation$removeEntryFromMyList$removeEntryFromMyList>
      get copyWith =>
          CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<
    TRes> {
  factory CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList(
    Mutation$removeEntryFromMyList$removeEntryFromMyList instance,
    TRes Function(Mutation$removeEntryFromMyList$removeEntryFromMyList) then,
  ) = _CopyWithImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList;

  factory CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes>
    implements
        CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes> {
  _CopyWithImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList(
    this._instance,
    this._then,
  );

  final Mutation$removeEntryFromMyList$removeEntryFromMyList _instance;

  final TRes Function(Mutation$removeEntryFromMyList$removeEntryFromMyList)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$removeEntryFromMyList$removeEntryFromMyList(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList<
        TRes>
    implements
        CopyWith$Mutation$removeEntryFromMyList$removeEntryFromMyList<TRes> {
  _CopyWithStubImpl$Mutation$removeEntryFromMyList$removeEntryFromMyList(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
