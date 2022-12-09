import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$LessonProgressOverview {
  Fragment$LessonProgressOverview({
    required this.id,
    required this.progress,
    required this.$__typename,
  });

  factory Fragment$LessonProgressOverview.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$progress = json['progress'];
    final l$$__typename = json['__typename'];
    return Fragment$LessonProgressOverview(
      id: (l$id as String),
      progress: Fragment$LessonProgressOverview$progress.fromJson(
          (l$progress as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Fragment$LessonProgressOverview$progress progress;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$progress = progress;
    _resultData['progress'] = l$progress.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$progress = progress;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? progress = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$LessonProgressOverview(
        id: id == _undefined || id == null ? _instance.id : (id as String),
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
    required this.$__typename,
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

  static const _undefined = {};

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
    required this.lessons,
    required this.$__typename,
  });

  factory Fragment$EpisodeLessonProgressOverview.fromJson(
      Map<String, dynamic> json) {
    final l$lessons = json['lessons'];
    final l$$__typename = json['__typename'];
    return Fragment$EpisodeLessonProgressOverview(
      lessons: Fragment$EpisodeLessonProgressOverview$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$EpisodeLessonProgressOverview$lessons lessons;

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
    if (!(other is Fragment$EpisodeLessonProgressOverview) ||
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

  static const _undefined = {};

  TRes call({
    Object? lessons = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EpisodeLessonProgressOverview(
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
    required this.$__typename,
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

  static const _undefined = {};

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

  static const _undefined = {};

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
    required this.$__typename,
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

  static const _undefined = {};

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

class Options$Query$GetEpisodeLessonProgress
    extends graphql.QueryOptions<Query$GetEpisodeLessonProgress> {
  Options$Query$GetEpisodeLessonProgress({
    String? operationName,
    required Variables$Query$GetEpisodeLessonProgress variables,
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
          document: documentNodeQueryGetEpisodeLessonProgress,
          parserFn: _parserFn$Query$GetEpisodeLessonProgress,
        );
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
    required this.lessons,
    required this.$__typename,
    this.season,
  });

  factory Query$GetEpisodeLessonProgress$episode.fromJson(
      Map<String, dynamic> json) {
    final l$lessons = json['lessons'];
    final l$$__typename = json['__typename'];
    final l$season = json['season'];
    return Query$GetEpisodeLessonProgress$episode(
      lessons: Query$GetEpisodeLessonProgress$episode$lessons.fromJson(
          (l$lessons as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      season: l$season == null
          ? null
          : Query$GetEpisodeLessonProgress$episode$season.fromJson(
              (l$season as Map<String, dynamic>)),
    );
  }

  final Query$GetEpisodeLessonProgress$episode$lessons lessons;

  final String $__typename;

  final Query$GetEpisodeLessonProgress$episode$season? season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$lessons = lessons;
    final l$$__typename = $__typename;
    final l$season = season;
    return Object.hashAll([
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

  static const _undefined = {};

  TRes call({
    Object? lessons = _undefined,
    Object? $__typename = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Query$GetEpisodeLessonProgress$episode(
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
    required this.$__typename,
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

  static const _undefined = {};

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
    required this.episodes,
    required this.$__typename,
  });

  factory Query$GetEpisodeLessonProgress$episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$episodes = json['episodes'];
    final l$$__typename = json['__typename'];
    return Query$GetEpisodeLessonProgress$episode$season(
      episodes: Query$GetEpisodeLessonProgress$episode$season$episodes.fromJson(
          (l$episodes as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetEpisodeLessonProgress$episode$season$episodes episodes;

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
    if (!(other is Query$GetEpisodeLessonProgress$episode$season) ||
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

  static const _undefined = {};

  TRes call({
    Object? episodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEpisodeLessonProgress$episode$season(
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
    required this.$__typename,
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

  static const _undefined = {};

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
