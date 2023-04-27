import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$Prompt {
  Fragment$Prompt({
    required this.id,
    required this.title,
    required this.from,
    required this.to,
    required this.$__typename,
  });

  factory Fragment$Prompt.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "SurveyPrompt":
        return Fragment$Prompt$$SurveyPrompt.fromJson(json);

      default:
        final l$id = json['id'];
        final l$title = json['title'];
        final l$from = json['from'];
        final l$to = json['to'];
        final l$$__typename = json['__typename'];
        return Fragment$Prompt(
          id: (l$id as String),
          title: (l$title as String),
          from: (l$from as String),
          to: (l$to as String),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final String id;

  final String title;

  final String from;

  final String to;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$from = from;
    _resultData['from'] = l$from;
    final l$to = to;
    _resultData['to'] = l$to;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$from = from;
    final l$to = to;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$from,
      l$to,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Prompt) || runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Prompt on Fragment$Prompt {
  CopyWith$Fragment$Prompt<Fragment$Prompt> get copyWith =>
      CopyWith$Fragment$Prompt(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Prompt<TRes> {
  factory CopyWith$Fragment$Prompt(
    Fragment$Prompt instance,
    TRes Function(Fragment$Prompt) then,
  ) = _CopyWithImpl$Fragment$Prompt;

  factory CopyWith$Fragment$Prompt.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Prompt;

  TRes call({
    String? id,
    String? title,
    String? from,
    String? to,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Prompt<TRes>
    implements CopyWith$Fragment$Prompt<TRes> {
  _CopyWithImpl$Fragment$Prompt(
    this._instance,
    this._then,
  );

  final Fragment$Prompt _instance;

  final TRes Function(Fragment$Prompt) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? from = _undefined,
    Object? to = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Prompt(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        from: from == _undefined || from == null
            ? _instance.from
            : (from as String),
        to: to == _undefined || to == null ? _instance.to : (to as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Prompt<TRes>
    implements CopyWith$Fragment$Prompt<TRes> {
  _CopyWithStubImpl$Fragment$Prompt(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? from,
    String? to,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionPrompt = FragmentDefinitionNode(
  name: NameNode(value: 'Prompt'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Prompt'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'SurveyPrompt'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'survey'),
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
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentPrompt = DocumentNode(definitions: [
  fragmentDefinitionPrompt,
  fragmentDefinitionSurvey,
  fragmentDefinitionSurveyQuestion,
]);

extension ClientExtension$Fragment$Prompt on graphql.GraphQLClient {
  void writeFragment$Prompt({
    required Fragment$Prompt data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Prompt',
            document: documentNodeFragmentPrompt,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Prompt? readFragment$Prompt({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Prompt',
          document: documentNodeFragmentPrompt,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Prompt.fromJson(result);
  }
}

class Fragment$Prompt$$SurveyPrompt implements Fragment$Prompt {
  Fragment$Prompt$$SurveyPrompt({
    required this.survey,
    this.$__typename = 'SurveyPrompt',
    required this.id,
    required this.title,
    required this.from,
    required this.to,
  });

  factory Fragment$Prompt$$SurveyPrompt.fromJson(Map<String, dynamic> json) {
    final l$survey = json['survey'];
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$title = json['title'];
    final l$from = json['from'];
    final l$to = json['to'];
    return Fragment$Prompt$$SurveyPrompt(
      survey: Fragment$Survey.fromJson((l$survey as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      title: (l$title as String),
      from: (l$from as String),
      to: (l$to as String),
    );
  }

  final Fragment$Survey survey;

  final String $__typename;

  final String id;

  final String title;

  final String from;

  final String to;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$survey = survey;
    _resultData['survey'] = l$survey.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$from = from;
    _resultData['from'] = l$from;
    final l$to = to;
    _resultData['to'] = l$to;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$survey = survey;
    final l$$__typename = $__typename;
    final l$id = id;
    final l$title = title;
    final l$from = from;
    final l$to = to;
    return Object.hashAll([
      l$survey,
      l$$__typename,
      l$id,
      l$title,
      l$from,
      l$to,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Prompt$$SurveyPrompt) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$survey = survey;
    final lOther$survey = other.survey;
    if (l$survey != lOther$survey) {
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
    return true;
  }
}

extension UtilityExtension$Fragment$Prompt$$SurveyPrompt
    on Fragment$Prompt$$SurveyPrompt {
  CopyWith$Fragment$Prompt$$SurveyPrompt<Fragment$Prompt$$SurveyPrompt>
      get copyWith => CopyWith$Fragment$Prompt$$SurveyPrompt(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Prompt$$SurveyPrompt<TRes> {
  factory CopyWith$Fragment$Prompt$$SurveyPrompt(
    Fragment$Prompt$$SurveyPrompt instance,
    TRes Function(Fragment$Prompt$$SurveyPrompt) then,
  ) = _CopyWithImpl$Fragment$Prompt$$SurveyPrompt;

  factory CopyWith$Fragment$Prompt$$SurveyPrompt.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Prompt$$SurveyPrompt;

  TRes call({
    Fragment$Survey? survey,
    String? $__typename,
    String? id,
    String? title,
    String? from,
    String? to,
  });
  CopyWith$Fragment$Survey<TRes> get survey;
}

class _CopyWithImpl$Fragment$Prompt$$SurveyPrompt<TRes>
    implements CopyWith$Fragment$Prompt$$SurveyPrompt<TRes> {
  _CopyWithImpl$Fragment$Prompt$$SurveyPrompt(
    this._instance,
    this._then,
  );

  final Fragment$Prompt$$SurveyPrompt _instance;

  final TRes Function(Fragment$Prompt$$SurveyPrompt) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? survey = _undefined,
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? title = _undefined,
    Object? from = _undefined,
    Object? to = _undefined,
  }) =>
      _then(Fragment$Prompt$$SurveyPrompt(
        survey: survey == _undefined || survey == null
            ? _instance.survey
            : (survey as Fragment$Survey),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        from: from == _undefined || from == null
            ? _instance.from
            : (from as String),
        to: to == _undefined || to == null ? _instance.to : (to as String),
      ));
  CopyWith$Fragment$Survey<TRes> get survey {
    final local$survey = _instance.survey;
    return CopyWith$Fragment$Survey(local$survey, (e) => call(survey: e));
  }
}

class _CopyWithStubImpl$Fragment$Prompt$$SurveyPrompt<TRes>
    implements CopyWith$Fragment$Prompt$$SurveyPrompt<TRes> {
  _CopyWithStubImpl$Fragment$Prompt$$SurveyPrompt(this._res);

  TRes _res;

  call({
    Fragment$Survey? survey,
    String? $__typename,
    String? id,
    String? title,
    String? from,
    String? to,
  }) =>
      _res;
  CopyWith$Fragment$Survey<TRes> get survey =>
      CopyWith$Fragment$Survey.stub(_res);
}

class Fragment$Survey {
  Fragment$Survey({
    required this.id,
    required this.title,
    this.description,
    required this.questions,
    this.$__typename = 'Survey',
  });

  factory Fragment$Survey.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$questions = json['questions'];
    final l$$__typename = json['__typename'];
    return Fragment$Survey(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
      questions: Fragment$Survey$questions.fromJson(
          (l$questions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? description;

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
    final l$questions = questions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
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

class Query$getPrompts {
  Query$getPrompts({
    required this.prompts,
    this.$__typename = 'QueryRoot',
  });

  factory Query$getPrompts.fromJson(Map<String, dynamic> json) {
    final l$prompts = json['prompts'];
    final l$$__typename = json['__typename'];
    return Query$getPrompts(
      prompts: (l$prompts as List<dynamic>)
          .map((e) => Fragment$Prompt.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Prompt> prompts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$prompts = prompts;
    _resultData['prompts'] = l$prompts.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$prompts = prompts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$prompts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getPrompts) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$prompts = prompts;
    final lOther$prompts = other.prompts;
    if (l$prompts.length != lOther$prompts.length) {
      return false;
    }
    for (int i = 0; i < l$prompts.length; i++) {
      final l$prompts$entry = l$prompts[i];
      final lOther$prompts$entry = lOther$prompts[i];
      if (l$prompts$entry != lOther$prompts$entry) {
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

extension UtilityExtension$Query$getPrompts on Query$getPrompts {
  CopyWith$Query$getPrompts<Query$getPrompts> get copyWith =>
      CopyWith$Query$getPrompts(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getPrompts<TRes> {
  factory CopyWith$Query$getPrompts(
    Query$getPrompts instance,
    TRes Function(Query$getPrompts) then,
  ) = _CopyWithImpl$Query$getPrompts;

  factory CopyWith$Query$getPrompts.stub(TRes res) =
      _CopyWithStubImpl$Query$getPrompts;

  TRes call({
    List<Fragment$Prompt>? prompts,
    String? $__typename,
  });
  TRes prompts(
      Iterable<Fragment$Prompt> Function(
              Iterable<CopyWith$Fragment$Prompt<Fragment$Prompt>>)
          _fn);
}

class _CopyWithImpl$Query$getPrompts<TRes>
    implements CopyWith$Query$getPrompts<TRes> {
  _CopyWithImpl$Query$getPrompts(
    this._instance,
    this._then,
  );

  final Query$getPrompts _instance;

  final TRes Function(Query$getPrompts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? prompts = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getPrompts(
        prompts: prompts == _undefined || prompts == null
            ? _instance.prompts
            : (prompts as List<Fragment$Prompt>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes prompts(
          Iterable<Fragment$Prompt> Function(
                  Iterable<CopyWith$Fragment$Prompt<Fragment$Prompt>>)
              _fn) =>
      call(
          prompts: _fn(_instance.prompts.map((e) => CopyWith$Fragment$Prompt(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getPrompts<TRes>
    implements CopyWith$Query$getPrompts<TRes> {
  _CopyWithStubImpl$Query$getPrompts(this._res);

  TRes _res;

  call({
    List<Fragment$Prompt>? prompts,
    String? $__typename,
  }) =>
      _res;
  prompts(_fn) => _res;
}

const documentNodeQuerygetPrompts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getPrompts'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'prompts'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Prompt'),
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
  fragmentDefinitionPrompt,
  fragmentDefinitionSurvey,
  fragmentDefinitionSurveyQuestion,
]);
Query$getPrompts _parserFn$Query$getPrompts(Map<String, dynamic> data) =>
    Query$getPrompts.fromJson(data);

class Options$Query$getPrompts extends graphql.QueryOptions<Query$getPrompts> {
  Options$Query$getPrompts({
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
          document: documentNodeQuerygetPrompts,
          parserFn: _parserFn$Query$getPrompts,
        );
}

class WatchOptions$Query$getPrompts
    extends graphql.WatchQueryOptions<Query$getPrompts> {
  WatchOptions$Query$getPrompts({
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
          document: documentNodeQuerygetPrompts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getPrompts,
        );
}

class FetchMoreOptions$Query$getPrompts extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getPrompts({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetPrompts,
        );
}

extension ClientExtension$Query$getPrompts on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getPrompts>> query$getPrompts(
          [Options$Query$getPrompts? options]) async =>
      await this.query(options ?? Options$Query$getPrompts());
  graphql.ObservableQuery<Query$getPrompts> watchQuery$getPrompts(
          [WatchOptions$Query$getPrompts? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getPrompts());
  void writeQuery$getPrompts({
    required Query$getPrompts data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetPrompts)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getPrompts? readQuery$getPrompts({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetPrompts)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getPrompts.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getPrompts> useQuery$getPrompts(
        [Options$Query$getPrompts? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$getPrompts());
graphql.ObservableQuery<Query$getPrompts> useWatchQuery$getPrompts(
        [WatchOptions$Query$getPrompts? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$getPrompts());

class Query$getPrompts$Widget extends graphql_flutter.Query<Query$getPrompts> {
  Query$getPrompts$Widget({
    widgets.Key? key,
    Options$Query$getPrompts? options,
    required graphql_flutter.QueryBuilder<Query$getPrompts> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getPrompts(),
          builder: builder,
        );
}

class Variables$Mutation$answerSurveyQuestion {
  factory Variables$Mutation$answerSurveyQuestion({
    required String id,
    required String answer,
  }) =>
      Variables$Mutation$answerSurveyQuestion._({
        r'id': id,
        r'answer': answer,
      });

  Variables$Mutation$answerSurveyQuestion._(this._$data);

  factory Variables$Mutation$answerSurveyQuestion.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$answer = data['answer'];
    result$data['answer'] = (l$answer as String);
    return Variables$Mutation$answerSurveyQuestion._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String get answer => (_$data['answer'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$answer = answer;
    result$data['answer'] = l$answer;
    return result$data;
  }

  CopyWith$Variables$Mutation$answerSurveyQuestion<
          Variables$Mutation$answerSurveyQuestion>
      get copyWith => CopyWith$Variables$Mutation$answerSurveyQuestion(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$answerSurveyQuestion) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$answer = answer;
    final lOther$answer = other.answer;
    if (l$answer != lOther$answer) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$answer = answer;
    return Object.hashAll([
      l$id,
      l$answer,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$answerSurveyQuestion<TRes> {
  factory CopyWith$Variables$Mutation$answerSurveyQuestion(
    Variables$Mutation$answerSurveyQuestion instance,
    TRes Function(Variables$Mutation$answerSurveyQuestion) then,
  ) = _CopyWithImpl$Variables$Mutation$answerSurveyQuestion;

  factory CopyWith$Variables$Mutation$answerSurveyQuestion.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$answerSurveyQuestion;

  TRes call({
    String? id,
    String? answer,
  });
}

class _CopyWithImpl$Variables$Mutation$answerSurveyQuestion<TRes>
    implements CopyWith$Variables$Mutation$answerSurveyQuestion<TRes> {
  _CopyWithImpl$Variables$Mutation$answerSurveyQuestion(
    this._instance,
    this._then,
  );

  final Variables$Mutation$answerSurveyQuestion _instance;

  final TRes Function(Variables$Mutation$answerSurveyQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? answer = _undefined,
  }) =>
      _then(Variables$Mutation$answerSurveyQuestion._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (answer != _undefined && answer != null)
          'answer': (answer as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$answerSurveyQuestion<TRes>
    implements CopyWith$Variables$Mutation$answerSurveyQuestion<TRes> {
  _CopyWithStubImpl$Variables$Mutation$answerSurveyQuestion(this._res);

  TRes _res;

  call({
    String? id,
    String? answer,
  }) =>
      _res;
}

class Mutation$answerSurveyQuestion {
  Mutation$answerSurveyQuestion({
    required this.answerSurveyQuestion,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$answerSurveyQuestion.fromJson(Map<String, dynamic> json) {
    final l$answerSurveyQuestion = json['answerSurveyQuestion'];
    final l$$__typename = json['__typename'];
    return Mutation$answerSurveyQuestion(
      answerSurveyQuestion:
          Mutation$answerSurveyQuestion$answerSurveyQuestion.fromJson(
              (l$answerSurveyQuestion as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$answerSurveyQuestion$answerSurveyQuestion answerSurveyQuestion;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$answerSurveyQuestion = answerSurveyQuestion;
    _resultData['answerSurveyQuestion'] = l$answerSurveyQuestion.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$answerSurveyQuestion = answerSurveyQuestion;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$answerSurveyQuestion,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$answerSurveyQuestion) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$answerSurveyQuestion = answerSurveyQuestion;
    final lOther$answerSurveyQuestion = other.answerSurveyQuestion;
    if (l$answerSurveyQuestion != lOther$answerSurveyQuestion) {
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

extension UtilityExtension$Mutation$answerSurveyQuestion
    on Mutation$answerSurveyQuestion {
  CopyWith$Mutation$answerSurveyQuestion<Mutation$answerSurveyQuestion>
      get copyWith => CopyWith$Mutation$answerSurveyQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$answerSurveyQuestion<TRes> {
  factory CopyWith$Mutation$answerSurveyQuestion(
    Mutation$answerSurveyQuestion instance,
    TRes Function(Mutation$answerSurveyQuestion) then,
  ) = _CopyWithImpl$Mutation$answerSurveyQuestion;

  factory CopyWith$Mutation$answerSurveyQuestion.stub(TRes res) =
      _CopyWithStubImpl$Mutation$answerSurveyQuestion;

  TRes call({
    Mutation$answerSurveyQuestion$answerSurveyQuestion? answerSurveyQuestion,
    String? $__typename,
  });
  CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion<TRes>
      get answerSurveyQuestion;
}

class _CopyWithImpl$Mutation$answerSurveyQuestion<TRes>
    implements CopyWith$Mutation$answerSurveyQuestion<TRes> {
  _CopyWithImpl$Mutation$answerSurveyQuestion(
    this._instance,
    this._then,
  );

  final Mutation$answerSurveyQuestion _instance;

  final TRes Function(Mutation$answerSurveyQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? answerSurveyQuestion = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$answerSurveyQuestion(
        answerSurveyQuestion:
            answerSurveyQuestion == _undefined || answerSurveyQuestion == null
                ? _instance.answerSurveyQuestion
                : (answerSurveyQuestion
                    as Mutation$answerSurveyQuestion$answerSurveyQuestion),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion<TRes>
      get answerSurveyQuestion {
    final local$answerSurveyQuestion = _instance.answerSurveyQuestion;
    return CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion(
        local$answerSurveyQuestion, (e) => call(answerSurveyQuestion: e));
  }
}

class _CopyWithStubImpl$Mutation$answerSurveyQuestion<TRes>
    implements CopyWith$Mutation$answerSurveyQuestion<TRes> {
  _CopyWithStubImpl$Mutation$answerSurveyQuestion(this._res);

  TRes _res;

  call({
    Mutation$answerSurveyQuestion$answerSurveyQuestion? answerSurveyQuestion,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion<TRes>
      get answerSurveyQuestion =>
          CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion.stub(
              _res);
}

const documentNodeMutationanswerSurveyQuestion = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'answerSurveyQuestion'),
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
        variable: VariableNode(name: NameNode(value: 'answer')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'answerSurveyQuestion'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'answer'),
            value: VariableNode(name: NameNode(value: 'answer')),
          ),
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
Mutation$answerSurveyQuestion _parserFn$Mutation$answerSurveyQuestion(
        Map<String, dynamic> data) =>
    Mutation$answerSurveyQuestion.fromJson(data);
typedef OnMutationCompleted$Mutation$answerSurveyQuestion = FutureOr<void>
    Function(
  dynamic,
  Mutation$answerSurveyQuestion?,
);

class Options$Mutation$answerSurveyQuestion
    extends graphql.MutationOptions<Mutation$answerSurveyQuestion> {
  Options$Mutation$answerSurveyQuestion({
    String? operationName,
    required Variables$Mutation$answerSurveyQuestion variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$answerSurveyQuestion? onCompleted,
    graphql.OnMutationUpdate<Mutation$answerSurveyQuestion>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$answerSurveyQuestion(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationanswerSurveyQuestion,
          parserFn: _parserFn$Mutation$answerSurveyQuestion,
        );

  final OnMutationCompleted$Mutation$answerSurveyQuestion?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$answerSurveyQuestion
    extends graphql.WatchQueryOptions<Mutation$answerSurveyQuestion> {
  WatchOptions$Mutation$answerSurveyQuestion({
    String? operationName,
    required Variables$Mutation$answerSurveyQuestion variables,
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
          document: documentNodeMutationanswerSurveyQuestion,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$answerSurveyQuestion,
        );
}

extension ClientExtension$Mutation$answerSurveyQuestion
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$answerSurveyQuestion>>
      mutate$answerSurveyQuestion(
              Options$Mutation$answerSurveyQuestion options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$answerSurveyQuestion>
      watchMutation$answerSurveyQuestion(
              WatchOptions$Mutation$answerSurveyQuestion options) =>
          this.watchMutation(options);
}

class Mutation$answerSurveyQuestion$HookResult {
  Mutation$answerSurveyQuestion$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$answerSurveyQuestion runMutation;

  final graphql.QueryResult<Mutation$answerSurveyQuestion> result;
}

Mutation$answerSurveyQuestion$HookResult useMutation$answerSurveyQuestion(
    [WidgetOptions$Mutation$answerSurveyQuestion? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$answerSurveyQuestion());
  return Mutation$answerSurveyQuestion$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$answerSurveyQuestion>
    useWatchMutation$answerSurveyQuestion(
            WatchOptions$Mutation$answerSurveyQuestion options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$answerSurveyQuestion
    extends graphql.MutationOptions<Mutation$answerSurveyQuestion> {
  WidgetOptions$Mutation$answerSurveyQuestion({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$answerSurveyQuestion? onCompleted,
    graphql.OnMutationUpdate<Mutation$answerSurveyQuestion>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$answerSurveyQuestion(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationanswerSurveyQuestion,
          parserFn: _parserFn$Mutation$answerSurveyQuestion,
        );

  final OnMutationCompleted$Mutation$answerSurveyQuestion?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$answerSurveyQuestion
    = graphql.MultiSourceResult<Mutation$answerSurveyQuestion> Function(
  Variables$Mutation$answerSurveyQuestion, {
  Object? optimisticResult,
});
typedef Builder$Mutation$answerSurveyQuestion = widgets.Widget Function(
  RunMutation$Mutation$answerSurveyQuestion,
  graphql.QueryResult<Mutation$answerSurveyQuestion>?,
);

class Mutation$answerSurveyQuestion$Widget
    extends graphql_flutter.Mutation<Mutation$answerSurveyQuestion> {
  Mutation$answerSurveyQuestion$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$answerSurveyQuestion? options,
    required Builder$Mutation$answerSurveyQuestion builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$answerSurveyQuestion(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult: optimisticResult,
            ),
            result,
          ),
        );
}

class Mutation$answerSurveyQuestion$answerSurveyQuestion {
  Mutation$answerSurveyQuestion$answerSurveyQuestion({
    required this.id,
    this.$__typename = 'AnswerSurveyQuestionResult',
  });

  factory Mutation$answerSurveyQuestion$answerSurveyQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$answerSurveyQuestion$answerSurveyQuestion(
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
    if (!(other is Mutation$answerSurveyQuestion$answerSurveyQuestion) ||
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

extension UtilityExtension$Mutation$answerSurveyQuestion$answerSurveyQuestion
    on Mutation$answerSurveyQuestion$answerSurveyQuestion {
  CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion<
          Mutation$answerSurveyQuestion$answerSurveyQuestion>
      get copyWith =>
          CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion<
    TRes> {
  factory CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion(
    Mutation$answerSurveyQuestion$answerSurveyQuestion instance,
    TRes Function(Mutation$answerSurveyQuestion$answerSurveyQuestion) then,
  ) = _CopyWithImpl$Mutation$answerSurveyQuestion$answerSurveyQuestion;

  factory CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$answerSurveyQuestion$answerSurveyQuestion;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$answerSurveyQuestion$answerSurveyQuestion<TRes>
    implements
        CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion<TRes> {
  _CopyWithImpl$Mutation$answerSurveyQuestion$answerSurveyQuestion(
    this._instance,
    this._then,
  );

  final Mutation$answerSurveyQuestion$answerSurveyQuestion _instance;

  final TRes Function(Mutation$answerSurveyQuestion$answerSurveyQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$answerSurveyQuestion$answerSurveyQuestion(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$answerSurveyQuestion$answerSurveyQuestion<TRes>
    implements
        CopyWith$Mutation$answerSurveyQuestion$answerSurveyQuestion<TRes> {
  _CopyWithStubImpl$Mutation$answerSurveyQuestion$answerSurveyQuestion(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
