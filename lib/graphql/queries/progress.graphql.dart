import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$setEpisodeProgress {
  factory Variables$Mutation$setEpisodeProgress({
    required String id,
    int? duration,
    int? progress,
  }) =>
      Variables$Mutation$setEpisodeProgress._({
        r'id': id,
        if (duration != null) r'duration': duration,
        if (progress != null) r'progress': progress,
      });

  Variables$Mutation$setEpisodeProgress._(this._$data);

  factory Variables$Mutation$setEpisodeProgress.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('duration')) {
      final l$duration = data['duration'];
      result$data['duration'] = (l$duration as int?);
    }
    if (data.containsKey('progress')) {
      final l$progress = data['progress'];
      result$data['progress'] = (l$progress as int?);
    }
    return Variables$Mutation$setEpisodeProgress._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  int? get duration => (_$data['duration'] as int?);
  int? get progress => (_$data['progress'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('duration')) {
      final l$duration = duration;
      result$data['duration'] = l$duration;
    }
    if (_$data.containsKey('progress')) {
      final l$progress = progress;
      result$data['progress'] = l$progress;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$setEpisodeProgress<
          Variables$Mutation$setEpisodeProgress>
      get copyWith => CopyWith$Variables$Mutation$setEpisodeProgress(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$setEpisodeProgress) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (_$data.containsKey('duration') !=
        other._$data.containsKey('duration')) {
      return false;
    }
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (_$data.containsKey('progress') !=
        other._$data.containsKey('progress')) {
      return false;
    }
    if (l$progress != lOther$progress) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    return Object.hashAll([
      l$id,
      _$data.containsKey('duration') ? l$duration : const {},
      _$data.containsKey('progress') ? l$progress : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$setEpisodeProgress<TRes> {
  factory CopyWith$Variables$Mutation$setEpisodeProgress(
    Variables$Mutation$setEpisodeProgress instance,
    TRes Function(Variables$Mutation$setEpisodeProgress) then,
  ) = _CopyWithImpl$Variables$Mutation$setEpisodeProgress;

  factory CopyWith$Variables$Mutation$setEpisodeProgress.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$setEpisodeProgress;

  TRes call({
    String? id,
    int? duration,
    int? progress,
  });
}

class _CopyWithImpl$Variables$Mutation$setEpisodeProgress<TRes>
    implements CopyWith$Variables$Mutation$setEpisodeProgress<TRes> {
  _CopyWithImpl$Variables$Mutation$setEpisodeProgress(
    this._instance,
    this._then,
  );

  final Variables$Mutation$setEpisodeProgress _instance;

  final TRes Function(Variables$Mutation$setEpisodeProgress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
  }) =>
      _then(Variables$Mutation$setEpisodeProgress._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (duration != _undefined) 'duration': (duration as int?),
        if (progress != _undefined) 'progress': (progress as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$setEpisodeProgress<TRes>
    implements CopyWith$Variables$Mutation$setEpisodeProgress<TRes> {
  _CopyWithStubImpl$Variables$Mutation$setEpisodeProgress(this._res);

  TRes _res;

  call({
    String? id,
    int? duration,
    int? progress,
  }) =>
      _res;
}

class Mutation$setEpisodeProgress {
  Mutation$setEpisodeProgress({
    required this.setEpisodeProgress,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$setEpisodeProgress.fromJson(Map<String, dynamic> json) {
    final l$setEpisodeProgress = json['setEpisodeProgress'];
    final l$$__typename = json['__typename'];
    return Mutation$setEpisodeProgress(
      setEpisodeProgress:
          Mutation$setEpisodeProgress$setEpisodeProgress.fromJson(
              (l$setEpisodeProgress as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$setEpisodeProgress$setEpisodeProgress setEpisodeProgress;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$setEpisodeProgress = setEpisodeProgress;
    _resultData['setEpisodeProgress'] = l$setEpisodeProgress.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$setEpisodeProgress = setEpisodeProgress;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$setEpisodeProgress,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$setEpisodeProgress) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$setEpisodeProgress = setEpisodeProgress;
    final lOther$setEpisodeProgress = other.setEpisodeProgress;
    if (l$setEpisodeProgress != lOther$setEpisodeProgress) {
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

extension UtilityExtension$Mutation$setEpisodeProgress
    on Mutation$setEpisodeProgress {
  CopyWith$Mutation$setEpisodeProgress<Mutation$setEpisodeProgress>
      get copyWith => CopyWith$Mutation$setEpisodeProgress(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$setEpisodeProgress<TRes> {
  factory CopyWith$Mutation$setEpisodeProgress(
    Mutation$setEpisodeProgress instance,
    TRes Function(Mutation$setEpisodeProgress) then,
  ) = _CopyWithImpl$Mutation$setEpisodeProgress;

  factory CopyWith$Mutation$setEpisodeProgress.stub(TRes res) =
      _CopyWithStubImpl$Mutation$setEpisodeProgress;

  TRes call({
    Mutation$setEpisodeProgress$setEpisodeProgress? setEpisodeProgress,
    String? $__typename,
  });
  CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress<TRes>
      get setEpisodeProgress;
}

class _CopyWithImpl$Mutation$setEpisodeProgress<TRes>
    implements CopyWith$Mutation$setEpisodeProgress<TRes> {
  _CopyWithImpl$Mutation$setEpisodeProgress(
    this._instance,
    this._then,
  );

  final Mutation$setEpisodeProgress _instance;

  final TRes Function(Mutation$setEpisodeProgress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? setEpisodeProgress = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$setEpisodeProgress(
        setEpisodeProgress:
            setEpisodeProgress == _undefined || setEpisodeProgress == null
                ? _instance.setEpisodeProgress
                : (setEpisodeProgress
                    as Mutation$setEpisodeProgress$setEpisodeProgress),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress<TRes>
      get setEpisodeProgress {
    final local$setEpisodeProgress = _instance.setEpisodeProgress;
    return CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress(
        local$setEpisodeProgress, (e) => call(setEpisodeProgress: e));
  }
}

class _CopyWithStubImpl$Mutation$setEpisodeProgress<TRes>
    implements CopyWith$Mutation$setEpisodeProgress<TRes> {
  _CopyWithStubImpl$Mutation$setEpisodeProgress(this._res);

  TRes _res;

  call({
    Mutation$setEpisodeProgress$setEpisodeProgress? setEpisodeProgress,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress<TRes>
      get setEpisodeProgress =>
          CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress.stub(_res);
}

const documentNodeMutationsetEpisodeProgress = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'setEpisodeProgress'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'duration')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'progress')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'setEpisodeProgress'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'duration'),
            value: VariableNode(name: NameNode(value: 'duration')),
          ),
          ArgumentNode(
            name: NameNode(value: 'progress'),
            value: VariableNode(name: NameNode(value: 'progress')),
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
            name: NameNode(value: 'duration'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'progress'),
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
Mutation$setEpisodeProgress _parserFn$Mutation$setEpisodeProgress(
        Map<String, dynamic> data) =>
    Mutation$setEpisodeProgress.fromJson(data);
typedef OnMutationCompleted$Mutation$setEpisodeProgress = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$setEpisodeProgress?,
);

class Options$Mutation$setEpisodeProgress
    extends graphql.MutationOptions<Mutation$setEpisodeProgress> {
  Options$Mutation$setEpisodeProgress({
    String? operationName,
    required Variables$Mutation$setEpisodeProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$setEpisodeProgress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$setEpisodeProgress? onCompleted,
    graphql.OnMutationUpdate<Mutation$setEpisodeProgress>? update,
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
                        : _parserFn$Mutation$setEpisodeProgress(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsetEpisodeProgress,
          parserFn: _parserFn$Mutation$setEpisodeProgress,
        );

  final OnMutationCompleted$Mutation$setEpisodeProgress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$setEpisodeProgress
    extends graphql.WatchQueryOptions<Mutation$setEpisodeProgress> {
  WatchOptions$Mutation$setEpisodeProgress({
    String? operationName,
    required Variables$Mutation$setEpisodeProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$setEpisodeProgress? typedOptimisticResult,
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
          document: documentNodeMutationsetEpisodeProgress,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$setEpisodeProgress,
        );
}

extension ClientExtension$Mutation$setEpisodeProgress on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$setEpisodeProgress>>
      mutate$setEpisodeProgress(
              Options$Mutation$setEpisodeProgress options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$setEpisodeProgress>
      watchMutation$setEpisodeProgress(
              WatchOptions$Mutation$setEpisodeProgress options) =>
          this.watchMutation(options);
}

class Mutation$setEpisodeProgress$HookResult {
  Mutation$setEpisodeProgress$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$setEpisodeProgress runMutation;

  final graphql.QueryResult<Mutation$setEpisodeProgress> result;
}

Mutation$setEpisodeProgress$HookResult useMutation$setEpisodeProgress(
    [WidgetOptions$Mutation$setEpisodeProgress? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$setEpisodeProgress());
  return Mutation$setEpisodeProgress$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$setEpisodeProgress>
    useWatchMutation$setEpisodeProgress(
            WatchOptions$Mutation$setEpisodeProgress options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$setEpisodeProgress
    extends graphql.MutationOptions<Mutation$setEpisodeProgress> {
  WidgetOptions$Mutation$setEpisodeProgress({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$setEpisodeProgress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$setEpisodeProgress? onCompleted,
    graphql.OnMutationUpdate<Mutation$setEpisodeProgress>? update,
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
                        : _parserFn$Mutation$setEpisodeProgress(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsetEpisodeProgress,
          parserFn: _parserFn$Mutation$setEpisodeProgress,
        );

  final OnMutationCompleted$Mutation$setEpisodeProgress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$setEpisodeProgress
    = graphql.MultiSourceResult<Mutation$setEpisodeProgress> Function(
  Variables$Mutation$setEpisodeProgress, {
  Object? optimisticResult,
  Mutation$setEpisodeProgress? typedOptimisticResult,
});
typedef Builder$Mutation$setEpisodeProgress = widgets.Widget Function(
  RunMutation$Mutation$setEpisodeProgress,
  graphql.QueryResult<Mutation$setEpisodeProgress>?,
);

class Mutation$setEpisodeProgress$Widget
    extends graphql_flutter.Mutation<Mutation$setEpisodeProgress> {
  Mutation$setEpisodeProgress$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$setEpisodeProgress? options,
    required Builder$Mutation$setEpisodeProgress builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$setEpisodeProgress(),
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

class Mutation$setEpisodeProgress$setEpisodeProgress {
  Mutation$setEpisodeProgress$setEpisodeProgress({
    this.$__typename = 'Episode',
    required this.duration,
    this.progress,
  });

  factory Mutation$setEpisodeProgress$setEpisodeProgress.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    return Mutation$setEpisodeProgress$setEpisodeProgress(
      $__typename: (l$$__typename as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
    );
  }

  final String $__typename;

  final int duration;

  final int? progress;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$duration = duration;
    final l$progress = progress;
    return Object.hashAll([
      l$$__typename,
      l$duration,
      l$progress,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$setEpisodeProgress$setEpisodeProgress) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$setEpisodeProgress$setEpisodeProgress
    on Mutation$setEpisodeProgress$setEpisodeProgress {
  CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress<
          Mutation$setEpisodeProgress$setEpisodeProgress>
      get copyWith => CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress<TRes> {
  factory CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress(
    Mutation$setEpisodeProgress$setEpisodeProgress instance,
    TRes Function(Mutation$setEpisodeProgress$setEpisodeProgress) then,
  ) = _CopyWithImpl$Mutation$setEpisodeProgress$setEpisodeProgress;

  factory CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$setEpisodeProgress$setEpisodeProgress;

  TRes call({
    String? $__typename,
    int? duration,
    int? progress,
  });
}

class _CopyWithImpl$Mutation$setEpisodeProgress$setEpisodeProgress<TRes>
    implements CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress<TRes> {
  _CopyWithImpl$Mutation$setEpisodeProgress$setEpisodeProgress(
    this._instance,
    this._then,
  );

  final Mutation$setEpisodeProgress$setEpisodeProgress _instance;

  final TRes Function(Mutation$setEpisodeProgress$setEpisodeProgress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $__typename = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
  }) =>
      _then(Mutation$setEpisodeProgress$setEpisodeProgress(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
      ));
}

class _CopyWithStubImpl$Mutation$setEpisodeProgress$setEpisodeProgress<TRes>
    implements CopyWith$Mutation$setEpisodeProgress$setEpisodeProgress<TRes> {
  _CopyWithStubImpl$Mutation$setEpisodeProgress$setEpisodeProgress(this._res);

  TRes _res;

  call({
    String? $__typename,
    int? duration,
    int? progress,
  }) =>
      _res;
}
