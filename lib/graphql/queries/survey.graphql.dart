import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$Survey {
  Fragment$Survey({
    required this.id,
    required this.title,
    this.description,
    required this.from,
    required this.to,
    required this.questions,
    this.$__typename = 'Survey',
  });

  factory Fragment$Survey.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$from = json['from'];
    final l$to = json['to'];
    final l$questions = json['questions'];
    final l$$__typename = json['__typename'];
    return Fragment$Survey(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
      from: (l$from as String),
      to: (l$to as String),
      questions: Fragment$Survey$questions.fromJson(
          (l$questions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? description;

  final String from;

  final String to;

  final Fragment$Survey$questions questions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$from = from;
    _resultData['from'] = l$from;
    final l$to = to;
    _resultData['to'] = l$to;
    final l$questions = questions;
    _resultData['questions'] = l$questions.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$from = from;
    final l$to = to;
    final l$questions = questions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$from,
      l$to,
      l$questions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Survey) || runtimeType != other.runtimeType) {
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
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
      return false;
    }
    final l$to = to;
    final lOther$to = other.to;
    if (l$to != lOther$to) {
      return false;
    }
    final l$questions = questions;
    final lOther$questions = other.questions;
    if (l$questions != lOther$questions) {
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

extension UtilityExtension$Fragment$Survey on Fragment$Survey {
  CopyWith$Fragment$Survey<Fragment$Survey> get copyWith =>
      CopyWith$Fragment$Survey(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Survey<TRes> {
  factory CopyWith$Fragment$Survey(
    Fragment$Survey instance,
    TRes Function(Fragment$Survey) then,
  ) = _CopyWithImpl$Fragment$Survey;

  factory CopyWith$Fragment$Survey.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Survey;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? from,
    String? to,
    Fragment$Survey$questions? questions,
    String? $__typename,
  });
  CopyWith$Fragment$Survey$questions<TRes> get questions;
}

class _CopyWithImpl$Fragment$Survey<TRes>
    implements CopyWith$Fragment$Survey<TRes> {
  _CopyWithImpl$Fragment$Survey(
    this._instance,
    this._then,
  );

  final Fragment$Survey _instance;

  final TRes Function(Fragment$Survey) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? from = _undefined,
    Object? to = _undefined,
    Object? questions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Survey(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        from: from == _undefined || from == null
            ? _instance.from
            : (from as String),
        to: to == _undefined || to == null ? _instance.to : (to as String),
        questions: questions == _undefined || questions == null
            ? _instance.questions
            : (questions as Fragment$Survey$questions),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Survey$questions<TRes> get questions {
    final local$questions = _instance.questions;
    return CopyWith$Fragment$Survey$questions(
        local$questions, (e) => call(questions: e));
  }
}

class _CopyWithStubImpl$Fragment$Survey<TRes>
    implements CopyWith$Fragment$Survey<TRes> {
  _CopyWithStubImpl$Fragment$Survey(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? from,
    String? to,
    Fragment$Survey$questions? questions,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Survey$questions<TRes> get questions =>
      CopyWith$Fragment$Survey$questions.stub(_res);
}

const fragmentDefinitionSurvey = FragmentDefinitionNode(
  name: NameNode(value: 'Survey'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Survey'),
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
      name: NameNode(value: 'from'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'to'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'questions'),
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
              name: NameNode(value: 'SurveyQuestion'),
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
const documentNodeFragmentSurvey = DocumentNode(definitions: [
  fragmentDefinitionSurvey,
  fragmentDefinitionSurveyQuestion,
]);

extension ClientExtension$Fragment$Survey on graphql.GraphQLClient {
  void writeFragment$Survey({
    required Fragment$Survey data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Survey',
            document: documentNodeFragmentSurvey,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Survey? readFragment$Survey({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Survey',
          document: documentNodeFragmentSurvey,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Survey.fromJson(result);
  }
}

class Fragment$Survey$questions {
  Fragment$Survey$questions({
    required this.items,
    this.$__typename = 'SurveyQuestionPagination',
  });

  factory Fragment$Survey$questions.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Survey$questions(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$SurveyQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$SurveyQuestion> items;

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
    if (!(other is Fragment$Survey$questions) ||
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

extension UtilityExtension$Fragment$Survey$questions
    on Fragment$Survey$questions {
  CopyWith$Fragment$Survey$questions<Fragment$Survey$questions> get copyWith =>
      CopyWith$Fragment$Survey$questions(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Survey$questions<TRes> {
  factory CopyWith$Fragment$Survey$questions(
    Fragment$Survey$questions instance,
    TRes Function(Fragment$Survey$questions) then,
  ) = _CopyWithImpl$Fragment$Survey$questions;

  factory CopyWith$Fragment$Survey$questions.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Survey$questions;

  TRes call({
    List<Fragment$SurveyQuestion>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$SurveyQuestion> Function(
              Iterable<
                  CopyWith$Fragment$SurveyQuestion<Fragment$SurveyQuestion>>)
          _fn);
}

class _CopyWithImpl$Fragment$Survey$questions<TRes>
    implements CopyWith$Fragment$Survey$questions<TRes> {
  _CopyWithImpl$Fragment$Survey$questions(
    this._instance,
    this._then,
  );

  final Fragment$Survey$questions _instance;

  final TRes Function(Fragment$Survey$questions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Survey$questions(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$SurveyQuestion>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$SurveyQuestion> Function(
                  Iterable<
                      CopyWith$Fragment$SurveyQuestion<
                          Fragment$SurveyQuestion>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$SurveyQuestion(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Survey$questions<TRes>
    implements CopyWith$Fragment$Survey$questions<TRes> {
  _CopyWithStubImpl$Fragment$Survey$questions(this._res);

  TRes _res;

  call({
    List<Fragment$SurveyQuestion>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$SurveyQuestion {
  Fragment$SurveyQuestion({
    required this.id,
    required this.title,
    this.description,
    required this.$__typename,
  });

  factory Fragment$SurveyQuestion.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "SurveyRatingQuestion":
        return Fragment$SurveyQuestion$$SurveyRatingQuestion.fromJson(json);

      case "SurveyTextQuestion":
        return Fragment$SurveyQuestion$$SurveyTextQuestion.fromJson(json);

      default:
        final l$id = json['id'];
        final l$title = json['title'];
        final l$description = json['description'];
        final l$$__typename = json['__typename'];
        return Fragment$SurveyQuestion(
          id: (l$id as String),
          title: (l$title as String),
          description: (l$description as String?),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final String id;

  final String title;

  final String? description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SurveyQuestion) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$SurveyQuestion on Fragment$SurveyQuestion {
  CopyWith$Fragment$SurveyQuestion<Fragment$SurveyQuestion> get copyWith =>
      CopyWith$Fragment$SurveyQuestion(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$SurveyQuestion<TRes> {
  factory CopyWith$Fragment$SurveyQuestion(
    Fragment$SurveyQuestion instance,
    TRes Function(Fragment$SurveyQuestion) then,
  ) = _CopyWithImpl$Fragment$SurveyQuestion;

  factory CopyWith$Fragment$SurveyQuestion.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SurveyQuestion;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$SurveyQuestion<TRes>
    implements CopyWith$Fragment$SurveyQuestion<TRes> {
  _CopyWithImpl$Fragment$SurveyQuestion(
    this._instance,
    this._then,
  );

  final Fragment$SurveyQuestion _instance;

  final TRes Function(Fragment$SurveyQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$SurveyQuestion(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$SurveyQuestion<TRes>
    implements CopyWith$Fragment$SurveyQuestion<TRes> {
  _CopyWithStubImpl$Fragment$SurveyQuestion(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionSurveyQuestion = FragmentDefinitionNode(
  name: NameNode(value: 'SurveyQuestion'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SurveyQuestion'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'SurveyRatingQuestion'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
      ]),
    ),
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'SurveyTextQuestion'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
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
const documentNodeFragmentSurveyQuestion = DocumentNode(definitions: [
  fragmentDefinitionSurveyQuestion,
]);

extension ClientExtension$Fragment$SurveyQuestion on graphql.GraphQLClient {
  void writeFragment$SurveyQuestion({
    required Fragment$SurveyQuestion data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'SurveyQuestion',
            document: documentNodeFragmentSurveyQuestion,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$SurveyQuestion? readFragment$SurveyQuestion({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'SurveyQuestion',
          document: documentNodeFragmentSurveyQuestion,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$SurveyQuestion.fromJson(result);
  }
}

class Fragment$SurveyQuestion$$SurveyRatingQuestion
    implements Fragment$SurveyQuestion {
  Fragment$SurveyQuestion$$SurveyRatingQuestion({
    this.$__typename = 'SurveyRatingQuestion',
    required this.id,
    required this.title,
    this.description,
  });

  factory Fragment$SurveyQuestion$$SurveyRatingQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    return Fragment$SurveyQuestion$$SurveyRatingQuestion(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
    );
  }

  final String $__typename;

  final String id;

  final String title;

  final String? description;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$title = title;
    final l$description = description;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$title,
      l$description,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SurveyQuestion$$SurveyRatingQuestion) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
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
    return true;
  }
}

extension UtilityExtension$Fragment$SurveyQuestion$$SurveyRatingQuestion
    on Fragment$SurveyQuestion$$SurveyRatingQuestion {
  CopyWith$Fragment$SurveyQuestion$$SurveyRatingQuestion<
          Fragment$SurveyQuestion$$SurveyRatingQuestion>
      get copyWith => CopyWith$Fragment$SurveyQuestion$$SurveyRatingQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SurveyQuestion$$SurveyRatingQuestion<TRes> {
  factory CopyWith$Fragment$SurveyQuestion$$SurveyRatingQuestion(
    Fragment$SurveyQuestion$$SurveyRatingQuestion instance,
    TRes Function(Fragment$SurveyQuestion$$SurveyRatingQuestion) then,
  ) = _CopyWithImpl$Fragment$SurveyQuestion$$SurveyRatingQuestion;

  factory CopyWith$Fragment$SurveyQuestion$$SurveyRatingQuestion.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$SurveyQuestion$$SurveyRatingQuestion;

  TRes call({
    String? $__typename,
    String? id,
    String? title,
    String? description,
  });
}

class _CopyWithImpl$Fragment$SurveyQuestion$$SurveyRatingQuestion<TRes>
    implements CopyWith$Fragment$SurveyQuestion$$SurveyRatingQuestion<TRes> {
  _CopyWithImpl$Fragment$SurveyQuestion$$SurveyRatingQuestion(
    this._instance,
    this._then,
  );

  final Fragment$SurveyQuestion$$SurveyRatingQuestion _instance;

  final TRes Function(Fragment$SurveyQuestion$$SurveyRatingQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
  }) =>
      _then(Fragment$SurveyQuestion$$SurveyRatingQuestion(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
      ));
}

class _CopyWithStubImpl$Fragment$SurveyQuestion$$SurveyRatingQuestion<TRes>
    implements CopyWith$Fragment$SurveyQuestion$$SurveyRatingQuestion<TRes> {
  _CopyWithStubImpl$Fragment$SurveyQuestion$$SurveyRatingQuestion(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    String? title,
    String? description,
  }) =>
      _res;
}

class Fragment$SurveyQuestion$$SurveyTextQuestion
    implements Fragment$SurveyQuestion {
  Fragment$SurveyQuestion$$SurveyTextQuestion({
    this.$__typename = 'SurveyTextQuestion',
    required this.id,
    required this.title,
    this.description,
  });

  factory Fragment$SurveyQuestion$$SurveyTextQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    return Fragment$SurveyQuestion$$SurveyTextQuestion(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
    );
  }

  final String $__typename;

  final String id;

  final String title;

  final String? description;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$title = title;
    final l$description = description;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$title,
      l$description,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$SurveyQuestion$$SurveyTextQuestion) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
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
    return true;
  }
}

extension UtilityExtension$Fragment$SurveyQuestion$$SurveyTextQuestion
    on Fragment$SurveyQuestion$$SurveyTextQuestion {
  CopyWith$Fragment$SurveyQuestion$$SurveyTextQuestion<
          Fragment$SurveyQuestion$$SurveyTextQuestion>
      get copyWith => CopyWith$Fragment$SurveyQuestion$$SurveyTextQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$SurveyQuestion$$SurveyTextQuestion<TRes> {
  factory CopyWith$Fragment$SurveyQuestion$$SurveyTextQuestion(
    Fragment$SurveyQuestion$$SurveyTextQuestion instance,
    TRes Function(Fragment$SurveyQuestion$$SurveyTextQuestion) then,
  ) = _CopyWithImpl$Fragment$SurveyQuestion$$SurveyTextQuestion;

  factory CopyWith$Fragment$SurveyQuestion$$SurveyTextQuestion.stub(TRes res) =
      _CopyWithStubImpl$Fragment$SurveyQuestion$$SurveyTextQuestion;

  TRes call({
    String? $__typename,
    String? id,
    String? title,
    String? description,
  });
}

class _CopyWithImpl$Fragment$SurveyQuestion$$SurveyTextQuestion<TRes>
    implements CopyWith$Fragment$SurveyQuestion$$SurveyTextQuestion<TRes> {
  _CopyWithImpl$Fragment$SurveyQuestion$$SurveyTextQuestion(
    this._instance,
    this._then,
  );

  final Fragment$SurveyQuestion$$SurveyTextQuestion _instance;

  final TRes Function(Fragment$SurveyQuestion$$SurveyTextQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
  }) =>
      _then(Fragment$SurveyQuestion$$SurveyTextQuestion(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
      ));
}

class _CopyWithStubImpl$Fragment$SurveyQuestion$$SurveyTextQuestion<TRes>
    implements CopyWith$Fragment$SurveyQuestion$$SurveyTextQuestion<TRes> {
  _CopyWithStubImpl$Fragment$SurveyQuestion$$SurveyTextQuestion(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    String? title,
    String? description,
  }) =>
      _res;
}

class Query$getSurveys {
  Query$getSurveys({
    required this.surveys,
    this.$__typename = 'QueryRoot',
  });

  factory Query$getSurveys.fromJson(Map<String, dynamic> json) {
    final l$surveys = json['surveys'];
    final l$$__typename = json['__typename'];
    return Query$getSurveys(
      surveys: (l$surveys as List<dynamic>)
          .map((e) => Fragment$Survey.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Survey> surveys;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$surveys = surveys;
    _resultData['surveys'] = l$surveys.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$surveys = surveys;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$surveys.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getSurveys) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$surveys = surveys;
    final lOther$surveys = other.surveys;
    if (l$surveys.length != lOther$surveys.length) {
      return false;
    }
    for (int i = 0; i < l$surveys.length; i++) {
      final l$surveys$entry = l$surveys[i];
      final lOther$surveys$entry = lOther$surveys[i];
      if (l$surveys$entry != lOther$surveys$entry) {
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

extension UtilityExtension$Query$getSurveys on Query$getSurveys {
  CopyWith$Query$getSurveys<Query$getSurveys> get copyWith =>
      CopyWith$Query$getSurveys(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getSurveys<TRes> {
  factory CopyWith$Query$getSurveys(
    Query$getSurveys instance,
    TRes Function(Query$getSurveys) then,
  ) = _CopyWithImpl$Query$getSurveys;

  factory CopyWith$Query$getSurveys.stub(TRes res) =
      _CopyWithStubImpl$Query$getSurveys;

  TRes call({
    List<Fragment$Survey>? surveys,
    String? $__typename,
  });
  TRes surveys(
      Iterable<Fragment$Survey> Function(
              Iterable<CopyWith$Fragment$Survey<Fragment$Survey>>)
          _fn);
}

class _CopyWithImpl$Query$getSurveys<TRes>
    implements CopyWith$Query$getSurveys<TRes> {
  _CopyWithImpl$Query$getSurveys(
    this._instance,
    this._then,
  );

  final Query$getSurveys _instance;

  final TRes Function(Query$getSurveys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? surveys = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getSurveys(
        surveys: surveys == _undefined || surveys == null
            ? _instance.surveys
            : (surveys as List<Fragment$Survey>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes surveys(
          Iterable<Fragment$Survey> Function(
                  Iterable<CopyWith$Fragment$Survey<Fragment$Survey>>)
              _fn) =>
      call(
          surveys: _fn(_instance.surveys.map((e) => CopyWith$Fragment$Survey(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getSurveys<TRes>
    implements CopyWith$Query$getSurveys<TRes> {
  _CopyWithStubImpl$Query$getSurveys(this._res);

  TRes _res;

  call({
    List<Fragment$Survey>? surveys,
    String? $__typename,
  }) =>
      _res;
  surveys(_fn) => _res;
}

const documentNodeQuerygetSurveys = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getSurveys'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'surveys'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Survey'),
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
  fragmentDefinitionSurvey,
  fragmentDefinitionSurveyQuestion,
]);
Query$getSurveys _parserFn$Query$getSurveys(Map<String, dynamic> data) =>
    Query$getSurveys.fromJson(data);

class Options$Query$getSurveys extends graphql.QueryOptions<Query$getSurveys> {
  Options$Query$getSurveys({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetSurveys,
          parserFn: _parserFn$Query$getSurveys,
        );
}

class WatchOptions$Query$getSurveys
    extends graphql.WatchQueryOptions<Query$getSurveys> {
  WatchOptions$Query$getSurveys({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerygetSurveys,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getSurveys,
        );
}

class FetchMoreOptions$Query$getSurveys extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getSurveys({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetSurveys,
        );
}

extension ClientExtension$Query$getSurveys on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getSurveys>> query$getSurveys(
          [Options$Query$getSurveys? options]) async =>
      await this.query(options ?? Options$Query$getSurveys());
  graphql.ObservableQuery<Query$getSurveys> watchQuery$getSurveys(
          [WatchOptions$Query$getSurveys? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getSurveys());
  void writeQuery$getSurveys({
    required Query$getSurveys data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetSurveys)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getSurveys? readQuery$getSurveys({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetSurveys)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getSurveys.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getSurveys> useQuery$getSurveys(
        [Options$Query$getSurveys? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$getSurveys());
graphql.ObservableQuery<Query$getSurveys> useWatchQuery$getSurveys(
        [WatchOptions$Query$getSurveys? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$getSurveys());

class Query$getSurveys$Widget extends graphql_flutter.Query<Query$getSurveys> {
  Query$getSurveys$Widget({
    widgets.Key? key,
    Options$Query$getSurveys? options,
    required graphql_flutter.QueryBuilder<Query$getSurveys> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getSurveys(),
          builder: builder,
        );
}
