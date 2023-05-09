import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$LessonProgressOverview {
  Fragment$LessonProgressOverview({
    required this.id,
    required this.locked,
    required this.progress,
    this.$__typename = 'Lesson',
  });

  factory Fragment$LessonProgressOverview.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$locked = json['locked'];
    final l$progress = json['progress'];
    final l$$__typename = json['__typename'];
    return Fragment$LessonProgressOverview(
      id: (l$id as String),
      locked: (l$locked as bool),
      progress: Fragment$LessonProgressOverview$progress.fromJson(
          (l$progress as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final bool locked;

  final Fragment$LessonProgressOverview$progress progress;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$locked = locked;
    _resultData['locked'] = l$locked;
    final l$progress = progress;
    _resultData['progress'] = l$progress.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$locked = locked;
    final l$progress = progress;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$locked,
      l$progress,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$LessonProgressOverview) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$locked = locked;
    final lOther$locked = other.locked;
    if (l$locked != lOther$locked) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
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

extension UtilityExtension$Fragment$LessonProgressOverview
    on Fragment$LessonProgressOverview {
  CopyWith$Fragment$LessonProgressOverview<Fragment$LessonProgressOverview>
      get copyWith => CopyWith$Fragment$LessonProgressOverview(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$LessonProgressOverview<TRes> {
  factory CopyWith$Fragment$LessonProgressOverview(
    Fragment$LessonProgressOverview instance,
    TRes Function(Fragment$LessonProgressOverview) then,
  ) = _CopyWithImpl$Fragment$LessonProgressOverview;

  factory CopyWith$Fragment$LessonProgressOverview.stub(TRes res) =
      _CopyWithStubImpl$Fragment$LessonProgressOverview;

  TRes call({
    String? id,
    bool? locked,
    Fragment$LessonProgressOverview$progress? progress,
    String? $__typename,
  });
  CopyWith$Fragment$LessonProgressOverview$progress<TRes> get progress;
}

class _CopyWithImpl$Fragment$LessonProgressOverview<TRes>
    implements CopyWith$Fragment$LessonProgressOverview<TRes> {
  _CopyWithImpl$Fragment$LessonProgressOverview(
    this._instance,
    this._then,
  );

  final Fragment$LessonProgressOverview _instance;

  final TRes Function(Fragment$LessonProgressOverview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? locked = _undefined,
    Object? progress = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$LessonProgressOverview(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        locked: locked == _undefined || locked == null
            ? _instance.locked
            : (locked as bool),
        progress: progress == _undefined || progress == null
            ? _instance.progress
            : (progress as Fragment$LessonProgressOverview$progress),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$LessonProgressOverview$progress<TRes> get progress {
    final local$progress = _instance.progress;
    return CopyWith$Fragment$LessonProgressOverview$progress(
        local$progress, (e) => call(progress: e));
  }
}

class _CopyWithStubImpl$Fragment$LessonProgressOverview<TRes>
    implements CopyWith$Fragment$LessonProgressOverview<TRes> {
  _CopyWithStubImpl$Fragment$LessonProgressOverview(this._res);

  TRes _res;

  call({
    String? id,
    bool? locked,
    Fragment$LessonProgressOverview$progress? progress,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$LessonProgressOverview$progress<TRes> get progress =>
      CopyWith$Fragment$LessonProgressOverview$progress.stub(_res);
}

const fragmentDefinitionLessonProgressOverview = FragmentDefinitionNode(
  name: NameNode(value: 'LessonProgressOverview'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Lesson'),
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
      name: NameNode(value: 'locked'),
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
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'total'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'completed'),
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
);
const documentNodeFragmentLessonProgressOverview = DocumentNode(definitions: [
  fragmentDefinitionLessonProgressOverview,
]);

extension ClientExtension$Fragment$LessonProgressOverview
    on graphql.GraphQLClient {
  void writeFragment$LessonProgressOverview({
    required Fragment$LessonProgressOverview data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'LessonProgressOverview',
            document: documentNodeFragmentLessonProgressOverview,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$LessonProgressOverview? readFragment$LessonProgressOverview({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'LessonProgressOverview',
          document: documentNodeFragmentLessonProgressOverview,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$LessonProgressOverview.fromJson(result);
  }
}

class Fragment$LessonProgressOverview$progress {
  Fragment$LessonProgressOverview$progress({
    required this.total,
    required this.completed,
    this.$__typename = 'TasksProgress',
  });

  factory Fragment$LessonProgressOverview$progress.fromJson(
      Map<String, dynamic> json) {
    final l$total = json['total'];
    final l$completed = json['completed'];
    final l$$__typename = json['__typename'];
    return Fragment$LessonProgressOverview$progress(
      total: (l$total as int),
      completed: (l$completed as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int total;

  final int completed;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$total = total;
    _resultData['total'] = l$total;
    final l$completed = completed;
    _resultData['completed'] = l$completed;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$total = total;
    final l$completed = completed;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$total,
      l$completed,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$LessonProgressOverview$progress) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$completed = completed;
    final lOther$completed = other.completed;
    if (l$completed != lOther$completed) {
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

extension UtilityExtension$Fragment$LessonProgressOverview$progress
    on Fragment$LessonProgressOverview$progress {
  CopyWith$Fragment$LessonProgressOverview$progress<
          Fragment$LessonProgressOverview$progress>
      get copyWith => CopyWith$Fragment$LessonProgressOverview$progress(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$LessonProgressOverview$progress<TRes> {
  factory CopyWith$Fragment$LessonProgressOverview$progress(
    Fragment$LessonProgressOverview$progress instance,
    TRes Function(Fragment$LessonProgressOverview$progress) then,
  ) = _CopyWithImpl$Fragment$LessonProgressOverview$progress;

  factory CopyWith$Fragment$LessonProgressOverview$progress.stub(TRes res) =
      _CopyWithStubImpl$Fragment$LessonProgressOverview$progress;

  TRes call({
    int? total,
    int? completed,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$LessonProgressOverview$progress<TRes>
    implements CopyWith$Fragment$LessonProgressOverview$progress<TRes> {
  _CopyWithImpl$Fragment$LessonProgressOverview$progress(
    this._instance,
    this._then,
  );

  final Fragment$LessonProgressOverview$progress _instance;

  final TRes Function(Fragment$LessonProgressOverview$progress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? total = _undefined,
    Object? completed = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$LessonProgressOverview$progress(
        total: total == _undefined || total == null
            ? _instance.total
            : (total as int),
        completed: completed == _undefined || completed == null
            ? _instance.completed
            : (completed as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$LessonProgressOverview$progress<TRes>
    implements CopyWith$Fragment$LessonProgressOverview$progress<TRes> {
  _CopyWithStubImpl$Fragment$LessonProgressOverview$progress(this._res);

  TRes _res;

  call({
    int? total,
    int? completed,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$EpisodeLessonProgressOverview {
  Fragment$EpisodeLessonProgressOverview({
    required this.id,
    required this.lessons,
    this.$__typename = 'Episode',
  });

  factory Fragment$EpisodeLessonProgressOverview.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$lessons = json['lessons'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeLessonProgressOverview(
      id: (l$id as String),
      lessons: Fragment$EpisodeLessonProgressOverview$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Fragment$EpisodeLessonProgressOverview$lessons lessons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$lessons = lessons;
    _resultData['lessons'] = l$lessons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$lessons = lessons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$lessons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$EpisodeLessonProgressOverview) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$lessons = lessons;
    final lOther$lessons = other.lessons;
    if (l$lessons != lOther$lessons) {
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

extension UtilityExtension$Fragment$EpisodeLessonProgressOverview
    on Fragment$EpisodeLessonProgressOverview {
  CopyWith$Fragment$EpisodeLessonProgressOverview<
          Fragment$EpisodeLessonProgressOverview>
      get copyWith => CopyWith$Fragment$EpisodeLessonProgressOverview(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeLessonProgressOverview<TRes> {
  factory CopyWith$Fragment$EpisodeLessonProgressOverview(
    Fragment$EpisodeLessonProgressOverview instance,
    TRes Function(Fragment$EpisodeLessonProgressOverview) then,
  ) = _CopyWithImpl$Fragment$EpisodeLessonProgressOverview;

  factory CopyWith$Fragment$EpisodeLessonProgressOverview.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeLessonProgressOverview;

  TRes call({
    String? id,
    Fragment$EpisodeLessonProgressOverview$lessons? lessons,
    String? $__typename,
  });
  CopyWith$Fragment$EpisodeLessonProgressOverview$lessons<TRes> get lessons;
}

class _CopyWithImpl$Fragment$EpisodeLessonProgressOverview<TRes>
    implements CopyWith$Fragment$EpisodeLessonProgressOverview<TRes> {
  _CopyWithImpl$Fragment$EpisodeLessonProgressOverview(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeLessonProgressOverview _instance;

  final TRes Function(Fragment$EpisodeLessonProgressOverview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? lessons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeLessonProgressOverview(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        lessons: lessons == _undefined || lessons == null
            ? _instance.lessons
            : (lessons as Fragment$EpisodeLessonProgressOverview$lessons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EpisodeLessonProgressOverview$lessons<TRes> get lessons {
    final local$lessons = _instance.lessons;
    return CopyWith$Fragment$EpisodeLessonProgressOverview$lessons(
        local$lessons, (e) => call(lessons: e));
  }
}

class _CopyWithStubImpl$Fragment$EpisodeLessonProgressOverview<TRes>
    implements CopyWith$Fragment$EpisodeLessonProgressOverview<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeLessonProgressOverview(this._res);

  TRes _res;

  call({
    String? id,
    Fragment$EpisodeLessonProgressOverview$lessons? lessons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EpisodeLessonProgressOverview$lessons<TRes> get lessons =>
      CopyWith$Fragment$EpisodeLessonProgressOverview$lessons.stub(_res);
}

const fragmentDefinitionEpisodeLessonProgressOverview = FragmentDefinitionNode(
  name: NameNode(value: 'EpisodeLessonProgressOverview'),
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
      name: NameNode(value: 'lessons'),
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
              name: NameNode(value: 'LessonProgressOverview'),
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
);
const documentNodeFragmentEpisodeLessonProgressOverview =
    DocumentNode(definitions: [
  fragmentDefinitionEpisodeLessonProgressOverview,
  fragmentDefinitionLessonProgressOverview,
]);

extension ClientExtension$Fragment$EpisodeLessonProgressOverview
    on graphql.GraphQLClient {
  void writeFragment$EpisodeLessonProgressOverview({
    required Fragment$EpisodeLessonProgressOverview data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'EpisodeLessonProgressOverview',
            document: documentNodeFragmentEpisodeLessonProgressOverview,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$EpisodeLessonProgressOverview?
      readFragment$EpisodeLessonProgressOverview({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'EpisodeLessonProgressOverview',
          document: documentNodeFragmentEpisodeLessonProgressOverview,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$EpisodeLessonProgressOverview.fromJson(result);
  }
}

class Fragment$EpisodeLessonProgressOverview$lessons {
  Fragment$EpisodeLessonProgressOverview$lessons({
    required this.items,
    this.$__typename = 'LessonPagination',
  });

  factory Fragment$EpisodeLessonProgressOverview$lessons.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeLessonProgressOverview$lessons(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$LessonProgressOverview.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$LessonProgressOverview> items;

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
    if (!(other is Fragment$EpisodeLessonProgressOverview$lessons) ||
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

extension UtilityExtension$Fragment$EpisodeLessonProgressOverview$lessons
    on Fragment$EpisodeLessonProgressOverview$lessons {
  CopyWith$Fragment$EpisodeLessonProgressOverview$lessons<
          Fragment$EpisodeLessonProgressOverview$lessons>
      get copyWith => CopyWith$Fragment$EpisodeLessonProgressOverview$lessons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EpisodeLessonProgressOverview$lessons<TRes> {
  factory CopyWith$Fragment$EpisodeLessonProgressOverview$lessons(
    Fragment$EpisodeLessonProgressOverview$lessons instance,
    TRes Function(Fragment$EpisodeLessonProgressOverview$lessons) then,
  ) = _CopyWithImpl$Fragment$EpisodeLessonProgressOverview$lessons;

  factory CopyWith$Fragment$EpisodeLessonProgressOverview$lessons.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$EpisodeLessonProgressOverview$lessons;

  TRes call({
    List<Fragment$LessonProgressOverview>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$LessonProgressOverview> Function(
              Iterable<
                  CopyWith$Fragment$LessonProgressOverview<
                      Fragment$LessonProgressOverview>>)
          _fn);
}

class _CopyWithImpl$Fragment$EpisodeLessonProgressOverview$lessons<TRes>
    implements CopyWith$Fragment$EpisodeLessonProgressOverview$lessons<TRes> {
  _CopyWithImpl$Fragment$EpisodeLessonProgressOverview$lessons(
    this._instance,
    this._then,
  );

  final Fragment$EpisodeLessonProgressOverview$lessons _instance;

  final TRes Function(Fragment$EpisodeLessonProgressOverview$lessons) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeLessonProgressOverview$lessons(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$LessonProgressOverview>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$LessonProgressOverview> Function(
                  Iterable<
                      CopyWith$Fragment$LessonProgressOverview<
                          Fragment$LessonProgressOverview>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$LessonProgressOverview(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$EpisodeLessonProgressOverview$lessons<TRes>
    implements CopyWith$Fragment$EpisodeLessonProgressOverview$lessons<TRes> {
  _CopyWithStubImpl$Fragment$EpisodeLessonProgressOverview$lessons(this._res);

  TRes _res;

  call({
    List<Fragment$LessonProgressOverview>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Variables$Query$GetStudyTopicLessonStatuses {
  factory Variables$Query$GetStudyTopicLessonStatuses({
    required String id,
    required int first,
  }) =>
      Variables$Query$GetStudyTopicLessonStatuses._({
        r'id': id,
        r'first': first,
      });

  Variables$Query$GetStudyTopicLessonStatuses._(this._$data);

  factory Variables$Query$GetStudyTopicLessonStatuses.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$first = data['first'];
    result$data['first'] = (l$first as int);
    return Variables$Query$GetStudyTopicLessonStatuses._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  int get first => (_$data['first'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$first = first;
    result$data['first'] = l$first;
    return result$data;
  }

  CopyWith$Variables$Query$GetStudyTopicLessonStatuses<
          Variables$Query$GetStudyTopicLessonStatuses>
      get copyWith => CopyWith$Variables$Query$GetStudyTopicLessonStatuses(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetStudyTopicLessonStatuses) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$first = first;
    return Object.hashAll([
      l$id,
      l$first,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetStudyTopicLessonStatuses<TRes> {
  factory CopyWith$Variables$Query$GetStudyTopicLessonStatuses(
    Variables$Query$GetStudyTopicLessonStatuses instance,
    TRes Function(Variables$Query$GetStudyTopicLessonStatuses) then,
  ) = _CopyWithImpl$Variables$Query$GetStudyTopicLessonStatuses;

  factory CopyWith$Variables$Query$GetStudyTopicLessonStatuses.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetStudyTopicLessonStatuses;

  TRes call({
    String? id,
    int? first,
  });
}

class _CopyWithImpl$Variables$Query$GetStudyTopicLessonStatuses<TRes>
    implements CopyWith$Variables$Query$GetStudyTopicLessonStatuses<TRes> {
  _CopyWithImpl$Variables$Query$GetStudyTopicLessonStatuses(
    this._instance,
    this._then,
  );

  final Variables$Query$GetStudyTopicLessonStatuses _instance;

  final TRes Function(Variables$Query$GetStudyTopicLessonStatuses) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? first = _undefined,
  }) =>
      _then(Variables$Query$GetStudyTopicLessonStatuses._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (first != _undefined && first != null) 'first': (first as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetStudyTopicLessonStatuses<TRes>
    implements CopyWith$Variables$Query$GetStudyTopicLessonStatuses<TRes> {
  _CopyWithStubImpl$Variables$Query$GetStudyTopicLessonStatuses(this._res);

  TRes _res;

  call({
    String? id,
    int? first,
  }) =>
      _res;
}

class Query$GetStudyTopicLessonStatuses {
  Query$GetStudyTopicLessonStatuses({
    required this.studyTopic,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetStudyTopicLessonStatuses.fromJson(
      Map<String, dynamic> json) {
    final l$studyTopic = json['studyTopic'];
    final l$$__typename = json['__typename'];
    return Query$GetStudyTopicLessonStatuses(
      studyTopic: Query$GetStudyTopicLessonStatuses$studyTopic.fromJson(
          (l$studyTopic as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetStudyTopicLessonStatuses$studyTopic studyTopic;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$studyTopic = studyTopic;
    _resultData['studyTopic'] = l$studyTopic.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$studyTopic = studyTopic;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$studyTopic,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetStudyTopicLessonStatuses) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$studyTopic = studyTopic;
    final lOther$studyTopic = other.studyTopic;
    if (l$studyTopic != lOther$studyTopic) {
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

extension UtilityExtension$Query$GetStudyTopicLessonStatuses
    on Query$GetStudyTopicLessonStatuses {
  CopyWith$Query$GetStudyTopicLessonStatuses<Query$GetStudyTopicLessonStatuses>
      get copyWith => CopyWith$Query$GetStudyTopicLessonStatuses(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStudyTopicLessonStatuses<TRes> {
  factory CopyWith$Query$GetStudyTopicLessonStatuses(
    Query$GetStudyTopicLessonStatuses instance,
    TRes Function(Query$GetStudyTopicLessonStatuses) then,
  ) = _CopyWithImpl$Query$GetStudyTopicLessonStatuses;

  factory CopyWith$Query$GetStudyTopicLessonStatuses.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses;

  TRes call({
    Query$GetStudyTopicLessonStatuses$studyTopic? studyTopic,
    String? $__typename,
  });
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic<TRes> get studyTopic;
}

class _CopyWithImpl$Query$GetStudyTopicLessonStatuses<TRes>
    implements CopyWith$Query$GetStudyTopicLessonStatuses<TRes> {
  _CopyWithImpl$Query$GetStudyTopicLessonStatuses(
    this._instance,
    this._then,
  );

  final Query$GetStudyTopicLessonStatuses _instance;

  final TRes Function(Query$GetStudyTopicLessonStatuses) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? studyTopic = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStudyTopicLessonStatuses(
        studyTopic: studyTopic == _undefined || studyTopic == null
            ? _instance.studyTopic
            : (studyTopic as Query$GetStudyTopicLessonStatuses$studyTopic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic<TRes> get studyTopic {
    final local$studyTopic = _instance.studyTopic;
    return CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic(
        local$studyTopic, (e) => call(studyTopic: e));
  }
}

class _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses<TRes>
    implements CopyWith$Query$GetStudyTopicLessonStatuses<TRes> {
  _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses(this._res);

  TRes _res;

  call({
    Query$GetStudyTopicLessonStatuses$studyTopic? studyTopic,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic<TRes> get studyTopic =>
      CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic.stub(_res);
}

const documentNodeQueryGetStudyTopicLessonStatuses = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetStudyTopicLessonStatuses'),
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
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'studyTopic'),
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
            name: NameNode(value: 'lessons'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: VariableNode(name: NameNode(value: 'first')),
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
                    name: NameNode(value: 'completed'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'episodes'),
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
                            name: NameNode(value: 'locked'),
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
]);
Query$GetStudyTopicLessonStatuses _parserFn$Query$GetStudyTopicLessonStatuses(
        Map<String, dynamic> data) =>
    Query$GetStudyTopicLessonStatuses.fromJson(data);
typedef OnQueryComplete$Query$GetStudyTopicLessonStatuses = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$GetStudyTopicLessonStatuses?,
);

class Options$Query$GetStudyTopicLessonStatuses
    extends graphql.QueryOptions<Query$GetStudyTopicLessonStatuses> {
  Options$Query$GetStudyTopicLessonStatuses({
    String? operationName,
    required Variables$Query$GetStudyTopicLessonStatuses variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetStudyTopicLessonStatuses? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetStudyTopicLessonStatuses? onComplete,
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
                        : _parserFn$Query$GetStudyTopicLessonStatuses(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetStudyTopicLessonStatuses,
          parserFn: _parserFn$Query$GetStudyTopicLessonStatuses,
        );

  final OnQueryComplete$Query$GetStudyTopicLessonStatuses? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetStudyTopicLessonStatuses
    extends graphql.WatchQueryOptions<Query$GetStudyTopicLessonStatuses> {
  WatchOptions$Query$GetStudyTopicLessonStatuses({
    String? operationName,
    required Variables$Query$GetStudyTopicLessonStatuses variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetStudyTopicLessonStatuses? typedOptimisticResult,
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
          document: documentNodeQueryGetStudyTopicLessonStatuses,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetStudyTopicLessonStatuses,
        );
}

class FetchMoreOptions$Query$GetStudyTopicLessonStatuses
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetStudyTopicLessonStatuses({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetStudyTopicLessonStatuses variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetStudyTopicLessonStatuses,
        );
}

extension ClientExtension$Query$GetStudyTopicLessonStatuses
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetStudyTopicLessonStatuses>>
      query$GetStudyTopicLessonStatuses(
              Options$Query$GetStudyTopicLessonStatuses options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetStudyTopicLessonStatuses>
      watchQuery$GetStudyTopicLessonStatuses(
              WatchOptions$Query$GetStudyTopicLessonStatuses options) =>
          this.watchQuery(options);
  void writeQuery$GetStudyTopicLessonStatuses({
    required Query$GetStudyTopicLessonStatuses data,
    required Variables$Query$GetStudyTopicLessonStatuses variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetStudyTopicLessonStatuses),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetStudyTopicLessonStatuses? readQuery$GetStudyTopicLessonStatuses({
    required Variables$Query$GetStudyTopicLessonStatuses variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetStudyTopicLessonStatuses),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetStudyTopicLessonStatuses.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetStudyTopicLessonStatuses>
    useQuery$GetStudyTopicLessonStatuses(
            Options$Query$GetStudyTopicLessonStatuses options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetStudyTopicLessonStatuses>
    useWatchQuery$GetStudyTopicLessonStatuses(
            WatchOptions$Query$GetStudyTopicLessonStatuses options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetStudyTopicLessonStatuses$Widget
    extends graphql_flutter.Query<Query$GetStudyTopicLessonStatuses> {
  Query$GetStudyTopicLessonStatuses$Widget({
    widgets.Key? key,
    required Options$Query$GetStudyTopicLessonStatuses options,
    required graphql_flutter.QueryBuilder<Query$GetStudyTopicLessonStatuses>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetStudyTopicLessonStatuses$studyTopic {
  Query$GetStudyTopicLessonStatuses$studyTopic({
    required this.lessons,
    this.$__typename = 'StudyTopic',
  });

  factory Query$GetStudyTopicLessonStatuses$studyTopic.fromJson(
      Map<String, dynamic> json) {
    final l$lessons = json['lessons'];
    final l$$__typename = json['__typename'];
    return Query$GetStudyTopicLessonStatuses$studyTopic(
      lessons: Query$GetStudyTopicLessonStatuses$studyTopic$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetStudyTopicLessonStatuses$studyTopic$lessons lessons;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$lessons = lessons;
    _resultData['lessons'] = l$lessons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$lessons = lessons;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$lessons,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetStudyTopicLessonStatuses$studyTopic) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$lessons = lessons;
    final lOther$lessons = other.lessons;
    if (l$lessons != lOther$lessons) {
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

extension UtilityExtension$Query$GetStudyTopicLessonStatuses$studyTopic
    on Query$GetStudyTopicLessonStatuses$studyTopic {
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic<
          Query$GetStudyTopicLessonStatuses$studyTopic>
      get copyWith => CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic<TRes> {
  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic(
    Query$GetStudyTopicLessonStatuses$studyTopic instance,
    TRes Function(Query$GetStudyTopicLessonStatuses$studyTopic) then,
  ) = _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic;

  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic.stub(TRes res) =
      _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic;

  TRes call({
    Query$GetStudyTopicLessonStatuses$studyTopic$lessons? lessons,
    String? $__typename,
  });
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons<TRes>
      get lessons;
}

class _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic<TRes>
    implements CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic<TRes> {
  _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic(
    this._instance,
    this._then,
  );

  final Query$GetStudyTopicLessonStatuses$studyTopic _instance;

  final TRes Function(Query$GetStudyTopicLessonStatuses$studyTopic) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? lessons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStudyTopicLessonStatuses$studyTopic(
        lessons: lessons == _undefined || lessons == null
            ? _instance.lessons
            : (lessons as Query$GetStudyTopicLessonStatuses$studyTopic$lessons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons<TRes>
      get lessons {
    final local$lessons = _instance.lessons;
    return CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons(
        local$lessons, (e) => call(lessons: e));
  }
}

class _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic<TRes>
    implements CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic<TRes> {
  _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic(this._res);

  TRes _res;

  call({
    Query$GetStudyTopicLessonStatuses$studyTopic$lessons? lessons,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons<TRes>
      get lessons =>
          CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons.stub(
              _res);
}

class Query$GetStudyTopicLessonStatuses$studyTopic$lessons {
  Query$GetStudyTopicLessonStatuses$studyTopic$lessons({
    required this.items,
    this.$__typename = 'LessonPagination',
  });

  factory Query$GetStudyTopicLessonStatuses$studyTopic$lessons.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetStudyTopicLessonStatuses$studyTopic$lessons(
      items: (l$items as List<dynamic>)
          .map((e) => Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items> items;

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
    if (!(other is Query$GetStudyTopicLessonStatuses$studyTopic$lessons) ||
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

extension UtilityExtension$Query$GetStudyTopicLessonStatuses$studyTopic$lessons
    on Query$GetStudyTopicLessonStatuses$studyTopic$lessons {
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons<
          Query$GetStudyTopicLessonStatuses$studyTopic$lessons>
      get copyWith =>
          CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons<
    TRes> {
  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons(
    Query$GetStudyTopicLessonStatuses$studyTopic$lessons instance,
    TRes Function(Query$GetStudyTopicLessonStatuses$studyTopic$lessons) then,
  ) = _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons;

  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons;

  TRes call({
    List<Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items> Function(
              Iterable<
                  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items<
                      Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items>>)
          _fn);
}

class _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons<TRes>
    implements
        CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons<TRes> {
  _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons(
    this._instance,
    this._then,
  );

  final Query$GetStudyTopicLessonStatuses$studyTopic$lessons _instance;

  final TRes Function(Query$GetStudyTopicLessonStatuses$studyTopic$lessons)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStudyTopicLessonStatuses$studyTopic$lessons(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items> Function(
                  Iterable<
                      CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items<
                          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons<
        TRes>
    implements
        CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons<TRes> {
  _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons(
      this._res);

  TRes _res;

  call({
    List<Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items {
  Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items({
    required this.id,
    required this.completed,
    required this.episodes,
    this.$__typename = 'Lesson',
  });

  factory Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$completed = json['completed'];
    final l$episodes = json['episodes'];
    final l$$__typename = json['__typename'];
    return Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items(
      id: (l$id as String),
      completed: (l$completed as bool),
      episodes:
          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes
              .fromJson((l$episodes as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final bool completed;

  final Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes
      episodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$completed = completed;
    _resultData['completed'] = l$completed;
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$completed = completed;
    final l$episodes = episodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$completed,
      l$episodes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$completed = completed;
    final lOther$completed = other.completed;
    if (l$completed != lOther$completed) {
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

extension UtilityExtension$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items
    on Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items {
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items<
          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items>
      get copyWith =>
          CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items<
    TRes> {
  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items(
    Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items instance,
    TRes Function(Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items)
        then,
  ) = _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items;

  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items;

  TRes call({
    String? id,
    bool? completed,
    Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes?
        episodes,
    String? $__typename,
  });
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes<
      TRes> get episodes;
}

class _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items<
        TRes>
    implements
        CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items<
            TRes> {
  _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items(
    this._instance,
    this._then,
  );

  final Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items _instance;

  final TRes Function(
      Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? completed = _undefined,
    Object? episodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        completed: completed == _undefined || completed == null
            ? _instance.completed
            : (completed as bool),
        episodes: episodes == _undefined || episodes == null
            ? _instance.episodes
            : (episodes
                as Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes<
      TRes> get episodes {
    final local$episodes = _instance.episodes;
    return CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes(
        local$episodes, (e) => call(episodes: e));
  }
}

class _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items<
        TRes>
    implements
        CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items<
            TRes> {
  _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items(
      this._res);

  TRes _res;

  call({
    String? id,
    bool? completed,
    Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes?
        episodes,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes<
          TRes>
      get episodes =>
          CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes
              .stub(_res);
}

class Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes {
  Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes({
    required this.items,
    this.$__typename = 'EpisodePagination',
  });

  factory Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items>
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
            is Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes) ||
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

extension UtilityExtension$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes
    on Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes {
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes<
          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes>
      get copyWith =>
          CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes<
    TRes> {
  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes(
    Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes
        instance,
    TRes Function(
            Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes)
        then,
  ) = _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes;

  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes;

  TRes call({
    List<Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items> Function(
              Iterable<
                  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items<
                      Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items>>)
          _fn);
}

class _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes<
        TRes>
    implements
        CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes<
            TRes> {
  _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes(
    this._instance,
    this._then,
  );

  final Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes
      _instance;

  final TRes Function(
          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items> Function(
                  Iterable<
                      CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items<
                          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes<
        TRes>
    implements
        CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes<
            TRes> {
  _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes(
      this._res);

  TRes _res;

  call({
    List<Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items {
  Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items({
    required this.id,
    required this.locked,
    this.$__typename = 'Episode',
  });

  factory Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$locked = json['locked'];
    final l$$__typename = json['__typename'];
    return Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items(
      id: (l$id as String),
      locked: (l$locked as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final bool locked;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$locked = locked;
    _resultData['locked'] = l$locked;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$locked = locked;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$locked,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$locked = locked;
    final lOther$locked = other.locked;
    if (l$locked != lOther$locked) {
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

extension UtilityExtension$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items
    on Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items {
  CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items<
          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items>
      get copyWith =>
          CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items<
    TRes> {
  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items(
    Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items
        instance,
    TRes Function(
            Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items)
        then,
  ) = _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items;

  factory CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items;

  TRes call({
    String? id,
    bool? locked,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items<
        TRes>
    implements
        CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items<
            TRes> {
  _CopyWithImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items(
    this._instance,
    this._then,
  );

  final Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items
      _instance;

  final TRes Function(
          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? locked = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        locked: locked == _undefined || locked == null
            ? _instance.locked
            : (locked as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items<
        TRes>
    implements
        CopyWith$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items<
            TRes> {
  _CopyWithStubImpl$Query$GetStudyTopicLessonStatuses$studyTopic$lessons$items$episodes$items(
      this._res);

  TRes _res;

  call({
    String? id,
    bool? locked,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetEpisodeLessonProgress {
  factory Variables$Query$GetEpisodeLessonProgress({required String id}) =>
      Variables$Query$GetEpisodeLessonProgress._({
        r'id': id,
      });

  Variables$Query$GetEpisodeLessonProgress._(this._$data);

  factory Variables$Query$GetEpisodeLessonProgress.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetEpisodeLessonProgress._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetEpisodeLessonProgress<
          Variables$Query$GetEpisodeLessonProgress>
      get copyWith => CopyWith$Variables$Query$GetEpisodeLessonProgress(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetEpisodeLessonProgress) ||
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

abstract class CopyWith$Variables$Query$GetEpisodeLessonProgress<TRes> {
  factory CopyWith$Variables$Query$GetEpisodeLessonProgress(
    Variables$Query$GetEpisodeLessonProgress instance,
    TRes Function(Variables$Query$GetEpisodeLessonProgress) then,
  ) = _CopyWithImpl$Variables$Query$GetEpisodeLessonProgress;

  factory CopyWith$Variables$Query$GetEpisodeLessonProgress.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetEpisodeLessonProgress;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetEpisodeLessonProgress<TRes>
    implements CopyWith$Variables$Query$GetEpisodeLessonProgress<TRes> {
  _CopyWithImpl$Variables$Query$GetEpisodeLessonProgress(
    this._instance,
    this._then,
  );

  final Variables$Query$GetEpisodeLessonProgress _instance;

  final TRes Function(Variables$Query$GetEpisodeLessonProgress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetEpisodeLessonProgress._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetEpisodeLessonProgress<TRes>
    implements CopyWith$Variables$Query$GetEpisodeLessonProgress<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEpisodeLessonProgress(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetEpisodeLessonProgress {
  Query$GetEpisodeLessonProgress({
    required this.episode,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetEpisodeLessonProgress.fromJson(Map<String, dynamic> json) {
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodeLessonProgress(
      episode: Query$GetEpisodeLessonProgress$episode.fromJson(
          (l$episode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEpisodeLessonProgress$episode episode;

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
    if (!(other is Query$GetEpisodeLessonProgress) ||
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

extension UtilityExtension$Query$GetEpisodeLessonProgress
    on Query$GetEpisodeLessonProgress {
  CopyWith$Query$GetEpisodeLessonProgress<Query$GetEpisodeLessonProgress>
      get copyWith => CopyWith$Query$GetEpisodeLessonProgress(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodeLessonProgress<TRes> {
  factory CopyWith$Query$GetEpisodeLessonProgress(
    Query$GetEpisodeLessonProgress instance,
    TRes Function(Query$GetEpisodeLessonProgress) then,
  ) = _CopyWithImpl$Query$GetEpisodeLessonProgress;

  factory CopyWith$Query$GetEpisodeLessonProgress.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodeLessonProgress;

  TRes call({
    Query$GetEpisodeLessonProgress$episode? episode,
    String? $__typename,
  });
  CopyWith$Query$GetEpisodeLessonProgress$episode<TRes> get episode;
}

class _CopyWithImpl$Query$GetEpisodeLessonProgress<TRes>
    implements CopyWith$Query$GetEpisodeLessonProgress<TRes> {
  _CopyWithImpl$Query$GetEpisodeLessonProgress(
    this._instance,
    this._then,
  );

  final Query$GetEpisodeLessonProgress _instance;

  final TRes Function(Query$GetEpisodeLessonProgress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodeLessonProgress(
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as Query$GetEpisodeLessonProgress$episode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetEpisodeLessonProgress$episode<TRes> get episode {
    final local$episode = _instance.episode;
    return CopyWith$Query$GetEpisodeLessonProgress$episode(
        local$episode, (e) => call(episode: e));
  }
}

class _CopyWithStubImpl$Query$GetEpisodeLessonProgress<TRes>
    implements CopyWith$Query$GetEpisodeLessonProgress<TRes> {
  _CopyWithStubImpl$Query$GetEpisodeLessonProgress(this._res);

  TRes _res;

  call({
    Query$GetEpisodeLessonProgress$episode? episode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetEpisodeLessonProgress$episode<TRes> get episode =>
      CopyWith$Query$GetEpisodeLessonProgress$episode.stub(_res);
}

const documentNodeQueryGetEpisodeLessonProgress = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetEpisodeLessonProgress'),
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
          FragmentSpreadNode(
            name: NameNode(value: 'EpisodeLessonProgressOverview'),
            directives: [],
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
                        name: NameNode(value: 'EpisodeLessonProgressOverview'),
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
  fragmentDefinitionEpisodeLessonProgressOverview,
  fragmentDefinitionLessonProgressOverview,
]);
Query$GetEpisodeLessonProgress _parserFn$Query$GetEpisodeLessonProgress(
        Map<String, dynamic> data) =>
    Query$GetEpisodeLessonProgress.fromJson(data);
typedef OnQueryComplete$Query$GetEpisodeLessonProgress = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$GetEpisodeLessonProgress?,
);

class Options$Query$GetEpisodeLessonProgress
    extends graphql.QueryOptions<Query$GetEpisodeLessonProgress> {
  Options$Query$GetEpisodeLessonProgress({
    String? operationName,
    required Variables$Query$GetEpisodeLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEpisodeLessonProgress? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetEpisodeLessonProgress? onComplete,
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
                        : _parserFn$Query$GetEpisodeLessonProgress(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetEpisodeLessonProgress,
          parserFn: _parserFn$Query$GetEpisodeLessonProgress,
        );

  final OnQueryComplete$Query$GetEpisodeLessonProgress? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetEpisodeLessonProgress
    extends graphql.WatchQueryOptions<Query$GetEpisodeLessonProgress> {
  WatchOptions$Query$GetEpisodeLessonProgress({
    String? operationName,
    required Variables$Query$GetEpisodeLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEpisodeLessonProgress? typedOptimisticResult,
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
          document: documentNodeQueryGetEpisodeLessonProgress,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetEpisodeLessonProgress,
        );
}

class FetchMoreOptions$Query$GetEpisodeLessonProgress
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEpisodeLessonProgress({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetEpisodeLessonProgress variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetEpisodeLessonProgress,
        );
}

extension ClientExtension$Query$GetEpisodeLessonProgress
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEpisodeLessonProgress>>
      query$GetEpisodeLessonProgress(
              Options$Query$GetEpisodeLessonProgress options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetEpisodeLessonProgress>
      watchQuery$GetEpisodeLessonProgress(
              WatchOptions$Query$GetEpisodeLessonProgress options) =>
          this.watchQuery(options);
  void writeQuery$GetEpisodeLessonProgress({
    required Query$GetEpisodeLessonProgress data,
    required Variables$Query$GetEpisodeLessonProgress variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetEpisodeLessonProgress),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetEpisodeLessonProgress? readQuery$GetEpisodeLessonProgress({
    required Variables$Query$GetEpisodeLessonProgress variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetEpisodeLessonProgress),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetEpisodeLessonProgress.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetEpisodeLessonProgress>
    useQuery$GetEpisodeLessonProgress(
            Options$Query$GetEpisodeLessonProgress options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetEpisodeLessonProgress>
    useWatchQuery$GetEpisodeLessonProgress(
            WatchOptions$Query$GetEpisodeLessonProgress options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetEpisodeLessonProgress$Widget
    extends graphql_flutter.Query<Query$GetEpisodeLessonProgress> {
  Query$GetEpisodeLessonProgress$Widget({
    widgets.Key? key,
    required Options$Query$GetEpisodeLessonProgress options,
    required graphql_flutter.QueryBuilder<Query$GetEpisodeLessonProgress>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetEpisodeLessonProgress$episode
    implements Fragment$EpisodeLessonProgressOverview {
  Query$GetEpisodeLessonProgress$episode({
    required this.id,
    required this.lessons,
    this.$__typename = 'Episode',
    this.season,
  });

  factory Query$GetEpisodeLessonProgress$episode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$lessons = json['lessons'];
    final l$$__typename = json['__typename'];
    final l$season = json['season'];
    return Query$GetEpisodeLessonProgress$episode(
      id: (l$id as String),
      lessons: Query$GetEpisodeLessonProgress$episode$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      season: l$season == null
          ? null
          : Query$GetEpisodeLessonProgress$episode$season.fromJson(
              (l$season as Map<String, dynamic>)),
    );
  }

  final String id;

  final Query$GetEpisodeLessonProgress$episode$lessons lessons;

  final String $__typename;

  final Query$GetEpisodeLessonProgress$episode$season? season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$lessons = lessons;
    _resultData['lessons'] = l$lessons.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$lessons = lessons;
    final l$$__typename = $__typename;
    final l$season = season;
    return Object.hashAll([
      l$id,
      l$lessons,
      l$$__typename,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetEpisodeLessonProgress$episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$lessons = lessons;
    final lOther$lessons = other.lessons;
    if (l$lessons != lOther$lessons) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetEpisodeLessonProgress$episode
    on Query$GetEpisodeLessonProgress$episode {
  CopyWith$Query$GetEpisodeLessonProgress$episode<
          Query$GetEpisodeLessonProgress$episode>
      get copyWith => CopyWith$Query$GetEpisodeLessonProgress$episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodeLessonProgress$episode<TRes> {
  factory CopyWith$Query$GetEpisodeLessonProgress$episode(
    Query$GetEpisodeLessonProgress$episode instance,
    TRes Function(Query$GetEpisodeLessonProgress$episode) then,
  ) = _CopyWithImpl$Query$GetEpisodeLessonProgress$episode;

  factory CopyWith$Query$GetEpisodeLessonProgress$episode.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode;

  TRes call({
    String? id,
    Query$GetEpisodeLessonProgress$episode$lessons? lessons,
    String? $__typename,
    Query$GetEpisodeLessonProgress$episode$season? season,
  });
  CopyWith$Query$GetEpisodeLessonProgress$episode$lessons<TRes> get lessons;
  CopyWith$Query$GetEpisodeLessonProgress$episode$season<TRes> get season;
}

class _CopyWithImpl$Query$GetEpisodeLessonProgress$episode<TRes>
    implements CopyWith$Query$GetEpisodeLessonProgress$episode<TRes> {
  _CopyWithImpl$Query$GetEpisodeLessonProgress$episode(
    this._instance,
    this._then,
  );

  final Query$GetEpisodeLessonProgress$episode _instance;

  final TRes Function(Query$GetEpisodeLessonProgress$episode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? lessons = _undefined,
    Object? $__typename = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Query$GetEpisodeLessonProgress$episode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        lessons: lessons == _undefined || lessons == null
            ? _instance.lessons
            : (lessons as Query$GetEpisodeLessonProgress$episode$lessons),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        season: season == _undefined
            ? _instance.season
            : (season as Query$GetEpisodeLessonProgress$episode$season?),
      ));
  CopyWith$Query$GetEpisodeLessonProgress$episode$lessons<TRes> get lessons {
    final local$lessons = _instance.lessons;
    return CopyWith$Query$GetEpisodeLessonProgress$episode$lessons(
        local$lessons, (e) => call(lessons: e));
  }

  CopyWith$Query$GetEpisodeLessonProgress$episode$season<TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$GetEpisodeLessonProgress$episode$season.stub(
            _then(_instance))
        : CopyWith$Query$GetEpisodeLessonProgress$episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode<TRes>
    implements CopyWith$Query$GetEpisodeLessonProgress$episode<TRes> {
  _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetEpisodeLessonProgress$episode$lessons? lessons,
    String? $__typename,
    Query$GetEpisodeLessonProgress$episode$season? season,
  }) =>
      _res;
  CopyWith$Query$GetEpisodeLessonProgress$episode$lessons<TRes> get lessons =>
      CopyWith$Query$GetEpisodeLessonProgress$episode$lessons.stub(_res);
  CopyWith$Query$GetEpisodeLessonProgress$episode$season<TRes> get season =>
      CopyWith$Query$GetEpisodeLessonProgress$episode$season.stub(_res);
}

class Query$GetEpisodeLessonProgress$episode$lessons
    implements Fragment$EpisodeLessonProgressOverview$lessons {
  Query$GetEpisodeLessonProgress$episode$lessons({
    required this.items,
    this.$__typename = 'LessonPagination',
  });

  factory Query$GetEpisodeLessonProgress$episode$lessons.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodeLessonProgress$episode$lessons(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$LessonProgressOverview.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$LessonProgressOverview> items;

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
    if (!(other is Query$GetEpisodeLessonProgress$episode$lessons) ||
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

extension UtilityExtension$Query$GetEpisodeLessonProgress$episode$lessons
    on Query$GetEpisodeLessonProgress$episode$lessons {
  CopyWith$Query$GetEpisodeLessonProgress$episode$lessons<
          Query$GetEpisodeLessonProgress$episode$lessons>
      get copyWith => CopyWith$Query$GetEpisodeLessonProgress$episode$lessons(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodeLessonProgress$episode$lessons<TRes> {
  factory CopyWith$Query$GetEpisodeLessonProgress$episode$lessons(
    Query$GetEpisodeLessonProgress$episode$lessons instance,
    TRes Function(Query$GetEpisodeLessonProgress$episode$lessons) then,
  ) = _CopyWithImpl$Query$GetEpisodeLessonProgress$episode$lessons;

  factory CopyWith$Query$GetEpisodeLessonProgress$episode$lessons.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode$lessons;

  TRes call({
    List<Fragment$LessonProgressOverview>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$LessonProgressOverview> Function(
              Iterable<
                  CopyWith$Fragment$LessonProgressOverview<
                      Fragment$LessonProgressOverview>>)
          _fn);
}

class _CopyWithImpl$Query$GetEpisodeLessonProgress$episode$lessons<TRes>
    implements CopyWith$Query$GetEpisodeLessonProgress$episode$lessons<TRes> {
  _CopyWithImpl$Query$GetEpisodeLessonProgress$episode$lessons(
    this._instance,
    this._then,
  );

  final Query$GetEpisodeLessonProgress$episode$lessons _instance;

  final TRes Function(Query$GetEpisodeLessonProgress$episode$lessons) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodeLessonProgress$episode$lessons(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$LessonProgressOverview>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$LessonProgressOverview> Function(
                  Iterable<
                      CopyWith$Fragment$LessonProgressOverview<
                          Fragment$LessonProgressOverview>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$LessonProgressOverview(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode$lessons<TRes>
    implements CopyWith$Query$GetEpisodeLessonProgress$episode$lessons<TRes> {
  _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode$lessons(this._res);

  TRes _res;

  call({
    List<Fragment$LessonProgressOverview>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$GetEpisodeLessonProgress$episode$season {
  Query$GetEpisodeLessonProgress$episode$season({
    required this.id,
    required this.episodes,
    this.$__typename = 'Season',
  });

  factory Query$GetEpisodeLessonProgress$episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$episodes = json['episodes'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodeLessonProgress$episode$season(
      id: (l$id as String),
      episodes: Query$GetEpisodeLessonProgress$episode$season$episodes.fromJson(
          (l$episodes as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetEpisodeLessonProgress$episode$season$episodes episodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$episodes = episodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$episodes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetEpisodeLessonProgress$episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$GetEpisodeLessonProgress$episode$season
    on Query$GetEpisodeLessonProgress$episode$season {
  CopyWith$Query$GetEpisodeLessonProgress$episode$season<
          Query$GetEpisodeLessonProgress$episode$season>
      get copyWith => CopyWith$Query$GetEpisodeLessonProgress$episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodeLessonProgress$episode$season<TRes> {
  factory CopyWith$Query$GetEpisodeLessonProgress$episode$season(
    Query$GetEpisodeLessonProgress$episode$season instance,
    TRes Function(Query$GetEpisodeLessonProgress$episode$season) then,
  ) = _CopyWithImpl$Query$GetEpisodeLessonProgress$episode$season;

  factory CopyWith$Query$GetEpisodeLessonProgress$episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode$season;

  TRes call({
    String? id,
    Query$GetEpisodeLessonProgress$episode$season$episodes? episodes,
    String? $__typename,
  });
  CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes<TRes>
      get episodes;
}

class _CopyWithImpl$Query$GetEpisodeLessonProgress$episode$season<TRes>
    implements CopyWith$Query$GetEpisodeLessonProgress$episode$season<TRes> {
  _CopyWithImpl$Query$GetEpisodeLessonProgress$episode$season(
    this._instance,
    this._then,
  );

  final Query$GetEpisodeLessonProgress$episode$season _instance;

  final TRes Function(Query$GetEpisodeLessonProgress$episode$season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? episodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodeLessonProgress$episode$season(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodes: episodes == _undefined || episodes == null
            ? _instance.episodes
            : (episodes
                as Query$GetEpisodeLessonProgress$episode$season$episodes),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes<TRes>
      get episodes {
    final local$episodes = _instance.episodes;
    return CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes(
        local$episodes, (e) => call(episodes: e));
  }
}

class _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode$season<TRes>
    implements CopyWith$Query$GetEpisodeLessonProgress$episode$season<TRes> {
  _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode$season(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetEpisodeLessonProgress$episode$season$episodes? episodes,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes<TRes>
      get episodes =>
          CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes.stub(
              _res);
}

class Query$GetEpisodeLessonProgress$episode$season$episodes {
  Query$GetEpisodeLessonProgress$episode$season$episodes({
    required this.items,
    this.$__typename = 'EpisodePagination',
  });

  factory Query$GetEpisodeLessonProgress$episode$season$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodeLessonProgress$episode$season$episodes(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$EpisodeLessonProgressOverview.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$EpisodeLessonProgressOverview> items;

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
    if (!(other is Query$GetEpisodeLessonProgress$episode$season$episodes) ||
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

extension UtilityExtension$Query$GetEpisodeLessonProgress$episode$season$episodes
    on Query$GetEpisodeLessonProgress$episode$season$episodes {
  CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes<
          Query$GetEpisodeLessonProgress$episode$season$episodes>
      get copyWith =>
          CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes<
    TRes> {
  factory CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes(
    Query$GetEpisodeLessonProgress$episode$season$episodes instance,
    TRes Function(Query$GetEpisodeLessonProgress$episode$season$episodes) then,
  ) = _CopyWithImpl$Query$GetEpisodeLessonProgress$episode$season$episodes;

  factory CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode$season$episodes;

  TRes call({
    List<Fragment$EpisodeLessonProgressOverview>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$EpisodeLessonProgressOverview> Function(
              Iterable<
                  CopyWith$Fragment$EpisodeLessonProgressOverview<
                      Fragment$EpisodeLessonProgressOverview>>)
          _fn);
}

class _CopyWithImpl$Query$GetEpisodeLessonProgress$episode$season$episodes<TRes>
    implements
        CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes<TRes> {
  _CopyWithImpl$Query$GetEpisodeLessonProgress$episode$season$episodes(
    this._instance,
    this._then,
  );

  final Query$GetEpisodeLessonProgress$episode$season$episodes _instance;

  final TRes Function(Query$GetEpisodeLessonProgress$episode$season$episodes)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodeLessonProgress$episode$season$episodes(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$EpisodeLessonProgressOverview>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$EpisodeLessonProgressOverview> Function(
                  Iterable<
                      CopyWith$Fragment$EpisodeLessonProgressOverview<
                          Fragment$EpisodeLessonProgressOverview>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$EpisodeLessonProgressOverview(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode$season$episodes<
        TRes>
    implements
        CopyWith$Query$GetEpisodeLessonProgress$episode$season$episodes<TRes> {
  _CopyWithStubImpl$Query$GetEpisodeLessonProgress$episode$season$episodes(
      this._res);

  TRes _res;

  call({
    List<Fragment$EpisodeLessonProgressOverview>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Variables$Query$GetSeasonLessonProgress {
  factory Variables$Query$GetSeasonLessonProgress({required String id}) =>
      Variables$Query$GetSeasonLessonProgress._({
        r'id': id,
      });

  Variables$Query$GetSeasonLessonProgress._(this._$data);

  factory Variables$Query$GetSeasonLessonProgress.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetSeasonLessonProgress._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetSeasonLessonProgress<
          Variables$Query$GetSeasonLessonProgress>
      get copyWith => CopyWith$Variables$Query$GetSeasonLessonProgress(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetSeasonLessonProgress) ||
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

abstract class CopyWith$Variables$Query$GetSeasonLessonProgress<TRes> {
  factory CopyWith$Variables$Query$GetSeasonLessonProgress(
    Variables$Query$GetSeasonLessonProgress instance,
    TRes Function(Variables$Query$GetSeasonLessonProgress) then,
  ) = _CopyWithImpl$Variables$Query$GetSeasonLessonProgress;

  factory CopyWith$Variables$Query$GetSeasonLessonProgress.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetSeasonLessonProgress;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetSeasonLessonProgress<TRes>
    implements CopyWith$Variables$Query$GetSeasonLessonProgress<TRes> {
  _CopyWithImpl$Variables$Query$GetSeasonLessonProgress(
    this._instance,
    this._then,
  );

  final Variables$Query$GetSeasonLessonProgress _instance;

  final TRes Function(Variables$Query$GetSeasonLessonProgress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetSeasonLessonProgress._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetSeasonLessonProgress<TRes>
    implements CopyWith$Variables$Query$GetSeasonLessonProgress<TRes> {
  _CopyWithStubImpl$Variables$Query$GetSeasonLessonProgress(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetSeasonLessonProgress {
  Query$GetSeasonLessonProgress({
    required this.season,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetSeasonLessonProgress.fromJson(Map<String, dynamic> json) {
    final l$season = json['season'];
    final l$$__typename = json['__typename'];
    return Query$GetSeasonLessonProgress(
      season: Query$GetSeasonLessonProgress$season.fromJson(
          (l$season as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetSeasonLessonProgress$season season;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$season = season;
    _resultData['season'] = l$season.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$season = season;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$season,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSeasonLessonProgress) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetSeasonLessonProgress
    on Query$GetSeasonLessonProgress {
  CopyWith$Query$GetSeasonLessonProgress<Query$GetSeasonLessonProgress>
      get copyWith => CopyWith$Query$GetSeasonLessonProgress(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSeasonLessonProgress<TRes> {
  factory CopyWith$Query$GetSeasonLessonProgress(
    Query$GetSeasonLessonProgress instance,
    TRes Function(Query$GetSeasonLessonProgress) then,
  ) = _CopyWithImpl$Query$GetSeasonLessonProgress;

  factory CopyWith$Query$GetSeasonLessonProgress.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSeasonLessonProgress;

  TRes call({
    Query$GetSeasonLessonProgress$season? season,
    String? $__typename,
  });
  CopyWith$Query$GetSeasonLessonProgress$season<TRes> get season;
}

class _CopyWithImpl$Query$GetSeasonLessonProgress<TRes>
    implements CopyWith$Query$GetSeasonLessonProgress<TRes> {
  _CopyWithImpl$Query$GetSeasonLessonProgress(
    this._instance,
    this._then,
  );

  final Query$GetSeasonLessonProgress _instance;

  final TRes Function(Query$GetSeasonLessonProgress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? season = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSeasonLessonProgress(
        season: season == _undefined || season == null
            ? _instance.season
            : (season as Query$GetSeasonLessonProgress$season),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetSeasonLessonProgress$season<TRes> get season {
    final local$season = _instance.season;
    return CopyWith$Query$GetSeasonLessonProgress$season(
        local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$GetSeasonLessonProgress<TRes>
    implements CopyWith$Query$GetSeasonLessonProgress<TRes> {
  _CopyWithStubImpl$Query$GetSeasonLessonProgress(this._res);

  TRes _res;

  call({
    Query$GetSeasonLessonProgress$season? season,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetSeasonLessonProgress$season<TRes> get season =>
      CopyWith$Query$GetSeasonLessonProgress$season.stub(_res);
}

const documentNodeQueryGetSeasonLessonProgress = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSeasonLessonProgress'),
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
        name: NameNode(value: 'season'),
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
                    name: NameNode(value: 'EpisodeLessonProgressOverview'),
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
  fragmentDefinitionEpisodeLessonProgressOverview,
  fragmentDefinitionLessonProgressOverview,
]);
Query$GetSeasonLessonProgress _parserFn$Query$GetSeasonLessonProgress(
        Map<String, dynamic> data) =>
    Query$GetSeasonLessonProgress.fromJson(data);
typedef OnQueryComplete$Query$GetSeasonLessonProgress = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetSeasonLessonProgress?,
);

class Options$Query$GetSeasonLessonProgress
    extends graphql.QueryOptions<Query$GetSeasonLessonProgress> {
  Options$Query$GetSeasonLessonProgress({
    String? operationName,
    required Variables$Query$GetSeasonLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSeasonLessonProgress? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSeasonLessonProgress? onComplete,
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
                        : _parserFn$Query$GetSeasonLessonProgress(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSeasonLessonProgress,
          parserFn: _parserFn$Query$GetSeasonLessonProgress,
        );

  final OnQueryComplete$Query$GetSeasonLessonProgress? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSeasonLessonProgress
    extends graphql.WatchQueryOptions<Query$GetSeasonLessonProgress> {
  WatchOptions$Query$GetSeasonLessonProgress({
    String? operationName,
    required Variables$Query$GetSeasonLessonProgress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSeasonLessonProgress? typedOptimisticResult,
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
          document: documentNodeQueryGetSeasonLessonProgress,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSeasonLessonProgress,
        );
}

class FetchMoreOptions$Query$GetSeasonLessonProgress
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSeasonLessonProgress({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetSeasonLessonProgress variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetSeasonLessonProgress,
        );
}

extension ClientExtension$Query$GetSeasonLessonProgress
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSeasonLessonProgress>>
      query$GetSeasonLessonProgress(
              Options$Query$GetSeasonLessonProgress options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetSeasonLessonProgress>
      watchQuery$GetSeasonLessonProgress(
              WatchOptions$Query$GetSeasonLessonProgress options) =>
          this.watchQuery(options);
  void writeQuery$GetSeasonLessonProgress({
    required Query$GetSeasonLessonProgress data,
    required Variables$Query$GetSeasonLessonProgress variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetSeasonLessonProgress),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSeasonLessonProgress? readQuery$GetSeasonLessonProgress({
    required Variables$Query$GetSeasonLessonProgress variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetSeasonLessonProgress),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetSeasonLessonProgress.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSeasonLessonProgress>
    useQuery$GetSeasonLessonProgress(
            Options$Query$GetSeasonLessonProgress options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetSeasonLessonProgress>
    useWatchQuery$GetSeasonLessonProgress(
            WatchOptions$Query$GetSeasonLessonProgress options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetSeasonLessonProgress$Widget
    extends graphql_flutter.Query<Query$GetSeasonLessonProgress> {
  Query$GetSeasonLessonProgress$Widget({
    widgets.Key? key,
    required Options$Query$GetSeasonLessonProgress options,
    required graphql_flutter.QueryBuilder<Query$GetSeasonLessonProgress>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetSeasonLessonProgress$season {
  Query$GetSeasonLessonProgress$season({
    required this.episodes,
    this.$__typename = 'Season',
  });

  factory Query$GetSeasonLessonProgress$season.fromJson(
      Map<String, dynamic> json) {
    final l$episodes = json['episodes'];
    final l$$__typename = json['__typename'];
    return Query$GetSeasonLessonProgress$season(
      episodes: Query$GetSeasonLessonProgress$season$episodes.fromJson(
          (l$episodes as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetSeasonLessonProgress$season$episodes episodes;

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
    if (!(other is Query$GetSeasonLessonProgress$season) ||
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

extension UtilityExtension$Query$GetSeasonLessonProgress$season
    on Query$GetSeasonLessonProgress$season {
  CopyWith$Query$GetSeasonLessonProgress$season<
          Query$GetSeasonLessonProgress$season>
      get copyWith => CopyWith$Query$GetSeasonLessonProgress$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSeasonLessonProgress$season<TRes> {
  factory CopyWith$Query$GetSeasonLessonProgress$season(
    Query$GetSeasonLessonProgress$season instance,
    TRes Function(Query$GetSeasonLessonProgress$season) then,
  ) = _CopyWithImpl$Query$GetSeasonLessonProgress$season;

  factory CopyWith$Query$GetSeasonLessonProgress$season.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSeasonLessonProgress$season;

  TRes call({
    Query$GetSeasonLessonProgress$season$episodes? episodes,
    String? $__typename,
  });
  CopyWith$Query$GetSeasonLessonProgress$season$episodes<TRes> get episodes;
}

class _CopyWithImpl$Query$GetSeasonLessonProgress$season<TRes>
    implements CopyWith$Query$GetSeasonLessonProgress$season<TRes> {
  _CopyWithImpl$Query$GetSeasonLessonProgress$season(
    this._instance,
    this._then,
  );

  final Query$GetSeasonLessonProgress$season _instance;

  final TRes Function(Query$GetSeasonLessonProgress$season) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSeasonLessonProgress$season(
        episodes: episodes == _undefined || episodes == null
            ? _instance.episodes
            : (episodes as Query$GetSeasonLessonProgress$season$episodes),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetSeasonLessonProgress$season$episodes<TRes> get episodes {
    final local$episodes = _instance.episodes;
    return CopyWith$Query$GetSeasonLessonProgress$season$episodes(
        local$episodes, (e) => call(episodes: e));
  }
}

class _CopyWithStubImpl$Query$GetSeasonLessonProgress$season<TRes>
    implements CopyWith$Query$GetSeasonLessonProgress$season<TRes> {
  _CopyWithStubImpl$Query$GetSeasonLessonProgress$season(this._res);

  TRes _res;

  call({
    Query$GetSeasonLessonProgress$season$episodes? episodes,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetSeasonLessonProgress$season$episodes<TRes> get episodes =>
      CopyWith$Query$GetSeasonLessonProgress$season$episodes.stub(_res);
}

class Query$GetSeasonLessonProgress$season$episodes {
  Query$GetSeasonLessonProgress$season$episodes({
    required this.items,
    this.$__typename = 'EpisodePagination',
  });

  factory Query$GetSeasonLessonProgress$season$episodes.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$GetSeasonLessonProgress$season$episodes(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$EpisodeLessonProgressOverview.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$EpisodeLessonProgressOverview> items;

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
    if (!(other is Query$GetSeasonLessonProgress$season$episodes) ||
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

extension UtilityExtension$Query$GetSeasonLessonProgress$season$episodes
    on Query$GetSeasonLessonProgress$season$episodes {
  CopyWith$Query$GetSeasonLessonProgress$season$episodes<
          Query$GetSeasonLessonProgress$season$episodes>
      get copyWith => CopyWith$Query$GetSeasonLessonProgress$season$episodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSeasonLessonProgress$season$episodes<TRes> {
  factory CopyWith$Query$GetSeasonLessonProgress$season$episodes(
    Query$GetSeasonLessonProgress$season$episodes instance,
    TRes Function(Query$GetSeasonLessonProgress$season$episodes) then,
  ) = _CopyWithImpl$Query$GetSeasonLessonProgress$season$episodes;

  factory CopyWith$Query$GetSeasonLessonProgress$season$episodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSeasonLessonProgress$season$episodes;

  TRes call({
    List<Fragment$EpisodeLessonProgressOverview>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$EpisodeLessonProgressOverview> Function(
              Iterable<
                  CopyWith$Fragment$EpisodeLessonProgressOverview<
                      Fragment$EpisodeLessonProgressOverview>>)
          _fn);
}

class _CopyWithImpl$Query$GetSeasonLessonProgress$season$episodes<TRes>
    implements CopyWith$Query$GetSeasonLessonProgress$season$episodes<TRes> {
  _CopyWithImpl$Query$GetSeasonLessonProgress$season$episodes(
    this._instance,
    this._then,
  );

  final Query$GetSeasonLessonProgress$season$episodes _instance;

  final TRes Function(Query$GetSeasonLessonProgress$season$episodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSeasonLessonProgress$season$episodes(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$EpisodeLessonProgressOverview>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$EpisodeLessonProgressOverview> Function(
                  Iterable<
                      CopyWith$Fragment$EpisodeLessonProgressOverview<
                          Fragment$EpisodeLessonProgressOverview>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$EpisodeLessonProgressOverview(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetSeasonLessonProgress$season$episodes<TRes>
    implements CopyWith$Query$GetSeasonLessonProgress$season$episodes<TRes> {
  _CopyWithStubImpl$Query$GetSeasonLessonProgress$season$episodes(this._res);

  TRes _res;

  call({
    List<Fragment$EpisodeLessonProgressOverview>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Variables$Query$GetLessonTitle {
  factory Variables$Query$GetLessonTitle({required String id}) =>
      Variables$Query$GetLessonTitle._({
        r'id': id,
      });

  Variables$Query$GetLessonTitle._(this._$data);

  factory Variables$Query$GetLessonTitle.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetLessonTitle._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetLessonTitle<Variables$Query$GetLessonTitle>
      get copyWith => CopyWith$Variables$Query$GetLessonTitle(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetLessonTitle) ||
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

abstract class CopyWith$Variables$Query$GetLessonTitle<TRes> {
  factory CopyWith$Variables$Query$GetLessonTitle(
    Variables$Query$GetLessonTitle instance,
    TRes Function(Variables$Query$GetLessonTitle) then,
  ) = _CopyWithImpl$Variables$Query$GetLessonTitle;

  factory CopyWith$Variables$Query$GetLessonTitle.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetLessonTitle;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetLessonTitle<TRes>
    implements CopyWith$Variables$Query$GetLessonTitle<TRes> {
  _CopyWithImpl$Variables$Query$GetLessonTitle(
    this._instance,
    this._then,
  );

  final Variables$Query$GetLessonTitle _instance;

  final TRes Function(Variables$Query$GetLessonTitle) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetLessonTitle._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetLessonTitle<TRes>
    implements CopyWith$Variables$Query$GetLessonTitle<TRes> {
  _CopyWithStubImpl$Variables$Query$GetLessonTitle(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetLessonTitle {
  Query$GetLessonTitle({
    required this.studyLesson,
    this.$__typename = 'QueryRoot',
  });

  factory Query$GetLessonTitle.fromJson(Map<String, dynamic> json) {
    final l$studyLesson = json['studyLesson'];
    final l$$__typename = json['__typename'];
    return Query$GetLessonTitle(
      studyLesson: Query$GetLessonTitle$studyLesson.fromJson(
          (l$studyLesson as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetLessonTitle$studyLesson studyLesson;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$studyLesson = studyLesson;
    _resultData['studyLesson'] = l$studyLesson.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$studyLesson = studyLesson;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$studyLesson,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetLessonTitle) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$studyLesson = studyLesson;
    final lOther$studyLesson = other.studyLesson;
    if (l$studyLesson != lOther$studyLesson) {
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

extension UtilityExtension$Query$GetLessonTitle on Query$GetLessonTitle {
  CopyWith$Query$GetLessonTitle<Query$GetLessonTitle> get copyWith =>
      CopyWith$Query$GetLessonTitle(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetLessonTitle<TRes> {
  factory CopyWith$Query$GetLessonTitle(
    Query$GetLessonTitle instance,
    TRes Function(Query$GetLessonTitle) then,
  ) = _CopyWithImpl$Query$GetLessonTitle;

  factory CopyWith$Query$GetLessonTitle.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLessonTitle;

  TRes call({
    Query$GetLessonTitle$studyLesson? studyLesson,
    String? $__typename,
  });
  CopyWith$Query$GetLessonTitle$studyLesson<TRes> get studyLesson;
}

class _CopyWithImpl$Query$GetLessonTitle<TRes>
    implements CopyWith$Query$GetLessonTitle<TRes> {
  _CopyWithImpl$Query$GetLessonTitle(
    this._instance,
    this._then,
  );

  final Query$GetLessonTitle _instance;

  final TRes Function(Query$GetLessonTitle) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? studyLesson = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetLessonTitle(
        studyLesson: studyLesson == _undefined || studyLesson == null
            ? _instance.studyLesson
            : (studyLesson as Query$GetLessonTitle$studyLesson),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetLessonTitle$studyLesson<TRes> get studyLesson {
    final local$studyLesson = _instance.studyLesson;
    return CopyWith$Query$GetLessonTitle$studyLesson(
        local$studyLesson, (e) => call(studyLesson: e));
  }
}

class _CopyWithStubImpl$Query$GetLessonTitle<TRes>
    implements CopyWith$Query$GetLessonTitle<TRes> {
  _CopyWithStubImpl$Query$GetLessonTitle(this._res);

  TRes _res;

  call({
    Query$GetLessonTitle$studyLesson? studyLesson,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetLessonTitle$studyLesson<TRes> get studyLesson =>
      CopyWith$Query$GetLessonTitle$studyLesson.stub(_res);
}

const documentNodeQueryGetLessonTitle = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetLessonTitle'),
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
        name: NameNode(value: 'studyLesson'),
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
Query$GetLessonTitle _parserFn$Query$GetLessonTitle(
        Map<String, dynamic> data) =>
    Query$GetLessonTitle.fromJson(data);
typedef OnQueryComplete$Query$GetLessonTitle = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetLessonTitle?,
);

class Options$Query$GetLessonTitle
    extends graphql.QueryOptions<Query$GetLessonTitle> {
  Options$Query$GetLessonTitle({
    String? operationName,
    required Variables$Query$GetLessonTitle variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetLessonTitle? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetLessonTitle? onComplete,
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
                    data == null ? null : _parserFn$Query$GetLessonTitle(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetLessonTitle,
          parserFn: _parserFn$Query$GetLessonTitle,
        );

  final OnQueryComplete$Query$GetLessonTitle? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetLessonTitle
    extends graphql.WatchQueryOptions<Query$GetLessonTitle> {
  WatchOptions$Query$GetLessonTitle({
    String? operationName,
    required Variables$Query$GetLessonTitle variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetLessonTitle? typedOptimisticResult,
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
          document: documentNodeQueryGetLessonTitle,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetLessonTitle,
        );
}

class FetchMoreOptions$Query$GetLessonTitle extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetLessonTitle({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetLessonTitle variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetLessonTitle,
        );
}

extension ClientExtension$Query$GetLessonTitle on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetLessonTitle>> query$GetLessonTitle(
          Options$Query$GetLessonTitle options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetLessonTitle> watchQuery$GetLessonTitle(
          WatchOptions$Query$GetLessonTitle options) =>
      this.watchQuery(options);
  void writeQuery$GetLessonTitle({
    required Query$GetLessonTitle data,
    required Variables$Query$GetLessonTitle variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetLessonTitle),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetLessonTitle? readQuery$GetLessonTitle({
    required Variables$Query$GetLessonTitle variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetLessonTitle),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetLessonTitle.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetLessonTitle> useQuery$GetLessonTitle(
        Options$Query$GetLessonTitle options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetLessonTitle> useWatchQuery$GetLessonTitle(
        WatchOptions$Query$GetLessonTitle options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetLessonTitle$Widget
    extends graphql_flutter.Query<Query$GetLessonTitle> {
  Query$GetLessonTitle$Widget({
    widgets.Key? key,
    required Options$Query$GetLessonTitle options,
    required graphql_flutter.QueryBuilder<Query$GetLessonTitle> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetLessonTitle$studyLesson {
  Query$GetLessonTitle$studyLesson({
    required this.id,
    required this.title,
    this.$__typename = 'Lesson',
  });

  factory Query$GetLessonTitle$studyLesson.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$GetLessonTitle$studyLesson(
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
    if (!(other is Query$GetLessonTitle$studyLesson) ||
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

extension UtilityExtension$Query$GetLessonTitle$studyLesson
    on Query$GetLessonTitle$studyLesson {
  CopyWith$Query$GetLessonTitle$studyLesson<Query$GetLessonTitle$studyLesson>
      get copyWith => CopyWith$Query$GetLessonTitle$studyLesson(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetLessonTitle$studyLesson<TRes> {
  factory CopyWith$Query$GetLessonTitle$studyLesson(
    Query$GetLessonTitle$studyLesson instance,
    TRes Function(Query$GetLessonTitle$studyLesson) then,
  ) = _CopyWithImpl$Query$GetLessonTitle$studyLesson;

  factory CopyWith$Query$GetLessonTitle$studyLesson.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLessonTitle$studyLesson;

  TRes call({
    String? id,
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetLessonTitle$studyLesson<TRes>
    implements CopyWith$Query$GetLessonTitle$studyLesson<TRes> {
  _CopyWithImpl$Query$GetLessonTitle$studyLesson(
    this._instance,
    this._then,
  );

  final Query$GetLessonTitle$studyLesson _instance;

  final TRes Function(Query$GetLessonTitle$studyLesson) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetLessonTitle$studyLesson(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetLessonTitle$studyLesson<TRes>
    implements CopyWith$Query$GetLessonTitle$studyLesson<TRes> {
  _CopyWithStubImpl$Query$GetLessonTitle$studyLesson(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? $__typename,
  }) =>
      _res;
}
