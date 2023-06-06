import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$Question {
  Fragment$Question({
    required this.question,
    required this.answer,
    this.$__typename = 'Question',
  });

  factory Fragment$Question.fromJson(Map<String, dynamic> json) {
    final l$question = json['question'];
    final l$answer = json['answer'];
    final l$$__typename = json['__typename'];
    return Fragment$Question(
      question: (l$question as String),
      answer: (l$answer as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String question;

  final String answer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$question = question;
    _resultData['question'] = l$question;
    final l$answer = answer;
    _resultData['answer'] = l$answer;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$question = question;
    final l$answer = answer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$question,
      l$answer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Question) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$question = question;
    final lOther$question = other.question;
    if (l$question != lOther$question) {
      return false;
    }
    final l$answer = answer;
    final lOther$answer = other.answer;
    if (l$answer != lOther$answer) {
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

extension UtilityExtension$Fragment$Question on Fragment$Question {
  CopyWith$Fragment$Question<Fragment$Question> get copyWith =>
      CopyWith$Fragment$Question(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Question<TRes> {
  factory CopyWith$Fragment$Question(
    Fragment$Question instance,
    TRes Function(Fragment$Question) then,
  ) = _CopyWithImpl$Fragment$Question;

  factory CopyWith$Fragment$Question.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Question;

  TRes call({
    String? question,
    String? answer,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Question<TRes>
    implements CopyWith$Fragment$Question<TRes> {
  _CopyWithImpl$Fragment$Question(
    this._instance,
    this._then,
  );

  final Fragment$Question _instance;

  final TRes Function(Fragment$Question) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? question = _undefined,
    Object? answer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Question(
        question: question == _undefined || question == null
            ? _instance.question
            : (question as String),
        answer: answer == _undefined || answer == null
            ? _instance.answer
            : (answer as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Question<TRes>
    implements CopyWith$Fragment$Question<TRes> {
  _CopyWithStubImpl$Fragment$Question(this._res);

  TRes _res;

  call({
    String? question,
    String? answer,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionQuestion = FragmentDefinitionNode(
  name: NameNode(value: 'Question'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Question'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'question'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'answer'),
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
const documentNodeFragmentQuestion = DocumentNode(definitions: [
  fragmentDefinitionQuestion,
]);

extension ClientExtension$Fragment$Question on graphql.GraphQLClient {
  void writeFragment$Question({
    required Fragment$Question data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Question',
            document: documentNodeFragmentQuestion,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Question? readFragment$Question({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Question',
          document: documentNodeFragmentQuestion,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Question.fromJson(result);
  }
}

class Fragment$FAQCategory {
  Fragment$FAQCategory({
    required this.title,
    this.questions,
    this.$__typename = 'FAQCategory',
  });

  factory Fragment$FAQCategory.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$questions = json['questions'];
    final l$$__typename = json['__typename'];
    return Fragment$FAQCategory(
      title: (l$title as String),
      questions: l$questions == null
          ? null
          : Fragment$FAQCategory$questions.fromJson(
              (l$questions as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final Fragment$FAQCategory$questions? questions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$questions = questions;
    _resultData['questions'] = l$questions?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$questions = questions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$questions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$FAQCategory) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$FAQCategory on Fragment$FAQCategory {
  CopyWith$Fragment$FAQCategory<Fragment$FAQCategory> get copyWith =>
      CopyWith$Fragment$FAQCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$FAQCategory<TRes> {
  factory CopyWith$Fragment$FAQCategory(
    Fragment$FAQCategory instance,
    TRes Function(Fragment$FAQCategory) then,
  ) = _CopyWithImpl$Fragment$FAQCategory;

  factory CopyWith$Fragment$FAQCategory.stub(TRes res) =
      _CopyWithStubImpl$Fragment$FAQCategory;

  TRes call({
    String? title,
    Fragment$FAQCategory$questions? questions,
    String? $__typename,
  });
  CopyWith$Fragment$FAQCategory$questions<TRes> get questions;
}

class _CopyWithImpl$Fragment$FAQCategory<TRes>
    implements CopyWith$Fragment$FAQCategory<TRes> {
  _CopyWithImpl$Fragment$FAQCategory(
    this._instance,
    this._then,
  );

  final Fragment$FAQCategory _instance;

  final TRes Function(Fragment$FAQCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? questions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$FAQCategory(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        questions: questions == _undefined
            ? _instance.questions
            : (questions as Fragment$FAQCategory$questions?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$FAQCategory$questions<TRes> get questions {
    final local$questions = _instance.questions;
    return local$questions == null
        ? CopyWith$Fragment$FAQCategory$questions.stub(_then(_instance))
        : CopyWith$Fragment$FAQCategory$questions(
            local$questions, (e) => call(questions: e));
  }
}

class _CopyWithStubImpl$Fragment$FAQCategory<TRes>
    implements CopyWith$Fragment$FAQCategory<TRes> {
  _CopyWithStubImpl$Fragment$FAQCategory(this._res);

  TRes _res;

  call({
    String? title,
    Fragment$FAQCategory$questions? questions,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$FAQCategory$questions<TRes> get questions =>
      CopyWith$Fragment$FAQCategory$questions.stub(_res);
}

const fragmentDefinitionFAQCategory = FragmentDefinitionNode(
  name: NameNode(value: 'FAQCategory'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'FAQCategory'),
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
              name: NameNode(value: 'Question'),
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
const documentNodeFragmentFAQCategory = DocumentNode(definitions: [
  fragmentDefinitionFAQCategory,
  fragmentDefinitionQuestion,
]);

extension ClientExtension$Fragment$FAQCategory on graphql.GraphQLClient {
  void writeFragment$FAQCategory({
    required Fragment$FAQCategory data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'FAQCategory',
            document: documentNodeFragmentFAQCategory,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$FAQCategory? readFragment$FAQCategory({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'FAQCategory',
          document: documentNodeFragmentFAQCategory,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$FAQCategory.fromJson(result);
  }
}

class Fragment$FAQCategory$questions {
  Fragment$FAQCategory$questions({
    required this.items,
    this.$__typename = 'QuestionPagination',
  });

  factory Fragment$FAQCategory$questions.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$FAQCategory$questions(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Question.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Question> items;

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
    if (!(other is Fragment$FAQCategory$questions) ||
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

extension UtilityExtension$Fragment$FAQCategory$questions
    on Fragment$FAQCategory$questions {
  CopyWith$Fragment$FAQCategory$questions<Fragment$FAQCategory$questions>
      get copyWith => CopyWith$Fragment$FAQCategory$questions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$FAQCategory$questions<TRes> {
  factory CopyWith$Fragment$FAQCategory$questions(
    Fragment$FAQCategory$questions instance,
    TRes Function(Fragment$FAQCategory$questions) then,
  ) = _CopyWithImpl$Fragment$FAQCategory$questions;

  factory CopyWith$Fragment$FAQCategory$questions.stub(TRes res) =
      _CopyWithStubImpl$Fragment$FAQCategory$questions;

  TRes call({
    List<Fragment$Question>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Question> Function(
              Iterable<CopyWith$Fragment$Question<Fragment$Question>>)
          _fn);
}

class _CopyWithImpl$Fragment$FAQCategory$questions<TRes>
    implements CopyWith$Fragment$FAQCategory$questions<TRes> {
  _CopyWithImpl$Fragment$FAQCategory$questions(
    this._instance,
    this._then,
  );

  final Fragment$FAQCategory$questions _instance;

  final TRes Function(Fragment$FAQCategory$questions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$FAQCategory$questions(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Question>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Question> Function(
                  Iterable<CopyWith$Fragment$Question<Fragment$Question>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$Question(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Fragment$FAQCategory$questions<TRes>
    implements CopyWith$Fragment$FAQCategory$questions<TRes> {
  _CopyWithStubImpl$Fragment$FAQCategory$questions(this._res);

  TRes _res;

  call({
    List<Fragment$Question>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FAQ {
  Query$FAQ({
    required this.faq,
    this.$__typename = 'QueryRoot',
  });

  factory Query$FAQ.fromJson(Map<String, dynamic> json) {
    final l$faq = json['faq'];
    final l$$__typename = json['__typename'];
    return Query$FAQ(
      faq: Query$FAQ$faq.fromJson((l$faq as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FAQ$faq faq;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$faq = faq;
    _resultData['faq'] = l$faq.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$faq = faq;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$faq,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FAQ) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$faq = faq;
    final lOther$faq = other.faq;
    if (l$faq != lOther$faq) {
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

extension UtilityExtension$Query$FAQ on Query$FAQ {
  CopyWith$Query$FAQ<Query$FAQ> get copyWith => CopyWith$Query$FAQ(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FAQ<TRes> {
  factory CopyWith$Query$FAQ(
    Query$FAQ instance,
    TRes Function(Query$FAQ) then,
  ) = _CopyWithImpl$Query$FAQ;

  factory CopyWith$Query$FAQ.stub(TRes res) = _CopyWithStubImpl$Query$FAQ;

  TRes call({
    Query$FAQ$faq? faq,
    String? $__typename,
  });
  CopyWith$Query$FAQ$faq<TRes> get faq;
}

class _CopyWithImpl$Query$FAQ<TRes> implements CopyWith$Query$FAQ<TRes> {
  _CopyWithImpl$Query$FAQ(
    this._instance,
    this._then,
  );

  final Query$FAQ _instance;

  final TRes Function(Query$FAQ) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? faq = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FAQ(
        faq: faq == _undefined || faq == null
            ? _instance.faq
            : (faq as Query$FAQ$faq),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FAQ$faq<TRes> get faq {
    final local$faq = _instance.faq;
    return CopyWith$Query$FAQ$faq(local$faq, (e) => call(faq: e));
  }
}

class _CopyWithStubImpl$Query$FAQ<TRes> implements CopyWith$Query$FAQ<TRes> {
  _CopyWithStubImpl$Query$FAQ(this._res);

  TRes _res;

  call({
    Query$FAQ$faq? faq,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FAQ$faq<TRes> get faq => CopyWith$Query$FAQ$faq.stub(_res);
}

const documentNodeQueryFAQ = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'FAQ'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'faq'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'categories'),
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
                    name: NameNode(value: 'FAQCategory'),
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
  fragmentDefinitionFAQCategory,
  fragmentDefinitionQuestion,
]);
Query$FAQ _parserFn$Query$FAQ(Map<String, dynamic> data) =>
    Query$FAQ.fromJson(data);
typedef OnQueryComplete$Query$FAQ = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$FAQ?,
);

class Options$Query$FAQ extends graphql.QueryOptions<Query$FAQ> {
  Options$Query$FAQ({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FAQ? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FAQ? onComplete,
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
                    data == null ? null : _parserFn$Query$FAQ(data),
                  ),
          onError: onError,
          document: documentNodeQueryFAQ,
          parserFn: _parserFn$Query$FAQ,
        );

  final OnQueryComplete$Query$FAQ? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$FAQ extends graphql.WatchQueryOptions<Query$FAQ> {
  WatchOptions$Query$FAQ({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FAQ? typedOptimisticResult,
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
          document: documentNodeQueryFAQ,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$FAQ,
        );
}

class FetchMoreOptions$Query$FAQ extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FAQ({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryFAQ,
        );
}

extension ClientExtension$Query$FAQ on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FAQ>> query$FAQ(
          [Options$Query$FAQ? options]) async =>
      await this.query(options ?? Options$Query$FAQ());
  graphql.ObservableQuery<Query$FAQ> watchQuery$FAQ(
          [WatchOptions$Query$FAQ? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$FAQ());
  void writeQuery$FAQ({
    required Query$FAQ data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryFAQ)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$FAQ? readQuery$FAQ({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryFAQ)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FAQ.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$FAQ> useQuery$FAQ(
        [Options$Query$FAQ? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$FAQ());
graphql.ObservableQuery<Query$FAQ> useWatchQuery$FAQ(
        [WatchOptions$Query$FAQ? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$FAQ());

class Query$FAQ$Widget extends graphql_flutter.Query<Query$FAQ> {
  Query$FAQ$Widget({
    widgets.Key? key,
    Options$Query$FAQ? options,
    required graphql_flutter.QueryBuilder<Query$FAQ> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$FAQ(),
          builder: builder,
        );
}

class Query$FAQ$faq {
  Query$FAQ$faq({
    this.categories,
    this.$__typename = 'FAQ',
  });

  factory Query$FAQ$faq.fromJson(Map<String, dynamic> json) {
    final l$categories = json['categories'];
    final l$$__typename = json['__typename'];
    return Query$FAQ$faq(
      categories: l$categories == null
          ? null
          : Query$FAQ$faq$categories.fromJson(
              (l$categories as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FAQ$faq$categories? categories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$categories = categories;
    _resultData['categories'] = l$categories?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$categories,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FAQ$faq) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories != lOther$categories) {
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

extension UtilityExtension$Query$FAQ$faq on Query$FAQ$faq {
  CopyWith$Query$FAQ$faq<Query$FAQ$faq> get copyWith => CopyWith$Query$FAQ$faq(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FAQ$faq<TRes> {
  factory CopyWith$Query$FAQ$faq(
    Query$FAQ$faq instance,
    TRes Function(Query$FAQ$faq) then,
  ) = _CopyWithImpl$Query$FAQ$faq;

  factory CopyWith$Query$FAQ$faq.stub(TRes res) =
      _CopyWithStubImpl$Query$FAQ$faq;

  TRes call({
    Query$FAQ$faq$categories? categories,
    String? $__typename,
  });
  CopyWith$Query$FAQ$faq$categories<TRes> get categories;
}

class _CopyWithImpl$Query$FAQ$faq<TRes>
    implements CopyWith$Query$FAQ$faq<TRes> {
  _CopyWithImpl$Query$FAQ$faq(
    this._instance,
    this._then,
  );

  final Query$FAQ$faq _instance;

  final TRes Function(Query$FAQ$faq) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? categories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FAQ$faq(
        categories: categories == _undefined
            ? _instance.categories
            : (categories as Query$FAQ$faq$categories?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FAQ$faq$categories<TRes> get categories {
    final local$categories = _instance.categories;
    return local$categories == null
        ? CopyWith$Query$FAQ$faq$categories.stub(_then(_instance))
        : CopyWith$Query$FAQ$faq$categories(
            local$categories, (e) => call(categories: e));
  }
}

class _CopyWithStubImpl$Query$FAQ$faq<TRes>
    implements CopyWith$Query$FAQ$faq<TRes> {
  _CopyWithStubImpl$Query$FAQ$faq(this._res);

  TRes _res;

  call({
    Query$FAQ$faq$categories? categories,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FAQ$faq$categories<TRes> get categories =>
      CopyWith$Query$FAQ$faq$categories.stub(_res);
}

class Query$FAQ$faq$categories {
  Query$FAQ$faq$categories({
    required this.items,
    this.$__typename = 'FAQCategoryPagination',
  });

  factory Query$FAQ$faq$categories.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FAQ$faq$categories(
      items: (l$items as List<dynamic>)
          .map(
              (e) => Fragment$FAQCategory.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$FAQCategory> items;

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
    if (!(other is Query$FAQ$faq$categories) ||
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

extension UtilityExtension$Query$FAQ$faq$categories
    on Query$FAQ$faq$categories {
  CopyWith$Query$FAQ$faq$categories<Query$FAQ$faq$categories> get copyWith =>
      CopyWith$Query$FAQ$faq$categories(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FAQ$faq$categories<TRes> {
  factory CopyWith$Query$FAQ$faq$categories(
    Query$FAQ$faq$categories instance,
    TRes Function(Query$FAQ$faq$categories) then,
  ) = _CopyWithImpl$Query$FAQ$faq$categories;

  factory CopyWith$Query$FAQ$faq$categories.stub(TRes res) =
      _CopyWithStubImpl$Query$FAQ$faq$categories;

  TRes call({
    List<Fragment$FAQCategory>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$FAQCategory> Function(
              Iterable<CopyWith$Fragment$FAQCategory<Fragment$FAQCategory>>)
          _fn);
}

class _CopyWithImpl$Query$FAQ$faq$categories<TRes>
    implements CopyWith$Query$FAQ$faq$categories<TRes> {
  _CopyWithImpl$Query$FAQ$faq$categories(
    this._instance,
    this._then,
  );

  final Query$FAQ$faq$categories _instance;

  final TRes Function(Query$FAQ$faq$categories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FAQ$faq$categories(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$FAQCategory>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$FAQCategory> Function(
                  Iterable<CopyWith$Fragment$FAQCategory<Fragment$FAQCategory>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$FAQCategory(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FAQ$faq$categories<TRes>
    implements CopyWith$Query$FAQ$faq$categories<TRes> {
  _CopyWithStubImpl$Query$FAQ$faq$categories(this._res);

  TRes _res;

  call({
    List<Fragment$FAQCategory>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}
