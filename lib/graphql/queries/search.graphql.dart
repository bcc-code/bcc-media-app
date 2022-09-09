import '../schema/schema.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

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
      get copyWith => CopyWith$Variables$Query$FetchEpisode(this, (i) => i);
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
          TRes Function(Variables$Query$FetchEpisode) then) =
      _CopyWithImpl$Variables$Query$FetchEpisode;

  factory CopyWith$Variables$Query$FetchEpisode.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$FetchEpisode;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$FetchEpisode<TRes>
    implements CopyWith$Variables$Query$FetchEpisode<TRes> {
  _CopyWithImpl$Variables$Query$FetchEpisode(this._instance, this._then);

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
  Query$FetchEpisode({this.episode, required this.$__typename});

  factory Query$FetchEpisode.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode(
        episode: l$episode == null
            ? null
            : Query$FetchEpisode$episode.fromJson(
                (l$episode as Map<String, dynamic>)),
        $__typename: (l$$__typename as String));
  }

  final Query$FetchEpisode$episode? episode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episode = episode;
    _resultData['episode'] = l$episode?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([l$episode, l$$__typename]);
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
      CopyWith$Query$FetchEpisode(this, (i) => i);
}

abstract class CopyWith$Query$FetchEpisode<TRes> {
  factory CopyWith$Query$FetchEpisode(
          Query$FetchEpisode instance, TRes Function(Query$FetchEpisode) then) =
      _CopyWithImpl$Query$FetchEpisode;

  factory CopyWith$Query$FetchEpisode.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode;

  TRes call({Query$FetchEpisode$episode? episode, String? $__typename});
  CopyWith$Query$FetchEpisode$episode<TRes> get episode;
}

class _CopyWithImpl$Query$FetchEpisode<TRes>
    implements CopyWith$Query$FetchEpisode<TRes> {
  _CopyWithImpl$Query$FetchEpisode(this._instance, this._then);

  final Query$FetchEpisode _instance;

  final TRes Function(Query$FetchEpisode) _then;

  static const _undefined = {};

  TRes call({Object? episode = _undefined, Object? $__typename = _undefined}) =>
      _then(Query$FetchEpisode(
          episode: episode == _undefined
              ? _instance.episode
              : (episode as Query$FetchEpisode$episode?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  CopyWith$Query$FetchEpisode$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return local$episode == null
        ? CopyWith$Query$FetchEpisode$episode.stub(_then(_instance))
        : CopyWith$Query$FetchEpisode$episode(
            local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$FetchEpisode<TRes>
    implements CopyWith$Query$FetchEpisode<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode(this._res);

  TRes _res;

  call({Query$FetchEpisode$episode? episode, String? $__typename}) => _res;
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
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'episode'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'id')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'extraDescription'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'imageUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
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
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'url'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'audioLanguages'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'subtitleLanguages'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
]);
Query$FetchEpisode _parserFn$Query$FetchEpisode(Map<String, dynamic> data) =>
    Query$FetchEpisode.fromJson(data);

class Options$Query$FetchEpisode
    extends graphql.QueryOptions<Query$FetchEpisode> {
  Options$Query$FetchEpisode(
      {String? operationName,
      required Variables$Query$FetchEpisode variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: documentNodeQueryFetchEpisode,
            parserFn: _parserFn$Query$FetchEpisode);
}

class WatchOptions$Query$FetchEpisode
    extends graphql.WatchQueryOptions<Query$FetchEpisode> {
  WatchOptions$Query$FetchEpisode(
      {String? operationName,
      required Variables$Query$FetchEpisode variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
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
            parserFn: _parserFn$Query$FetchEpisode);
}

class FetchMoreOptions$Query$FetchEpisode extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FetchEpisode(
      {required graphql.UpdateQuery updateQuery,
      required Variables$Query$FetchEpisode variables})
      : super(
            updateQuery: updateQuery,
            variables: variables.toJson(),
            document: documentNodeQueryFetchEpisode);
}

extension ClientExtension$Query$FetchEpisode on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FetchEpisode>> query$FetchEpisode(
          Options$Query$FetchEpisode options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$FetchEpisode> watchQuery$FetchEpisode(
          WatchOptions$Query$FetchEpisode options) =>
      this.watchQuery(options);
  void writeQuery$FetchEpisode(
          {required Query$FetchEpisode data,
          required Variables$Query$FetchEpisode variables,
          bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation:
                  graphql.Operation(document: documentNodeQueryFetchEpisode),
              variables: variables.toJson()),
          data: data.toJson(),
          broadcast: broadcast);
  Query$FetchEpisode? readQuery$FetchEpisode(
      {required Variables$Query$FetchEpisode variables,
      bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryFetchEpisode),
            variables: variables.toJson()),
        optimistic: optimistic);
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
  Query$FetchEpisode$Widget(
      {widgets.Key? key,
      required Options$Query$FetchEpisode options,
      required graphql_flutter.QueryBuilder<Query$FetchEpisode> builder})
      : super(key: key, options: options, builder: builder);
}

class Query$FetchEpisode$episode {
  Query$FetchEpisode$episode(
      {required this.id,
      required this.title,
      required this.description,
      required this.extraDescription,
      this.imageUrl,
      required this.streams,
      required this.$__typename});

  factory Query$FetchEpisode$episode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$extraDescription = json['extraDescription'];
    final l$imageUrl = json['imageUrl'];
    final l$streams = json['streams'];
    final l$$__typename = json['__typename'];
    return Query$FetchEpisode$episode(
        id: (l$id as String),
        title: (l$title as String),
        description: (l$description as String),
        extraDescription: (l$extraDescription as String),
        imageUrl: (l$imageUrl as String?),
        streams: (l$streams as List<dynamic>)
            .map((e) => Query$FetchEpisode$episode$streams.fromJson(
                (e as Map<String, dynamic>)))
            .toList(),
        $__typename: (l$$__typename as String));
  }

  final String id;

  final String title;

  final String description;

  final String extraDescription;

  final String? imageUrl;

  final List<Query$FetchEpisode$episode$streams> streams;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$extraDescription = extraDescription;
    _resultData['extraDescription'] = l$extraDescription;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$streams = streams;
    _resultData['streams'] = l$streams.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$extraDescription = extraDescription;
    final l$imageUrl = imageUrl;
    final l$streams = streams;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$extraDescription,
      l$imageUrl,
      Object.hashAll(l$streams.map((v) => v)),
      l$$__typename
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
      get copyWith => CopyWith$Query$FetchEpisode$episode(this, (i) => i);
}

abstract class CopyWith$Query$FetchEpisode$episode<TRes> {
  factory CopyWith$Query$FetchEpisode$episode(
          Query$FetchEpisode$episode instance,
          TRes Function(Query$FetchEpisode$episode) then) =
      _CopyWithImpl$Query$FetchEpisode$episode;

  factory CopyWith$Query$FetchEpisode$episode.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode;

  TRes call(
      {String? id,
      String? title,
      String? description,
      String? extraDescription,
      String? imageUrl,
      List<Query$FetchEpisode$episode$streams>? streams,
      String? $__typename});
  TRes streams(
      Iterable<Query$FetchEpisode$episode$streams> Function(
              Iterable<
                  CopyWith$Query$FetchEpisode$episode$streams<
                      Query$FetchEpisode$episode$streams>>)
          _fn);
}

class _CopyWithImpl$Query$FetchEpisode$episode<TRes>
    implements CopyWith$Query$FetchEpisode$episode<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode(this._instance, this._then);

  final Query$FetchEpisode$episode _instance;

  final TRes Function(Query$FetchEpisode$episode) _then;

  static const _undefined = {};

  TRes call(
          {Object? id = _undefined,
          Object? title = _undefined,
          Object? description = _undefined,
          Object? extraDescription = _undefined,
          Object? imageUrl = _undefined,
          Object? streams = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Query$FetchEpisode$episode(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          title: title == _undefined || title == null
              ? _instance.title
              : (title as String),
          description: description == _undefined || description == null
              ? _instance.description
              : (description as String),
          extraDescription:
              extraDescription == _undefined || extraDescription == null
                  ? _instance.extraDescription
                  : (extraDescription as String),
          imageUrl: imageUrl == _undefined
              ? _instance.imageUrl
              : (imageUrl as String?),
          streams: streams == _undefined || streams == null
              ? _instance.streams
              : (streams as List<Query$FetchEpisode$episode$streams>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes streams(
          Iterable<Query$FetchEpisode$episode$streams> Function(
                  Iterable<
                      CopyWith$Query$FetchEpisode$episode$streams<
                          Query$FetchEpisode$episode$streams>>)
              _fn) =>
      call(
          streams: _fn(_instance.streams.map((e) =>
                  CopyWith$Query$FetchEpisode$episode$streams(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Query$FetchEpisode$episode<TRes>
    implements CopyWith$Query$FetchEpisode$episode<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode(this._res);

  TRes _res;

  call(
          {String? id,
          String? title,
          String? description,
          String? extraDescription,
          String? imageUrl,
          List<Query$FetchEpisode$episode$streams>? streams,
          String? $__typename}) =>
      _res;
  streams(_fn) => _res;
}

class Query$FetchEpisode$episode$streams {
  Query$FetchEpisode$episode$streams(
      {required this.type,
      required this.url,
      required this.audioLanguages,
      required this.subtitleLanguages,
      required this.$__typename});

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
        $__typename: (l$$__typename as String));
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
      l$$__typename
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
      get copyWith =>
          CopyWith$Query$FetchEpisode$episode$streams(this, (i) => i);
}

abstract class CopyWith$Query$FetchEpisode$episode$streams<TRes> {
  factory CopyWith$Query$FetchEpisode$episode$streams(
          Query$FetchEpisode$episode$streams instance,
          TRes Function(Query$FetchEpisode$episode$streams) then) =
      _CopyWithImpl$Query$FetchEpisode$episode$streams;

  factory CopyWith$Query$FetchEpisode$episode$streams.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchEpisode$episode$streams;

  TRes call(
      {Enum$StreamType? type,
      String? url,
      List<Enum$Language>? audioLanguages,
      List<Enum$Language>? subtitleLanguages,
      String? $__typename});
}

class _CopyWithImpl$Query$FetchEpisode$episode$streams<TRes>
    implements CopyWith$Query$FetchEpisode$episode$streams<TRes> {
  _CopyWithImpl$Query$FetchEpisode$episode$streams(this._instance, this._then);

  final Query$FetchEpisode$episode$streams _instance;

  final TRes Function(Query$FetchEpisode$episode$streams) _then;

  static const _undefined = {};

  TRes call(
          {Object? type = _undefined,
          Object? url = _undefined,
          Object? audioLanguages = _undefined,
          Object? subtitleLanguages = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Query$FetchEpisode$episode$streams(
          type: type == _undefined || type == null
              ? _instance.type
              : (type as Enum$StreamType),
          url: url == _undefined || url == null
              ? _instance.url
              : (url as String),
          audioLanguages: audioLanguages == _undefined || audioLanguages == null
              ? _instance.audioLanguages
              : (audioLanguages as List<Enum$Language>),
          subtitleLanguages:
              subtitleLanguages == _undefined || subtitleLanguages == null
                  ? _instance.subtitleLanguages
                  : (subtitleLanguages as List<Enum$Language>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchEpisode$episode$streams<TRes>
    implements CopyWith$Query$FetchEpisode$episode$streams<TRes> {
  _CopyWithStubImpl$Query$FetchEpisode$episode$streams(this._res);

  TRes _res;

  call(
          {Enum$StreamType? type,
          String? url,
          List<Enum$Language>? audioLanguages,
          List<Enum$Language>? subtitleLanguages,
          String? $__typename}) =>
      _res;
}
