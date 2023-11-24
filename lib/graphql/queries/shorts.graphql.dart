import 'dart:async';
import 'episode.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$ShortsEpisode implements Fragment$PlayableMediaItem {
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
      name: NameNode(value: 'PlayableMediaItem'),
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
  fragmentDefinitionPlayableMediaItem,
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
    implements Fragment$PlayableMediaItem$context {
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
        Fragment$PlayableMediaItem$context$$ContextCollection,
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
        Fragment$PlayableMediaItem$context$$Season,
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

class Fragment$ShortsEpisode$season
    implements Fragment$PlayableMediaItem$season {
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
    implements Fragment$PlayableMediaItem$season$show {
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

class Fragment$PlayableMediaItemShort {
  Fragment$PlayableMediaItemShort({
    required this.id,
    required this.streams,
    required this.title,
    this.image,
    this.$__typename = 'Short',
  });

  factory Fragment$PlayableMediaItemShort.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$streams = json['streams'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Fragment$PlayableMediaItemShort(
      id: (l$id as String),
      streams: (l$streams as List<dynamic>)
          .map(
              (e) => Fragment$BasicStream.fromJson((e as Map<String, dynamic>)))
          .toList(),
      title: (l$title as String),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<Fragment$BasicStream> streams;

  final String title;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$streams = streams;
    _resultData['streams'] = l$streams.map((e) => e.toJson()).toList();
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
    final l$streams = streams;
    final l$title = title;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$streams.map((v) => v)),
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
    if (!(other is Fragment$PlayableMediaItemShort) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Fragment$PlayableMediaItemShort
    on Fragment$PlayableMediaItemShort {
  CopyWith$Fragment$PlayableMediaItemShort<Fragment$PlayableMediaItemShort>
      get copyWith => CopyWith$Fragment$PlayableMediaItemShort(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$PlayableMediaItemShort<TRes> {
  factory CopyWith$Fragment$PlayableMediaItemShort(
    Fragment$PlayableMediaItemShort instance,
    TRes Function(Fragment$PlayableMediaItemShort) then,
  ) = _CopyWithImpl$Fragment$PlayableMediaItemShort;

  factory CopyWith$Fragment$PlayableMediaItemShort.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PlayableMediaItemShort;

  TRes call({
    String? id,
    List<Fragment$BasicStream>? streams,
    String? title,
    String? image,
    String? $__typename,
  });
  TRes streams(
      Iterable<Fragment$BasicStream> Function(
              Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
          _fn);
}

class _CopyWithImpl$Fragment$PlayableMediaItemShort<TRes>
    implements CopyWith$Fragment$PlayableMediaItemShort<TRes> {
  _CopyWithImpl$Fragment$PlayableMediaItemShort(
    this._instance,
    this._then,
  );

  final Fragment$PlayableMediaItemShort _instance;

  final TRes Function(Fragment$PlayableMediaItemShort) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? streams = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$PlayableMediaItemShort(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        streams: streams == _undefined || streams == null
            ? _instance.streams
            : (streams as List<Fragment$BasicStream>),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
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
}

class _CopyWithStubImpl$Fragment$PlayableMediaItemShort<TRes>
    implements CopyWith$Fragment$PlayableMediaItemShort<TRes> {
  _CopyWithStubImpl$Fragment$PlayableMediaItemShort(this._res);

  TRes _res;

  call({
    String? id,
    List<Fragment$BasicStream>? streams,
    String? title,
    String? image,
    String? $__typename,
  }) =>
      _res;

  streams(_fn) => _res;
}

const fragmentDefinitionPlayableMediaItemShort = FragmentDefinitionNode(
  name: NameNode(value: 'PlayableMediaItemShort'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Short'),
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
      name: NameNode(value: 'streams'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'BasicStream'),
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
);
const documentNodeFragmentPlayableMediaItemShort = DocumentNode(definitions: [
  fragmentDefinitionPlayableMediaItemShort,
  fragmentDefinitionBasicStream,
]);

extension ClientExtension$Fragment$PlayableMediaItemShort
    on graphql.GraphQLClient {
  void writeFragment$PlayableMediaItemShort({
    required Fragment$PlayableMediaItemShort data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'PlayableMediaItemShort',
            document: documentNodeFragmentPlayableMediaItemShort,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$PlayableMediaItemShort? readFragment$PlayableMediaItemShort({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'PlayableMediaItemShort',
          document: documentNodeFragmentPlayableMediaItemShort,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$PlayableMediaItemShort.fromJson(result);
  }
}

class Fragment$Short implements Fragment$PlayableMediaItemShort {
  Fragment$Short({
    required this.id,
    required this.title,
    this.description,
    required this.inMyList,
    this.image,
    this.source,
    required this.streams,
    this.$__typename = 'Short',
  });

  factory Fragment$Short.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$inMyList = json['inMyList'];
    final l$image = json['image'];
    final l$source = json['source'];
    final l$streams = json['streams'];
    final l$$__typename = json['__typename'];
    return Fragment$Short(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
      inMyList: (l$inMyList as bool),
      image: (l$image as String?),
      source: l$source == null
          ? null
          : Fragment$Short$source.fromJson((l$source as Map<String, dynamic>)),
      streams: (l$streams as List<dynamic>)
          .map(
              (e) => Fragment$BasicStream.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? description;

  final bool inMyList;

  final String? image;

  final Fragment$Short$source? source;

  final List<Fragment$BasicStream> streams;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$inMyList = inMyList;
    _resultData['inMyList'] = l$inMyList;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$source = source;
    _resultData['source'] = l$source?.toJson();
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
    final l$inMyList = inMyList;
    final l$image = image;
    final l$source = source;
    final l$streams = streams;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$inMyList,
      l$image,
      l$source,
      Object.hashAll(l$streams.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Short) || runtimeType != other.runtimeType) {
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
    final l$inMyList = inMyList;
    final lOther$inMyList = other.inMyList;
    if (l$inMyList != lOther$inMyList) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$source = source;
    final lOther$source = other.source;
    if (l$source != lOther$source) {
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

extension UtilityExtension$Fragment$Short on Fragment$Short {
  CopyWith$Fragment$Short<Fragment$Short> get copyWith =>
      CopyWith$Fragment$Short(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Short<TRes> {
  factory CopyWith$Fragment$Short(
    Fragment$Short instance,
    TRes Function(Fragment$Short) then,
  ) = _CopyWithImpl$Fragment$Short;

  factory CopyWith$Fragment$Short.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Short;

  TRes call({
    String? id,
    String? title,
    String? description,
    bool? inMyList,
    String? image,
    Fragment$Short$source? source,
    List<Fragment$BasicStream>? streams,
    String? $__typename,
  });
  CopyWith$Fragment$Short$source<TRes> get source;
  TRes streams(
      Iterable<Fragment$BasicStream> Function(
              Iterable<CopyWith$Fragment$BasicStream<Fragment$BasicStream>>)
          _fn);
}

class _CopyWithImpl$Fragment$Short<TRes>
    implements CopyWith$Fragment$Short<TRes> {
  _CopyWithImpl$Fragment$Short(
    this._instance,
    this._then,
  );

  final Fragment$Short _instance;

  final TRes Function(Fragment$Short) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? inMyList = _undefined,
    Object? image = _undefined,
    Object? source = _undefined,
    Object? streams = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Short(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        inMyList: inMyList == _undefined || inMyList == null
            ? _instance.inMyList
            : (inMyList as bool),
        image: image == _undefined ? _instance.image : (image as String?),
        source: source == _undefined
            ? _instance.source
            : (source as Fragment$Short$source?),
        streams: streams == _undefined || streams == null
            ? _instance.streams
            : (streams as List<Fragment$BasicStream>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Short$source<TRes> get source {
    final local$source = _instance.source;
    return local$source == null
        ? CopyWith$Fragment$Short$source.stub(_then(_instance))
        : CopyWith$Fragment$Short$source(local$source, (e) => call(source: e));
  }

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
}

class _CopyWithStubImpl$Fragment$Short<TRes>
    implements CopyWith$Fragment$Short<TRes> {
  _CopyWithStubImpl$Fragment$Short(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    bool? inMyList,
    String? image,
    Fragment$Short$source? source,
    List<Fragment$BasicStream>? streams,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Short$source<TRes> get source =>
      CopyWith$Fragment$Short$source.stub(_res);

  streams(_fn) => _res;
}

const fragmentDefinitionShort = FragmentDefinitionNode(
  name: NameNode(value: 'Short'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Short'),
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
      name: NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'inMyList'),
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
      name: NameNode(value: 'source'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'item'),
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
          name: NameNode(value: 'start'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'end'),
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
    FragmentSpreadNode(
      name: NameNode(value: 'PlayableMediaItemShort'),
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
const documentNodeFragmentShort = DocumentNode(definitions: [
  fragmentDefinitionShort,
  fragmentDefinitionPlayableMediaItemShort,
  fragmentDefinitionBasicStream,
]);

extension ClientExtension$Fragment$Short on graphql.GraphQLClient {
  void writeFragment$Short({
    required Fragment$Short data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Short',
            document: documentNodeFragmentShort,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Short? readFragment$Short({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Short',
          document: documentNodeFragmentShort,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Short.fromJson(result);
  }
}

class Fragment$Short$source {
  Fragment$Short$source({
    required this.item,
    this.start,
    this.end,
    this.$__typename = 'SubclipSource',
  });

  factory Fragment$Short$source.fromJson(Map<String, dynamic> json) {
    final l$item = json['item'];
    final l$start = json['start'];
    final l$end = json['end'];
    final l$$__typename = json['__typename'];
    return Fragment$Short$source(
      item:
          Fragment$Short$source$item.fromJson((l$item as Map<String, dynamic>)),
      start: (l$start as num?)?.toDouble(),
      end: (l$end as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Short$source$item item;

  final double? start;

  final double? end;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$start = start;
    _resultData['start'] = l$start;
    final l$end = end;
    _resultData['end'] = l$end;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item = item;
    final l$start = start;
    final l$end = end;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$item,
      l$start,
      l$end,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Short$source) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
      return false;
    }
    final l$start = start;
    final lOther$start = other.start;
    if (l$start != lOther$start) {
      return false;
    }
    final l$end = end;
    final lOther$end = other.end;
    if (l$end != lOther$end) {
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

extension UtilityExtension$Fragment$Short$source on Fragment$Short$source {
  CopyWith$Fragment$Short$source<Fragment$Short$source> get copyWith =>
      CopyWith$Fragment$Short$source(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Short$source<TRes> {
  factory CopyWith$Fragment$Short$source(
    Fragment$Short$source instance,
    TRes Function(Fragment$Short$source) then,
  ) = _CopyWithImpl$Fragment$Short$source;

  factory CopyWith$Fragment$Short$source.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Short$source;

  TRes call({
    Fragment$Short$source$item? item,
    double? start,
    double? end,
    String? $__typename,
  });
  CopyWith$Fragment$Short$source$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Short$source<TRes>
    implements CopyWith$Fragment$Short$source<TRes> {
  _CopyWithImpl$Fragment$Short$source(
    this._instance,
    this._then,
  );

  final Fragment$Short$source _instance;

  final TRes Function(Fragment$Short$source) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? item = _undefined,
    Object? start = _undefined,
    Object? end = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Short$source(
        item: item == _undefined || item == null
            ? _instance.item
            : (item as Fragment$Short$source$item),
        start: start == _undefined ? _instance.start : (start as double?),
        end: end == _undefined ? _instance.end : (end as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Short$source$item<TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Fragment$Short$source$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Short$source<TRes>
    implements CopyWith$Fragment$Short$source<TRes> {
  _CopyWithStubImpl$Fragment$Short$source(this._res);

  TRes _res;

  call({
    Fragment$Short$source$item? item,
    double? start,
    double? end,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Short$source$item<TRes> get item =>
      CopyWith$Fragment$Short$source$item.stub(_res);
}

class Fragment$Short$source$item {
  Fragment$Short$source$item({required this.$__typename});

  factory Fragment$Short$source$item.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Episode":
        return Fragment$Short$source$item$$Episode.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Short$source$item(
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
    if (!(other is Fragment$Short$source$item) ||
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

extension UtilityExtension$Fragment$Short$source$item
    on Fragment$Short$source$item {
  CopyWith$Fragment$Short$source$item<Fragment$Short$source$item>
      get copyWith => CopyWith$Fragment$Short$source$item(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(Fragment$Short$source$item$$Episode) episode,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        return episode(this as Fragment$Short$source$item$$Episode);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$Short$source$item$$Episode)? episode,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Episode":
        if (episode != null) {
          return episode(this as Fragment$Short$source$item$$Episode);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$Short$source$item<TRes> {
  factory CopyWith$Fragment$Short$source$item(
    Fragment$Short$source$item instance,
    TRes Function(Fragment$Short$source$item) then,
  ) = _CopyWithImpl$Fragment$Short$source$item;

  factory CopyWith$Fragment$Short$source$item.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Short$source$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Short$source$item<TRes>
    implements CopyWith$Fragment$Short$source$item<TRes> {
  _CopyWithImpl$Fragment$Short$source$item(
    this._instance,
    this._then,
  );

  final Fragment$Short$source$item _instance;

  final TRes Function(Fragment$Short$source$item) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
      Fragment$Short$source$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Short$source$item<TRes>
    implements CopyWith$Fragment$Short$source$item<TRes> {
  _CopyWithStubImpl$Fragment$Short$source$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Short$source$item$$Episode
    implements Fragment$Short$source$item {
  Fragment$Short$source$item$$Episode({
    required this.id,
    required this.title,
    this.$__typename = 'Episode',
  });

  factory Fragment$Short$source$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Short$source$item$$Episode(
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
    if (!(other is Fragment$Short$source$item$$Episode) ||
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

extension UtilityExtension$Fragment$Short$source$item$$Episode
    on Fragment$Short$source$item$$Episode {
  CopyWith$Fragment$Short$source$item$$Episode<
          Fragment$Short$source$item$$Episode>
      get copyWith => CopyWith$Fragment$Short$source$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Short$source$item$$Episode<TRes> {
  factory CopyWith$Fragment$Short$source$item$$Episode(
    Fragment$Short$source$item$$Episode instance,
    TRes Function(Fragment$Short$source$item$$Episode) then,
  ) = _CopyWithImpl$Fragment$Short$source$item$$Episode;

  factory CopyWith$Fragment$Short$source$item$$Episode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Short$source$item$$Episode;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Short$source$item$$Episode<TRes>
    implements CopyWith$Fragment$Short$source$item$$Episode<TRes> {
  _CopyWithImpl$Fragment$Short$source$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Short$source$item$$Episode _instance;

  final TRes Function(Fragment$Short$source$item$$Episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Short$source$item$$Episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Short$source$item$$Episode<TRes>
    implements CopyWith$Fragment$Short$source$item$$Episode<TRes> {
  _CopyWithStubImpl$Fragment$Short$source$item$$Episode(this._res);

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
      case "Short":
        return Query$getShortsStartingEpisode$playlist$items$items$$Short
            .fromJson(json);

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
            Query$getShortsStartingEpisode$playlist$items$items$$Short)
        short,
    required _T Function(
            Query$getShortsStartingEpisode$playlist$items$items$$Episode)
        episode,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Short":
        return short(
            this as Query$getShortsStartingEpisode$playlist$items$items$$Short);

      case "Episode":
        return episode(this
            as Query$getShortsStartingEpisode$playlist$items$items$$Episode);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$getShortsStartingEpisode$playlist$items$items$$Short)?
        short,
    _T Function(Query$getShortsStartingEpisode$playlist$items$items$$Episode)?
        episode,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "Short":
        if (short != null) {
          return short(this
              as Query$getShortsStartingEpisode$playlist$items$items$$Short);
        } else {
          return orElse();
        }

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

class Query$getShortsStartingEpisode$playlist$items$items$$Short
    implements Query$getShortsStartingEpisode$playlist$items$items {
  Query$getShortsStartingEpisode$playlist$items$items$$Short({
    required this.id,
    this.$__typename = 'Short',
  });

  factory Query$getShortsStartingEpisode$playlist$items$items$$Short.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getShortsStartingEpisode$playlist$items$items$$Short(
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
            is Query$getShortsStartingEpisode$playlist$items$items$$Short) ||
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

extension UtilityExtension$Query$getShortsStartingEpisode$playlist$items$items$$Short
    on Query$getShortsStartingEpisode$playlist$items$items$$Short {
  CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Short<
          Query$getShortsStartingEpisode$playlist$items$items$$Short>
      get copyWith =>
          CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Short(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Short<
    TRes> {
  factory CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Short(
    Query$getShortsStartingEpisode$playlist$items$items$$Short instance,
    TRes Function(Query$getShortsStartingEpisode$playlist$items$items$$Short)
        then,
  ) = _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items$items$$Short;

  factory CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Short.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items$items$$Short;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items$items$$Short<
        TRes>
    implements
        CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Short<
            TRes> {
  _CopyWithImpl$Query$getShortsStartingEpisode$playlist$items$items$$Short(
    this._instance,
    this._then,
  );

  final Query$getShortsStartingEpisode$playlist$items$items$$Short _instance;

  final TRes Function(
      Query$getShortsStartingEpisode$playlist$items$items$$Short) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShortsStartingEpisode$playlist$items$items$$Short(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items$items$$Short<
        TRes>
    implements
        CopyWith$Query$getShortsStartingEpisode$playlist$items$items$$Short<
            TRes> {
  _CopyWithStubImpl$Query$getShortsStartingEpisode$playlist$items$items$$Short(
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
              )
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
  fragmentDefinitionPlayableMediaItem,
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

class Variables$Query$getShorts {
  factory Variables$Query$getShorts({
    String? cursor,
    int? limit,
  }) =>
      Variables$Query$getShorts._({
        if (cursor != null) r'cursor': cursor,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$getShorts._(this._$data);

  factory Variables$Query$getShorts.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('cursor')) {
      final l$cursor = data['cursor'];
      result$data['cursor'] = (l$cursor as String?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$getShorts._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get cursor => (_$data['cursor'] as String?);

  int? get limit => (_$data['limit'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('cursor')) {
      final l$cursor = cursor;
      result$data['cursor'] = l$cursor;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getShorts<Variables$Query$getShorts> get copyWith =>
      CopyWith$Variables$Query$getShorts(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getShorts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (_$data.containsKey('cursor') != other._$data.containsKey('cursor')) {
      return false;
    }
    if (l$cursor != lOther$cursor) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$cursor = cursor;
    final l$limit = limit;
    return Object.hashAll([
      _$data.containsKey('cursor') ? l$cursor : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getShorts<TRes> {
  factory CopyWith$Variables$Query$getShorts(
    Variables$Query$getShorts instance,
    TRes Function(Variables$Query$getShorts) then,
  ) = _CopyWithImpl$Variables$Query$getShorts;

  factory CopyWith$Variables$Query$getShorts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getShorts;

  TRes call({
    String? cursor,
    int? limit,
  });
}

class _CopyWithImpl$Variables$Query$getShorts<TRes>
    implements CopyWith$Variables$Query$getShorts<TRes> {
  _CopyWithImpl$Variables$Query$getShorts(
    this._instance,
    this._then,
  );

  final Variables$Query$getShorts _instance;

  final TRes Function(Variables$Query$getShorts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cursor = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$getShorts._({
        ..._instance._$data,
        if (cursor != _undefined) 'cursor': (cursor as String?),
        if (limit != _undefined) 'limit': (limit as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getShorts<TRes>
    implements CopyWith$Variables$Query$getShorts<TRes> {
  _CopyWithStubImpl$Variables$Query$getShorts(this._res);

  TRes _res;

  call({
    String? cursor,
    int? limit,
  }) =>
      _res;
}

class Query$getShorts {
  Query$getShorts({
    required this.shorts,
    this.$__typename = 'QueryRoot',
  });

  factory Query$getShorts.fromJson(Map<String, dynamic> json) {
    final l$shorts = json['shorts'];
    final l$$__typename = json['__typename'];
    return Query$getShorts(
      shorts:
          Query$getShorts$shorts.fromJson((l$shorts as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getShorts$shorts shorts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$shorts = shorts;
    _resultData['shorts'] = l$shorts.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$shorts = shorts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$shorts,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getShorts) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$shorts = shorts;
    final lOther$shorts = other.shorts;
    if (l$shorts != lOther$shorts) {
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

extension UtilityExtension$Query$getShorts on Query$getShorts {
  CopyWith$Query$getShorts<Query$getShorts> get copyWith =>
      CopyWith$Query$getShorts(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getShorts<TRes> {
  factory CopyWith$Query$getShorts(
    Query$getShorts instance,
    TRes Function(Query$getShorts) then,
  ) = _CopyWithImpl$Query$getShorts;

  factory CopyWith$Query$getShorts.stub(TRes res) =
      _CopyWithStubImpl$Query$getShorts;

  TRes call({
    Query$getShorts$shorts? shorts,
    String? $__typename,
  });
  CopyWith$Query$getShorts$shorts<TRes> get shorts;
}

class _CopyWithImpl$Query$getShorts<TRes>
    implements CopyWith$Query$getShorts<TRes> {
  _CopyWithImpl$Query$getShorts(
    this._instance,
    this._then,
  );

  final Query$getShorts _instance;

  final TRes Function(Query$getShorts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? shorts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShorts(
        shorts: shorts == _undefined || shorts == null
            ? _instance.shorts
            : (shorts as Query$getShorts$shorts),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$getShorts$shorts<TRes> get shorts {
    final local$shorts = _instance.shorts;
    return CopyWith$Query$getShorts$shorts(
        local$shorts, (e) => call(shorts: e));
  }
}

class _CopyWithStubImpl$Query$getShorts<TRes>
    implements CopyWith$Query$getShorts<TRes> {
  _CopyWithStubImpl$Query$getShorts(this._res);

  TRes _res;

  call({
    Query$getShorts$shorts? shorts,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$getShorts$shorts<TRes> get shorts =>
      CopyWith$Query$getShorts$shorts.stub(_res);
}

const documentNodeQuerygetShorts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getShorts'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
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
        name: NameNode(value: 'shorts'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'cursor'),
            value: VariableNode(name: NameNode(value: 'cursor')),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
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
            name: NameNode(value: 'nextCursor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'shorts'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'Short'),
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
  fragmentDefinitionShort,
  fragmentDefinitionPlayableMediaItemShort,
  fragmentDefinitionBasicStream,
]);
Query$getShorts _parserFn$Query$getShorts(Map<String, dynamic> data) =>
    Query$getShorts.fromJson(data);
typedef OnQueryComplete$Query$getShorts = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getShorts?,
);

class Options$Query$getShorts extends graphql.QueryOptions<Query$getShorts> {
  Options$Query$getShorts({
    String? operationName,
    Variables$Query$getShorts? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getShorts? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getShorts? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
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
                    data == null ? null : _parserFn$Query$getShorts(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetShorts,
          parserFn: _parserFn$Query$getShorts,
        );

  final OnQueryComplete$Query$getShorts? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getShorts
    extends graphql.WatchQueryOptions<Query$getShorts> {
  WatchOptions$Query$getShorts({
    String? operationName,
    Variables$Query$getShorts? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getShorts? typedOptimisticResult,
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
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerygetShorts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getShorts,
        );
}

class FetchMoreOptions$Query$getShorts extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getShorts({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$getShorts? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerygetShorts,
        );
}

extension ClientExtension$Query$getShorts on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getShorts>> query$getShorts(
          [Options$Query$getShorts? options]) async =>
      await this.query(options ?? Options$Query$getShorts());
  graphql.ObservableQuery<Query$getShorts> watchQuery$getShorts(
          [WatchOptions$Query$getShorts? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getShorts());
  void writeQuery$getShorts({
    required Query$getShorts data,
    Variables$Query$getShorts? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetShorts),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getShorts? readQuery$getShorts({
    Variables$Query$getShorts? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetShorts),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getShorts.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getShorts> useQuery$getShorts(
        [Options$Query$getShorts? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$getShorts());
graphql.ObservableQuery<Query$getShorts> useWatchQuery$getShorts(
        [WatchOptions$Query$getShorts? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$getShorts());

class Query$getShorts$Widget extends graphql_flutter.Query<Query$getShorts> {
  Query$getShorts$Widget({
    widgets.Key? key,
    Options$Query$getShorts? options,
    required graphql_flutter.QueryBuilder<Query$getShorts> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getShorts(),
          builder: builder,
        );
}

class Query$getShorts$shorts {
  Query$getShorts$shorts({
    required this.cursor,
    required this.nextCursor,
    required this.shorts,
    this.$__typename = 'ShortsPagination',
  });

  factory Query$getShorts$shorts.fromJson(Map<String, dynamic> json) {
    final l$cursor = json['cursor'];
    final l$nextCursor = json['nextCursor'];
    final l$shorts = json['shorts'];
    final l$$__typename = json['__typename'];
    return Query$getShorts$shorts(
      cursor: (l$cursor as String),
      nextCursor: (l$nextCursor as String),
      shorts: (l$shorts as List<dynamic>)
          .map((e) => Fragment$Short.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String cursor;

  final String nextCursor;

  final List<Fragment$Short> shorts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$nextCursor = nextCursor;
    _resultData['nextCursor'] = l$nextCursor;
    final l$shorts = shorts;
    _resultData['shorts'] = l$shorts.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cursor = cursor;
    final l$nextCursor = nextCursor;
    final l$shorts = shorts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cursor,
      l$nextCursor,
      Object.hashAll(l$shorts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getShorts$shorts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
      return false;
    }
    final l$nextCursor = nextCursor;
    final lOther$nextCursor = other.nextCursor;
    if (l$nextCursor != lOther$nextCursor) {
      return false;
    }
    final l$shorts = shorts;
    final lOther$shorts = other.shorts;
    if (l$shorts.length != lOther$shorts.length) {
      return false;
    }
    for (int i = 0; i < l$shorts.length; i++) {
      final l$shorts$entry = l$shorts[i];
      final lOther$shorts$entry = lOther$shorts[i];
      if (l$shorts$entry != lOther$shorts$entry) {
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

extension UtilityExtension$Query$getShorts$shorts on Query$getShorts$shorts {
  CopyWith$Query$getShorts$shorts<Query$getShorts$shorts> get copyWith =>
      CopyWith$Query$getShorts$shorts(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getShorts$shorts<TRes> {
  factory CopyWith$Query$getShorts$shorts(
    Query$getShorts$shorts instance,
    TRes Function(Query$getShorts$shorts) then,
  ) = _CopyWithImpl$Query$getShorts$shorts;

  factory CopyWith$Query$getShorts$shorts.stub(TRes res) =
      _CopyWithStubImpl$Query$getShorts$shorts;

  TRes call({
    String? cursor,
    String? nextCursor,
    List<Fragment$Short>? shorts,
    String? $__typename,
  });
  TRes shorts(
      Iterable<Fragment$Short> Function(
              Iterable<CopyWith$Fragment$Short<Fragment$Short>>)
          _fn);
}

class _CopyWithImpl$Query$getShorts$shorts<TRes>
    implements CopyWith$Query$getShorts$shorts<TRes> {
  _CopyWithImpl$Query$getShorts$shorts(
    this._instance,
    this._then,
  );

  final Query$getShorts$shorts _instance;

  final TRes Function(Query$getShorts$shorts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cursor = _undefined,
    Object? nextCursor = _undefined,
    Object? shorts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShorts$shorts(
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        nextCursor: nextCursor == _undefined || nextCursor == null
            ? _instance.nextCursor
            : (nextCursor as String),
        shorts: shorts == _undefined || shorts == null
            ? _instance.shorts
            : (shorts as List<Fragment$Short>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes shorts(
          Iterable<Fragment$Short> Function(
                  Iterable<CopyWith$Fragment$Short<Fragment$Short>>)
              _fn) =>
      call(
          shorts: _fn(_instance.shorts.map((e) => CopyWith$Fragment$Short(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getShorts$shorts<TRes>
    implements CopyWith$Query$getShorts$shorts<TRes> {
  _CopyWithStubImpl$Query$getShorts$shorts(this._res);

  TRes _res;

  call({
    String? cursor,
    String? nextCursor,
    List<Fragment$Short>? shorts,
    String? $__typename,
  }) =>
      _res;

  shorts(_fn) => _res;
}

class Variables$Query$getShort {
  factory Variables$Query$getShort({required String id}) =>
      Variables$Query$getShort._({
        r'id': id,
      });

  Variables$Query$getShort._(this._$data);

  factory Variables$Query$getShort.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$getShort._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getShort<Variables$Query$getShort> get copyWith =>
      CopyWith$Variables$Query$getShort(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getShort) ||
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

abstract class CopyWith$Variables$Query$getShort<TRes> {
  factory CopyWith$Variables$Query$getShort(
    Variables$Query$getShort instance,
    TRes Function(Variables$Query$getShort) then,
  ) = _CopyWithImpl$Variables$Query$getShort;

  factory CopyWith$Variables$Query$getShort.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getShort;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$getShort<TRes>
    implements CopyWith$Variables$Query$getShort<TRes> {
  _CopyWithImpl$Variables$Query$getShort(
    this._instance,
    this._then,
  );

  final Variables$Query$getShort _instance;

  final TRes Function(Variables$Query$getShort) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$getShort._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getShort<TRes>
    implements CopyWith$Variables$Query$getShort<TRes> {
  _CopyWithStubImpl$Variables$Query$getShort(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$getShort {
  Query$getShort({
    required this.short,
    this.$__typename = 'QueryRoot',
  });

  factory Query$getShort.fromJson(Map<String, dynamic> json) {
    final l$short = json['short'];
    final l$$__typename = json['__typename'];
    return Query$getShort(
      short: Fragment$Short.fromJson((l$short as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Short short;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$short = short;
    _resultData['short'] = l$short.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$short = short;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$short,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getShort) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$short = short;
    final lOther$short = other.short;
    if (l$short != lOther$short) {
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

extension UtilityExtension$Query$getShort on Query$getShort {
  CopyWith$Query$getShort<Query$getShort> get copyWith =>
      CopyWith$Query$getShort(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getShort<TRes> {
  factory CopyWith$Query$getShort(
    Query$getShort instance,
    TRes Function(Query$getShort) then,
  ) = _CopyWithImpl$Query$getShort;

  factory CopyWith$Query$getShort.stub(TRes res) =
      _CopyWithStubImpl$Query$getShort;

  TRes call({
    Fragment$Short? short,
    String? $__typename,
  });
  CopyWith$Fragment$Short<TRes> get short;
}

class _CopyWithImpl$Query$getShort<TRes>
    implements CopyWith$Query$getShort<TRes> {
  _CopyWithImpl$Query$getShort(
    this._instance,
    this._then,
  );

  final Query$getShort _instance;

  final TRes Function(Query$getShort) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? short = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getShort(
        short: short == _undefined || short == null
            ? _instance.short
            : (short as Fragment$Short),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Short<TRes> get short {
    final local$short = _instance.short;
    return CopyWith$Fragment$Short(local$short, (e) => call(short: e));
  }
}

class _CopyWithStubImpl$Query$getShort<TRes>
    implements CopyWith$Query$getShort<TRes> {
  _CopyWithStubImpl$Query$getShort(this._res);

  TRes _res;

  call({
    Fragment$Short? short,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Short<TRes> get short => CopyWith$Fragment$Short.stub(_res);
}

const documentNodeQuerygetShort = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getShort'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'short'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Short'),
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
  fragmentDefinitionShort,
  fragmentDefinitionPlayableMediaItemShort,
  fragmentDefinitionBasicStream,
]);
Query$getShort _parserFn$Query$getShort(Map<String, dynamic> data) =>
    Query$getShort.fromJson(data);
typedef OnQueryComplete$Query$getShort = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getShort?,
);

class Options$Query$getShort extends graphql.QueryOptions<Query$getShort> {
  Options$Query$getShort({
    String? operationName,
    required Variables$Query$getShort variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getShort? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getShort? onComplete,
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
                    data == null ? null : _parserFn$Query$getShort(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetShort,
          parserFn: _parserFn$Query$getShort,
        );

  final OnQueryComplete$Query$getShort? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getShort
    extends graphql.WatchQueryOptions<Query$getShort> {
  WatchOptions$Query$getShort({
    String? operationName,
    required Variables$Query$getShort variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getShort? typedOptimisticResult,
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
          document: documentNodeQuerygetShort,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getShort,
        );
}

class FetchMoreOptions$Query$getShort extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getShort({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getShort variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetShort,
        );
}

extension ClientExtension$Query$getShort on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getShort>> query$getShort(
          Options$Query$getShort options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getShort> watchQuery$getShort(
          WatchOptions$Query$getShort options) =>
      this.watchQuery(options);
  void writeQuery$getShort({
    required Query$getShort data,
    required Variables$Query$getShort variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetShort),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getShort? readQuery$getShort({
    required Variables$Query$getShort variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetShort),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getShort.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getShort> useQuery$getShort(
        Options$Query$getShort options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getShort> useWatchQuery$getShort(
        WatchOptions$Query$getShort options) =>
    graphql_flutter.useWatchQuery(options);

class Query$getShort$Widget extends graphql_flutter.Query<Query$getShort> {
  Query$getShort$Widget({
    widgets.Key? key,
    required Options$Query$getShort options,
    required graphql_flutter.QueryBuilder<Query$getShort> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Variables$Mutation$setShortProgress {
  factory Variables$Mutation$setShortProgress({
    required String id,
    required double progress,
  }) =>
      Variables$Mutation$setShortProgress._({
        r'id': id,
        r'progress': progress,
      });

  Variables$Mutation$setShortProgress._(this._$data);

  factory Variables$Mutation$setShortProgress.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$progress = data['progress'];
    result$data['progress'] = (l$progress as num).toDouble();
    return Variables$Mutation$setShortProgress._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  double get progress => (_$data['progress'] as double);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$progress = progress;
    result$data['progress'] = l$progress;
    return result$data;
  }

  CopyWith$Variables$Mutation$setShortProgress<
          Variables$Mutation$setShortProgress>
      get copyWith => CopyWith$Variables$Mutation$setShortProgress(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$setShortProgress) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$progress = progress;
    return Object.hashAll([
      l$id,
      l$progress,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$setShortProgress<TRes> {
  factory CopyWith$Variables$Mutation$setShortProgress(
    Variables$Mutation$setShortProgress instance,
    TRes Function(Variables$Mutation$setShortProgress) then,
  ) = _CopyWithImpl$Variables$Mutation$setShortProgress;

  factory CopyWith$Variables$Mutation$setShortProgress.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$setShortProgress;

  TRes call({
    String? id,
    double? progress,
  });
}

class _CopyWithImpl$Variables$Mutation$setShortProgress<TRes>
    implements CopyWith$Variables$Mutation$setShortProgress<TRes> {
  _CopyWithImpl$Variables$Mutation$setShortProgress(
    this._instance,
    this._then,
  );

  final Variables$Mutation$setShortProgress _instance;

  final TRes Function(Variables$Mutation$setShortProgress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? progress = _undefined,
  }) =>
      _then(Variables$Mutation$setShortProgress._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (progress != _undefined && progress != null)
          'progress': (progress as double),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$setShortProgress<TRes>
    implements CopyWith$Variables$Mutation$setShortProgress<TRes> {
  _CopyWithStubImpl$Variables$Mutation$setShortProgress(this._res);

  TRes _res;

  call({
    String? id,
    double? progress,
  }) =>
      _res;
}

class Mutation$setShortProgress {
  Mutation$setShortProgress({
    required this.setShortProgress,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$setShortProgress.fromJson(Map<String, dynamic> json) {
    final l$setShortProgress = json['setShortProgress'];
    final l$$__typename = json['__typename'];
    return Mutation$setShortProgress(
      setShortProgress:
          Fragment$Short.fromJson((l$setShortProgress as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Short setShortProgress;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$setShortProgress = setShortProgress;
    _resultData['setShortProgress'] = l$setShortProgress.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$setShortProgress = setShortProgress;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$setShortProgress,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$setShortProgress) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$setShortProgress = setShortProgress;
    final lOther$setShortProgress = other.setShortProgress;
    if (l$setShortProgress != lOther$setShortProgress) {
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

extension UtilityExtension$Mutation$setShortProgress
    on Mutation$setShortProgress {
  CopyWith$Mutation$setShortProgress<Mutation$setShortProgress> get copyWith =>
      CopyWith$Mutation$setShortProgress(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$setShortProgress<TRes> {
  factory CopyWith$Mutation$setShortProgress(
    Mutation$setShortProgress instance,
    TRes Function(Mutation$setShortProgress) then,
  ) = _CopyWithImpl$Mutation$setShortProgress;

  factory CopyWith$Mutation$setShortProgress.stub(TRes res) =
      _CopyWithStubImpl$Mutation$setShortProgress;

  TRes call({
    Fragment$Short? setShortProgress,
    String? $__typename,
  });
  CopyWith$Fragment$Short<TRes> get setShortProgress;
}

class _CopyWithImpl$Mutation$setShortProgress<TRes>
    implements CopyWith$Mutation$setShortProgress<TRes> {
  _CopyWithImpl$Mutation$setShortProgress(
    this._instance,
    this._then,
  );

  final Mutation$setShortProgress _instance;

  final TRes Function(Mutation$setShortProgress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? setShortProgress = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$setShortProgress(
        setShortProgress:
            setShortProgress == _undefined || setShortProgress == null
                ? _instance.setShortProgress
                : (setShortProgress as Fragment$Short),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$Short<TRes> get setShortProgress {
    final local$setShortProgress = _instance.setShortProgress;
    return CopyWith$Fragment$Short(
        local$setShortProgress, (e) => call(setShortProgress: e));
  }
}

class _CopyWithStubImpl$Mutation$setShortProgress<TRes>
    implements CopyWith$Mutation$setShortProgress<TRes> {
  _CopyWithStubImpl$Mutation$setShortProgress(this._res);

  TRes _res;

  call({
    Fragment$Short? setShortProgress,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$Short<TRes> get setShortProgress =>
      CopyWith$Fragment$Short.stub(_res);
}

const documentNodeMutationsetShortProgress = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'setShortProgress'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'progress')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'setShortProgress'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'progress'),
            value: VariableNode(name: NameNode(value: 'progress')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Short'),
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
  fragmentDefinitionShort,
  fragmentDefinitionPlayableMediaItemShort,
  fragmentDefinitionBasicStream,
]);
Mutation$setShortProgress _parserFn$Mutation$setShortProgress(
        Map<String, dynamic> data) =>
    Mutation$setShortProgress.fromJson(data);
typedef OnMutationCompleted$Mutation$setShortProgress = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$setShortProgress?,
);

class Options$Mutation$setShortProgress
    extends graphql.MutationOptions<Mutation$setShortProgress> {
  Options$Mutation$setShortProgress({
    String? operationName,
    required Variables$Mutation$setShortProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$setShortProgress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$setShortProgress? onCompleted,
    graphql.OnMutationUpdate<Mutation$setShortProgress>? update,
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
                        : _parserFn$Mutation$setShortProgress(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsetShortProgress,
          parserFn: _parserFn$Mutation$setShortProgress,
        );

  final OnMutationCompleted$Mutation$setShortProgress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$setShortProgress
    extends graphql.WatchQueryOptions<Mutation$setShortProgress> {
  WatchOptions$Mutation$setShortProgress({
    String? operationName,
    required Variables$Mutation$setShortProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$setShortProgress? typedOptimisticResult,
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
          document: documentNodeMutationsetShortProgress,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$setShortProgress,
        );
}

extension ClientExtension$Mutation$setShortProgress on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$setShortProgress>>
      mutate$setShortProgress(
              Options$Mutation$setShortProgress options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$setShortProgress>
      watchMutation$setShortProgress(
              WatchOptions$Mutation$setShortProgress options) =>
          this.watchMutation(options);
}

class Mutation$setShortProgress$HookResult {
  Mutation$setShortProgress$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$setShortProgress runMutation;

  final graphql.QueryResult<Mutation$setShortProgress> result;
}

Mutation$setShortProgress$HookResult useMutation$setShortProgress(
    [WidgetOptions$Mutation$setShortProgress? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$setShortProgress());
  return Mutation$setShortProgress$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$setShortProgress>
    useWatchMutation$setShortProgress(
            WatchOptions$Mutation$setShortProgress options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$setShortProgress
    extends graphql.MutationOptions<Mutation$setShortProgress> {
  WidgetOptions$Mutation$setShortProgress({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$setShortProgress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$setShortProgress? onCompleted,
    graphql.OnMutationUpdate<Mutation$setShortProgress>? update,
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
                        : _parserFn$Mutation$setShortProgress(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsetShortProgress,
          parserFn: _parserFn$Mutation$setShortProgress,
        );

  final OnMutationCompleted$Mutation$setShortProgress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$setShortProgress
    = graphql.MultiSourceResult<Mutation$setShortProgress> Function(
  Variables$Mutation$setShortProgress, {
  Object? optimisticResult,
  Mutation$setShortProgress? typedOptimisticResult,
});
typedef Builder$Mutation$setShortProgress = widgets.Widget Function(
  RunMutation$Mutation$setShortProgress,
  graphql.QueryResult<Mutation$setShortProgress>?,
);

class Mutation$setShortProgress$Widget
    extends graphql_flutter.Mutation<Mutation$setShortProgress> {
  Mutation$setShortProgress$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$setShortProgress? options,
    required Builder$Mutation$setShortProgress builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$setShortProgress(),
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
