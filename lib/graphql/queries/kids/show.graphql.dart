import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$KidsEpisodeThumbnail {
  Fragment$KidsEpisodeThumbnail({
    required this.id,
    required this.title,
    required this.duration,
    this.image,
    required this.cursor,
    this.$__typename = 'Episode',
  });

  factory Fragment$KidsEpisodeThumbnail.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$duration = json['duration'];
    final l$image = json['image'];
    final l$cursor = json['cursor'];
    final l$$__typename = json['__typename'];
    return Fragment$KidsEpisodeThumbnail(
      id: (l$id as String),
      title: (l$title as String),
      duration: (l$duration as int),
      image: (l$image as String?),
      cursor: (l$cursor as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final int duration;

  final String? image;

  final String cursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$duration = duration;
    final l$image = image;
    final l$cursor = cursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$duration,
      l$image,
      l$cursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$KidsEpisodeThumbnail) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
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

extension UtilityExtension$Fragment$KidsEpisodeThumbnail
    on Fragment$KidsEpisodeThumbnail {
  CopyWith$Fragment$KidsEpisodeThumbnail<Fragment$KidsEpisodeThumbnail>
      get copyWith => CopyWith$Fragment$KidsEpisodeThumbnail(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$KidsEpisodeThumbnail<TRes> {
  factory CopyWith$Fragment$KidsEpisodeThumbnail(
    Fragment$KidsEpisodeThumbnail instance,
    TRes Function(Fragment$KidsEpisodeThumbnail) then,
  ) = _CopyWithImpl$Fragment$KidsEpisodeThumbnail;

  factory CopyWith$Fragment$KidsEpisodeThumbnail.stub(TRes res) =
      _CopyWithStubImpl$Fragment$KidsEpisodeThumbnail;

  TRes call({
    String? id,
    String? title,
    int? duration,
    String? image,
    String? cursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$KidsEpisodeThumbnail<TRes>
    implements CopyWith$Fragment$KidsEpisodeThumbnail<TRes> {
  _CopyWithImpl$Fragment$KidsEpisodeThumbnail(
    this._instance,
    this._then,
  );

  final Fragment$KidsEpisodeThumbnail _instance;

  final TRes Function(Fragment$KidsEpisodeThumbnail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? duration = _undefined,
    Object? image = _undefined,
    Object? cursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$KidsEpisodeThumbnail(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        image: image == _undefined ? _instance.image : (image as String?),
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$KidsEpisodeThumbnail<TRes>
    implements CopyWith$Fragment$KidsEpisodeThumbnail<TRes> {
  _CopyWithStubImpl$Fragment$KidsEpisodeThumbnail(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    int? duration,
    String? image,
    String? cursor,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionKidsEpisodeThumbnail = FragmentDefinitionNode(
  name: NameNode(value: 'KidsEpisodeThumbnail'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Episode'),
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
      name: NameNode(value: 'title'),
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
      name: NameNode(value: 'image'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'cursor'),
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
const documentNodeFragmentKidsEpisodeThumbnail = DocumentNode(definitions: [
  fragmentDefinitionKidsEpisodeThumbnail,
]);

extension ClientExtension$Fragment$KidsEpisodeThumbnail
    on graphql.GraphQLClient {
  void writeFragment$KidsEpisodeThumbnail({
    required Fragment$KidsEpisodeThumbnail data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'KidsEpisodeThumbnail',
            document: documentNodeFragmentKidsEpisodeThumbnail,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$KidsEpisodeThumbnail? readFragment$KidsEpisodeThumbnail({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'KidsEpisodeThumbnail',
          document: documentNodeFragmentKidsEpisodeThumbnail,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$KidsEpisodeThumbnail.fromJson(result);
  }
}

class Variables$Query$GetShowOverview {
  factory Variables$Query$GetShowOverview({required String id}) =>
      Variables$Query$GetShowOverview._({
        r'id': id,
      });

  Variables$Query$GetShowOverview._(this._$data);

  factory Variables$Query$GetShowOverview.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetShowOverview._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetShowOverview<Variables$Query$GetShowOverview>
      get copyWith => CopyWith$Variables$Query$GetShowOverview(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetShowOverview) ||
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

abstract class CopyWith$Variables$Query$GetShowOverview<TRes> {
  factory CopyWith$Variables$Query$GetShowOverview(
    Variables$Query$GetShowOverview instance,
    TRes Function(Variables$Query$GetShowOverview) then,
  ) = _CopyWithImpl$Variables$Query$GetShowOverview;

  factory CopyWith$Variables$Query$GetShowOverview.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetShowOverview;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetShowOverview<TRes>
    implements CopyWith$Variables$Query$GetShowOverview<TRes> {
  _CopyWithImpl$Variables$Query$GetShowOverview(
    this._instance,
    this._then,
  );

  final Variables$Query$GetShowOverview _instance;

  final TRes Function(Variables$Query$GetShowOverview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetShowOverview._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetShowOverview<TRes>
    implements CopyWith$Variables$Query$GetShowOverview<TRes> {
  _CopyWithStubImpl$Variables$Query$GetShowOverview(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetShowOverview {
  Query$GetShowOverview({
    required this.$show,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetShowOverview.fromJson(Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$GetShowOverview(
      $show: Query$GetShowOverview$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetShowOverview$show $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetShowOverview) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$show = $show;
    final lOther$$show = other.$show;
    if (l$$show != lOther$$show) {
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

extension UtilityExtension$Query$GetShowOverview on Query$GetShowOverview {
  CopyWith$Query$GetShowOverview<Query$GetShowOverview> get copyWith =>
      CopyWith$Query$GetShowOverview(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetShowOverview<TRes> {
  factory CopyWith$Query$GetShowOverview(
    Query$GetShowOverview instance,
    TRes Function(Query$GetShowOverview) then,
  ) = _CopyWithImpl$Query$GetShowOverview;

  factory CopyWith$Query$GetShowOverview.stub(TRes res) =
      _CopyWithStubImpl$Query$GetShowOverview;

  TRes call({
    Query$GetShowOverview$show? $show,
    String? $__typename,
  });
  CopyWith$Query$GetShowOverview$show<TRes> get $show;
}

class _CopyWithImpl$Query$GetShowOverview<TRes>
    implements CopyWith$Query$GetShowOverview<TRes> {
  _CopyWithImpl$Query$GetShowOverview(
    this._instance,
    this._then,
  );

  final Query$GetShowOverview _instance;

  final TRes Function(Query$GetShowOverview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetShowOverview(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Query$GetShowOverview$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetShowOverview$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$GetShowOverview$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$GetShowOverview<TRes>
    implements CopyWith$Query$GetShowOverview<TRes> {
  _CopyWithStubImpl$Query$GetShowOverview(this._res);

  TRes _res;

  call({
    Query$GetShowOverview$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetShowOverview$show<TRes> get $show =>
      CopyWith$Query$GetShowOverview$show.stub(_res);
}

const documentNodeQueryGetShowOverview = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetShowOverview'),
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
        name: NameNode(value: 'show'),
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
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'episodeCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'seasons'),
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
                    name: NameNode(value: 'episodes'),
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
                              name: NameNode(value: 'Episode'),
                              isNonNull: false,
                            )),
                            directives: [],
                            selectionSet: SelectionSetNode(selections: [
                              FragmentSpreadNode(
                                name: NameNode(value: 'KidsEpisodeThumbnail'),
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
  fragmentDefinitionKidsEpisodeThumbnail,
]);
Query$GetShowOverview _parserFn$Query$GetShowOverview(
        Map<String, dynamic> data) =>
    Query$GetShowOverview.fromJson(data);
typedef OnQueryComplete$Query$GetShowOverview = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetShowOverview?,
);

class Options$Query$GetShowOverview
    extends graphql.QueryOptions<Query$GetShowOverview> {
  Options$Query$GetShowOverview({
    String? operationName,
    required Variables$Query$GetShowOverview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetShowOverview? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetShowOverview? onComplete,
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
                    data == null ? null : _parserFn$Query$GetShowOverview(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetShowOverview,
          parserFn: _parserFn$Query$GetShowOverview,
        );

  final OnQueryComplete$Query$GetShowOverview? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetShowOverview
    extends graphql.WatchQueryOptions<Query$GetShowOverview> {
  WatchOptions$Query$GetShowOverview({
    String? operationName,
    required Variables$Query$GetShowOverview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetShowOverview? typedOptimisticResult,
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
          document: documentNodeQueryGetShowOverview,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetShowOverview,
        );
}

class FetchMoreOptions$Query$GetShowOverview extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetShowOverview({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetShowOverview variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetShowOverview,
        );
}

extension ClientExtension$Query$GetShowOverview on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetShowOverview>> query$GetShowOverview(
          Options$Query$GetShowOverview options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetShowOverview> watchQuery$GetShowOverview(
          WatchOptions$Query$GetShowOverview options) =>
      this.watchQuery(options);
  void writeQuery$GetShowOverview({
    required Query$GetShowOverview data,
    required Variables$Query$GetShowOverview variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetShowOverview),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetShowOverview? readQuery$GetShowOverview({
    required Variables$Query$GetShowOverview variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetShowOverview),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetShowOverview.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetShowOverview> useQuery$GetShowOverview(
        Options$Query$GetShowOverview options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetShowOverview> useWatchQuery$GetShowOverview(
        WatchOptions$Query$GetShowOverview options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetShowOverview$Widget
    extends graphql_flutter.Query<Query$GetShowOverview> {
  Query$GetShowOverview$Widget({
    widgets.Key? key,
    required Options$Query$GetShowOverview options,
    required graphql_flutter.QueryBuilder<Query$GetShowOverview> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetShowOverview$show {
  Query$GetShowOverview$show({
    required this.title,
    required this.episodeCount,
    required this.seasons,
    this.$__typename = 'Show',
  });

  factory Query$GetShowOverview$show.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$episodeCount = json['episodeCount'];
    final l$seasons = json['seasons'];
    final l$$__typename = json['__typename'];
    return Query$GetShowOverview$show(
      title: (l$title as String),
      episodeCount: (l$episodeCount as int),
      seasons: Query$GetShowOverview$show$seasons.fromJson(
          (l$seasons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final int episodeCount;

  final Query$GetShowOverview$show$seasons seasons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasons = seasons;
    _resultData['seasons'] = l$seasons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$episodeCount = episodeCount;
    final l$seasons = seasons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$episodeCount,
      l$seasons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetShowOverview$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasons = seasons;
    final lOther$seasons = other.seasons;
    if (l$seasons != lOther$seasons) {
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

extension UtilityExtension$Query$GetShowOverview$show
    on Query$GetShowOverview$show {
  CopyWith$Query$GetShowOverview$show<Query$GetShowOverview$show>
      get copyWith => CopyWith$Query$GetShowOverview$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetShowOverview$show<TRes> {
  factory CopyWith$Query$GetShowOverview$show(
    Query$GetShowOverview$show instance,
    TRes Function(Query$GetShowOverview$show) then,
  ) = _CopyWithImpl$Query$GetShowOverview$show;

  factory CopyWith$Query$GetShowOverview$show.stub(TRes res) =
      _CopyWithStubImpl$Query$GetShowOverview$show;

  TRes call({
    String? title,
    int? episodeCount,
    Query$GetShowOverview$show$seasons? seasons,
    String? $__typename,
  });
  CopyWith$Query$GetShowOverview$show$seasons<TRes> get seasons;
}

class _CopyWithImpl$Query$GetShowOverview$show<TRes>
    implements CopyWith$Query$GetShowOverview$show<TRes> {
  _CopyWithImpl$Query$GetShowOverview$show(
    this._instance,
    this._then,
  );

  final Query$GetShowOverview$show _instance;

  final TRes Function(Query$GetShowOverview$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? episodeCount = _undefined,
    Object? seasons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetShowOverview$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasons: seasons == _undefined || seasons == null
            ? _instance.seasons
            : (seasons as Query$GetShowOverview$show$seasons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetShowOverview$show$seasons<TRes> get seasons {
    final local$seasons = _instance.seasons;
    return CopyWith$Query$GetShowOverview$show$seasons(
        local$seasons, (e) => call(seasons: e));
  }
}

class _CopyWithStubImpl$Query$GetShowOverview$show<TRes>
    implements CopyWith$Query$GetShowOverview$show<TRes> {
  _CopyWithStubImpl$Query$GetShowOverview$show(this._res);

  TRes _res;

  call({
    String? title,
    int? episodeCount,
    Query$GetShowOverview$show$seasons? seasons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetShowOverview$show$seasons<TRes> get seasons =>
      CopyWith$Query$GetShowOverview$show$seasons.stub(_res);
}

class Query$GetShowOverview$show$seasons {
  Query$GetShowOverview$show$seasons({
    required this.items,
    this.$__typename = 'SeasonPagination',
  });

  factory Query$GetShowOverview$show$seasons.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetShowOverview$show$seasons(
      items: (l$items as List<dynamic>)
          .map((e) => Query$GetShowOverview$show$seasons$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetShowOverview$show$seasons$items> items;

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
    if (!(other is Query$GetShowOverview$show$seasons) ||
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

extension UtilityExtension$Query$GetShowOverview$show$seasons
    on Query$GetShowOverview$show$seasons {
  CopyWith$Query$GetShowOverview$show$seasons<
          Query$GetShowOverview$show$seasons>
      get copyWith => CopyWith$Query$GetShowOverview$show$seasons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetShowOverview$show$seasons<TRes> {
  factory CopyWith$Query$GetShowOverview$show$seasons(
    Query$GetShowOverview$show$seasons instance,
    TRes Function(Query$GetShowOverview$show$seasons) then,
  ) = _CopyWithImpl$Query$GetShowOverview$show$seasons;

  factory CopyWith$Query$GetShowOverview$show$seasons.stub(TRes res) =
      _CopyWithStubImpl$Query$GetShowOverview$show$seasons;

  TRes call({
    List<Query$GetShowOverview$show$seasons$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$GetShowOverview$show$seasons$items> Function(
              Iterable<
                  CopyWith$Query$GetShowOverview$show$seasons$items<
                      Query$GetShowOverview$show$seasons$items>>)
          _fn);
}

class _CopyWithImpl$Query$GetShowOverview$show$seasons<TRes>
    implements CopyWith$Query$GetShowOverview$show$seasons<TRes> {
  _CopyWithImpl$Query$GetShowOverview$show$seasons(
    this._instance,
    this._then,
  );

  final Query$GetShowOverview$show$seasons _instance;

  final TRes Function(Query$GetShowOverview$show$seasons) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetShowOverview$show$seasons(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$GetShowOverview$show$seasons$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$GetShowOverview$show$seasons$items> Function(
                  Iterable<
                      CopyWith$Query$GetShowOverview$show$seasons$items<
                          Query$GetShowOverview$show$seasons$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Query$GetShowOverview$show$seasons$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetShowOverview$show$seasons<TRes>
    implements CopyWith$Query$GetShowOverview$show$seasons<TRes> {
  _CopyWithStubImpl$Query$GetShowOverview$show$seasons(this._res);

  TRes _res;

  call({
    List<Query$GetShowOverview$show$seasons$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetShowOverview$show$seasons$items {
  Query$GetShowOverview$show$seasons$items({
    required this.episodes,
    this.$__typename = 'Season',
  });

  factory Query$GetShowOverview$show$seasons$items.fromJson(
      Map<String, dynamic> json) {
    final l$episodes = json['episodes'];
    final l$$__typename = json['__typename'];
    return Query$GetShowOverview$show$seasons$items(
      episodes: Query$GetShowOverview$show$seasons$items$episodes.fromJson(
          (l$episodes as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetShowOverview$show$seasons$items$episodes episodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$episodes = episodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$episodes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetShowOverview$show$seasons$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$episodes = episodes;
    final lOther$episodes = other.episodes;
    if (l$episodes != lOther$episodes) {
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

extension UtilityExtension$Query$GetShowOverview$show$seasons$items
    on Query$GetShowOverview$show$seasons$items {
  CopyWith$Query$GetShowOverview$show$seasons$items<
          Query$GetShowOverview$show$seasons$items>
      get copyWith => CopyWith$Query$GetShowOverview$show$seasons$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetShowOverview$show$seasons$items<TRes> {
  factory CopyWith$Query$GetShowOverview$show$seasons$items(
    Query$GetShowOverview$show$seasons$items instance,
    TRes Function(Query$GetShowOverview$show$seasons$items) then,
  ) = _CopyWithImpl$Query$GetShowOverview$show$seasons$items;

  factory CopyWith$Query$GetShowOverview$show$seasons$items.stub(TRes res) =
      _CopyWithStubImpl$Query$GetShowOverview$show$seasons$items;

  TRes call({
    Query$GetShowOverview$show$seasons$items$episodes? episodes,
    String? $__typename,
  });
  CopyWith$Query$GetShowOverview$show$seasons$items$episodes<TRes> get episodes;
}

class _CopyWithImpl$Query$GetShowOverview$show$seasons$items<TRes>
    implements CopyWith$Query$GetShowOverview$show$seasons$items<TRes> {
  _CopyWithImpl$Query$GetShowOverview$show$seasons$items(
    this._instance,
    this._then,
  );

  final Query$GetShowOverview$show$seasons$items _instance;

  final TRes Function(Query$GetShowOverview$show$seasons$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetShowOverview$show$seasons$items(
        episodes: episodes == _undefined || episodes == null
            ? _instance.episodes
            : (episodes as Query$GetShowOverview$show$seasons$items$episodes),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetShowOverview$show$seasons$items$episodes<TRes>
      get episodes {
    final local$episodes = _instance.episodes;
    return CopyWith$Query$GetShowOverview$show$seasons$items$episodes(
        local$episodes, (e) => call(episodes: e));
  }
}

class _CopyWithStubImpl$Query$GetShowOverview$show$seasons$items<TRes>
    implements CopyWith$Query$GetShowOverview$show$seasons$items<TRes> {
  _CopyWithStubImpl$Query$GetShowOverview$show$seasons$items(this._res);

  TRes _res;

  call({
    Query$GetShowOverview$show$seasons$items$episodes? episodes,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetShowOverview$show$seasons$items$episodes<TRes>
      get episodes =>
          CopyWith$Query$GetShowOverview$show$seasons$items$episodes.stub(_res);
}

class Query$GetShowOverview$show$seasons$items$episodes {
  Query$GetShowOverview$show$seasons$items$episodes({
    required this.items,
    this.$__typename = 'EpisodePagination',
  });

  factory Query$GetShowOverview$show$seasons$items$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetShowOverview$show$seasons$items$episodes(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$GetShowOverview$show$seasons$items$episodes$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetShowOverview$show$seasons$items$episodes$items> items;

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
    if (!(other is Query$GetShowOverview$show$seasons$items$episodes) ||
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

extension UtilityExtension$Query$GetShowOverview$show$seasons$items$episodes
    on Query$GetShowOverview$show$seasons$items$episodes {
  CopyWith$Query$GetShowOverview$show$seasons$items$episodes<
          Query$GetShowOverview$show$seasons$items$episodes>
      get copyWith =>
          CopyWith$Query$GetShowOverview$show$seasons$items$episodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetShowOverview$show$seasons$items$episodes<
    TRes> {
  factory CopyWith$Query$GetShowOverview$show$seasons$items$episodes(
    Query$GetShowOverview$show$seasons$items$episodes instance,
    TRes Function(Query$GetShowOverview$show$seasons$items$episodes) then,
  ) = _CopyWithImpl$Query$GetShowOverview$show$seasons$items$episodes;

  factory CopyWith$Query$GetShowOverview$show$seasons$items$episodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetShowOverview$show$seasons$items$episodes;

  TRes call({
    List<Query$GetShowOverview$show$seasons$items$episodes$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$GetShowOverview$show$seasons$items$episodes$items> Function(
              Iterable<
                  CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items<
                      Query$GetShowOverview$show$seasons$items$episodes$items>>)
          _fn);
}

class _CopyWithImpl$Query$GetShowOverview$show$seasons$items$episodes<TRes>
    implements
        CopyWith$Query$GetShowOverview$show$seasons$items$episodes<TRes> {
  _CopyWithImpl$Query$GetShowOverview$show$seasons$items$episodes(
    this._instance,
    this._then,
  );

  final Query$GetShowOverview$show$seasons$items$episodes _instance;

  final TRes Function(Query$GetShowOverview$show$seasons$items$episodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetShowOverview$show$seasons$items$episodes(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$GetShowOverview$show$seasons$items$episodes$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$GetShowOverview$show$seasons$items$episodes$items> Function(
                  Iterable<
                      CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items<
                          Query$GetShowOverview$show$seasons$items$episodes$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetShowOverview$show$seasons$items$episodes<TRes>
    implements
        CopyWith$Query$GetShowOverview$show$seasons$items$episodes<TRes> {
  _CopyWithStubImpl$Query$GetShowOverview$show$seasons$items$episodes(
      this._res);

  TRes _res;

  call({
    List<Query$GetShowOverview$show$seasons$items$episodes$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetShowOverview$show$seasons$items$episodes$items
    implements Fragment$KidsEpisodeThumbnail {
  Query$GetShowOverview$show$seasons$items$episodes$items({
    required this.id,
    required this.title,
    required this.duration,
    this.image,
    required this.cursor,
    this.$__typename = 'Episode',
  });

  factory Query$GetShowOverview$show$seasons$items$episodes$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$duration = json['duration'];
    final l$image = json['image'];
    final l$cursor = json['cursor'];
    final l$$__typename = json['__typename'];
    return Query$GetShowOverview$show$seasons$items$episodes$items(
      id: (l$id as String),
      title: (l$title as String),
      duration: (l$duration as int),
      image: (l$image as String?),
      cursor: (l$cursor as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final int duration;

  final String? image;

  final String cursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$duration = duration;
    final l$image = image;
    final l$cursor = cursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$duration,
      l$image,
      l$cursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetShowOverview$show$seasons$items$episodes$items) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
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

extension UtilityExtension$Query$GetShowOverview$show$seasons$items$episodes$items
    on Query$GetShowOverview$show$seasons$items$episodes$items {
  CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items<
          Query$GetShowOverview$show$seasons$items$episodes$items>
      get copyWith =>
          CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items<
    TRes> {
  factory CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items(
    Query$GetShowOverview$show$seasons$items$episodes$items instance,
    TRes Function(Query$GetShowOverview$show$seasons$items$episodes$items) then,
  ) = _CopyWithImpl$Query$GetShowOverview$show$seasons$items$episodes$items;

  factory CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetShowOverview$show$seasons$items$episodes$items;

  TRes call({
    String? id,
    String? title,
    int? duration,
    String? image,
    String? cursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetShowOverview$show$seasons$items$episodes$items<
        TRes>
    implements
        CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items<TRes> {
  _CopyWithImpl$Query$GetShowOverview$show$seasons$items$episodes$items(
    this._instance,
    this._then,
  );

  final Query$GetShowOverview$show$seasons$items$episodes$items _instance;

  final TRes Function(Query$GetShowOverview$show$seasons$items$episodes$items)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? duration = _undefined,
    Object? image = _undefined,
    Object? cursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetShowOverview$show$seasons$items$episodes$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        image: image == _undefined ? _instance.image : (image as String?),
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetShowOverview$show$seasons$items$episodes$items<
        TRes>
    implements
        CopyWith$Query$GetShowOverview$show$seasons$items$episodes$items<TRes> {
  _CopyWithStubImpl$Query$GetShowOverview$show$seasons$items$episodes$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    int? duration,
    String? image,
    String? cursor,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetPlaylistOverview {
  factory Variables$Query$GetPlaylistOverview({required String id}) =>
      Variables$Query$GetPlaylistOverview._({
        r'id': id,
      });

  Variables$Query$GetPlaylistOverview._(this._$data);

  factory Variables$Query$GetPlaylistOverview.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetPlaylistOverview._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetPlaylistOverview<
          Variables$Query$GetPlaylistOverview>
      get copyWith => CopyWith$Variables$Query$GetPlaylistOverview(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetPlaylistOverview) ||
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

abstract class CopyWith$Variables$Query$GetPlaylistOverview<TRes> {
  factory CopyWith$Variables$Query$GetPlaylistOverview(
    Variables$Query$GetPlaylistOverview instance,
    TRes Function(Variables$Query$GetPlaylistOverview) then,
  ) = _CopyWithImpl$Variables$Query$GetPlaylistOverview;

  factory CopyWith$Variables$Query$GetPlaylistOverview.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetPlaylistOverview;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetPlaylistOverview<TRes>
    implements CopyWith$Variables$Query$GetPlaylistOverview<TRes> {
  _CopyWithImpl$Variables$Query$GetPlaylistOverview(
    this._instance,
    this._then,
  );

  final Variables$Query$GetPlaylistOverview _instance;

  final TRes Function(Variables$Query$GetPlaylistOverview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetPlaylistOverview._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetPlaylistOverview<TRes>
    implements CopyWith$Variables$Query$GetPlaylistOverview<TRes> {
  _CopyWithStubImpl$Variables$Query$GetPlaylistOverview(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetPlaylistOverview {
  Query$GetPlaylistOverview({
    required this.playlist,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetPlaylistOverview.fromJson(Map<String, dynamic> json) {
    final l$playlist = json['playlist'];
    final l$$__typename = json['__typename'];
    return Query$GetPlaylistOverview(
      playlist: Query$GetPlaylistOverview$playlist.fromJson(
          (l$playlist as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetPlaylistOverview$playlist playlist;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$playlist = playlist;
    _resultData['playlist'] = l$playlist.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$playlist = playlist;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$playlist,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetPlaylistOverview) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$playlist = playlist;
    final lOther$playlist = other.playlist;
    if (l$playlist != lOther$playlist) {
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

extension UtilityExtension$Query$GetPlaylistOverview
    on Query$GetPlaylistOverview {
  CopyWith$Query$GetPlaylistOverview<Query$GetPlaylistOverview> get copyWith =>
      CopyWith$Query$GetPlaylistOverview(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetPlaylistOverview<TRes> {
  factory CopyWith$Query$GetPlaylistOverview(
    Query$GetPlaylistOverview instance,
    TRes Function(Query$GetPlaylistOverview) then,
  ) = _CopyWithImpl$Query$GetPlaylistOverview;

  factory CopyWith$Query$GetPlaylistOverview.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPlaylistOverview;

  TRes call({
    Query$GetPlaylistOverview$playlist? playlist,
    String? $__typename,
  });
  CopyWith$Query$GetPlaylistOverview$playlist<TRes> get playlist;
}

class _CopyWithImpl$Query$GetPlaylistOverview<TRes>
    implements CopyWith$Query$GetPlaylistOverview<TRes> {
  _CopyWithImpl$Query$GetPlaylistOverview(
    this._instance,
    this._then,
  );

  final Query$GetPlaylistOverview _instance;

  final TRes Function(Query$GetPlaylistOverview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? playlist = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetPlaylistOverview(
        playlist: playlist == _undefined || playlist == null
            ? _instance.playlist
            : (playlist as Query$GetPlaylistOverview$playlist),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetPlaylistOverview$playlist<TRes> get playlist {
    final local$playlist = _instance.playlist;
    return CopyWith$Query$GetPlaylistOverview$playlist(
        local$playlist, (e) => call(playlist: e));
  }
}

class _CopyWithStubImpl$Query$GetPlaylistOverview<TRes>
    implements CopyWith$Query$GetPlaylistOverview<TRes> {
  _CopyWithStubImpl$Query$GetPlaylistOverview(this._res);

  TRes _res;

  call({
    Query$GetPlaylistOverview$playlist? playlist,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetPlaylistOverview$playlist<TRes> get playlist =>
      CopyWith$Query$GetPlaylistOverview$playlist.stub(_res);
}

const documentNodeQueryGetPlaylistOverview = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetPlaylistOverview'),
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
        name: NameNode(value: 'playlist'),
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
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'total'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                      name: NameNode(value: 'Episode'),
                      isNonNull: false,
                    )),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'KidsEpisodeThumbnail'),
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
  fragmentDefinitionKidsEpisodeThumbnail,
]);
Query$GetPlaylistOverview _parserFn$Query$GetPlaylistOverview(
        Map<String, dynamic> data) =>
    Query$GetPlaylistOverview.fromJson(data);
typedef OnQueryComplete$Query$GetPlaylistOverview = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetPlaylistOverview?,
);

class Options$Query$GetPlaylistOverview
    extends graphql.QueryOptions<Query$GetPlaylistOverview> {
  Options$Query$GetPlaylistOverview({
    String? operationName,
    required Variables$Query$GetPlaylistOverview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetPlaylistOverview? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetPlaylistOverview? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$GetPlaylistOverview(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetPlaylistOverview,
          parserFn: _parserFn$Query$GetPlaylistOverview,
        );

  final OnQueryComplete$Query$GetPlaylistOverview? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetPlaylistOverview
    extends graphql.WatchQueryOptions<Query$GetPlaylistOverview> {
  WatchOptions$Query$GetPlaylistOverview({
    String? operationName,
    required Variables$Query$GetPlaylistOverview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetPlaylistOverview? typedOptimisticResult,
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
          document: documentNodeQueryGetPlaylistOverview,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetPlaylistOverview,
        );
}

class FetchMoreOptions$Query$GetPlaylistOverview
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetPlaylistOverview({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetPlaylistOverview variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetPlaylistOverview,
        );
}

extension ClientExtension$Query$GetPlaylistOverview on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetPlaylistOverview>>
      query$GetPlaylistOverview(
              Options$Query$GetPlaylistOverview options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetPlaylistOverview>
      watchQuery$GetPlaylistOverview(
              WatchOptions$Query$GetPlaylistOverview options) =>
          this.watchQuery(options);
  void writeQuery$GetPlaylistOverview({
    required Query$GetPlaylistOverview data,
    required Variables$Query$GetPlaylistOverview variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetPlaylistOverview),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetPlaylistOverview? readQuery$GetPlaylistOverview({
    required Variables$Query$GetPlaylistOverview variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetPlaylistOverview),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetPlaylistOverview.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetPlaylistOverview>
    useQuery$GetPlaylistOverview(Options$Query$GetPlaylistOverview options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetPlaylistOverview>
    useWatchQuery$GetPlaylistOverview(
            WatchOptions$Query$GetPlaylistOverview options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetPlaylistOverview$Widget
    extends graphql_flutter.Query<Query$GetPlaylistOverview> {
  Query$GetPlaylistOverview$Widget({
    widgets.Key? key,
    required Options$Query$GetPlaylistOverview options,
    required graphql_flutter.QueryBuilder<Query$GetPlaylistOverview> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetPlaylistOverview$playlist {
  Query$GetPlaylistOverview$playlist({
    required this.title,
    required this.items,
    this.$__typename = 'Playlist',
  });

  factory Query$GetPlaylistOverview$playlist.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetPlaylistOverview$playlist(
      title: (l$title as String),
      items: Query$GetPlaylistOverview$playlist$items.fromJson(
          (l$items as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final Query$GetPlaylistOverview$playlist$items items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$items,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetPlaylistOverview$playlist) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$GetPlaylistOverview$playlist
    on Query$GetPlaylistOverview$playlist {
  CopyWith$Query$GetPlaylistOverview$playlist<
          Query$GetPlaylistOverview$playlist>
      get copyWith => CopyWith$Query$GetPlaylistOverview$playlist(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetPlaylistOverview$playlist<TRes> {
  factory CopyWith$Query$GetPlaylistOverview$playlist(
    Query$GetPlaylistOverview$playlist instance,
    TRes Function(Query$GetPlaylistOverview$playlist) then,
  ) = _CopyWithImpl$Query$GetPlaylistOverview$playlist;

  factory CopyWith$Query$GetPlaylistOverview$playlist.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPlaylistOverview$playlist;

  TRes call({
    String? title,
    Query$GetPlaylistOverview$playlist$items? items,
    String? $__typename,
  });
  CopyWith$Query$GetPlaylistOverview$playlist$items<TRes> get items;
}

class _CopyWithImpl$Query$GetPlaylistOverview$playlist<TRes>
    implements CopyWith$Query$GetPlaylistOverview$playlist<TRes> {
  _CopyWithImpl$Query$GetPlaylistOverview$playlist(
    this._instance,
    this._then,
  );

  final Query$GetPlaylistOverview$playlist _instance;

  final TRes Function(Query$GetPlaylistOverview$playlist) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetPlaylistOverview$playlist(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Query$GetPlaylistOverview$playlist$items),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetPlaylistOverview$playlist$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$GetPlaylistOverview$playlist$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$GetPlaylistOverview$playlist<TRes>
    implements CopyWith$Query$GetPlaylistOverview$playlist<TRes> {
  _CopyWithStubImpl$Query$GetPlaylistOverview$playlist(this._res);

  TRes _res;

  call({
    String? title,
    Query$GetPlaylistOverview$playlist$items? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetPlaylistOverview$playlist$items<TRes> get items =>
      CopyWith$Query$GetPlaylistOverview$playlist$items.stub(_res);
}

class Query$GetPlaylistOverview$playlist$items {
  Query$GetPlaylistOverview$playlist$items({
    required this.total,
    required this.items,
    this.$__typename = 'PlaylistItemPagination',
  });

  factory Query$GetPlaylistOverview$playlist$items.fromJson(
      Map<String, dynamic> json) {
    final l$total = json['total'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetPlaylistOverview$playlist$items(
      total: (l$total as int),
      items: (l$items as List<dynamic>)
          .map((e) => Query$GetPlaylistOverview$playlist$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int total;

  final List<Query$GetPlaylistOverview$playlist$items$items> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$total = total;
    _resultData['total'] = l$total;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$total = total;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$total,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetPlaylistOverview$playlist$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
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

extension UtilityExtension$Query$GetPlaylistOverview$playlist$items
    on Query$GetPlaylistOverview$playlist$items {
  CopyWith$Query$GetPlaylistOverview$playlist$items<
          Query$GetPlaylistOverview$playlist$items>
      get copyWith => CopyWith$Query$GetPlaylistOverview$playlist$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetPlaylistOverview$playlist$items<TRes> {
  factory CopyWith$Query$GetPlaylistOverview$playlist$items(
    Query$GetPlaylistOverview$playlist$items instance,
    TRes Function(Query$GetPlaylistOverview$playlist$items) then,
  ) = _CopyWithImpl$Query$GetPlaylistOverview$playlist$items;

  factory CopyWith$Query$GetPlaylistOverview$playlist$items.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items;

  TRes call({
    int? total,
    List<Query$GetPlaylistOverview$playlist$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$GetPlaylistOverview$playlist$items$items> Function(
              Iterable<
                  CopyWith$Query$GetPlaylistOverview$playlist$items$items<
                      Query$GetPlaylistOverview$playlist$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$GetPlaylistOverview$playlist$items<TRes>
    implements CopyWith$Query$GetPlaylistOverview$playlist$items<TRes> {
  _CopyWithImpl$Query$GetPlaylistOverview$playlist$items(
    this._instance,
    this._then,
  );

  final Query$GetPlaylistOverview$playlist$items _instance;

  final TRes Function(Query$GetPlaylistOverview$playlist$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? total = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetPlaylistOverview$playlist$items(
        total: total == _undefined || total == null
            ? _instance.total
            : (total as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Query$GetPlaylistOverview$playlist$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$GetPlaylistOverview$playlist$items$items> Function(
                  Iterable<
                      CopyWith$Query$GetPlaylistOverview$playlist$items$items<
                          Query$GetPlaylistOverview$playlist$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Query$GetPlaylistOverview$playlist$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items<TRes>
    implements CopyWith$Query$GetPlaylistOverview$playlist$items<TRes> {
  _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items(this._res);

  TRes _res;

  call({
    int? total,
    List<Query$GetPlaylistOverview$playlist$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetPlaylistOverview$playlist$items$items {
  Query$GetPlaylistOverview$playlist$items$items({required this.$__typename});

  factory Query$GetPlaylistOverview$playlist$items$items.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Episode":
        return Query$GetPlaylistOverview$playlist$items$items$$Episode.fromJson(
            json);

      case "Short":
        return Query$GetPlaylistOverview$playlist$items$items$$Short.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Query$GetPlaylistOverview$playlist$items$items(
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
    if (!(other is Query$GetPlaylistOverview$playlist$items$items) ||
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

extension UtilityExtension$Query$GetPlaylistOverview$playlist$items$items
    on Query$GetPlaylistOverview$playlist$items$items {
  CopyWith$Query$GetPlaylistOverview$playlist$items$items<
          Query$GetPlaylistOverview$playlist$items$items>
      get copyWith => CopyWith$Query$GetPlaylistOverview$playlist$items$items(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(
            Query$GetPlaylistOverview$playlist$items$items$$Episode)
        episode,
    required _T Function(Query$GetPlaylistOverview$playlist$items$items$$Short)
        short,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        return episode(
            this as Query$GetPlaylistOverview$playlist$items$items$$Episode);

      case "Short":
        return short(
            this as Query$GetPlaylistOverview$playlist$items$items$$Short);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$GetPlaylistOverview$playlist$items$items$$Episode)?
        episode,
    _T Function(Query$GetPlaylistOverview$playlist$items$items$$Short)? short,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        if (episode != null) {
          return episode(
              this as Query$GetPlaylistOverview$playlist$items$items$$Episode);
        } else {
          return orElse();
        }

      case "Short":
        if (short != null) {
          return short(
              this as Query$GetPlaylistOverview$playlist$items$items$$Short);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$GetPlaylistOverview$playlist$items$items<TRes> {
  factory CopyWith$Query$GetPlaylistOverview$playlist$items$items(
    Query$GetPlaylistOverview$playlist$items$items instance,
    TRes Function(Query$GetPlaylistOverview$playlist$items$items) then,
  ) = _CopyWithImpl$Query$GetPlaylistOverview$playlist$items$items;

  factory CopyWith$Query$GetPlaylistOverview$playlist$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items$items;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$GetPlaylistOverview$playlist$items$items<TRes>
    implements CopyWith$Query$GetPlaylistOverview$playlist$items$items<TRes> {
  _CopyWithImpl$Query$GetPlaylistOverview$playlist$items$items(
    this._instance,
    this._then,
  );

  final Query$GetPlaylistOverview$playlist$items$items _instance;

  final TRes Function(Query$GetPlaylistOverview$playlist$items$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$GetPlaylistOverview$playlist$items$items(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items$items<TRes>
    implements CopyWith$Query$GetPlaylistOverview$playlist$items$items<TRes> {
  _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items$items(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$GetPlaylistOverview$playlist$items$items$$Episode
    implements
        Fragment$KidsEpisodeThumbnail,
        Query$GetPlaylistOverview$playlist$items$items {
  Query$GetPlaylistOverview$playlist$items$items$$Episode({
    required this.id,
    required this.title,
    required this.duration,
    this.image,
    required this.cursor,
    this.$__typename = 'Episode',
  });

  factory Query$GetPlaylistOverview$playlist$items$items$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$duration = json['duration'];
    final l$image = json['image'];
    final l$cursor = json['cursor'];
    final l$$__typename = json['__typename'];
    return Query$GetPlaylistOverview$playlist$items$items$$Episode(
      id: (l$id as String),
      title: (l$title as String),
      duration: (l$duration as int),
      image: (l$image as String?),
      cursor: (l$cursor as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final int duration;

  final String? image;

  final String cursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$duration = duration;
    final l$image = image;
    final l$cursor = cursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$duration,
      l$image,
      l$cursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetPlaylistOverview$playlist$items$items$$Episode) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
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

extension UtilityExtension$Query$GetPlaylistOverview$playlist$items$items$$Episode
    on Query$GetPlaylistOverview$playlist$items$items$$Episode {
  CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Episode<
          Query$GetPlaylistOverview$playlist$items$items$$Episode>
      get copyWith =>
          CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Episode<
    TRes> {
  factory CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Episode(
    Query$GetPlaylistOverview$playlist$items$items$$Episode instance,
    TRes Function(Query$GetPlaylistOverview$playlist$items$items$$Episode) then,
  ) = _CopyWithImpl$Query$GetPlaylistOverview$playlist$items$items$$Episode;

  factory CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items$items$$Episode;

  TRes call({
    String? id,
    String? title,
    int? duration,
    String? image,
    String? cursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetPlaylistOverview$playlist$items$items$$Episode<
        TRes>
    implements
        CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Episode<TRes> {
  _CopyWithImpl$Query$GetPlaylistOverview$playlist$items$items$$Episode(
    this._instance,
    this._then,
  );

  final Query$GetPlaylistOverview$playlist$items$items$$Episode _instance;

  final TRes Function(Query$GetPlaylistOverview$playlist$items$items$$Episode)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? duration = _undefined,
    Object? image = _undefined,
    Object? cursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetPlaylistOverview$playlist$items$items$$Episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        image: image == _undefined ? _instance.image : (image as String?),
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items$items$$Episode<
        TRes>
    implements
        CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Episode<TRes> {
  _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items$items$$Episode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    int? duration,
    String? image,
    String? cursor,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetPlaylistOverview$playlist$items$items$$Short
    implements Query$GetPlaylistOverview$playlist$items$items {
  Query$GetPlaylistOverview$playlist$items$items$$Short(
      {this.$__typename = 'Short'});

  factory Query$GetPlaylistOverview$playlist$items$items$$Short.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$GetPlaylistOverview$playlist$items$items$$Short(
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
    if (!(other is Query$GetPlaylistOverview$playlist$items$items$$Short) ||
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

extension UtilityExtension$Query$GetPlaylistOverview$playlist$items$items$$Short
    on Query$GetPlaylistOverview$playlist$items$items$$Short {
  CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Short<
          Query$GetPlaylistOverview$playlist$items$items$$Short>
      get copyWith =>
          CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Short(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Short<
    TRes> {
  factory CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Short(
    Query$GetPlaylistOverview$playlist$items$items$$Short instance,
    TRes Function(Query$GetPlaylistOverview$playlist$items$items$$Short) then,
  ) = _CopyWithImpl$Query$GetPlaylistOverview$playlist$items$items$$Short;

  factory CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Short.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items$items$$Short;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$GetPlaylistOverview$playlist$items$items$$Short<TRes>
    implements
        CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Short<TRes> {
  _CopyWithImpl$Query$GetPlaylistOverview$playlist$items$items$$Short(
    this._instance,
    this._then,
  );

  final Query$GetPlaylistOverview$playlist$items$items$$Short _instance;

  final TRes Function(Query$GetPlaylistOverview$playlist$items$items$$Short)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$GetPlaylistOverview$playlist$items$items$$Short(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items$items$$Short<
        TRes>
    implements
        CopyWith$Query$GetPlaylistOverview$playlist$items$items$$Short<TRes> {
  _CopyWithStubImpl$Query$GetPlaylistOverview$playlist$items$items$$Short(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}
