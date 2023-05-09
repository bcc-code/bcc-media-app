import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$CalendarEntryEpisode {
  Fragment$CalendarEntryEpisode({
    required this.id,
    required this.title,
    this.image,
    required this.locked,
    required this.description,
    this.season,
    this.$__typename = 'Episode',
  });

  factory Fragment$CalendarEntryEpisode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$locked = json['locked'];
    final l$description = json['description'];
    final l$season = json['season'];
    final l$$__typename = json['__typename'];
    return Fragment$CalendarEntryEpisode(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      locked: (l$locked as bool),
      description: (l$description as String),
      season: l$season == null
          ? null
          : Fragment$CalendarEntryEpisode$season.fromJson(
              (l$season as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final bool locked;

  final String description;

  final Fragment$CalendarEntryEpisode$season? season;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$locked = locked;
    _resultData['locked'] = l$locked;
    final l$description = description;
    _resultData['description'] = l$description;
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
    final l$image = image;
    final l$locked = locked;
    final l$description = description;
    final l$season = season;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$locked,
      l$description,
      l$season,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CalendarEntryEpisode) ||
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
    final l$locked = locked;
    final lOther$locked = other.locked;
    if (l$locked != lOther$locked) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Fragment$CalendarEntryEpisode
    on Fragment$CalendarEntryEpisode {
  CopyWith$Fragment$CalendarEntryEpisode<Fragment$CalendarEntryEpisode>
      get copyWith => CopyWith$Fragment$CalendarEntryEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$CalendarEntryEpisode<TRes> {
  factory CopyWith$Fragment$CalendarEntryEpisode(
    Fragment$CalendarEntryEpisode instance,
    TRes Function(Fragment$CalendarEntryEpisode) then,
  ) = _CopyWithImpl$Fragment$CalendarEntryEpisode;

  factory CopyWith$Fragment$CalendarEntryEpisode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CalendarEntryEpisode;

  TRes call({
    String? id,
    String? title,
    String? image,
    bool? locked,
    String? description,
    Fragment$CalendarEntryEpisode$season? season,
    String? $__typename,
  });
  CopyWith$Fragment$CalendarEntryEpisode$season<TRes> get season;
}

class _CopyWithImpl$Fragment$CalendarEntryEpisode<TRes>
    implements CopyWith$Fragment$CalendarEntryEpisode<TRes> {
  _CopyWithImpl$Fragment$CalendarEntryEpisode(
    this._instance,
    this._then,
  );

  final Fragment$CalendarEntryEpisode _instance;

  final TRes Function(Fragment$CalendarEntryEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? locked = _undefined,
    Object? description = _undefined,
    Object? season = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CalendarEntryEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        locked: locked == _undefined || locked == null
            ? _instance.locked
            : (locked as bool),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        season: season == _undefined
            ? _instance.season
            : (season as Fragment$CalendarEntryEpisode$season?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$CalendarEntryEpisode$season<TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$CalendarEntryEpisode$season.stub(_then(_instance))
        : CopyWith$Fragment$CalendarEntryEpisode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$CalendarEntryEpisode<TRes>
    implements CopyWith$Fragment$CalendarEntryEpisode<TRes> {
  _CopyWithStubImpl$Fragment$CalendarEntryEpisode(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    bool? locked,
    String? description,
    Fragment$CalendarEntryEpisode$season? season,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$CalendarEntryEpisode$season<TRes> get season =>
      CopyWith$Fragment$CalendarEntryEpisode$season.stub(_res);
}

const fragmentDefinitionCalendarEntryEpisode = FragmentDefinitionNode(
  name: NameNode(value: 'CalendarEntryEpisode'),
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
      name: NameNode(value: 'image'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'locked'),
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
          name: NameNode(value: 'show'),
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
);
const documentNodeFragmentCalendarEntryEpisode = DocumentNode(definitions: [
  fragmentDefinitionCalendarEntryEpisode,
]);

extension ClientExtension$Fragment$CalendarEntryEpisode
    on graphql.GraphQLClient {
  void writeFragment$CalendarEntryEpisode({
    required Fragment$CalendarEntryEpisode data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'CalendarEntryEpisode',
            document: documentNodeFragmentCalendarEntryEpisode,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$CalendarEntryEpisode? readFragment$CalendarEntryEpisode({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'CalendarEntryEpisode',
          document: documentNodeFragmentCalendarEntryEpisode,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$CalendarEntryEpisode.fromJson(result);
  }
}

class Fragment$CalendarEntryEpisode$season {
  Fragment$CalendarEntryEpisode$season({
    required this.id,
    required this.title,
    required this.$show,
    this.$__typename = 'Season',
  });

  factory Fragment$CalendarEntryEpisode$season.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$CalendarEntryEpisode$season(
      id: (l$id as String),
      title: (l$title as String),
      $show: Fragment$CalendarEntryEpisode$season$show.fromJson(
          (l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final Fragment$CalendarEntryEpisode$season$show $show;

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
    if (!(other is Fragment$CalendarEntryEpisode$season) ||
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

extension UtilityExtension$Fragment$CalendarEntryEpisode$season
    on Fragment$CalendarEntryEpisode$season {
  CopyWith$Fragment$CalendarEntryEpisode$season<
          Fragment$CalendarEntryEpisode$season>
      get copyWith => CopyWith$Fragment$CalendarEntryEpisode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$CalendarEntryEpisode$season<TRes> {
  factory CopyWith$Fragment$CalendarEntryEpisode$season(
    Fragment$CalendarEntryEpisode$season instance,
    TRes Function(Fragment$CalendarEntryEpisode$season) then,
  ) = _CopyWithImpl$Fragment$CalendarEntryEpisode$season;

  factory CopyWith$Fragment$CalendarEntryEpisode$season.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CalendarEntryEpisode$season;

  TRes call({
    String? id,
    String? title,
    Fragment$CalendarEntryEpisode$season$show? $show,
    String? $__typename,
  });
  CopyWith$Fragment$CalendarEntryEpisode$season$show<TRes> get $show;
}

class _CopyWithImpl$Fragment$CalendarEntryEpisode$season<TRes>
    implements CopyWith$Fragment$CalendarEntryEpisode$season<TRes> {
  _CopyWithImpl$Fragment$CalendarEntryEpisode$season(
    this._instance,
    this._then,
  );

  final Fragment$CalendarEntryEpisode$season _instance;

  final TRes Function(Fragment$CalendarEntryEpisode$season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CalendarEntryEpisode$season(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show as Fragment$CalendarEntryEpisode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$CalendarEntryEpisode$season$show<TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$CalendarEntryEpisode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$CalendarEntryEpisode$season<TRes>
    implements CopyWith$Fragment$CalendarEntryEpisode$season<TRes> {
  _CopyWithStubImpl$Fragment$CalendarEntryEpisode$season(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    Fragment$CalendarEntryEpisode$season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$CalendarEntryEpisode$season$show<TRes> get $show =>
      CopyWith$Fragment$CalendarEntryEpisode$season$show.stub(_res);
}

class Fragment$CalendarEntryEpisode$season$show {
  Fragment$CalendarEntryEpisode$season$show({
    required this.id,
    required this.title,
    this.$__typename = 'Show',
  });

  factory Fragment$CalendarEntryEpisode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$CalendarEntryEpisode$season$show(
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
    if (!(other is Fragment$CalendarEntryEpisode$season$show) ||
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

extension UtilityExtension$Fragment$CalendarEntryEpisode$season$show
    on Fragment$CalendarEntryEpisode$season$show {
  CopyWith$Fragment$CalendarEntryEpisode$season$show<
          Fragment$CalendarEntryEpisode$season$show>
      get copyWith => CopyWith$Fragment$CalendarEntryEpisode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$CalendarEntryEpisode$season$show<TRes> {
  factory CopyWith$Fragment$CalendarEntryEpisode$season$show(
    Fragment$CalendarEntryEpisode$season$show instance,
    TRes Function(Fragment$CalendarEntryEpisode$season$show) then,
  ) = _CopyWithImpl$Fragment$CalendarEntryEpisode$season$show;

  factory CopyWith$Fragment$CalendarEntryEpisode$season$show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CalendarEntryEpisode$season$show;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$CalendarEntryEpisode$season$show<TRes>
    implements CopyWith$Fragment$CalendarEntryEpisode$season$show<TRes> {
  _CopyWithImpl$Fragment$CalendarEntryEpisode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$CalendarEntryEpisode$season$show _instance;

  final TRes Function(Fragment$CalendarEntryEpisode$season$show) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CalendarEntryEpisode$season$show(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$CalendarEntryEpisode$season$show<TRes>
    implements CopyWith$Fragment$CalendarEntryEpisode$season$show<TRes> {
  _CopyWithStubImpl$Fragment$CalendarEntryEpisode$season$show(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$CalendarDayEntries {
  Fragment$CalendarDayEntries({
    required this.entries,
    this.$__typename = 'CalendarDay',
  });

  factory Fragment$CalendarDayEntries.fromJson(Map<String, dynamic> json) {
    final l$entries = json['entries'];
    final l$$__typename = json['__typename'];
    return Fragment$CalendarDayEntries(
      entries: (l$entries as List<dynamic>)
          .map((e) => Fragment$CalendarDayEntries$entries.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$CalendarDayEntries$entries> entries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$entries = entries;
    _resultData['entries'] = l$entries.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$entries = entries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$entries.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CalendarDayEntries) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$entries = entries;
    final lOther$entries = other.entries;
    if (l$entries.length != lOther$entries.length) {
      return false;
    }
    for (int i = 0; i < l$entries.length; i++) {
      final l$entries$entry = l$entries[i];
      final lOther$entries$entry = lOther$entries[i];
      if (l$entries$entry != lOther$entries$entry) {
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

extension UtilityExtension$Fragment$CalendarDayEntries
    on Fragment$CalendarDayEntries {
  CopyWith$Fragment$CalendarDayEntries<Fragment$CalendarDayEntries>
      get copyWith => CopyWith$Fragment$CalendarDayEntries(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$CalendarDayEntries<TRes> {
  factory CopyWith$Fragment$CalendarDayEntries(
    Fragment$CalendarDayEntries instance,
    TRes Function(Fragment$CalendarDayEntries) then,
  ) = _CopyWithImpl$Fragment$CalendarDayEntries;

  factory CopyWith$Fragment$CalendarDayEntries.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CalendarDayEntries;

  TRes call({
    List<Fragment$CalendarDayEntries$entries>? entries,
    String? $__typename,
  });
  TRes entries(
      Iterable<Fragment$CalendarDayEntries$entries> Function(
              Iterable<
                  CopyWith$Fragment$CalendarDayEntries$entries<
                      Fragment$CalendarDayEntries$entries>>)
          _fn);
}

class _CopyWithImpl$Fragment$CalendarDayEntries<TRes>
    implements CopyWith$Fragment$CalendarDayEntries<TRes> {
  _CopyWithImpl$Fragment$CalendarDayEntries(
    this._instance,
    this._then,
  );

  final Fragment$CalendarDayEntries _instance;

  final TRes Function(Fragment$CalendarDayEntries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? entries = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CalendarDayEntries(
        entries: entries == _undefined || entries == null
            ? _instance.entries
            : (entries as List<Fragment$CalendarDayEntries$entries>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes entries(
          Iterable<Fragment$CalendarDayEntries$entries> Function(
                  Iterable<
                      CopyWith$Fragment$CalendarDayEntries$entries<
                          Fragment$CalendarDayEntries$entries>>)
              _fn) =>
      call(
          entries: _fn(_instance.entries
              .map((e) => CopyWith$Fragment$CalendarDayEntries$entries(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$CalendarDayEntries<TRes>
    implements CopyWith$Fragment$CalendarDayEntries<TRes> {
  _CopyWithStubImpl$Fragment$CalendarDayEntries(this._res);

  TRes _res;

  call({
    List<Fragment$CalendarDayEntries$entries>? entries,
    String? $__typename,
  }) =>
      _res;
  entries(_fn) => _res;
}

const fragmentDefinitionCalendarDayEntries = FragmentDefinitionNode(
  name: NameNode(value: 'CalendarDayEntries'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'CalendarDay'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'entries'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
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
        InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
            name: NameNode(value: 'EpisodeCalendarEntry'),
            isNonNull: false,
          )),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'episode'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'CalendarEntryEpisode'),
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
);
const documentNodeFragmentCalendarDayEntries = DocumentNode(definitions: [
  fragmentDefinitionCalendarDayEntries,
  fragmentDefinitionCalendarEntryEpisode,
]);

extension ClientExtension$Fragment$CalendarDayEntries on graphql.GraphQLClient {
  void writeFragment$CalendarDayEntries({
    required Fragment$CalendarDayEntries data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'CalendarDayEntries',
            document: documentNodeFragmentCalendarDayEntries,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$CalendarDayEntries? readFragment$CalendarDayEntries({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'CalendarDayEntries',
          document: documentNodeFragmentCalendarDayEntries,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$CalendarDayEntries.fromJson(result);
  }
}

class Fragment$CalendarDayEntries$entries {
  Fragment$CalendarDayEntries$entries({
    required this.start,
    required this.end,
    required this.$__typename,
  });

  factory Fragment$CalendarDayEntries$entries.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "EpisodeCalendarEntry":
        return Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry
            .fromJson(json);

      case "SimpleCalendarEntry":
        return Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry
            .fromJson(json);

      case "SeasonCalendarEntry":
        return Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry
            .fromJson(json);

      case "ShowCalendarEntry":
        return Fragment$CalendarDayEntries$entries$$ShowCalendarEntry.fromJson(
            json);

      default:
        final l$start = json['start'];
        final l$end = json['end'];
        final l$$__typename = json['__typename'];
        return Fragment$CalendarDayEntries$entries(
          start: (l$start as String),
          end: (l$end as String),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final String start;

  final String end;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$start = start;
    final l$end = end;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
    if (!(other is Fragment$CalendarDayEntries$entries) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$CalendarDayEntries$entries
    on Fragment$CalendarDayEntries$entries {
  CopyWith$Fragment$CalendarDayEntries$entries<
          Fragment$CalendarDayEntries$entries>
      get copyWith => CopyWith$Fragment$CalendarDayEntries$entries(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(
            Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry)
        episodeCalendarEntry,
    required _T Function(
            Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry)
        simpleCalendarEntry,
    required _T Function(
            Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry)
        seasonCalendarEntry,
    required _T Function(Fragment$CalendarDayEntries$entries$$ShowCalendarEntry)
        showCalendarEntry,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "EpisodeCalendarEntry":
        return episodeCalendarEntry(
            this as Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry);

      case "SimpleCalendarEntry":
        return simpleCalendarEntry(
            this as Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry);

      case "SeasonCalendarEntry":
        return seasonCalendarEntry(
            this as Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry);

      case "ShowCalendarEntry":
        return showCalendarEntry(
            this as Fragment$CalendarDayEntries$entries$$ShowCalendarEntry);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry)?
        episodeCalendarEntry,
    _T Function(Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry)?
        simpleCalendarEntry,
    _T Function(Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry)?
        seasonCalendarEntry,
    _T Function(Fragment$CalendarDayEntries$entries$$ShowCalendarEntry)?
        showCalendarEntry,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "EpisodeCalendarEntry":
        if (episodeCalendarEntry != null) {
          return episodeCalendarEntry(this
              as Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry);
        } else {
          return orElse();
        }

      case "SimpleCalendarEntry":
        if (simpleCalendarEntry != null) {
          return simpleCalendarEntry(
              this as Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry);
        } else {
          return orElse();
        }

      case "SeasonCalendarEntry":
        if (seasonCalendarEntry != null) {
          return seasonCalendarEntry(
              this as Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry);
        } else {
          return orElse();
        }

      case "ShowCalendarEntry":
        if (showCalendarEntry != null) {
          return showCalendarEntry(
              this as Fragment$CalendarDayEntries$entries$$ShowCalendarEntry);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Fragment$CalendarDayEntries$entries<TRes> {
  factory CopyWith$Fragment$CalendarDayEntries$entries(
    Fragment$CalendarDayEntries$entries instance,
    TRes Function(Fragment$CalendarDayEntries$entries) then,
  ) = _CopyWithImpl$Fragment$CalendarDayEntries$entries;

  factory CopyWith$Fragment$CalendarDayEntries$entries.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CalendarDayEntries$entries;

  TRes call({
    String? start,
    String? end,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$CalendarDayEntries$entries<TRes>
    implements CopyWith$Fragment$CalendarDayEntries$entries<TRes> {
  _CopyWithImpl$Fragment$CalendarDayEntries$entries(
    this._instance,
    this._then,
  );

  final Fragment$CalendarDayEntries$entries _instance;

  final TRes Function(Fragment$CalendarDayEntries$entries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? start = _undefined,
    Object? end = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CalendarDayEntries$entries(
        start: start == _undefined || start == null
            ? _instance.start
            : (start as String),
        end: end == _undefined || end == null ? _instance.end : (end as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$CalendarDayEntries$entries<TRes>
    implements CopyWith$Fragment$CalendarDayEntries$entries<TRes> {
  _CopyWithStubImpl$Fragment$CalendarDayEntries$entries(this._res);

  TRes _res;

  call({
    String? start,
    String? end,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry
    implements Fragment$CalendarDayEntries$entries {
  Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry({
    this.episode,
    this.$__typename = 'EpisodeCalendarEntry',
    required this.start,
    required this.end,
  });

  factory Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry.fromJson(
      Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    final l$start = json['start'];
    final l$end = json['end'];
    return Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry(
      episode: l$episode == null
          ? null
          : Fragment$CalendarEntryEpisode.fromJson(
              (l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      start: (l$start as String),
      end: (l$end as String),
    );
  }

  final Fragment$CalendarEntryEpisode? episode;

  final String $__typename;

  final String start;

  final String end;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episode = episode;
    _resultData['episode'] = l$episode?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$start = start;
    _resultData['start'] = l$start;
    final l$end = end;
    _resultData['end'] = l$end;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$episode = episode;
    final l$$__typename = $__typename;
    final l$start = start;
    final l$end = end;
    return Object.hashAll([
      l$episode,
      l$$__typename,
      l$start,
      l$end,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry
    on Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry {
  CopyWith$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry<
          Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry>
      get copyWith =>
          CopyWith$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry<
    TRes> {
  factory CopyWith$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry(
    Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry instance,
    TRes Function(Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry)
        then,
  ) = _CopyWithImpl$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry;

  factory CopyWith$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry;

  TRes call({
    Fragment$CalendarEntryEpisode? episode,
    String? $__typename,
    String? start,
    String? end,
  });
  CopyWith$Fragment$CalendarEntryEpisode<TRes> get episode;
}

class _CopyWithImpl$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry<
        TRes>
    implements
        CopyWith$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry<
            TRes> {
  _CopyWithImpl$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry(
    this._instance,
    this._then,
  );

  final Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry _instance;

  final TRes Function(Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
    Object? start = _undefined,
    Object? end = _undefined,
  }) =>
      _then(Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry(
        episode: episode == _undefined
            ? _instance.episode
            : (episode as Fragment$CalendarEntryEpisode?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        start: start == _undefined || start == null
            ? _instance.start
            : (start as String),
        end: end == _undefined || end == null ? _instance.end : (end as String),
      ));
  CopyWith$Fragment$CalendarEntryEpisode<TRes> get episode {
    final local$episode = _instance.episode;
    return local$episode == null
        ? CopyWith$Fragment$CalendarEntryEpisode.stub(_then(_instance))
        : CopyWith$Fragment$CalendarEntryEpisode(
            local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry<
        TRes>
    implements
        CopyWith$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry<
            TRes> {
  _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$EpisodeCalendarEntry(
      this._res);

  TRes _res;

  call({
    Fragment$CalendarEntryEpisode? episode,
    String? $__typename,
    String? start,
    String? end,
  }) =>
      _res;
  CopyWith$Fragment$CalendarEntryEpisode<TRes> get episode =>
      CopyWith$Fragment$CalendarEntryEpisode.stub(_res);
}

class Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry
    implements Fragment$CalendarDayEntries$entries {
  Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry({
    required this.start,
    required this.end,
    this.$__typename = 'SimpleCalendarEntry',
  });

  factory Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry.fromJson(
      Map<String, dynamic> json) {
    final l$start = json['start'];
    final l$end = json['end'];
    final l$$__typename = json['__typename'];
    return Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry(
      start: (l$start as String),
      end: (l$end as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String start;

  final String end;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$start = start;
    final l$end = end;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
    if (!(other is Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry
    on Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry {
  CopyWith$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry<
          Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry>
      get copyWith =>
          CopyWith$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry<
    TRes> {
  factory CopyWith$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry(
    Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry instance,
    TRes Function(Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry)
        then,
  ) = _CopyWithImpl$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry;

  factory CopyWith$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry;

  TRes call({
    String? start,
    String? end,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry<
        TRes>
    implements
        CopyWith$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry<
            TRes> {
  _CopyWithImpl$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry(
    this._instance,
    this._then,
  );

  final Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry _instance;

  final TRes Function(Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? start = _undefined,
    Object? end = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry(
        start: start == _undefined || start == null
            ? _instance.start
            : (start as String),
        end: end == _undefined || end == null ? _instance.end : (end as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry<
        TRes>
    implements
        CopyWith$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry<
            TRes> {
  _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$SimpleCalendarEntry(
      this._res);

  TRes _res;

  call({
    String? start,
    String? end,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry
    implements Fragment$CalendarDayEntries$entries {
  Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry({
    required this.start,
    required this.end,
    this.$__typename = 'SeasonCalendarEntry',
  });

  factory Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry.fromJson(
      Map<String, dynamic> json) {
    final l$start = json['start'];
    final l$end = json['end'];
    final l$$__typename = json['__typename'];
    return Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry(
      start: (l$start as String),
      end: (l$end as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String start;

  final String end;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$start = start;
    final l$end = end;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
    if (!(other is Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry
    on Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry {
  CopyWith$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry<
          Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry>
      get copyWith =>
          CopyWith$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry<
    TRes> {
  factory CopyWith$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry(
    Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry instance,
    TRes Function(Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry)
        then,
  ) = _CopyWithImpl$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry;

  factory CopyWith$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry;

  TRes call({
    String? start,
    String? end,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry<
        TRes>
    implements
        CopyWith$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry<
            TRes> {
  _CopyWithImpl$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry(
    this._instance,
    this._then,
  );

  final Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry _instance;

  final TRes Function(Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? start = _undefined,
    Object? end = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry(
        start: start == _undefined || start == null
            ? _instance.start
            : (start as String),
        end: end == _undefined || end == null ? _instance.end : (end as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry<
        TRes>
    implements
        CopyWith$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry<
            TRes> {
  _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$SeasonCalendarEntry(
      this._res);

  TRes _res;

  call({
    String? start,
    String? end,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$CalendarDayEntries$entries$$ShowCalendarEntry
    implements Fragment$CalendarDayEntries$entries {
  Fragment$CalendarDayEntries$entries$$ShowCalendarEntry({
    required this.start,
    required this.end,
    this.$__typename = 'ShowCalendarEntry',
  });

  factory Fragment$CalendarDayEntries$entries$$ShowCalendarEntry.fromJson(
      Map<String, dynamic> json) {
    final l$start = json['start'];
    final l$end = json['end'];
    final l$$__typename = json['__typename'];
    return Fragment$CalendarDayEntries$entries$$ShowCalendarEntry(
      start: (l$start as String),
      end: (l$end as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String start;

  final String end;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$start = start;
    final l$end = end;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
    if (!(other is Fragment$CalendarDayEntries$entries$$ShowCalendarEntry) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry
    on Fragment$CalendarDayEntries$entries$$ShowCalendarEntry {
  CopyWith$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry<
          Fragment$CalendarDayEntries$entries$$ShowCalendarEntry>
      get copyWith =>
          CopyWith$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry<
    TRes> {
  factory CopyWith$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry(
    Fragment$CalendarDayEntries$entries$$ShowCalendarEntry instance,
    TRes Function(Fragment$CalendarDayEntries$entries$$ShowCalendarEntry) then,
  ) = _CopyWithImpl$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry;

  factory CopyWith$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry;

  TRes call({
    String? start,
    String? end,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry<TRes>
    implements
        CopyWith$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry<TRes> {
  _CopyWithImpl$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry(
    this._instance,
    this._then,
  );

  final Fragment$CalendarDayEntries$entries$$ShowCalendarEntry _instance;

  final TRes Function(Fragment$CalendarDayEntries$entries$$ShowCalendarEntry)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? start = _undefined,
    Object? end = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$CalendarDayEntries$entries$$ShowCalendarEntry(
        start: start == _undefined || start == null
            ? _instance.start
            : (start as String),
        end: end == _undefined || end == null ? _instance.end : (end as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry<
        TRes>
    implements
        CopyWith$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry<TRes> {
  _CopyWithStubImpl$Fragment$CalendarDayEntries$entries$$ShowCalendarEntry(
      this._res);

  TRes _res;

  call({
    String? start,
    String? end,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$CalendarDayEpisodeEntries {
  factory Variables$Query$CalendarDayEpisodeEntries({required String date}) =>
      Variables$Query$CalendarDayEpisodeEntries._({
        r'date': date,
      });

  Variables$Query$CalendarDayEpisodeEntries._(this._$data);

  factory Variables$Query$CalendarDayEpisodeEntries.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$date = data['date'];
    result$data['date'] = (l$date as String);
    return Variables$Query$CalendarDayEpisodeEntries._(result$data);
  }

  Map<String, dynamic> _$data;

  String get date => (_$data['date'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$date = date;
    result$data['date'] = l$date;
    return result$data;
  }

  CopyWith$Variables$Query$CalendarDayEpisodeEntries<
          Variables$Query$CalendarDayEpisodeEntries>
      get copyWith => CopyWith$Variables$Query$CalendarDayEpisodeEntries(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$CalendarDayEpisodeEntries) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$date = date;
    return Object.hashAll([l$date]);
  }
}

abstract class CopyWith$Variables$Query$CalendarDayEpisodeEntries<TRes> {
  factory CopyWith$Variables$Query$CalendarDayEpisodeEntries(
    Variables$Query$CalendarDayEpisodeEntries instance,
    TRes Function(Variables$Query$CalendarDayEpisodeEntries) then,
  ) = _CopyWithImpl$Variables$Query$CalendarDayEpisodeEntries;

  factory CopyWith$Variables$Query$CalendarDayEpisodeEntries.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$CalendarDayEpisodeEntries;

  TRes call({String? date});
}

class _CopyWithImpl$Variables$Query$CalendarDayEpisodeEntries<TRes>
    implements CopyWith$Variables$Query$CalendarDayEpisodeEntries<TRes> {
  _CopyWithImpl$Variables$Query$CalendarDayEpisodeEntries(
    this._instance,
    this._then,
  );

  final Variables$Query$CalendarDayEpisodeEntries _instance;

  final TRes Function(Variables$Query$CalendarDayEpisodeEntries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? date = _undefined}) =>
      _then(Variables$Query$CalendarDayEpisodeEntries._({
        ..._instance._$data,
        if (date != _undefined && date != null) 'date': (date as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$CalendarDayEpisodeEntries<TRes>
    implements CopyWith$Variables$Query$CalendarDayEpisodeEntries<TRes> {
  _CopyWithStubImpl$Variables$Query$CalendarDayEpisodeEntries(this._res);

  TRes _res;

  call({String? date}) => _res;
}

class Query$CalendarDayEpisodeEntries {
  Query$CalendarDayEpisodeEntries({
    this.calendar,
    this.$__typename = 'QueryRoot',
  });

  factory Query$CalendarDayEpisodeEntries.fromJson(Map<String, dynamic> json) {
    final l$calendar = json['calendar'];
    final l$$__typename = json['__typename'];
    return Query$CalendarDayEpisodeEntries(
      calendar: l$calendar == null
          ? null
          : Query$CalendarDayEpisodeEntries$calendar.fromJson(
              (l$calendar as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$CalendarDayEpisodeEntries$calendar? calendar;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$calendar = calendar;
    _resultData['calendar'] = l$calendar?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$calendar = calendar;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$calendar,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$CalendarDayEpisodeEntries) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$calendar = calendar;
    final lOther$calendar = other.calendar;
    if (l$calendar != lOther$calendar) {
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

extension UtilityExtension$Query$CalendarDayEpisodeEntries
    on Query$CalendarDayEpisodeEntries {
  CopyWith$Query$CalendarDayEpisodeEntries<Query$CalendarDayEpisodeEntries>
      get copyWith => CopyWith$Query$CalendarDayEpisodeEntries(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$CalendarDayEpisodeEntries<TRes> {
  factory CopyWith$Query$CalendarDayEpisodeEntries(
    Query$CalendarDayEpisodeEntries instance,
    TRes Function(Query$CalendarDayEpisodeEntries) then,
  ) = _CopyWithImpl$Query$CalendarDayEpisodeEntries;

  factory CopyWith$Query$CalendarDayEpisodeEntries.stub(TRes res) =
      _CopyWithStubImpl$Query$CalendarDayEpisodeEntries;

  TRes call({
    Query$CalendarDayEpisodeEntries$calendar? calendar,
    String? $__typename,
  });
  CopyWith$Query$CalendarDayEpisodeEntries$calendar<TRes> get calendar;
}

class _CopyWithImpl$Query$CalendarDayEpisodeEntries<TRes>
    implements CopyWith$Query$CalendarDayEpisodeEntries<TRes> {
  _CopyWithImpl$Query$CalendarDayEpisodeEntries(
    this._instance,
    this._then,
  );

  final Query$CalendarDayEpisodeEntries _instance;

  final TRes Function(Query$CalendarDayEpisodeEntries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? calendar = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$CalendarDayEpisodeEntries(
        calendar: calendar == _undefined
            ? _instance.calendar
            : (calendar as Query$CalendarDayEpisodeEntries$calendar?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$CalendarDayEpisodeEntries$calendar<TRes> get calendar {
    final local$calendar = _instance.calendar;
    return local$calendar == null
        ? CopyWith$Query$CalendarDayEpisodeEntries$calendar.stub(
            _then(_instance))
        : CopyWith$Query$CalendarDayEpisodeEntries$calendar(
            local$calendar, (e) => call(calendar: e));
  }
}

class _CopyWithStubImpl$Query$CalendarDayEpisodeEntries<TRes>
    implements CopyWith$Query$CalendarDayEpisodeEntries<TRes> {
  _CopyWithStubImpl$Query$CalendarDayEpisodeEntries(this._res);

  TRes _res;

  call({
    Query$CalendarDayEpisodeEntries$calendar? calendar,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$CalendarDayEpisodeEntries$calendar<TRes> get calendar =>
      CopyWith$Query$CalendarDayEpisodeEntries$calendar.stub(_res);
}

const documentNodeQueryCalendarDayEpisodeEntries = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'CalendarDayEpisodeEntries'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'date')),
        type: NamedTypeNode(
          name: NameNode(value: 'Date'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'calendar'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'day'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'day'),
                value: VariableNode(name: NameNode(value: 'date')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'CalendarDayEntries'),
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
  fragmentDefinitionCalendarDayEntries,
  fragmentDefinitionCalendarEntryEpisode,
]);
Query$CalendarDayEpisodeEntries _parserFn$Query$CalendarDayEpisodeEntries(
        Map<String, dynamic> data) =>
    Query$CalendarDayEpisodeEntries.fromJson(data);
typedef OnQueryComplete$Query$CalendarDayEpisodeEntries = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$CalendarDayEpisodeEntries?,
);

class Options$Query$CalendarDayEpisodeEntries
    extends graphql.QueryOptions<Query$CalendarDayEpisodeEntries> {
  Options$Query$CalendarDayEpisodeEntries({
    String? operationName,
    required Variables$Query$CalendarDayEpisodeEntries variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CalendarDayEpisodeEntries? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$CalendarDayEpisodeEntries? onComplete,
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
                        : _parserFn$Query$CalendarDayEpisodeEntries(data),
                  ),
          onError: onError,
          document: documentNodeQueryCalendarDayEpisodeEntries,
          parserFn: _parserFn$Query$CalendarDayEpisodeEntries,
        );

  final OnQueryComplete$Query$CalendarDayEpisodeEntries? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$CalendarDayEpisodeEntries
    extends graphql.WatchQueryOptions<Query$CalendarDayEpisodeEntries> {
  WatchOptions$Query$CalendarDayEpisodeEntries({
    String? operationName,
    required Variables$Query$CalendarDayEpisodeEntries variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CalendarDayEpisodeEntries? typedOptimisticResult,
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
          document: documentNodeQueryCalendarDayEpisodeEntries,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$CalendarDayEpisodeEntries,
        );
}

class FetchMoreOptions$Query$CalendarDayEpisodeEntries
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$CalendarDayEpisodeEntries({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$CalendarDayEpisodeEntries variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryCalendarDayEpisodeEntries,
        );
}

extension ClientExtension$Query$CalendarDayEpisodeEntries
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$CalendarDayEpisodeEntries>>
      query$CalendarDayEpisodeEntries(
              Options$Query$CalendarDayEpisodeEntries options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$CalendarDayEpisodeEntries>
      watchQuery$CalendarDayEpisodeEntries(
              WatchOptions$Query$CalendarDayEpisodeEntries options) =>
          this.watchQuery(options);
  void writeQuery$CalendarDayEpisodeEntries({
    required Query$CalendarDayEpisodeEntries data,
    required Variables$Query$CalendarDayEpisodeEntries variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryCalendarDayEpisodeEntries),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$CalendarDayEpisodeEntries? readQuery$CalendarDayEpisodeEntries({
    required Variables$Query$CalendarDayEpisodeEntries variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryCalendarDayEpisodeEntries),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$CalendarDayEpisodeEntries.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$CalendarDayEpisodeEntries>
    useQuery$CalendarDayEpisodeEntries(
            Options$Query$CalendarDayEpisodeEntries options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$CalendarDayEpisodeEntries>
    useWatchQuery$CalendarDayEpisodeEntries(
            WatchOptions$Query$CalendarDayEpisodeEntries options) =>
        graphql_flutter.useWatchQuery(options);

class Query$CalendarDayEpisodeEntries$Widget
    extends graphql_flutter.Query<Query$CalendarDayEpisodeEntries> {
  Query$CalendarDayEpisodeEntries$Widget({
    widgets.Key? key,
    required Options$Query$CalendarDayEpisodeEntries options,
    required graphql_flutter.QueryBuilder<Query$CalendarDayEpisodeEntries>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$CalendarDayEpisodeEntries$calendar {
  Query$CalendarDayEpisodeEntries$calendar({
    required this.day,
    this.$__typename = 'Calendar',
  });

  factory Query$CalendarDayEpisodeEntries$calendar.fromJson(
      Map<String, dynamic> json) {
    final l$day = json['day'];
    final l$$__typename = json['__typename'];
    return Query$CalendarDayEpisodeEntries$calendar(
      day:
          Fragment$CalendarDayEntries.fromJson((l$day as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CalendarDayEntries day;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$day = day;
    _resultData['day'] = l$day.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$day = day;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$day,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$CalendarDayEpisodeEntries$calendar) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
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

extension UtilityExtension$Query$CalendarDayEpisodeEntries$calendar
    on Query$CalendarDayEpisodeEntries$calendar {
  CopyWith$Query$CalendarDayEpisodeEntries$calendar<
          Query$CalendarDayEpisodeEntries$calendar>
      get copyWith => CopyWith$Query$CalendarDayEpisodeEntries$calendar(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$CalendarDayEpisodeEntries$calendar<TRes> {
  factory CopyWith$Query$CalendarDayEpisodeEntries$calendar(
    Query$CalendarDayEpisodeEntries$calendar instance,
    TRes Function(Query$CalendarDayEpisodeEntries$calendar) then,
  ) = _CopyWithImpl$Query$CalendarDayEpisodeEntries$calendar;

  factory CopyWith$Query$CalendarDayEpisodeEntries$calendar.stub(TRes res) =
      _CopyWithStubImpl$Query$CalendarDayEpisodeEntries$calendar;

  TRes call({
    Fragment$CalendarDayEntries? day,
    String? $__typename,
  });
  CopyWith$Fragment$CalendarDayEntries<TRes> get day;
}

class _CopyWithImpl$Query$CalendarDayEpisodeEntries$calendar<TRes>
    implements CopyWith$Query$CalendarDayEpisodeEntries$calendar<TRes> {
  _CopyWithImpl$Query$CalendarDayEpisodeEntries$calendar(
    this._instance,
    this._then,
  );

  final Query$CalendarDayEpisodeEntries$calendar _instance;

  final TRes Function(Query$CalendarDayEpisodeEntries$calendar) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? day = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$CalendarDayEpisodeEntries$calendar(
        day: day == _undefined || day == null
            ? _instance.day
            : (day as Fragment$CalendarDayEntries),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$CalendarDayEntries<TRes> get day {
    final local$day = _instance.day;
    return CopyWith$Fragment$CalendarDayEntries(local$day, (e) => call(day: e));
  }
}

class _CopyWithStubImpl$Query$CalendarDayEpisodeEntries$calendar<TRes>
    implements CopyWith$Query$CalendarDayEpisodeEntries$calendar<TRes> {
  _CopyWithStubImpl$Query$CalendarDayEpisodeEntries$calendar(this._res);

  TRes _res;

  call({
    Fragment$CalendarDayEntries? day,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$CalendarDayEntries<TRes> get day =>
      CopyWith$Fragment$CalendarDayEntries.stub(_res);
}
