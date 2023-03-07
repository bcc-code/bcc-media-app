import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$sendSupportEmail {
  factory Variables$Mutation$sendSupportEmail({
    required String title,
    required String content,
    required String html,
  }) =>
      Variables$Mutation$sendSupportEmail._({
        r'title': title,
        r'content': content,
        r'html': html,
      });

  Variables$Mutation$sendSupportEmail._(this._$data);

  factory Variables$Mutation$sendSupportEmail.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$content = data['content'];
    result$data['content'] = (l$content as String);
    final l$html = data['html'];
    result$data['html'] = (l$html as String);
    return Variables$Mutation$sendSupportEmail._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);
  String get content => (_$data['content'] as String);
  String get html => (_$data['html'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    final l$content = content;
    result$data['content'] = l$content;
    final l$html = html;
    result$data['html'] = l$html;
    return result$data;
  }

  CopyWith$Variables$Mutation$sendSupportEmail<
          Variables$Mutation$sendSupportEmail>
      get copyWith => CopyWith$Variables$Mutation$sendSupportEmail(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$sendSupportEmail) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$html = html;
    final lOther$html = other.html;
    if (l$html != lOther$html) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$content = content;
    final l$html = html;
    return Object.hashAll([
      l$title,
      l$content,
      l$html,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$sendSupportEmail<TRes> {
  factory CopyWith$Variables$Mutation$sendSupportEmail(
    Variables$Mutation$sendSupportEmail instance,
    TRes Function(Variables$Mutation$sendSupportEmail) then,
  ) = _CopyWithImpl$Variables$Mutation$sendSupportEmail;

  factory CopyWith$Variables$Mutation$sendSupportEmail.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$sendSupportEmail;

  TRes call({
    String? title,
    String? content,
    String? html,
  });
}

class _CopyWithImpl$Variables$Mutation$sendSupportEmail<TRes>
    implements CopyWith$Variables$Mutation$sendSupportEmail<TRes> {
  _CopyWithImpl$Variables$Mutation$sendSupportEmail(
    this._instance,
    this._then,
  );

  final Variables$Mutation$sendSupportEmail _instance;

  final TRes Function(Variables$Mutation$sendSupportEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? content = _undefined,
    Object? html = _undefined,
  }) =>
      _then(Variables$Mutation$sendSupportEmail._({
        ..._instance._$data,
        if (title != _undefined && title != null) 'title': (title as String),
        if (content != _undefined && content != null)
          'content': (content as String),
        if (html != _undefined && html != null) 'html': (html as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$sendSupportEmail<TRes>
    implements CopyWith$Variables$Mutation$sendSupportEmail<TRes> {
  _CopyWithStubImpl$Variables$Mutation$sendSupportEmail(this._res);

  TRes _res;

  call({
    String? title,
    String? content,
    String? html,
  }) =>
      _res;
}

class Mutation$sendSupportEmail {
  Mutation$sendSupportEmail({
    required this.sendSupportEmail,
    this.$__typename = 'MutationRoot',
  });

  factory Mutation$sendSupportEmail.fromJson(Map<String, dynamic> json) {
    final l$sendSupportEmail = json['sendSupportEmail'];
    final l$$__typename = json['__typename'];
    return Mutation$sendSupportEmail(
      sendSupportEmail: (l$sendSupportEmail as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool sendSupportEmail;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendSupportEmail = sendSupportEmail;
    _resultData['sendSupportEmail'] = l$sendSupportEmail;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendSupportEmail = sendSupportEmail;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sendSupportEmail,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$sendSupportEmail) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendSupportEmail = sendSupportEmail;
    final lOther$sendSupportEmail = other.sendSupportEmail;
    if (l$sendSupportEmail != lOther$sendSupportEmail) {
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

extension UtilityExtension$Mutation$sendSupportEmail
    on Mutation$sendSupportEmail {
  CopyWith$Mutation$sendSupportEmail<Mutation$sendSupportEmail> get copyWith =>
      CopyWith$Mutation$sendSupportEmail(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$sendSupportEmail<TRes> {
  factory CopyWith$Mutation$sendSupportEmail(
    Mutation$sendSupportEmail instance,
    TRes Function(Mutation$sendSupportEmail) then,
  ) = _CopyWithImpl$Mutation$sendSupportEmail;

  factory CopyWith$Mutation$sendSupportEmail.stub(TRes res) =
      _CopyWithStubImpl$Mutation$sendSupportEmail;

  TRes call({
    bool? sendSupportEmail,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$sendSupportEmail<TRes>
    implements CopyWith$Mutation$sendSupportEmail<TRes> {
  _CopyWithImpl$Mutation$sendSupportEmail(
    this._instance,
    this._then,
  );

  final Mutation$sendSupportEmail _instance;

  final TRes Function(Mutation$sendSupportEmail) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendSupportEmail = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$sendSupportEmail(
        sendSupportEmail:
            sendSupportEmail == _undefined || sendSupportEmail == null
                ? _instance.sendSupportEmail
                : (sendSupportEmail as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$sendSupportEmail<TRes>
    implements CopyWith$Mutation$sendSupportEmail<TRes> {
  _CopyWithStubImpl$Mutation$sendSupportEmail(this._res);

  TRes _res;

  call({
    bool? sendSupportEmail,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationsendSupportEmail = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'sendSupportEmail'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'title')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'html')),
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
        name: NameNode(value: 'sendSupportEmail'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'title'),
            value: VariableNode(name: NameNode(value: 'title')),
          ),
          ArgumentNode(
            name: NameNode(value: 'content'),
            value: VariableNode(name: NameNode(value: 'content')),
          ),
          ArgumentNode(
            name: NameNode(value: 'html'),
            value: VariableNode(name: NameNode(value: 'html')),
          ),
        ],
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
]);
Mutation$sendSupportEmail _parserFn$Mutation$sendSupportEmail(
        Map<String, dynamic> data) =>
    Mutation$sendSupportEmail.fromJson(data);
typedef OnMutationCompleted$Mutation$sendSupportEmail = FutureOr<void> Function(
  dynamic,
  Mutation$sendSupportEmail?,
);

class Options$Mutation$sendSupportEmail
    extends graphql.MutationOptions<Mutation$sendSupportEmail> {
  Options$Mutation$sendSupportEmail({
    String? operationName,
    required Variables$Mutation$sendSupportEmail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendSupportEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendSupportEmail>? update,
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
                        : _parserFn$Mutation$sendSupportEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendSupportEmail,
          parserFn: _parserFn$Mutation$sendSupportEmail,
        );

  final OnMutationCompleted$Mutation$sendSupportEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$sendSupportEmail
    extends graphql.WatchQueryOptions<Mutation$sendSupportEmail> {
  WatchOptions$Mutation$sendSupportEmail({
    String? operationName,
    required Variables$Mutation$sendSupportEmail variables,
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
          document: documentNodeMutationsendSupportEmail,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$sendSupportEmail,
        );
}

extension ClientExtension$Mutation$sendSupportEmail on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$sendSupportEmail>>
      mutate$sendSupportEmail(
              Options$Mutation$sendSupportEmail options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$sendSupportEmail>
      watchMutation$sendSupportEmail(
              WatchOptions$Mutation$sendSupportEmail options) =>
          this.watchMutation(options);
}

class Mutation$sendSupportEmail$HookResult {
  Mutation$sendSupportEmail$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$sendSupportEmail runMutation;

  final graphql.QueryResult<Mutation$sendSupportEmail> result;
}

Mutation$sendSupportEmail$HookResult useMutation$sendSupportEmail(
    [WidgetOptions$Mutation$sendSupportEmail? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$sendSupportEmail());
  return Mutation$sendSupportEmail$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$sendSupportEmail>
    useWatchMutation$sendSupportEmail(
            WatchOptions$Mutation$sendSupportEmail options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$sendSupportEmail
    extends graphql.MutationOptions<Mutation$sendSupportEmail> {
  WidgetOptions$Mutation$sendSupportEmail({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$sendSupportEmail? onCompleted,
    graphql.OnMutationUpdate<Mutation$sendSupportEmail>? update,
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
                        : _parserFn$Mutation$sendSupportEmail(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsendSupportEmail,
          parserFn: _parserFn$Mutation$sendSupportEmail,
        );

  final OnMutationCompleted$Mutation$sendSupportEmail? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$sendSupportEmail
    = graphql.MultiSourceResult<Mutation$sendSupportEmail> Function(
  Variables$Mutation$sendSupportEmail, {
  Object? optimisticResult,
});
typedef Builder$Mutation$sendSupportEmail = widgets.Widget Function(
  RunMutation$Mutation$sendSupportEmail,
  graphql.QueryResult<Mutation$sendSupportEmail>?,
);

class Mutation$sendSupportEmail$Widget
    extends graphql_flutter.Mutation<Mutation$sendSupportEmail> {
  Mutation$sendSupportEmail$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$sendSupportEmail? options,
    required Builder$Mutation$sendSupportEmail builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$sendSupportEmail(),
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
