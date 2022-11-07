import '../schema/items.graphql.dart';
import '../schema/schema.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$SeasonListEpisode {
  Fragment$SeasonListEpisode({
    required this.id,
    this.imageUrl,
    this.number,
    required this.title,
    required this.ageRating,
    required this.duration,
    required this.$__typename,
  });

  factory Fragment$SeasonListEpisode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$imageUrl = json['imageUrl'];
    final l$number = json['number'];
    final l$title = json['title'];
    final l$ageRating = json['ageRating'];
    final l$duration = json['duration'];
    final l$$__typename = json['__typename'];
    return Fragment$SeasonListEpisode(
      id: (l$id as String),
      imageUrl: (l$imageUrl as String?),
      number: (l$number as int?),
      title: (l$title as String),
      ageRating: (l$ageRating as String),
      duration: (l$duration as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? imageUrl;

  final int? number;

  final String title;

  final String ageRating;

  final int duration;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$imageUrl = imageUrl;
    final l$number = number;
    final l$title = title;
    final l$ageRating = ageRating;
    final l$duration = duration;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$imageUrl,
      l$number,
      l$title,
      l$ageRating,
      l$duration,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SeasonListEpisode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$ageRating = ageRating;
    final lOther$ageRating = other.ageRating;
    if (l$ageRating != lOther$ageRating) {
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

extension UtilityExtension$Fragment$SeasonListEpisode
    on Fragment$SeasonListEpisode {
  CopyWith$Fragment$SeasonListEpisode<Fragment$SeasonListEpisode>
      get copyWith => CopyWith$Fragment$SeasonListEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SeasonListEpisode<TRes> {
  factory CopyWith$Fragment$SeasonListEpisode(
    Fragment$SeasonListEpisode instance,
    TRes Function(Fragment$SeasonListEpisode) then,
  ) = _CopyWithImpl$Fragment$SeasonListEpisode;

  factory CopyWith$Fragment$SeasonListEpisode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SeasonListEpisode;

  TRes call({
    String? id,
    String? imageUrl,
    int? number,
    String? title,
    String? ageRating,
    int? duration,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SeasonListEpisode<TRes>
    implements CopyWith$Fragment$SeasonListEpisode<TRes> {
  _CopyWithImpl$Fragment$SeasonListEpisode(
    this._instance,
    this._then,
  );

  final Fragment$SeasonListEpisode _instance;

  final TRes Function(Fragment$SeasonListEpisode) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? imageUrl = _undefined,
    Object? number = _undefined,
    Object? title = _undefined,
    Object? ageRating = _undefined,
    Object? duration = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SeasonListEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        imageUrl:
            imageUrl == _undefined ? _instance.imageUrl : (imageUrl as String?),
        number: number == _undefined ? _instance.number : (number as int?),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SeasonListEpisode<TRes>
    implements CopyWith$Fragment$SeasonListEpisode<TRes> {
  _CopyWithStubImpl$Fragment$SeasonListEpisode(this._res);

  TRes _res;

  call({
    String? id,
    String? imageUrl,
    int? number,
    String? title,
    String? ageRating,
    int? duration,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionSeasonListEpisode = FragmentDefinitionNode(
  name: NameNode(value: 'SeasonListEpisode'),
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
      name: NameNode(value: 'imageUrl'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'number'),
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
      name: NameNode(value: 'ageRating'),
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
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentSeasonListEpisode = DocumentNode(definitions: [
  fragmentDefinitionSeasonListEpisode,
]);

extension ClientExtension$Fragment$SeasonListEpisode on graphql.GraphQLClient {
  void writeFragment$SeasonListEpisode({
    required Fragment$SeasonListEpisode data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'SeasonListEpisode',
            document: documentNodeFragmentSeasonListEpisode,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$SeasonListEpisode? readFragment$SeasonListEpisode({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'SeasonListEpisode',
          document: documentNodeFragmentSeasonListEpisode,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$SeasonListEpisode.fromJson(result);
  }
}

class Variables$Query$FetchEpisode {
  factory Variables$Query$FetchEpisode({required String id}) =>
      Variables$Query$FetchEpisode._({
        r'id': id,
      });

  Variables$Query$FetchEpisode._(this._$data);

  factory Variables$Query$FetchEpisode.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$FetchEpisode._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$FetchEpisode<Variables$Query$FetchEpisode>
      get copyWith => CopyWith$Variables$Query$FetchEpisode(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$FetchEpisode) ||
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

abstract class CopyWith$Variables$Query$FetchEpisode<TRes> {
  factory CopyWith$Variables$Query$FetchEpisode(
    Variables$Query$FetchEpisode instance,
    TRes Function(Variables$Query$FetchEpisode) then,
  ) = _CopyWithImpl$Variables$Query$FetchEpisode;

  factory CopyWith$Variables$Query$FetchEpisode.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$FetchEpisode;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$FetchEpisode<TRes>
    implements CopyWith$Variables$Query$FetchEpisode<TRes> {
  _CopyWithImpl$Variables$Query$FetchEpisode(
    this._instance,
    this._then,
  );

  final Variables$Query$FetchEpisode _instance;

  final TRes Function(Variables$Query$FetchEpisode) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$FetchEpisode._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$FetchEpisode<TRes>
    implements CopyWith$Variables$Query$FetchEpisode<TRes> {
  _CopyWithStubImpl$Variables$Query$FetchEpisode(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$FetchEpisode {
  Query$FetchEpisode({
    required this.episode,
    required this.$__typename,
  });

  factory Query$FetchEpisode.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode(
      episode: Query$FetchEpisode$episode.fromJson(
          (l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchEpisode$episode episode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episode = episode;
    _resultData['episode'] = l$episode.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$episode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
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

extension UtilityExtension$Query$FetchEpisode on Query$FetchEpisode {
  CopyWith$Query$FetchEpisode<Query$FetchEpisode> get copyWith =>
      CopyWith$Query$FetchEpisode(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FetchEpisode<TRes> {
  factory CopyWith$Query$FetchEpisode(
    Query$FetchEpisode instance,
    TRes Function(Query$FetchEpisode) then,
  ) = _CopyWithImpl$Query$FetchEpisode;

  factory CopyWith$Query$FetchEpisode.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode;

  TRes call({
    Query$FetchEpisode$episode? episode,
    String? $__typename,
  });
  CopyWith$Query$FetchEpisode$episode<TRes> get episode;
}

class _CopyWithImpl$Query$FetchEpisode<TRes>
    implements CopyWith$Query$FetchEpisode<TRes> {
  _CopyWithImpl$Query$FetchEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode _instance;

  final TRes Function(Query$FetchEpisode) _then;

  static const _undefined = {};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode(
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Query$FetchEpisode$episode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchEpisode$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Query$FetchEpisode$episode(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode<TRes>
    implements CopyWith$Query$FetchEpisode<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode(this._res);

  TRes _res;

  call({
    Query$FetchEpisode$episode? episode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchEpisode$episode<TRes> get episode =>
      CopyWith$Query$FetchEpisode$episode.stub(_res);
}

const documentNodeQueryFetchEpisode = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'FetchEpisode'),
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
        name: NameNode(value: 'episode'),
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
            name: NameNode(value: 'number'),
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
            name: NameNode(value: 'extraDescription'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'imageUrl'),
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
          FieldNode(
            name: NameNode(value: 'ageRating'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'streams'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'url'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'audioLanguages'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'subtitleLanguages'),
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
            name: NameNode(value: 'season'),
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
                name: NameNode(value: 'number'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
                      FragmentSpreadNode(
                        name: NameNode(value: 'SeasonListEpisode'),
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
                name: NameNode(value: 'show'),
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
                    name: NameNode(value: 'type'),
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
  fragmentDefinitionSeasonListEpisode,
]);
Query$FetchEpisode _parserFn$Query$FetchEpisode(Map<String, dynamic> data) =>
    Query$FetchEpisode.fromJson(data);

class Options$Query$FetchEpisode
    extends graphql.QueryOptions<Query$FetchEpisode> {
  Options$Query$FetchEpisode({
    String? operationName,
    required Variables$Query$FetchEpisode variables,
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
          document: documentNodeQueryFetchEpisode,
          parserFn: _parserFn$Query$FetchEpisode,
        );
}

class WatchOptions$Query$FetchEpisode
    extends graphql.WatchQueryOptions<Query$FetchEpisode> {
  WatchOptions$Query$FetchEpisode({
    String? operationName,
    required Variables$Query$FetchEpisode variables,
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
          document: documentNodeQueryFetchEpisode,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$FetchEpisode,
        );
}

class FetchMoreOptions$Query$FetchEpisode extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FetchEpisode({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$FetchEpisode variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryFetchEpisode,
        );
}

extension ClientExtension$Query$FetchEpisode on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FetchEpisode>> query$FetchEpisode(
          Options$Query$FetchEpisode options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$FetchEpisode> watchQuery$FetchEpisode(
          WatchOptions$Query$FetchEpisode options) =>
      this.watchQuery(options);
  void writeQuery$FetchEpisode({
    required Query$FetchEpisode data,
    required Variables$Query$FetchEpisode variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryFetchEpisode),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$FetchEpisode? readQuery$FetchEpisode({
    required Variables$Query$FetchEpisode variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryFetchEpisode),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FetchEpisode.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$FetchEpisode> useQuery$FetchEpisode(
        Options$Query$FetchEpisode options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$FetchEpisode> useWatchQuery$FetchEpisode(
        WatchOptions$Query$FetchEpisode options) =>
    graphql_flutter.useWatchQuery(options);

class Query$FetchEpisode$Widget
    extends graphql_flutter.Query<Query$FetchEpisode> {
  Query$FetchEpisode$Widget({
    widgets.Key? key,
    required Options$Query$FetchEpisode options,
    required graphql_flutter.QueryBuilder<Query$FetchEpisode> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$FetchEpisode$episode {
  Query$FetchEpisode$episode({
    required this.id,
    required this.title,
    this.number,
    required this.description,
    required this.extraDescription,
    this.imageUrl,
    required this.duration,
    this.progress,
    required this.ageRating,
    required this.streams,
    this.season,
    required this.$__typename,
  });

  factory Query$FetchEpisode$episode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$number = json['number'];
    final l$description = json['description'];
    final l$extraDescription = json['extraDescription'];
    final l$imageUrl = json['imageUrl'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$ageRating = json['ageRating'];
    final l$streams = json['streams'];
    final l$season = json['season'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode(
      id: (l$id as String),
      title: (l$title as String),
      number: (l$number as int?),
      description: (l$description as String),
      extraDescription: (l$extraDescription as String),
      imageUrl: (l$imageUrl as String?),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      ageRating: (l$ageRating as String),
      streams: (l$streams as List<dynamic>)
          .map((e) => Query$FetchEpisode$episode$streams.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      season: l$season == null
          ? null
          : Query$FetchEpisode$episode$season.fromJson(
              (l$season as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final int? number;

  final String description;

  final String extraDescription;

  final String? imageUrl;

  final int duration;

  final int? progress;

  final String ageRating;

  final List<Query$FetchEpisode$episode$streams> streams;

  final Query$FetchEpisode$episode$season? season;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$extraDescription = extraDescription;
    _resultData['extraDescription'] = l$extraDescription;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$streams = streams;
    _resultData['streams'] = l$streams.map((e) => e.toJson()).toList();
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$number = number;
    final l$description = description;
    final l$extraDescription = extraDescription;
    final l$imageUrl = imageUrl;
    final l$duration = duration;
    final l$progress = progress;
    final l$ageRating = ageRating;
    final l$streams = streams;
    final l$season = season;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$number,
      l$description,
      l$extraDescription,
      l$imageUrl,
      l$duration,
      l$progress,
      l$ageRating,
      Object.hashAll(l$streams.map((v) => v)),
      l$season,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode) ||
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
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$extraDescription = extraDescription;
    final lOther$extraDescription = other.extraDescription;
    if (l$extraDescription != lOther$extraDescription) {
      return false;
    }
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
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
    final l$ageRating = ageRating;
    final lOther$ageRating = other.ageRating;
    if (l$ageRating != lOther$ageRating) {
      return false;
    }
    final l$streams = streams;
    final lOther$streams = other.streams;
    if (l$streams.length != lOther$streams.length) {
      return false;
    }
    for (int i = 0; i < l$streams.length; i++) {
      final l$streams$entry = l$streams[i];
      final lOther$streams$entry = lOther$streams[i];
      if (l$streams$entry != lOther$streams$entry) {
        return false;
      }
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
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

extension UtilityExtension$Query$FetchEpisode$episode
    on Query$FetchEpisode$episode {
  CopyWith$Query$FetchEpisode$episode<Query$FetchEpisode$episode>
      get copyWith => CopyWith$Query$FetchEpisode$episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode<TRes> {
  factory CopyWith$Query$FetchEpisode$episode(
    Query$FetchEpisode$episode instance,
    TRes Function(Query$FetchEpisode$episode) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode;

  factory CopyWith$Query$FetchEpisode$episode.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode;

  TRes call({
    String? id,
    String? title,
    int? number,
    String? description,
    String? extraDescription,
    String? imageUrl,
    int? duration,
    int? progress,
    String? ageRating,
    List<Query$FetchEpisode$episode$streams>? streams,
    Query$FetchEpisode$episode$season? season,
    String? $__typename,
  });
  TRes streams(
      Iterable<Query$FetchEpisode$episode$streams> Function(
              Iterable<
                  CopyWith$Query$FetchEpisode$episode$streams<
                      Query$FetchEpisode$episode$streams>>)
          _fn);
  CopyWith$Query$FetchEpisode$episode$season<TRes> get season;
}

class _CopyWithImpl$Query$FetchEpisode$episode<TRes>
    implements CopyWith$Query$FetchEpisode$episode<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode _instance;

  final TRes Function(Query$FetchEpisode$episode) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? number = _undefined,
    Object? description = _undefined,
    Object? extraDescription = _undefined,
    Object? imageUrl = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? ageRating = _undefined,
    Object? streams = _undefined,
    Object? season = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        number: number == _undefined ? _instance.number : (number as int?),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        extraDescription:
            extraDescription == _undefined || extraDescription == null
                ? _instance.extraDescription
                : (extraDescription as String),
        imageUrl:
            imageUrl == _undefined ? _instance.imageUrl : (imageUrl as String?),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        streams: streams == _undefined || streams == null
            ? _instance.streams
            : (streams as List<Query$FetchEpisode$episode$streams>),
        season: season == _undefined
            ? _instance.season
            : (season as Query$FetchEpisode$episode$season?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes streams(
          Iterable<Query$FetchEpisode$episode$streams> Function(
                  Iterable<
                      CopyWith$Query$FetchEpisode$episode$streams<
                          Query$FetchEpisode$episode$streams>>)
              _fn) =>
      call(
          streams: _fn(_instance.streams
              .map((e) => CopyWith$Query$FetchEpisode$episode$streams(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Query$FetchEpisode$episode$season<TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$FetchEpisode$episode$season.stub(_then(_instance))
        : CopyWith$Query$FetchEpisode$episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode<TRes>
    implements CopyWith$Query$FetchEpisode$episode<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    int? number,
    String? description,
    String? extraDescription,
    String? imageUrl,
    int? duration,
    int? progress,
    String? ageRating,
    List<Query$FetchEpisode$episode$streams>? streams,
    Query$FetchEpisode$episode$season? season,
    String? $__typename,
  }) =>
      _res;
  streams(_fn) => _res;
  CopyWith$Query$FetchEpisode$episode$season<TRes> get season =>
      CopyWith$Query$FetchEpisode$episode$season.stub(_res);
}

class Query$FetchEpisode$episode$streams {
  Query$FetchEpisode$episode$streams({
    required this.type,
    required this.url,
    required this.audioLanguages,
    required this.subtitleLanguages,
    required this.$__typename,
  });

  factory Query$FetchEpisode$episode$streams.fromJson(
      Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$url = json['url'];
    final l$audioLanguages = json['audioLanguages'];
    final l$subtitleLanguages = json['subtitleLanguages'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$streams(
      type: fromJson$Enum$StreamType((l$type as String)),
      url: (l$url as String),
      audioLanguages: (l$audioLanguages as List<dynamic>)
          .map((e) => fromJson$Enum$Language((e as String)))
          .toList(),
      subtitleLanguages: (l$subtitleLanguages as List<dynamic>)
          .map((e) => fromJson$Enum$Language((e as String)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$StreamType type;

  final String url;

  final List<Enum$Language> audioLanguages;

  final List<Enum$Language> subtitleLanguages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$StreamType(l$type);
    final l$url = url;
    _resultData['url'] = l$url;
    final l$audioLanguages = audioLanguages;
    _resultData['audioLanguages'] =
        l$audioLanguages.map((e) => toJson$Enum$Language(e)).toList();
    final l$subtitleLanguages = subtitleLanguages;
    _resultData['subtitleLanguages'] =
        l$subtitleLanguages.map((e) => toJson$Enum$Language(e)).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$url = url;
    final l$audioLanguages = audioLanguages;
    final l$subtitleLanguages = subtitleLanguages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$type,
      l$url,
      Object.hashAll(l$audioLanguages.map((v) => v)),
      Object.hashAll(l$subtitleLanguages.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode$streams) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$audioLanguages = audioLanguages;
    final lOther$audioLanguages = other.audioLanguages;
    if (l$audioLanguages.length != lOther$audioLanguages.length) {
      return false;
    }
    for (int i = 0; i < l$audioLanguages.length; i++) {
      final l$audioLanguages$entry = l$audioLanguages[i];
      final lOther$audioLanguages$entry = lOther$audioLanguages[i];
      if (l$audioLanguages$entry != lOther$audioLanguages$entry) {
        return false;
      }
    }
    final l$subtitleLanguages = subtitleLanguages;
    final lOther$subtitleLanguages = other.subtitleLanguages;
    if (l$subtitleLanguages.length != lOther$subtitleLanguages.length) {
      return false;
    }
    for (int i = 0; i < l$subtitleLanguages.length; i++) {
      final l$subtitleLanguages$entry = l$subtitleLanguages[i];
      final lOther$subtitleLanguages$entry = lOther$subtitleLanguages[i];
      if (l$subtitleLanguages$entry != lOther$subtitleLanguages$entry) {
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

extension UtilityExtension$Query$FetchEpisode$episode$streams
    on Query$FetchEpisode$episode$streams {
  CopyWith$Query$FetchEpisode$episode$streams<
          Query$FetchEpisode$episode$streams>
      get copyWith => CopyWith$Query$FetchEpisode$episode$streams(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$streams<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$streams(
    Query$FetchEpisode$episode$streams instance,
    TRes Function(Query$FetchEpisode$episode$streams) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$streams;

  factory CopyWith$Query$FetchEpisode$episode$streams.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$streams;

  TRes call({
    Enum$StreamType? type,
    String? url,
    List<Enum$Language>? audioLanguages,
    List<Enum$Language>? subtitleLanguages,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchEpisode$episode$streams<TRes>
    implements CopyWith$Query$FetchEpisode$episode$streams<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$streams(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$streams _instance;

  final TRes Function(Query$FetchEpisode$episode$streams) _then;

  static const _undefined = {};

  TRes call({
    Object? type = _undefined,
    Object? url = _undefined,
    Object? audioLanguages = _undefined,
    Object? subtitleLanguages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$streams(
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$StreamType),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        audioLanguages: audioLanguages == _undefined || audioLanguages == null
            ? _instance.audioLanguages
            : (audioLanguages as List<Enum$Language>),
        subtitleLanguages:
            subtitleLanguages == _undefined || subtitleLanguages == null
                ? _instance.subtitleLanguages
                : (subtitleLanguages as List<Enum$Language>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$streams<TRes>
    implements CopyWith$Query$FetchEpisode$episode$streams<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$streams(this._res);

  TRes _res;

  call({
    Enum$StreamType? type,
    String? url,
    List<Enum$Language>? audioLanguages,
    List<Enum$Language>? subtitleLanguages,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchEpisode$episode$season {
  Query$FetchEpisode$episode$season({
    required this.id,
    required this.title,
    required this.number,
    required this.episodes,
    required this.$show,
    required this.$__typename,
  });

  factory Query$FetchEpisode$episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$number = json['number'];
    final l$episodes = json['episodes'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$season(
      id: (l$id as String),
      title: (l$title as String),
      number: (l$number as int),
      episodes: Query$FetchEpisode$episode$season$episodes.fromJson(
          (l$episodes as Map<String, dynamic>)),
      $show: Query$FetchEpisode$episode$season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final int number;

  final Query$FetchEpisode$episode$season$episodes episodes;

  final Query$FetchEpisode$episode$season$show $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes.toJson();
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$number = number;
    final l$episodes = episodes;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$number,
      l$episodes,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode$season) ||
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
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    final l$episodes = episodes;
    final lOther$episodes = other.episodes;
    if (l$episodes != lOther$episodes) {
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

extension UtilityExtension$Query$FetchEpisode$episode$season
    on Query$FetchEpisode$episode$season {
  CopyWith$Query$FetchEpisode$episode$season<Query$FetchEpisode$episode$season>
      get copyWith => CopyWith$Query$FetchEpisode$episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$season<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$season(
    Query$FetchEpisode$episode$season instance,
    TRes Function(Query$FetchEpisode$episode$season) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$season;

  factory CopyWith$Query$FetchEpisode$episode$season.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$season;

  TRes call({
    String? id,
    String? title,
    int? number,
    Query$FetchEpisode$episode$season$episodes? episodes,
    Query$FetchEpisode$episode$season$show? $show,
    String? $__typename,
  });
  CopyWith$Query$FetchEpisode$episode$season$episodes<TRes> get episodes;
  CopyWith$Query$FetchEpisode$episode$season$show<TRes> get $show;
}

class _CopyWithImpl$Query$FetchEpisode$episode$season<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$season(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$season _instance;

  final TRes Function(Query$FetchEpisode$episode$season) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? number = _undefined,
    Object? episodes = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$season(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        episodes: episodes == _undefined || episodes == null
            ? _instance.episodes
            : (episodes as Query$FetchEpisode$episode$season$episodes),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Query$FetchEpisode$episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchEpisode$episode$season$episodes<TRes> get episodes {
    final local$episodes = _instance.episodes;
    return CopyWith$Query$FetchEpisode$episode$season$episodes(
        local$episodes, (e) => call(episodes: e));
  }

  CopyWith$Query$FetchEpisode$episode$season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$FetchEpisode$episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$season<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$season(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    int? number,
    Query$FetchEpisode$episode$season$episodes? episodes,
    Query$FetchEpisode$episode$season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchEpisode$episode$season$episodes<TRes> get episodes =>
      CopyWith$Query$FetchEpisode$episode$season$episodes.stub(_res);
  CopyWith$Query$FetchEpisode$episode$season$show<TRes> get $show =>
      CopyWith$Query$FetchEpisode$episode$season$show.stub(_res);
}

class Query$FetchEpisode$episode$season$episodes {
  Query$FetchEpisode$episode$season$episodes({
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchEpisode$episode$season$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$season$episodes(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$SeasonListEpisode.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$SeasonListEpisode> items;

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
    if (!(other is Query$FetchEpisode$episode$season$episodes) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$season$episodes
    on Query$FetchEpisode$episode$season$episodes {
  CopyWith$Query$FetchEpisode$episode$season$episodes<
          Query$FetchEpisode$episode$season$episodes>
      get copyWith => CopyWith$Query$FetchEpisode$episode$season$episodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$season$episodes<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$season$episodes(
    Query$FetchEpisode$episode$season$episodes instance,
    TRes Function(Query$FetchEpisode$episode$season$episodes) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$season$episodes;

  factory CopyWith$Query$FetchEpisode$episode$season$episodes.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$season$episodes;

  TRes call({
    List<Fragment$SeasonListEpisode>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$SeasonListEpisode> Function(
              Iterable<
                  CopyWith$Fragment$SeasonListEpisode<
                      Fragment$SeasonListEpisode>>)
          _fn);
}

class _CopyWithImpl$Query$FetchEpisode$episode$season$episodes<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season$episodes<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$season$episodes(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$season$episodes _instance;

  final TRes Function(Query$FetchEpisode$episode$season$episodes) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$season$episodes(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$SeasonListEpisode>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$SeasonListEpisode> Function(
                  Iterable<
                      CopyWith$Fragment$SeasonListEpisode<
                          Fragment$SeasonListEpisode>>)
              _fn) =>
      call(
          items: _fn(
              _instance.items.map((e) => CopyWith$Fragment$SeasonListEpisode(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$season$episodes<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season$episodes<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$season$episodes(this._res);

  TRes _res;

  call({
    List<Fragment$SeasonListEpisode>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchEpisode$episode$season$show {
  Query$FetchEpisode$episode$season$show({
    required this.title,
    required this.type,
    required this.seasons,
    required this.$__typename,
  });

  factory Query$FetchEpisode$episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$type = json['type'];
    final l$seasons = json['seasons'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$season$show(
      title: (l$title as String),
      type: fromJson$Enum$ShowType((l$type as String)),
      seasons: Query$FetchEpisode$episode$season$show$seasons.fromJson(
          (l$seasons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final Enum$ShowType type;

  final Query$FetchEpisode$episode$season$show$seasons seasons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$type = type;
    _resultData['type'] = toJson$Enum$ShowType(l$type);
    final l$seasons = seasons;
    _resultData['seasons'] = l$seasons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$type = type;
    final l$seasons = seasons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$type,
      l$seasons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode$season$show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
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

extension UtilityExtension$Query$FetchEpisode$episode$season$show
    on Query$FetchEpisode$episode$season$show {
  CopyWith$Query$FetchEpisode$episode$season$show<
          Query$FetchEpisode$episode$season$show>
      get copyWith => CopyWith$Query$FetchEpisode$episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$season$show<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$season$show(
    Query$FetchEpisode$episode$season$show instance,
    TRes Function(Query$FetchEpisode$episode$season$show) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$season$show;

  factory CopyWith$Query$FetchEpisode$episode$season$show.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$season$show;

  TRes call({
    String? title,
    Enum$ShowType? type,
    Query$FetchEpisode$episode$season$show$seasons? seasons,
    String? $__typename,
  });
  CopyWith$Query$FetchEpisode$episode$season$show$seasons<TRes> get seasons;
}

class _CopyWithImpl$Query$FetchEpisode$episode$season$show<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season$show<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$season$show(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$season$show _instance;

  final TRes Function(Query$FetchEpisode$episode$season$show) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? type = _undefined,
    Object? seasons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$ShowType),
        seasons: seasons == _undefined || seasons == null
            ? _instance.seasons
            : (seasons as Query$FetchEpisode$episode$season$show$seasons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchEpisode$episode$season$show$seasons<TRes> get seasons {
    final local$seasons = _instance.seasons;
    return CopyWith$Query$FetchEpisode$episode$season$show$seasons(
        local$seasons, (e) => call(seasons: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$season$show<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season$show<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$season$show(this._res);

  TRes _res;

  call({
    String? title,
    Enum$ShowType? type,
    Query$FetchEpisode$episode$season$show$seasons? seasons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchEpisode$episode$season$show$seasons<TRes> get seasons =>
      CopyWith$Query$FetchEpisode$episode$season$show$seasons.stub(_res);
}

class Query$FetchEpisode$episode$season$show$seasons {
  Query$FetchEpisode$episode$season$show$seasons({
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchEpisode$episode$season$show$seasons.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$season$show$seasons(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchEpisode$episode$season$show$seasons$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FetchEpisode$episode$season$show$seasons$items> items;

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
    if (!(other is Query$FetchEpisode$episode$season$show$seasons) ||
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

extension UtilityExtension$Query$FetchEpisode$episode$season$show$seasons
    on Query$FetchEpisode$episode$season$show$seasons {
  CopyWith$Query$FetchEpisode$episode$season$show$seasons<
          Query$FetchEpisode$episode$season$show$seasons>
      get copyWith => CopyWith$Query$FetchEpisode$episode$season$show$seasons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$season$show$seasons<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$season$show$seasons(
    Query$FetchEpisode$episode$season$show$seasons instance,
    TRes Function(Query$FetchEpisode$episode$season$show$seasons) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$season$show$seasons;

  factory CopyWith$Query$FetchEpisode$episode$season$show$seasons.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$season$show$seasons;

  TRes call({
    List<Query$FetchEpisode$episode$season$show$seasons$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchEpisode$episode$season$show$seasons$items> Function(
              Iterable<
                  CopyWith$Query$FetchEpisode$episode$season$show$seasons$items<
                      Query$FetchEpisode$episode$season$show$seasons$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchEpisode$episode$season$show$seasons<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season$show$seasons<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$season$show$seasons(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$season$show$seasons _instance;

  final TRes Function(Query$FetchEpisode$episode$season$show$seasons) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$season$show$seasons(
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as List<Query$FetchEpisode$episode$season$show$seasons$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchEpisode$episode$season$show$seasons$items> Function(
                  Iterable<
                      CopyWith$Query$FetchEpisode$episode$season$show$seasons$items<
                          Query$FetchEpisode$episode$season$show$seasons$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchEpisode$episode$season$show$seasons$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$season$show$seasons<TRes>
    implements CopyWith$Query$FetchEpisode$episode$season$show$seasons<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$season$show$seasons(this._res);

  TRes _res;

  call({
    List<Query$FetchEpisode$episode$season$show$seasons$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchEpisode$episode$season$show$seasons$items {
  Query$FetchEpisode$episode$season$show$seasons$items({
    required this.id,
    required this.title,
    required this.$__typename,
  });

  factory Query$FetchEpisode$episode$season$show$seasons$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode$season$show$seasons$items(
      id: (l$id as String),
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchEpisode$episode$season$show$seasons$items) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchEpisode$episode$season$show$seasons$items
    on Query$FetchEpisode$episode$season$show$seasons$items {
  CopyWith$Query$FetchEpisode$episode$season$show$seasons$items<
          Query$FetchEpisode$episode$season$show$seasons$items>
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$season$show$seasons$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchEpisode$episode$season$show$seasons$items<
    TRes> {
  factory CopyWith$Query$FetchEpisode$episode$season$show$seasons$items(
    Query$FetchEpisode$episode$season$show$seasons$items instance,
    TRes Function(Query$FetchEpisode$episode$season$show$seasons$items) then,
  ) = _CopyWithImpl$Query$FetchEpisode$episode$season$show$seasons$items;

  factory CopyWith$Query$FetchEpisode$episode$season$show$seasons$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$season$show$seasons$items;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchEpisode$episode$season$show$seasons$items<TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$season$show$seasons$items<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$season$show$seasons$items(
    this._instance,
    this._then,
  );

  final Query$FetchEpisode$episode$season$show$seasons$items _instance;

  final TRes Function(Query$FetchEpisode$episode$season$show$seasons$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchEpisode$episode$season$show$seasons$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$season$show$seasons$items<
        TRes>
    implements
        CopyWith$Query$FetchEpisode$episode$season$show$seasons$items<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$season$show$seasons$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$legacyIDLookup {
  factory Variables$Query$legacyIDLookup({
    int? episodeId,
    int? programId,
  }) =>
      Variables$Query$legacyIDLookup._({
        if (episodeId != null) r'episodeId': episodeId,
        if (programId != null) r'programId': programId,
      });

  Variables$Query$legacyIDLookup._(this._$data);

  factory Variables$Query$legacyIDLookup.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('episodeId')) {
      final l$episodeId = data['episodeId'];
      result$data['episodeId'] = (l$episodeId as int?);
    }
    if (data.containsKey('programId')) {
      final l$programId = data['programId'];
      result$data['programId'] = (l$programId as int?);
    }
    return Variables$Query$legacyIDLookup._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get episodeId => (_$data['episodeId'] as int?);
  int? get programId => (_$data['programId'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('episodeId')) {
      final l$episodeId = episodeId;
      result$data['episodeId'] = l$episodeId;
    }
    if (_$data.containsKey('programId')) {
      final l$programId = programId;
      result$data['programId'] = l$programId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$legacyIDLookup<Variables$Query$legacyIDLookup>
      get copyWith => CopyWith$Variables$Query$legacyIDLookup(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$legacyIDLookup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$episodeId = episodeId;
    final lOther$episodeId = other.episodeId;
    if (_$data.containsKey('episodeId') !=
        other._$data.containsKey('episodeId')) {
      return false;
    }
    if (l$episodeId != lOther$episodeId) {
      return false;
    }
    final l$programId = programId;
    final lOther$programId = other.programId;
    if (_$data.containsKey('programId') !=
        other._$data.containsKey('programId')) {
      return false;
    }
    if (l$programId != lOther$programId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$episodeId = episodeId;
    final l$programId = programId;
    return Object.hashAll([
      _$data.containsKey('episodeId') ? l$episodeId : const {},
      _$data.containsKey('programId') ? l$programId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$legacyIDLookup<TRes> {
  factory CopyWith$Variables$Query$legacyIDLookup(
    Variables$Query$legacyIDLookup instance,
    TRes Function(Variables$Query$legacyIDLookup) then,
  ) = _CopyWithImpl$Variables$Query$legacyIDLookup;

  factory CopyWith$Variables$Query$legacyIDLookup.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$legacyIDLookup;

  TRes call({
    int? episodeId,
    int? programId,
  });
}

class _CopyWithImpl$Variables$Query$legacyIDLookup<TRes>
    implements CopyWith$Variables$Query$legacyIDLookup<TRes> {
  _CopyWithImpl$Variables$Query$legacyIDLookup(
    this._instance,
    this._then,
  );

  final Variables$Query$legacyIDLookup _instance;

  final TRes Function(Variables$Query$legacyIDLookup) _then;

  static const _undefined = {};

  TRes call({
    Object? episodeId = _undefined,
    Object? programId = _undefined,
  }) =>
      _then(Variables$Query$legacyIDLookup._({
        ..._instance._$data,
        if (episodeId != _undefined) 'episodeId': (episodeId as int?),
        if (programId != _undefined) 'programId': (programId as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$legacyIDLookup<TRes>
    implements CopyWith$Variables$Query$legacyIDLookup<TRes> {
  _CopyWithStubImpl$Variables$Query$legacyIDLookup(this._res);

  TRes _res;

  call({
    int? episodeId,
    int? programId,
  }) =>
      _res;
}

class Query$legacyIDLookup {
  Query$legacyIDLookup({
    required this.legacyIDLookup,
    required this.$__typename,
  });

  factory Query$legacyIDLookup.fromJson(Map<String, dynamic> json) {
    final l$legacyIDLookup = json['legacyIDLookup'];
    final l$$__typename = json['__typename'];
    return Query$legacyIDLookup(
      legacyIDLookup: Query$legacyIDLookup$legacyIDLookup.fromJson(
          (l$legacyIDLookup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$legacyIDLookup$legacyIDLookup legacyIDLookup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$legacyIDLookup = legacyIDLookup;
    _resultData['legacyIDLookup'] = l$legacyIDLookup.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$legacyIDLookup = legacyIDLookup;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$legacyIDLookup,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$legacyIDLookup) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$legacyIDLookup = legacyIDLookup;
    final lOther$legacyIDLookup = other.legacyIDLookup;
    if (l$legacyIDLookup != lOther$legacyIDLookup) {
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

extension UtilityExtension$Query$legacyIDLookup on Query$legacyIDLookup {
  CopyWith$Query$legacyIDLookup<Query$legacyIDLookup> get copyWith =>
      CopyWith$Query$legacyIDLookup(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$legacyIDLookup<TRes> {
  factory CopyWith$Query$legacyIDLookup(
    Query$legacyIDLookup instance,
    TRes Function(Query$legacyIDLookup) then,
  ) = _CopyWithImpl$Query$legacyIDLookup;

  factory CopyWith$Query$legacyIDLookup.stub(TRes res) =
      _CopyWithStubImpl$Query$legacyIDLookup;

  TRes call({
    Query$legacyIDLookup$legacyIDLookup? legacyIDLookup,
    String? $__typename,
  });
  CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> get legacyIDLookup;
}

class _CopyWithImpl$Query$legacyIDLookup<TRes>
    implements CopyWith$Query$legacyIDLookup<TRes> {
  _CopyWithImpl$Query$legacyIDLookup(
    this._instance,
    this._then,
  );

  final Query$legacyIDLookup _instance;

  final TRes Function(Query$legacyIDLookup) _then;

  static const _undefined = {};

  TRes call({
    Object? legacyIDLookup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$legacyIDLookup(
        legacyIDLookup: legacyIDLookup == _undefined || legacyIDLookup == null
            ? _instance.legacyIDLookup
            : (legacyIDLookup as Query$legacyIDLookup$legacyIDLookup),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> get legacyIDLookup {
    final local$legacyIDLookup = _instance.legacyIDLookup;
    return CopyWith$Query$legacyIDLookup$legacyIDLookup(
        local$legacyIDLookup, (e) => call(legacyIDLookup: e));
  }
}

class _CopyWithStubImpl$Query$legacyIDLookup<TRes>
    implements CopyWith$Query$legacyIDLookup<TRes> {
  _CopyWithStubImpl$Query$legacyIDLookup(this._res);

  TRes _res;

  call({
    Query$legacyIDLookup$legacyIDLookup? legacyIDLookup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> get legacyIDLookup =>
      CopyWith$Query$legacyIDLookup$legacyIDLookup.stub(_res);
}

const documentNodeQuerylegacyIDLookup = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'legacyIDLookup'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'episodeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'programId')),
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
        name: NameNode(value: 'legacyIDLookup'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'options'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'episodeID'),
                value: VariableNode(name: NameNode(value: 'episodeId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'programID'),
                value: VariableNode(name: NameNode(value: 'programId')),
              ),
            ]),
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
Query$legacyIDLookup _parserFn$Query$legacyIDLookup(
        Map<String, dynamic> data) =>
    Query$legacyIDLookup.fromJson(data);

class Options$Query$legacyIDLookup
    extends graphql.QueryOptions<Query$legacyIDLookup> {
  Options$Query$legacyIDLookup({
    String? operationName,
    Variables$Query$legacyIDLookup? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerylegacyIDLookup,
          parserFn: _parserFn$Query$legacyIDLookup,
        );
}

class WatchOptions$Query$legacyIDLookup
    extends graphql.WatchQueryOptions<Query$legacyIDLookup> {
  WatchOptions$Query$legacyIDLookup({
    String? operationName,
    Variables$Query$legacyIDLookup? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerylegacyIDLookup,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$legacyIDLookup,
        );
}

class FetchMoreOptions$Query$legacyIDLookup extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$legacyIDLookup({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$legacyIDLookup? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerylegacyIDLookup,
        );
}

extension ClientExtension$Query$legacyIDLookup on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$legacyIDLookup>> query$legacyIDLookup(
          [Options$Query$legacyIDLookup? options]) async =>
      await this.query(options ?? Options$Query$legacyIDLookup());
  graphql.ObservableQuery<Query$legacyIDLookup> watchQuery$legacyIDLookup(
          [WatchOptions$Query$legacyIDLookup? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$legacyIDLookup());
  void writeQuery$legacyIDLookup({
    required Query$legacyIDLookup data,
    Variables$Query$legacyIDLookup? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerylegacyIDLookup),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$legacyIDLookup? readQuery$legacyIDLookup({
    Variables$Query$legacyIDLookup? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerylegacyIDLookup),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$legacyIDLookup.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$legacyIDLookup> useQuery$legacyIDLookup(
        [Options$Query$legacyIDLookup? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$legacyIDLookup());
graphql.ObservableQuery<Query$legacyIDLookup> useWatchQuery$legacyIDLookup(
        [WatchOptions$Query$legacyIDLookup? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$legacyIDLookup());

class Query$legacyIDLookup$Widget
    extends graphql_flutter.Query<Query$legacyIDLookup> {
  Query$legacyIDLookup$Widget({
    widgets.Key? key,
    Options$Query$legacyIDLookup? options,
    required graphql_flutter.QueryBuilder<Query$legacyIDLookup> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$legacyIDLookup(),
          builder: builder,
        );
}

class Query$legacyIDLookup$legacyIDLookup {
  Query$legacyIDLookup$legacyIDLookup({
    required this.id,
    required this.$__typename,
  });

  factory Query$legacyIDLookup$legacyIDLookup.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$legacyIDLookup$legacyIDLookup(
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
    if (!(other is Query$legacyIDLookup$legacyIDLookup) ||
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

extension UtilityExtension$Query$legacyIDLookup$legacyIDLookup
    on Query$legacyIDLookup$legacyIDLookup {
  CopyWith$Query$legacyIDLookup$legacyIDLookup<
          Query$legacyIDLookup$legacyIDLookup>
      get copyWith => CopyWith$Query$legacyIDLookup$legacyIDLookup(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> {
  factory CopyWith$Query$legacyIDLookup$legacyIDLookup(
    Query$legacyIDLookup$legacyIDLookup instance,
    TRes Function(Query$legacyIDLookup$legacyIDLookup) then,
  ) = _CopyWithImpl$Query$legacyIDLookup$legacyIDLookup;

  factory CopyWith$Query$legacyIDLookup$legacyIDLookup.stub(TRes res) =
      _CopyWithStubImpl$Query$legacyIDLookup$legacyIDLookup;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$legacyIDLookup$legacyIDLookup<TRes>
    implements CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> {
  _CopyWithImpl$Query$legacyIDLookup$legacyIDLookup(
    this._instance,
    this._then,
  );

  final Query$legacyIDLookup$legacyIDLookup _instance;

  final TRes Function(Query$legacyIDLookup$legacyIDLookup) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$legacyIDLookup$legacyIDLookup(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$legacyIDLookup$legacyIDLookup<TRes>
    implements CopyWith$Query$legacyIDLookup$legacyIDLookup<TRes> {
  _CopyWithStubImpl$Query$legacyIDLookup$legacyIDLookup(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
