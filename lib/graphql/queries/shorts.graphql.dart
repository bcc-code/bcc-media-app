import 'dart:async';
import 'episode.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$ShortsEpisode implements Fragment$PlayableEpisode {
  Fragment$ShortsEpisode({
    required this.title,
    required this.id,
    required this.cursor,
    this.image,
    required this.streams,
    this.context,
    required this.duration,
    this.season,
    this.$__typename = 'Episode',
  });

  factory Fragment$ShortsEpisode.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$id = json['id'];
    final l$cursor = json['cursor'];
    final l$image = json['image'];
    final l$streams = json['streams'];
    final l$context = json['context'];
    final l$duration = json['duration'];
    final l$season = json['season'];
    final l$$__typename = json['__typename'];
    return Fragment$ShortsEpisode(
      title: (l$title as String),
      id: (l$id as String),
      cursor: (l$cursor as String),
      image: (l$image as String?),
      streams: (l$streams as List<dynamic>)
          .map(
              (e) => Fragment$BasicStream.fromJson((e as Map<String, dynamic>)))
          .toList(),
      context: l$context == null
          ? null
          : Fragment$ShortsEpisode$context.fromJson(
              (l$context as Map<String, dynamic>)),
      duration: (l$duration as int),
      season: l$season == null
          ? null
          : Fragment$ShortsEpisode$season.fromJson(
              (l$season as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String id;

  final String cursor;

  final String? image;

  final List<Fragment$BasicStream> streams;

  final Fragment$ShortsEpisode$context? context;

  final int duration;

  final Fragment$ShortsEpisode$season? season;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$streams = streams;
    _resultData['streams'] = l$streams.map((e) => e.toJson()).toList();
    final l$context = context;
    _resultData['context'] = l$context?.toJson();
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$id = id;
    final l$cursor = cursor;
    final l$image = image;
    final l$streams = streams;
    final l$context = context;
    final l$duration = duration;
    final l$season = season;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$id,
      l$cursor,
      l$image,
      Object.hashAll(l$streams.map((v) => v)),
      l$context,
      l$duration,
      l$season,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ShortsEpisode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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
    final l$context = context;
    final lOther$context = other.context;
    if (l$context != lOther$context) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
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

extension UtilityExtension$Fragment$ShortsEpisode on Fragment$ShortsEpisode {
  CopyWith$Fragment$ShortsEpisode<Fragment$ShortsEpisode> get copyWith =>
      CopyWith$Fragment$ShortsEpisode(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ShortsEpisode<TRes> {
  factory CopyWith$Fragment$ShortsEpisode(
    Fragment$ShortsEpisode instance,
    TRes Function(Fragment$ShortsEpisode) then,
  ) = _CopyWithImpl$Fragment$ShortsEpisode;

  factory CopyWith$Fragment$ShortsEpisode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ShortsEpisode;

  TRes call({
    String? title,
    String? id,
    String? cursor,
    String? image,
    List<Fragment$BasicStream>? streams,
    Fragment$ShortsEpisode$context? context,
    int? duration,
    Fragment$ShortsEpisode$season? season,
    String? $__typename,
  });
  TRes streams(
      Iterable<Fragment$BasicStream> Function(
              Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
          _fn);
  CopyWith$Fragment$ShortsEpisode$context<TRes> get context;
  CopyWith$Fragment$ShortsEpisode$season<TRes> get season;
}

class _CopyWithImpl$Fragment$ShortsEpisode<TRes>
    implements CopyWith$Fragment$ShortsEpisode<TRes> {
  _CopyWithImpl$Fragment$ShortsEpisode(
    this._instance,
    this._then,
  );

  final Fragment$ShortsEpisode _instance;

  final TRes Function(Fragment$ShortsEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? id = _undefined,
    Object? cursor = _undefined,
    Object? image = _undefined,
    Object? streams = _undefined,
    Object? context = _undefined,
    Object? duration = _undefined,
    Object? season = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ShortsEpisode(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        image: image == _undefined ? _instance.image : (image as String?),
        streams: streams == _undefined || streams == null
            ? _instance.streams
            : (streams as List<Fragment$BasicStream>),
        context: context == _undefined
            ? _instance.context
            : (context as Fragment$ShortsEpisode$context?),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        season: season == _undefined
            ? _instance.season
            : (season as Fragment$ShortsEpisode$season?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes streams(
          Iterable<Fragment$BasicStream> Function(
                  Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
              _fn) =>
      call(
          streams:
              _fn(_instance.streams.map((e) => CopyWith$Fragment$BasicStream(
                    e,
                    (i) => i,
                  ))).toList());
  CopyWith$Fragment$ShortsEpisode$context<TRes> get context {
    final local$context = _instance.context;
    return local$context == null
        ? CopyWith$Fragment$ShortsEpisode$context.stub(_then(_instance))
        : CopyWith$Fragment$ShortsEpisode$context(
            local$context, (e) => call(context: e));
  }

  CopyWith$Fragment$ShortsEpisode$season<TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$ShortsEpisode$season.stub(_then(_instance))
        : CopyWith$Fragment$ShortsEpisode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$ShortsEpisode<TRes>
    implements CopyWith$Fragment$ShortsEpisode<TRes> {
  _CopyWithStubImpl$Fragment$ShortsEpisode(this._res);

  TRes _res;

  call({
    String? title,
    String? id,
    String? cursor,
    String? image,
    List<Fragment$BasicStream>? streams,
    Fragment$ShortsEpisode$context? context,
    int? duration,
    Fragment$ShortsEpisode$season? season,
    String? $__typename,
  }) =>
      _res;
  streams(_fn) => _res;
  CopyWith$Fragment$ShortsEpisode$context<TRes> get context =>
      CopyWith$Fragment$ShortsEpisode$context.stub(_res);
  CopyWith$Fragment$ShortsEpisode$season<TRes> get season =>
      CopyWith$Fragment$ShortsEpisode$season.stub(_res);
}

const fragmentDefinitionShortsEpisode = FragmentDefinitionNode(
  name: NameNode(value: 'ShortsEpisode'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Episode'),
    isNonNull: false,
  )),
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
      name: NameNode(value: 'id'),
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
      name: NameNode(value: 'image'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FragmentSpreadNode(
      name: NameNode(value: 'PlayableEpisode'),
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
);
const documentNodeFragmentShortsEpisode = DocumentNode(definitions: [
  fragmentDefinitionShortsEpisode,
  fragmentDefinitionPlayableEpisode,
  fragmentDefinitionBasicStream,
]);

extension ClientExtension$Fragment$ShortsEpisode on graphql.GraphQLClient {
  void writeFragment$ShortsEpisode({
    required Fragment$ShortsEpisode data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ShortsEpisode',
            document: documentNodeFragmentShortsEpisode,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ShortsEpisode? readFragment$ShortsEpisode({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ShortsEpisode',
          document: documentNodeFragmentShortsEpisode,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ShortsEpisode.fromJson(result);
  }
}

class Fragment$ShortsEpisode$context
    implements Fragment$PlayableEpisode$context {
  Fragment$ShortsEpisode$context({required this.$__typename});

  factory Fragment$ShortsEpisode$context.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ContextCollection":
        return Fragment$ShortsEpisode$context$$ContextCollection.fromJson(json);

      case "Season":
        return Fragment$ShortsEpisode$context$$Season.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$ShortsEpisode$context(
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
    if (!(other is Fragment$ShortsEpisode$context) ||
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

extension UtilityExtension$Fragment$ShortsEpisode$context
    on Fragment$ShortsEpisode$context {
  CopyWith$Fragment$ShortsEpisode$context<Fragment$ShortsEpisode$context>
      get copyWith => CopyWith$Fragment$ShortsEpisode$context(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(Fragment$ShortsEpisode$context$$ContextCollection)
        contextCollection,
    required _T Function(Fragment$ShortsEpisode$context$$Season) season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        return contextCollection(
            this as Fragment$ShortsEpisode$context$$ContextCollection);

      case "Season":
        return season(this as Fragment$ShortsEpisode$context$$Season);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$ShortsEpisode$context$$ContextCollection)?
        contextCollection,
    _T Function(Fragment$ShortsEpisode$context$$Season)? season,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ContextCollection":
        if (contextCollection != null) {
          return contextCollection(
              this as Fragment$ShortsEpisode$context$$ContextCollection);
        } else {
          return orElse();
        }

      case "Season":
        if (season != null) {
          return season(this as Fragment$ShortsEpisode$context$$Season);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$ShortsEpisode$context<TRes> {
  factory CopyWith$Fragment$ShortsEpisode$context(
    Fragment$ShortsEpisode$context instance,
    TRes Function(Fragment$ShortsEpisode$context) then,
  ) = _CopyWithImpl$Fragment$ShortsEpisode$context;

  factory CopyWith$Fragment$ShortsEpisode$context.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ShortsEpisode$context;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$ShortsEpisode$context<TRes>
    implements CopyWith$Fragment$ShortsEpisode$context<TRes> {
  _CopyWithImpl$Fragment$ShortsEpisode$context(
    this._instance,
    this._then,
  );

  final Fragment$ShortsEpisode$context _instance;

  final TRes Function(Fragment$ShortsEpisode$context) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$ShortsEpisode$context(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ShortsEpisode$context<TRes>
    implements CopyWith$Fragment$ShortsEpisode$context<TRes> {
  _CopyWithStubImpl$Fragment$ShortsEpisode$context(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$ShortsEpisode$context$$ContextCollection
    implements
        Fragment$PlayableEpisode$context$$ContextCollection,
        Fragment$ShortsEpisode$context {
  Fragment$ShortsEpisode$context$$ContextCollection({
    required this.id,
    this.$__typename = 'ContextCollection',
  });

  factory Fragment$ShortsEpisode$context$$ContextCollection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Fragment$ShortsEpisode$context$$ContextCollection(
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
    if (!(other is Fragment$ShortsEpisode$context$$ContextCollection) ||
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

extension UtilityExtension$Fragment$ShortsEpisode$context$$ContextCollection
    on Fragment$ShortsEpisode$context$$ContextCollection {
  CopyWith$Fragment$ShortsEpisode$context$$ContextCollection<
          Fragment$ShortsEpisode$context$$ContextCollection>
      get copyWith =>
          CopyWith$Fragment$ShortsEpisode$context$$ContextCollection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ShortsEpisode$context$$ContextCollection<
    TRes> {
  factory CopyWith$Fragment$ShortsEpisode$context$$ContextCollection(
    Fragment$ShortsEpisode$context$$ContextCollection instance,
    TRes Function(Fragment$ShortsEpisode$context$$ContextCollection) then,
  ) = _CopyWithImpl$Fragment$ShortsEpisode$context$$ContextCollection;

  factory CopyWith$Fragment$ShortsEpisode$context$$ContextCollection.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$ShortsEpisode$context$$ContextCollection;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ShortsEpisode$context$$ContextCollection<TRes>
    implements
        CopyWith$Fragment$ShortsEpisode$context$$ContextCollection<TRes> {
  _CopyWithImpl$Fragment$ShortsEpisode$context$$ContextCollection(
    this._instance,
    this._then,
  );

  final Fragment$ShortsEpisode$context$$ContextCollection _instance;

  final TRes Function(Fragment$ShortsEpisode$context$$ContextCollection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ShortsEpisode$context$$ContextCollection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ShortsEpisode$context$$ContextCollection<TRes>
    implements
        CopyWith$Fragment$ShortsEpisode$context$$ContextCollection<TRes> {
  _CopyWithStubImpl$Fragment$ShortsEpisode$context$$ContextCollection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$ShortsEpisode$context$$Season
    implements
        Fragment$PlayableEpisode$context$$Season,
        Fragment$ShortsEpisode$context {
  Fragment$ShortsEpisode$context$$Season({this.$__typename = 'Season'});

  factory Fragment$ShortsEpisode$context$$Season.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Fragment$ShortsEpisode$context$$Season(
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
    if (!(other is Fragment$ShortsEpisode$context$$Season) ||
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

extension UtilityExtension$Fragment$ShortsEpisode$context$$Season
    on Fragment$ShortsEpisode$context$$Season {
  CopyWith$Fragment$ShortsEpisode$context$$Season<
          Fragment$ShortsEpisode$context$$Season>
      get copyWith => CopyWith$Fragment$ShortsEpisode$context$$Season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ShortsEpisode$context$$Season<TRes> {
  factory CopyWith$Fragment$ShortsEpisode$context$$Season(
    Fragment$ShortsEpisode$context$$Season instance,
    TRes Function(Fragment$ShortsEpisode$context$$Season) then,
  ) = _CopyWithImpl$Fragment$ShortsEpisode$context$$Season;

  factory CopyWith$Fragment$ShortsEpisode$context$$Season.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ShortsEpisode$context$$Season;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$ShortsEpisode$context$$Season<TRes>
    implements CopyWith$Fragment$ShortsEpisode$context$$Season<TRes> {
  _CopyWithImpl$Fragment$ShortsEpisode$context$$Season(
    this._instance,
    this._then,
  );

  final Fragment$ShortsEpisode$context$$Season _instance;

  final TRes Function(Fragment$ShortsEpisode$context$$Season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$ShortsEpisode$context$$Season(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ShortsEpisode$context$$Season<TRes>
    implements CopyWith$Fragment$ShortsEpisode$context$$Season<TRes> {
  _CopyWithStubImpl$Fragment$ShortsEpisode$context$$Season(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$ShortsEpisode$season implements Fragment$PlayableEpisode$season {
  Fragment$ShortsEpisode$season({
    required this.id,
    required this.title,
    required this.$show,
    this.$__typename = 'Season',
  });

  factory Fragment$ShortsEpisode$season.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$ShortsEpisode$season(
      id: (l$id as String),
      title: (l$title as String),
      $show: Fragment$ShortsEpisode$season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final Fragment$ShortsEpisode$season$show $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
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
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ShortsEpisode$season) ||
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

extension UtilityExtension$Fragment$ShortsEpisode$season
    on Fragment$ShortsEpisode$season {
  CopyWith$Fragment$ShortsEpisode$season<Fragment$ShortsEpisode$season>
      get copyWith => CopyWith$Fragment$ShortsEpisode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ShortsEpisode$season<TRes> {
  factory CopyWith$Fragment$ShortsEpisode$season(
    Fragment$ShortsEpisode$season instance,
    TRes Function(Fragment$ShortsEpisode$season) then,
  ) = _CopyWithImpl$Fragment$ShortsEpisode$season;

  factory CopyWith$Fragment$ShortsEpisode$season.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ShortsEpisode$season;

  TRes call({
    String? id,
    String? title,
    Fragment$ShortsEpisode$season$show? $show,
    String? $__typename,
  });
  CopyWith$Fragment$ShortsEpisode$season$show<TRes> get $show;
}

class _CopyWithImpl$Fragment$ShortsEpisode$season<TRes>
    implements CopyWith$Fragment$ShortsEpisode$season<TRes> {
  _CopyWithImpl$Fragment$ShortsEpisode$season(
    this._instance,
    this._then,
  );

  final Fragment$ShortsEpisode$season _instance;

  final TRes Function(Fragment$ShortsEpisode$season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ShortsEpisode$season(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Fragment$ShortsEpisode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$ShortsEpisode$season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$ShortsEpisode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$ShortsEpisode$season<TRes>
    implements CopyWith$Fragment$ShortsEpisode$season<TRes> {
  _CopyWithStubImpl$Fragment$ShortsEpisode$season(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    Fragment$ShortsEpisode$season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$ShortsEpisode$season$show<TRes> get $show =>
      CopyWith$Fragment$ShortsEpisode$season$show.stub(_res);
}

class Fragment$ShortsEpisode$season$show
    implements Fragment$PlayableEpisode$season$show {
  Fragment$ShortsEpisode$season$show({
    required this.id,
    required this.title,
    this.$__typename = 'Show',
  });

  factory Fragment$ShortsEpisode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$ShortsEpisode$season$show(
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
    if (!(other is Fragment$ShortsEpisode$season$show) ||
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

extension UtilityExtension$Fragment$ShortsEpisode$season$show
    on Fragment$ShortsEpisode$season$show {
  CopyWith$Fragment$ShortsEpisode$season$show<
          Fragment$ShortsEpisode$season$show>
      get copyWith => CopyWith$Fragment$ShortsEpisode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ShortsEpisode$season$show<TRes> {
  factory CopyWith$Fragment$ShortsEpisode$season$show(
    Fragment$ShortsEpisode$season$show instance,
    TRes Function(Fragment$ShortsEpisode$season$show) then,
  ) = _CopyWithImpl$Fragment$ShortsEpisode$season$show;

  factory CopyWith$Fragment$ShortsEpisode$season$show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ShortsEpisode$season$show;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ShortsEpisode$season$show<TRes>
    implements CopyWith$Fragment$ShortsEpisode$season$show<TRes> {
  _CopyWithImpl$Fragment$ShortsEpisode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$ShortsEpisode$season$show _instance;

  final TRes Function(Fragment$ShortsEpisode$season$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ShortsEpisode$season$show(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ShortsEpisode$season$show<TRes>
    implements CopyWith$Fragment$ShortsEpisode$season$show<TRes> {
  _CopyWithStubImpl$Fragment$ShortsEpisode$season$show(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$getShortsStartingEpisode {
  Query$getShortsStartingEpisode({
    required this.playlist,
    this.$__typename = 'QueryRoot',
  });

  factory Query$getShortsStartingEpisode.fromJson(Map<String, dynamic> json) {
    final l$playlist = json['playlist'];
    final l$$__typename = json['__typename'];
    return Query$getShortsStartingEpisode(
      playlist: Query$getShortsStartingEpisode$playlist.fromJson(
          (l$playlist as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getShortsStartingEpisode$playlist playlist;

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
    if (!(other is Query$getShortsStartingEpisode) ||
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

extension UtilityExtension$Query$getShortsStartingEpisode
    on Query$getShortsStartingEpisode {
  CopyWith$Query$getShortsStartingEpisode<Query$getShortsStartingEpisode>
      get copyWith => CopyWith$Query$getShortsStartingEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getShortsStartingEpisode<TRes> {
  factory CopyWith$Query$getShortsStartingEpisode(
    Query$getShortsStartingEpisode instance,
    TRes Function(Query$getShortsStartingEpisode) then,
  ) = _CopyWithImpl$Query$getShortsStartingEpisode;

  factory CopyWith$Query$getShortsStartingEpisode.stub(TRes res) =
      _CopyWithStubImpl$Query$getShortsStartingEpisode;

  TRes call({
    Query$getShortsStartingEpisode$playlist? playlist,
    String? $__typename,
  });
  CopyWith$Query$getShortsStartingEpisode$playlist<TRes> get playlist;
}

class _CopyWithImpl$Query$getShortsStartingEpisode<TRes>
    implements CopyWith$Query$getShortsStartingEpisode<TRes> {
  _CopyWithImpl$Query$getShortsStartingEpisode(
    this._instance,
    this._then,
  );

  final Query$getShortsStartingEpisode _instance;

  final TRes Function(Query$getShortsStartingEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? playlist = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShortsStartingEpisode(
        playlist: playlist == _undefined || playlist == null
            ? _instance.playlist
            : (playlist as Query$getShortsStartingEpisode$playlist),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getShortsStartingEpisode$playlist<TRes> get playlist {
    final local$playlist = _instance.playlist;
    return CopyWith$Query$getShortsStartingEpisode$playlist(
        local$playlist, (e) => call(playlist: e));
  }
}

class _CopyWithStubImpl$Query$getShortsStartingEpisode<TRes>
    implements CopyWith$Query$getShortsStartingEpisode<TRes> {
  _CopyWithStubImpl$Query$getShortsStartingEpisode(this._res);

  TRes _res;

  call({
    Query$getShortsStartingEpisode$playlist? playlist,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getShortsStartingEpisode$playlist<TRes> get playlist =>
      CopyWith$Query$getShortsStartingEpisode$playlist.stub(_res);
}

const documentNodeQuerygetShortsStartingEpisode = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getShortsStartingEpisode'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'playlist'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: StringValueNode(
              value: 'e7efbde0-b134-46c8-950d-814b9570e903',
              isBlock: false,
            ),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'items'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '1'),
              )
            ],
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
Query$getShortsStartingEpisode _parserFn$Query$getShortsStartingEpisode(
        Map<String, dynamic> data) =>
    Query$getShortsStartingEpisode.fromJson(data);
typedef OnQueryComplete$Query$getShortsStartingEpisode = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$getShortsStartingEpisode?,
);

class Options$Query$getShortsStartingEpisode
    extends graphql.QueryOptions<Query$getShortsStartingEpisode> {
  Options$Query$getShortsStartingEpisode({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getShortsStartingEpisode? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getShortsStartingEpisode? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$getShortsStartingEpisode(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetShortsStartingEpisode,
          parserFn: _parserFn$Query$getShortsStartingEpisode,
        );

  final OnQueryComplete$Query$getShortsStartingEpisode? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getShortsStartingEpisode
    extends graphql.WatchQueryOptions<Query$getShortsStartingEpisode> {
  WatchOptions$Query$getShortsStartingEpisode({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getShortsStartingEpisode? typedOptimisticResult,
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
          document: documentNodeQuerygetShortsStartingEpisode,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getShortsStartingEpisode,
        );
}

class FetchMoreOptions$Query$getShortsStartingEpisode
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getShortsStartingEpisode(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetShortsStartingEpisode,
        );
}

extension ClientExtension$Query$getShortsStartingEpisode
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getShortsStartingEpisode>>
      query$getShortsStartingEpisode(
              [Options$Query$getShortsStartingEpisode? options]) async =>
          await this.query(options ?? Options$Query$getShortsStartingEpisode());
  graphql.ObservableQuery<Query$getShortsStartingEpisode>
      watchQuery$getShortsStartingEpisode(
              [WatchOptions$Query$getShortsStartingEpisode? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$getShortsStartingEpisode());
  void writeQuery$getShortsStartingEpisode({
    required Query$getShortsStartingEpisode data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerygetShortsStartingEpisode)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getShortsStartingEpisode? readQuery$getShortsStartingEpisode(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetShortsStartingEpisode)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getShortsStartingEpisode.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getShortsStartingEpisode>
    useQuery$getShortsStartingEpisode(
            [Options$Query$getShortsStartingEpisode? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$getShortsStartingEpisode());
graphql.ObservableQuery<Query$getShortsStartingEpisode>
    useWatchQuery$getShortsStartingEpisode(
            [WatchOptions$Query$getShortsStartingEpisode? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$getShortsStartingEpisode());

class Query$getShortsStartingEpisode$Widget
    extends graphql_flutter.Query<Query$getShortsStartingEpisode> {
  Query$getShortsStartingEpisode$Widget({
    widgets.Key? key,
    Options$Query$getShortsStartingEpisode? options,
    required graphql_flutter.QueryBuilder<Query$getShortsStartingEpisode>
        builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getShortsStartingEpisode(),
          builder: builder,
        );
}

class Query$getShortsStartingEpisode$playlist {
  Query$getShortsStartingEpisode$playlist({
    required this.items,
    this.$__typename = 'Playlist',
  });

  factory Query$getShortsStartingEpisode$playlist.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getShortsStartingEpisode$playlist(
      items: Query$getShortsStartingEpisode$playlist$items.fromJson(
          (l$items as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getShortsStartingEpisode$playlist$items items;

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
    if (!(other is Query$getShortsStartingEpisode$playlist) ||
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

extension UtilityExtension$Query$getShortsStartingEpisode$playlist
    on Query$getShortsStartingEpisode$playlist {
  CopyWith$Query$getShortsStartingEpisode$playlist<
          Query$getShortsStartingEpisode$playlist>
      get copyWith => CopyWith$Query$getShortsStartingEpisode$playlist(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getShortsStartingEpisode$playlist<TRes> {
  factory CopyWith$Query$getShortsStartingEpisode$playlist(
    Query$getShortsStartingEpisode$playlist instance,
    TRes Function(Query$getShortsStartingEpisode$playlist) then,
  ) = _CopyWithImpl$Query$getShortsStartingEpisode$playlist;

  factory CopyWith$Query$getShortsStartingEpisode$playlist.stub(TRes res) =
      _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist;

  TRes call({
    Query$getShortsStartingEpisode$playlist$items? items,
    String? $__typename,
  });
  CopyWith$Query$getShortsStartingEpisode$playlist$items<TRes> get items;
}

class _CopyWithImpl$Query$getShortsStartingEpisode$playlist<TRes>
    implements CopyWith$Query$getShortsStartingEpisode$playlist<TRes> {
  _CopyWithImpl$Query$getShortsStartingEpisode$playlist(
    this._instance,
    this._then,
  );

  final Query$getShortsStartingEpisode$playlist _instance;

  final TRes Function(Query$getShortsStartingEpisode$playlist) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShortsStartingEpisode$playlist(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Query$getShortsStartingEpisode$playlist$items),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getShortsStartingEpisode$playlist$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$getShortsStartingEpisode$playlist$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist<TRes>
    implements CopyWith$Query$getShortsStartingEpisode$playlist<TRes> {
  _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist(this._res);

  TRes _res;

  call({
    Query$getShortsStartingEpisode$playlist$items? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getShortsStartingEpisode$playlist$items<TRes> get items =>
      CopyWith$Query$getShortsStartingEpisode$playlist$items.stub(_res);
}

class Query$getShortsStartingEpisode$playlist$items {
  Query$getShortsStartingEpisode$playlist$items({
    required this.items,
    this.$__typename = 'PlaylistItemPagination',
  });

  factory Query$getShortsStartingEpisode$playlist$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getShortsStartingEpisode$playlist$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$getShortsStartingEpisode$playlist$items$items.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getShortsStartingEpisode$playlist$items$items> items;

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
    if (!(other is Query$getShortsStartingEpisode$playlist$items) ||
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

extension UtilityExtension$Query$getShortsStartingEpisode$playlist$items
    on Query$getShortsStartingEpisode$playlist$items {
  CopyWith$Query$getShortsStartingEpisode$playlist$items<
          Query$getShortsStartingEpisode$playlist$items>
      get copyWith => CopyWith$Query$getShortsStartingEpisode$playlist$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getShortsStartingEpisode$playlist$items<TRes> {
  factory CopyWith$Query$getShortsStartingEpisode$playlist$items(
    Query$getShortsStartingEpisode$playlist$items instance,
    TRes Function(Query$getShortsStartingEpisode$playlist$items) then,
  ) = _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items;

  factory CopyWith$Query$getShortsStartingEpisode$playlist$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items;

  TRes call({
    List<Query$getShortsStartingEpisode$playlist$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$getShortsStartingEpisode$playlist$items$items> Function(
              Iterable<
                  CopyWith$Query$getShortsStartingEpisode$playlist$items$items<
                      Query$getShortsStartingEpisode$playlist$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items<TRes>
    implements CopyWith$Query$getShortsStartingEpisode$playlist$items<TRes> {
  _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items(
    this._instance,
    this._then,
  );

  final Query$getShortsStartingEpisode$playlist$items _instance;

  final TRes Function(Query$getShortsStartingEpisode$playlist$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShortsStartingEpisode$playlist$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as List<Query$getShortsStartingEpisode$playlist$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$getShortsStartingEpisode$playlist$items$items> Function(
                  Iterable<
                      CopyWith$Query$getShortsStartingEpisode$playlist$items$items<
                          Query$getShortsStartingEpisode$playlist$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$getShortsStartingEpisode$playlist$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items<TRes>
    implements CopyWith$Query$getShortsStartingEpisode$playlist$items<TRes> {
  _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items(this._res);

  TRes _res;

  call({
    List<Query$getShortsStartingEpisode$playlist$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$getShortsStartingEpisode$playlist$items$items {
  Query$getShortsStartingEpisode$playlist$items$items({
    required this.id,
    required this.$__typename,
  });

  factory Query$getShortsStartingEpisode$playlist$items$items.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Episode":
        return Query$getShortsStartingEpisode$playlist$items$items$$Episode
            .fromJson(json);

      default:
        final l$id = json['id'];
        final l$$__typename = json['__typename'];
        return Query$getShortsStartingEpisode$playlist$items$items(
          id: (l$id as String),
          $__typename: (l$$__typename as String),
        );
    }
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
    if (!(other is Query$getShortsStartingEpisode$playlist$items$items) ||
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

extension UtilityExtension$Query$getShortsStartingEpisode$playlist$items$items
    on Query$getShortsStartingEpisode$playlist$items$items {
  CopyWith$Query$getShortsStartingEpisode$playlist$items$items<
          Query$getShortsStartingEpisode$playlist$items$items>
      get copyWith =>
          CopyWith$Query$getShortsStartingEpisode$playlist$items$items(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(
            Query$getShortsStartingEpisode$playlist$items$items$$Episode)
        episode,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        return episode(this
            as Query$getShortsStartingEpisode$playlist$items$items$$Episode);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$getShortsStartingEpisode$playlist$items$items$$Episode)?
        episode,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        if (episode != null) {
          return episode(this
              as Query$getShortsStartingEpisode$playlist$items$items$$Episode);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$getShortsStartingEpisode$playlist$items$items<
    TRes> {
  factory CopyWith$Query$getShortsStartingEpisode$playlist$items$items(
    Query$getShortsStartingEpisode$playlist$items$items instance,
    TRes Function(Query$getShortsStartingEpisode$playlist$items$items) then,
  ) = _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items$items;

  factory CopyWith$Query$getShortsStartingEpisode$playlist$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items$items;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items$items<TRes>
    implements
        CopyWith$Query$getShortsStartingEpisode$playlist$items$items<TRes> {
  _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items$items(
    this._instance,
    this._then,
  );

  final Query$getShortsStartingEpisode$playlist$items$items _instance;

  final TRes Function(Query$getShortsStartingEpisode$playlist$items$items)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShortsStartingEpisode$playlist$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items$items<
        TRes>
    implements
        CopyWith$Query$getShortsStartingEpisode$playlist$items$items<TRes> {
  _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getShortsStartingEpisode$playlist$items$items$$Episode
    implements Query$getShortsStartingEpisode$playlist$items$items {
  Query$getShortsStartingEpisode$playlist$items$items$$Episode({
    required this.id,
    this.$__typename = 'Episode',
  });

  factory Query$getShortsStartingEpisode$playlist$items$items$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getShortsStartingEpisode$playlist$items$items$$Episode(
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
    if (!(other
            is Query$getShortsStartingEpisode$playlist$items$items$$Episode) ||
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

extension UtilityExtension$Query$getShortsStartingEpisode$playlist$items$items$$Episode
    on Query$getShortsStartingEpisode$playlist$items$items$$Episode {
  CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Episode<
          Query$getShortsStartingEpisode$playlist$items$items$$Episode>
      get copyWith =>
          CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Episode<
    TRes> {
  factory CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Episode(
    Query$getShortsStartingEpisode$playlist$items$items$$Episode instance,
    TRes Function(Query$getShortsStartingEpisode$playlist$items$items$$Episode)
        then,
  ) = _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items$items$$Episode;

  factory CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items$items$$Episode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items$items$$Episode<
        TRes>
    implements
        CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Episode<
            TRes> {
  _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items$items$$Episode(
    this._instance,
    this._then,
  );

  final Query$getShortsStartingEpisode$playlist$items$items$$Episode _instance;

  final TRes Function(
      Query$getShortsStartingEpisode$playlist$items$items$$Episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShortsStartingEpisode$playlist$items$items$$Episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items$items$$Episode<
        TRes>
    implements
        CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items$items$$Episode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getShortsFromStartingEpisode {
  factory Variables$Query$getShortsFromStartingEpisode({required String id}) =>
      Variables$Query$getShortsFromStartingEpisode._({
        r'id': id,
      });

  Variables$Query$getShortsFromStartingEpisode._(this._$data);

  factory Variables$Query$getShortsFromStartingEpisode.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$getShortsFromStartingEpisode._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getShortsFromStartingEpisode<
          Variables$Query$getShortsFromStartingEpisode>
      get copyWith => CopyWith$Variables$Query$getShortsFromStartingEpisode(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getShortsFromStartingEpisode) ||
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

abstract class CopyWith$Variables$Query$getShortsFromStartingEpisode<TRes> {
  factory CopyWith$Variables$Query$getShortsFromStartingEpisode(
    Variables$Query$getShortsFromStartingEpisode instance,
    TRes Function(Variables$Query$getShortsFromStartingEpisode) then,
  ) = _CopyWithImpl$Variables$Query$getShortsFromStartingEpisode;

  factory CopyWith$Variables$Query$getShortsFromStartingEpisode.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getShortsFromStartingEpisode;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$getShortsFromStartingEpisode<TRes>
    implements CopyWith$Variables$Query$getShortsFromStartingEpisode<TRes> {
  _CopyWithImpl$Variables$Query$getShortsFromStartingEpisode(
    this._instance,
    this._then,
  );

  final Variables$Query$getShortsFromStartingEpisode _instance;

  final TRes Function(Variables$Query$getShortsFromStartingEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getShortsFromStartingEpisode._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getShortsFromStartingEpisode<TRes>
    implements CopyWith$Variables$Query$getShortsFromStartingEpisode<TRes> {
  _CopyWithStubImpl$Variables$Query$getShortsFromStartingEpisode(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$getShortsFromStartingEpisode {
  Query$getShortsFromStartingEpisode({
    required this.episode,
    this.$__typename = 'QueryRoot',
  });

  factory Query$getShortsFromStartingEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$getShortsFromStartingEpisode(
      episode: Query$getShortsFromStartingEpisode$episode.fromJson(
          (l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getShortsFromStartingEpisode$episode episode;

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
    if (!(other is Query$getShortsFromStartingEpisode) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getShortsFromStartingEpisode
    on Query$getShortsFromStartingEpisode {
  CopyWith$Query$getShortsFromStartingEpisode<
          Query$getShortsFromStartingEpisode>
      get copyWith => CopyWith$Query$getShortsFromStartingEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getShortsFromStartingEpisode<TRes> {
  factory CopyWith$Query$getShortsFromStartingEpisode(
    Query$getShortsFromStartingEpisode instance,
    TRes Function(Query$getShortsFromStartingEpisode) then,
  ) = _CopyWithImpl$Query$getShortsFromStartingEpisode;

  factory CopyWith$Query$getShortsFromStartingEpisode.stub(TRes res) =
      _CopyWithStubImpl$Query$getShortsFromStartingEpisode;

  TRes call({
    Query$getShortsFromStartingEpisode$episode? episode,
    String? $__typename,
  });
  CopyWith$Query$getShortsFromStartingEpisode$episode<TRes> get episode;
}

class _CopyWithImpl$Query$getShortsFromStartingEpisode<TRes>
    implements CopyWith$Query$getShortsFromStartingEpisode<TRes> {
  _CopyWithImpl$Query$getShortsFromStartingEpisode(
    this._instance,
    this._then,
  );

  final Query$getShortsFromStartingEpisode _instance;

  final TRes Function(Query$getShortsFromStartingEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShortsFromStartingEpisode(
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Query$getShortsFromStartingEpisode$episode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getShortsFromStartingEpisode$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Query$getShortsFromStartingEpisode$episode(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$getShortsFromStartingEpisode<TRes>
    implements CopyWith$Query$getShortsFromStartingEpisode<TRes> {
  _CopyWithStubImpl$Query$getShortsFromStartingEpisode(this._res);

  TRes _res;

  call({
    Query$getShortsFromStartingEpisode$episode? episode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getShortsFromStartingEpisode$episode<TRes> get episode =>
      CopyWith$Query$getShortsFromStartingEpisode$episode.stub(_res);
}

const documentNodeQuerygetShortsFromStartingEpisode =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getShortsFromStartingEpisode'),
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
          ),
          ArgumentNode(
            name: NameNode(value: 'context'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'playlistId'),
                value: StringValueNode(
                  value: 'e7efbde0-b134-46c8-950d-814b9570e903',
                  isBlock: false,
                ),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'shuffle'),
                value: BooleanValueNode(value: true),
              ),
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'cursor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'next'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: IntValueNode(value: '20'),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'ShortsEpisode'),
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
  fragmentDefinitionShortsEpisode,
  fragmentDefinitionPlayableEpisode,
  fragmentDefinitionBasicStream,
]);
Query$getShortsFromStartingEpisode _parserFn$Query$getShortsFromStartingEpisode(
        Map<String, dynamic> data) =>
    Query$getShortsFromStartingEpisode.fromJson(data);
typedef OnQueryComplete$Query$getShortsFromStartingEpisode = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$getShortsFromStartingEpisode?,
);

class Options$Query$getShortsFromStartingEpisode
    extends graphql.QueryOptions<Query$getShortsFromStartingEpisode> {
  Options$Query$getShortsFromStartingEpisode({
    String? operationName,
    required Variables$Query$getShortsFromStartingEpisode variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getShortsFromStartingEpisode? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getShortsFromStartingEpisode? onComplete,
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
                        : _parserFn$Query$getShortsFromStartingEpisode(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetShortsFromStartingEpisode,
          parserFn: _parserFn$Query$getShortsFromStartingEpisode,
        );

  final OnQueryComplete$Query$getShortsFromStartingEpisode?
      onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getShortsFromStartingEpisode
    extends graphql.WatchQueryOptions<Query$getShortsFromStartingEpisode> {
  WatchOptions$Query$getShortsFromStartingEpisode({
    String? operationName,
    required Variables$Query$getShortsFromStartingEpisode variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getShortsFromStartingEpisode? typedOptimisticResult,
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
          document: documentNodeQuerygetShortsFromStartingEpisode,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getShortsFromStartingEpisode,
        );
}

class FetchMoreOptions$Query$getShortsFromStartingEpisode
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getShortsFromStartingEpisode({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getShortsFromStartingEpisode variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetShortsFromStartingEpisode,
        );
}

extension ClientExtension$Query$getShortsFromStartingEpisode
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getShortsFromStartingEpisode>>
      query$getShortsFromStartingEpisode(
              Options$Query$getShortsFromStartingEpisode options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getShortsFromStartingEpisode>
      watchQuery$getShortsFromStartingEpisode(
              WatchOptions$Query$getShortsFromStartingEpisode options) =>
          this.watchQuery(options);
  void writeQuery$getShortsFromStartingEpisode({
    required Query$getShortsFromStartingEpisode data,
    required Variables$Query$getShortsFromStartingEpisode variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetShortsFromStartingEpisode),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getShortsFromStartingEpisode? readQuery$getShortsFromStartingEpisode({
    required Variables$Query$getShortsFromStartingEpisode variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetShortsFromStartingEpisode),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getShortsFromStartingEpisode.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getShortsFromStartingEpisode>
    useQuery$getShortsFromStartingEpisode(
            Options$Query$getShortsFromStartingEpisode options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getShortsFromStartingEpisode>
    useWatchQuery$getShortsFromStartingEpisode(
            WatchOptions$Query$getShortsFromStartingEpisode options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getShortsFromStartingEpisode$Widget
    extends graphql_flutter.Query<Query$getShortsFromStartingEpisode> {
  Query$getShortsFromStartingEpisode$Widget({
    widgets.Key? key,
    required Options$Query$getShortsFromStartingEpisode options,
    required graphql_flutter.QueryBuilder<Query$getShortsFromStartingEpisode>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getShortsFromStartingEpisode$episode {
  Query$getShortsFromStartingEpisode$episode({
    required this.cursor,
    required this.next,
    this.$__typename = 'Episode',
  });

  factory Query$getShortsFromStartingEpisode$episode.fromJson(
      Map<String, dynamic> json) {
    final l$cursor = json['cursor'];
    final l$next = json['next'];
    final l$$__typename = json['__typename'];
    return Query$getShortsFromStartingEpisode$episode(
      cursor: (l$cursor as String),
      next: (l$next as List<dynamic>)
          .map((e) =>
              Fragment$ShortsEpisode.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String cursor;

  final List<Fragment$ShortsEpisode> next;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$next = next;
    _resultData['next'] = l$next.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cursor = cursor;
    final l$next = next;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cursor,
      Object.hashAll(l$next.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getShortsFromStartingEpisode$episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
      return false;
    }
    final l$next = next;
    final lOther$next = other.next;
    if (l$next.length != lOther$next.length) {
      return false;
    }
    for (int i = 0; i < l$next.length; i++) {
      final l$next$entry = l$next[i];
      final lOther$next$entry = lOther$next[i];
      if (l$next$entry != lOther$next$entry) {
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

extension UtilityExtension$Query$getShortsFromStartingEpisode$episode
    on Query$getShortsFromStartingEpisode$episode {
  CopyWith$Query$getShortsFromStartingEpisode$episode<
          Query$getShortsFromStartingEpisode$episode>
      get copyWith => CopyWith$Query$getShortsFromStartingEpisode$episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getShortsFromStartingEpisode$episode<TRes> {
  factory CopyWith$Query$getShortsFromStartingEpisode$episode(
    Query$getShortsFromStartingEpisode$episode instance,
    TRes Function(Query$getShortsFromStartingEpisode$episode) then,
  ) = _CopyWithImpl$Query$getShortsFromStartingEpisode$episode;

  factory CopyWith$Query$getShortsFromStartingEpisode$episode.stub(TRes res) =
      _CopyWithStubImpl$Query$getShortsFromStartingEpisode$episode;

  TRes call({
    String? cursor,
    List<Fragment$ShortsEpisode>? next,
    String? $__typename,
  });
  TRes next(
      Iterable<Fragment$ShortsEpisode> Function(
              Iterable<CopyWith$Fragment$ShortsEpisode<Fragment$ShortsEpisode>>)
          _fn);
}

class _CopyWithImpl$Query$getShortsFromStartingEpisode$episode<TRes>
    implements CopyWith$Query$getShortsFromStartingEpisode$episode<TRes> {
  _CopyWithImpl$Query$getShortsFromStartingEpisode$episode(
    this._instance,
    this._then,
  );

  final Query$getShortsFromStartingEpisode$episode _instance;

  final TRes Function(Query$getShortsFromStartingEpisode$episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cursor = _undefined,
    Object? next = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShortsFromStartingEpisode$episode(
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        next: next == _undefined || next == null
            ? _instance.next
            : (next as List<Fragment$ShortsEpisode>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes next(
          Iterable<Fragment$ShortsEpisode> Function(
                  Iterable<
                      CopyWith$Fragment$ShortsEpisode<Fragment$ShortsEpisode>>)
              _fn) =>
      call(
          next: _fn(_instance.next.map((e) => CopyWith$Fragment$ShortsEpisode(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getShortsFromStartingEpisode$episode<TRes>
    implements CopyWith$Query$getShortsFromStartingEpisode$episode<TRes> {
  _CopyWithStubImpl$Query$getShortsFromStartingEpisode$episode(this._res);

  TRes _res;

  call({
    String? cursor,
    List<Fragment$ShortsEpisode>? next,
    String? $__typename,
  }) =>
      _res;
  next(_fn) => _res;
}
