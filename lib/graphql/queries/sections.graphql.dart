import '../schema/pages.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'page.graphql.dart';

class Variables$Query$FetchMoreItemsForItemSection {
  factory Variables$Query$FetchMoreItemsForItemSection({
    required String id,
    int? first,
    int? offset,
  }) =>
      Variables$Query$FetchMoreItemsForItemSection._({
        r'id': id,
        if (first != null) r'first': first,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$FetchMoreItemsForItemSection._(this._$data);

  factory Variables$Query$FetchMoreItemsForItemSection.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$FetchMoreItemsForItemSection._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  int? get first => (_$data['first'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    return result$data;
  }

  CopyWith$Variables$Query$FetchMoreItemsForItemSection<
          Variables$Query$FetchMoreItemsForItemSection>
      get copyWith => CopyWith$Variables$Query$FetchMoreItemsForItemSection(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$FetchMoreItemsForItemSection) ||
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
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$first = first;
    final l$offset = offset;
    return Object.hashAll([
      l$id,
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$FetchMoreItemsForItemSection<TRes> {
  factory CopyWith$Variables$Query$FetchMoreItemsForItemSection(
    Variables$Query$FetchMoreItemsForItemSection instance,
    TRes Function(Variables$Query$FetchMoreItemsForItemSection) then,
  ) = _CopyWithImpl$Variables$Query$FetchMoreItemsForItemSection;

  factory CopyWith$Variables$Query$FetchMoreItemsForItemSection.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$FetchMoreItemsForItemSection;

  TRes call({
    String? id,
    int? first,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$FetchMoreItemsForItemSection<TRes>
    implements CopyWith$Variables$Query$FetchMoreItemsForItemSection<TRes> {
  _CopyWithImpl$Variables$Query$FetchMoreItemsForItemSection(
    this._instance,
    this._then,
  );

  final Variables$Query$FetchMoreItemsForItemSection _instance;

  final TRes Function(Variables$Query$FetchMoreItemsForItemSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? first = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$FetchMoreItemsForItemSection._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (first != _undefined) 'first': (first as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$FetchMoreItemsForItemSection<TRes>
    implements CopyWith$Variables$Query$FetchMoreItemsForItemSection<TRes> {
  _CopyWithStubImpl$Variables$Query$FetchMoreItemsForItemSection(this._res);

  TRes _res;

  call({
    String? id,
    int? first,
    int? offset,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection {
  Query$FetchMoreItemsForItemSection({
    required this.section,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection.fromJson(
      Map<String, dynamic> json) {
    final l$section = json['section'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection(
      section: Query$FetchMoreItemsForItemSection$section.fromJson(
          (l$section as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchMoreItemsForItemSection$section section;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$section = section;
    _resultData['section'] = l$section.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$section = section;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$section,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchMoreItemsForItemSection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$section = section;
    final lOther$section = other.section;
    if (l$section != lOther$section) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection
    on Query$FetchMoreItemsForItemSection {
  CopyWith$Query$FetchMoreItemsForItemSection<
          Query$FetchMoreItemsForItemSection>
      get copyWith => CopyWith$Query$FetchMoreItemsForItemSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection<TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection(
    Query$FetchMoreItemsForItemSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection) then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection;

  TRes call({
    Query$FetchMoreItemsForItemSection$section? section,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section<TRes> get section;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection<TRes>
    implements CopyWith$Query$FetchMoreItemsForItemSection<TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection _instance;

  final TRes Function(Query$FetchMoreItemsForItemSection) _then;

  static const _undefined = {};

  TRes call({
    Object? section = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection(
        section: section == _undefined || section == null
            ? _instance.section
            : (section as Query$FetchMoreItemsForItemSection$section),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section<TRes> get section {
    final local$section = _instance.section;
    return CopyWith$Query$FetchMoreItemsForItemSection$section(
        local$section, (e) => call(section: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection<TRes>
    implements CopyWith$Query$FetchMoreItemsForItemSection<TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection(this._res);

  TRes _res;

  call({
    Query$FetchMoreItemsForItemSection$section? section,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section<TRes> get section =>
      CopyWith$Query$FetchMoreItemsForItemSection$section.stub(_res);
}

const documentNodeQueryFetchMoreItemsForItemSection =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'FetchMoreItemsForItemSection'),
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
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
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
        name: NameNode(value: 'section'),
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
          FragmentSpreadNode(
            name: NameNode(value: 'Section'),
            directives: [],
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'ItemSection'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'items'),
                alias: null,
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: VariableNode(name: NameNode(value: 'first')),
                  ),
                  ArgumentNode(
                    name: NameNode(value: 'offset'),
                    value: VariableNode(name: NameNode(value: 'offset')),
                  ),
                ],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'items'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'ItemSectionItem'),
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
  fragmentDefinitionSection,
  fragmentDefinitionItemSection,
  fragmentDefinitionItemSectionItem,
  fragmentDefinitionGridSectionItem,
]);
Query$FetchMoreItemsForItemSection _parserFn$Query$FetchMoreItemsForItemSection(
        Map<String, dynamic> data) =>
    Query$FetchMoreItemsForItemSection.fromJson(data);

class Options$Query$FetchMoreItemsForItemSection
    extends graphql.QueryOptions<Query$FetchMoreItemsForItemSection> {
  Options$Query$FetchMoreItemsForItemSection({
    String? operationName,
    required Variables$Query$FetchMoreItemsForItemSection variables,
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
          document: documentNodeQueryFetchMoreItemsForItemSection,
          parserFn: _parserFn$Query$FetchMoreItemsForItemSection,
        );
}

class WatchOptions$Query$FetchMoreItemsForItemSection
    extends graphql.WatchQueryOptions<Query$FetchMoreItemsForItemSection> {
  WatchOptions$Query$FetchMoreItemsForItemSection({
    String? operationName,
    required Variables$Query$FetchMoreItemsForItemSection variables,
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
          document: documentNodeQueryFetchMoreItemsForItemSection,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$FetchMoreItemsForItemSection,
        );
}

class FetchMoreOptions$Query$FetchMoreItemsForItemSection
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FetchMoreItemsForItemSection({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$FetchMoreItemsForItemSection variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryFetchMoreItemsForItemSection,
        );
}

extension ClientExtension$Query$FetchMoreItemsForItemSection
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FetchMoreItemsForItemSection>>
      query$FetchMoreItemsForItemSection(
              Options$Query$FetchMoreItemsForItemSection options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$FetchMoreItemsForItemSection>
      watchQuery$FetchMoreItemsForItemSection(
              WatchOptions$Query$FetchMoreItemsForItemSection options) =>
          this.watchQuery(options);
  void writeQuery$FetchMoreItemsForItemSection({
    required Query$FetchMoreItemsForItemSection data,
    required Variables$Query$FetchMoreItemsForItemSection variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryFetchMoreItemsForItemSection),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$FetchMoreItemsForItemSection? readQuery$FetchMoreItemsForItemSection({
    required Variables$Query$FetchMoreItemsForItemSection variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryFetchMoreItemsForItemSection),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$FetchMoreItemsForItemSection.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$FetchMoreItemsForItemSection>
    useQuery$FetchMoreItemsForItemSection(
            Options$Query$FetchMoreItemsForItemSection options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$FetchMoreItemsForItemSection>
    useWatchQuery$FetchMoreItemsForItemSection(
            WatchOptions$Query$FetchMoreItemsForItemSection options) =>
        graphql_flutter.useWatchQuery(options);

class Query$FetchMoreItemsForItemSection$Widget
    extends graphql_flutter.Query<Query$FetchMoreItemsForItemSection> {
  Query$FetchMoreItemsForItemSection$Widget({
    widgets.Key? key,
    required Options$Query$FetchMoreItemsForItemSection options,
    required graphql_flutter.QueryBuilder<Query$FetchMoreItemsForItemSection>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$FetchMoreItemsForItemSection$section implements Fragment$Section {
  Query$FetchMoreItemsForItemSection$section({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "PosterSection":
        return Query$FetchMoreItemsForItemSection$section$$PosterSection
            .fromJson(json);

      case "FeaturedSection":
        return Query$FetchMoreItemsForItemSection$section$$FeaturedSection
            .fromJson(json);

      case "DefaultSection":
        return Query$FetchMoreItemsForItemSection$section$$DefaultSection
            .fromJson(json);

      case "CardSection":
        return Query$FetchMoreItemsForItemSection$section$$CardSection.fromJson(
            json);

      case "ListSection":
        return Query$FetchMoreItemsForItemSection$section$$ListSection.fromJson(
            json);

      case "CardListSection":
        return Query$FetchMoreItemsForItemSection$section$$CardListSection
            .fromJson(json);

      case "DefaultGridSection":
        return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection
            .fromJson(json);

      case "PosterGridSection":
        return Query$FetchMoreItemsForItemSection$section$$PosterGridSection
            .fromJson(json);

      case "IconGridSection":
        return Query$FetchMoreItemsForItemSection$section$$IconGridSection
            .fromJson(json);

      case "IconSection":
        return Query$FetchMoreItemsForItemSection$section$$IconSection.fromJson(
            json);

      case "LabelSection":
        return Query$FetchMoreItemsForItemSection$section$$LabelSection
            .fromJson(json);

      case "WebSection":
        return Query$FetchMoreItemsForItemSection$section$$WebSection.fromJson(
            json);

      case "MessageSection":
        return Query$FetchMoreItemsForItemSection$section$$MessageSection
            .fromJson(json);

      case "PageDetailsSection":
        return Query$FetchMoreItemsForItemSection$section$$PageDetailsSection
            .fromJson(json);

      default:
        final l$id = json['id'];
        final l$title = json['title'];
        final l$description = json['description'];
        final l$$__typename = json['__typename'];
        return Query$FetchMoreItemsForItemSection$section(
          id: (l$id as String),
          title: (l$title as String?),
          description: (l$description as String?),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final String id;

  final String? title;

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
    if (!(other is Query$FetchMoreItemsForItemSection$section) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section
    on Query$FetchMoreItemsForItemSection$section {
  CopyWith$Query$FetchMoreItemsForItemSection$section<
          Query$FetchMoreItemsForItemSection$section>
      get copyWith => CopyWith$Query$FetchMoreItemsForItemSection$section(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section<TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section(
    Query$FetchMoreItemsForItemSection$section instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section) then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section.stub(TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section<TRes>
    implements CopyWith$Query$FetchMoreItemsForItemSection$section<TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section _instance;

  final TRes Function(Query$FetchMoreItemsForItemSection$section) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section<TRes>
    implements CopyWith$Query$FetchMoreItemsForItemSection$section<TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection
    implements
        Fragment$Section$$PosterSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$PosterSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.size,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$size = json['size'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$PosterSection$items
          .fromJson((l$items as Map<String, dynamic>)),
      size: fromJson$Enum$SectionSize((l$size as String)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items items;

  final Enum$SectionSize size;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$size = size;
    _resultData['size'] = toJson$Enum$SectionSize(l$size);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$size = size;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
      l$size,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchMoreItemsForItemSection$section$$PosterSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (l$size != lOther$size) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection
    on Query$FetchMoreItemsForItemSection$section$$PosterSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection<
          Query$FetchMoreItemsForItemSection$section$$PosterSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection(
    Query$FetchMoreItemsForItemSection$section$$PosterSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$PosterSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items? items,
    Enum$SectionSize? size,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection _instance;

  final TRes Function(Query$FetchMoreItemsForItemSection$section$$PosterSection)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? size = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$PosterSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$PosterSection$items),
        size: size == _undefined || size == null
            ? _instance.size
            : (size as Enum$SectionSize),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items? items,
    Enum$SectionSize? size,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items<TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata
    implements
        Fragment$Section$$PosterSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items
    implements
        Fragment$Section$$PosterSection$items,
        Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items> Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items<
                      Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$PosterSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$PosterSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items> Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items<
                          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items
    implements
        Fragment$Section$$PosterSection$items$items,
        Fragment$ItemSectionItem {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item:
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item
              .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item
      item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items) ||
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
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item?
        item,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item?
        item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item
    implements
        Fragment$Section$$PosterSection$items$items$item,
        Fragment$ItemSectionItem$item {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item(
      {required this.$__typename});

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item(
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
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link
    implements
        Fragment$Section$$PosterSection$items$items$item$$Link,
        Fragment$ItemSectionItem$item$$Link,
        Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page
    implements
        Fragment$Section$$PosterSection$items$items$item$$Page,
        Fragment$ItemSectionItem$item$$Page,
        Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode
    implements
        Fragment$Section$$PosterSection$items$items$item$$Episode,
        Fragment$ItemSectionItem$item$$Episode,
        Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    required this.productionDate,
    this.season,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$productionDate = json['productionDate'];
    final l$season = json['season'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      productionDate: (l$productionDate as String),
      season: l$season == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final String productionDate;

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$productionDate = productionDate;
    _resultData['productionDate'] = l$productionDate;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$productionDate = productionDate;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$productionDate,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    final l$productionDate = productionDate;
    final lOther$productionDate = other.productionDate;
    if (l$productionDate != lOther$productionDate) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    String? productionDate,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season?
        season,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? productionDate = _undefined,
    Object? season = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        productionDate: productionDate == _undefined || productionDate == null
            ? _instance.productionDate
            : (productionDate as String),
        season: season == _undefined
            ? _instance.season
            : (season
                as Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    String? productionDate,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season?
        season,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show
    implements
        Fragment$Section$$PosterSection$items$items$item$$Show,
        Fragment$ItemSectionItem$item$$Show,
        Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$Section$$PosterSection$items$items$item$$Show$defaultEpisode,
        Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode(
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
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season
    implements
        Fragment$Section$$PosterSection$items$items$item$$Episode$season {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season({
    required this.$show,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season(
      $show:
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season;

  TRes call({
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show
    implements
        Fragment$Section$$PosterSection$items$items$item$$Episode$season$show {
  Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show
    on Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show<
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show(
    Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection
    implements
        Fragment$Section$$FeaturedSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.size,
  });

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$size = json['size'];
    return Query$FetchMoreItemsForItemSection$section$$FeaturedSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items
          .fromJson((l$items as Map<String, dynamic>)),
      size: fromJson$Enum$SectionSize((l$size as String)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items items;

  final Enum$SectionSize size;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$size = size;
    _resultData['size'] = toJson$Enum$SectionSize(l$size);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$size = size;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
      l$size,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (l$size != lOther$size) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$FeaturedSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items? items,
    Enum$SectionSize? size,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items<
      TRes> get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$FeaturedSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? size = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$FeaturedSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items),
        size: size == _undefined || size == null
            ? _instance.size
            : (size as Enum$SectionSize),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items<
      TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items? items,
    Enum$SectionSize? size,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items<
          TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata
    implements
        Fragment$Section$$FeaturedSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata)
      _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items
    implements
        Fragment$Section$$FeaturedSection$items,
        Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items> Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items<
                      Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items> Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items<
                          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items
    implements
        Fragment$Section$$FeaturedSection$items$items,
        Fragment$ItemSectionItem {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
    required this.description,
  });

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    final l$description = json['description'];
    return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item:
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item
              .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      description: (l$description as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item
      item;

  final String $__typename;

  final String description;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$description = description;
    _resultData['description'] = l$description;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    final l$description = description;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
      l$description,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items) ||
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
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item?
        item,
    String? $__typename,
    String? description,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
    Object? description = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item?
        item,
    String? $__typename,
    String? description,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item
    implements
        Fragment$Section$$FeaturedSection$items$items$item,
        Fragment$ItemSectionItem$item {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item(
      {required this.$__typename});

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item(
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
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link
    implements
        Fragment$Section$$FeaturedSection$items$items$item$$Link,
        Fragment$ItemSectionItem$item$$Link,
        Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page
    implements
        Fragment$Section$$FeaturedSection$items$items$item$$Page,
        Fragment$ItemSectionItem$item$$Page,
        Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode
    implements
        Fragment$Section$$FeaturedSection$items$items$item$$Episode,
        Fragment$ItemSectionItem$item$$Episode,
        Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
  });

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show
    implements
        Fragment$Section$$FeaturedSection$items$items$item$$Show,
        Fragment$ItemSectionItem$item$$Show,
        Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
  });

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$Section$$FeaturedSection$items$items$item$$Show$defaultEpisode,
        Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
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
            is Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode
    on Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
    Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$FeaturedSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection
    implements
        Fragment$Section$$DefaultSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.size,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$size = json['size'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$DefaultSection$items
          .fromJson((l$items as Map<String, dynamic>)),
      size: fromJson$Enum$SectionSize((l$size as String)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items items;

  final Enum$SectionSize size;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$size = size;
    _resultData['size'] = toJson$Enum$SectionSize(l$size);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$size = size;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
      l$size,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (l$size != lOther$size) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$DefaultSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items? items,
    Enum$SectionSize? size,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items<
      TRes> get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$DefaultSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? size = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$DefaultSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$DefaultSection$items),
        size: size == _undefined || size == null
            ? _instance.size
            : (size as Enum$SectionSize),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items<
      TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items? items,
    Enum$SectionSize? size,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items<
          TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata
    implements
        Fragment$Section$$DefaultSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata)
      _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items
    implements
        Fragment$Section$$DefaultSection$items,
        Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items> Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items<
                      Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$DefaultSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$DefaultSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items> Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items<
                          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items
    implements
        Fragment$Section$$DefaultSection$items$items,
        Fragment$ItemSectionItem {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item:
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item
              .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item
      item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items) ||
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
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item?
        item,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item?
        item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item
    implements
        Fragment$Section$$DefaultSection$items$items$item,
        Fragment$ItemSectionItem$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item(
      {required this.$__typename});

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item(
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
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link
    implements
        Fragment$Section$$DefaultSection$items$items$item$$Link,
        Fragment$ItemSectionItem$item$$Link,
        Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page
    implements
        Fragment$Section$$DefaultSection$items$items$item$$Page,
        Fragment$ItemSectionItem$item$$Page,
        Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode
    implements
        Fragment$Section$$DefaultSection$items$items$item$$Episode,
        Fragment$ItemSectionItem$item$$Episode,
        Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    required this.productionDate,
    this.season,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$productionDate = json['productionDate'];
    final l$season = json['season'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      productionDate: (l$productionDate as String),
      season: l$season == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final String productionDate;

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$productionDate = productionDate;
    _resultData['productionDate'] = l$productionDate;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$productionDate = productionDate;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$productionDate,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    final l$productionDate = productionDate;
    final lOther$productionDate = other.productionDate;
    if (l$productionDate != lOther$productionDate) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    String? productionDate,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season?
        season,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? productionDate = _undefined,
    Object? season = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        productionDate: productionDate == _undefined || productionDate == null
            ? _instance.productionDate
            : (productionDate as String),
        season: season == _undefined
            ? _instance.season
            : (season
                as Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    String? productionDate,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season?
        season,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show
    implements
        Fragment$Section$$DefaultSection$items$items$item$$Show,
        Fragment$ItemSectionItem$item$$Show,
        Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$Section$$DefaultSection$items$items$item$$Show$defaultEpisode,
        Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode(
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
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season
    implements
        Fragment$Section$$DefaultSection$items$items$item$$Episode$season {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season({
    required this.$show,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season(
      $show:
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season;

  TRes call({
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show
    implements
        Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show {
  Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show
    on Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show<
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show(
    Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardSection
    implements
        Fragment$Section$$CardSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$CardSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.cardSize,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$cardSize = json['cardSize'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$CardSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$CardSection$items
          .fromJson((l$items as Map<String, dynamic>)),
      cardSize: fromJson$Enum$CardSectionSize((l$cardSize as String)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$CardSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items items;

  final Enum$CardSectionSize cardSize;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$cardSize = cardSize;
    _resultData['cardSize'] = toJson$Enum$CardSectionSize(l$cardSize);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$cardSize = cardSize;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
      l$cardSize,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchMoreItemsForItemSection$section$$CardSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$cardSize = cardSize;
    final lOther$cardSize = other.cardSize;
    if (l$cardSize != lOther$cardSize) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection
    on Query$FetchMoreItemsForItemSection$section$$CardSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection<
          Query$FetchMoreItemsForItemSection$section$$CardSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection(
    Query$FetchMoreItemsForItemSection$section$$CardSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$CardSection) then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$CardSection$metadata? metadata,
    Query$FetchMoreItemsForItemSection$section$$CardSection$items? items,
    Enum$CardSectionSize? cardSize,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection<TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection _instance;

  final TRes Function(Query$FetchMoreItemsForItemSection$section$$CardSection)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? cardSize = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$CardSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$CardSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$CardSection$items),
        cardSize: cardSize == _undefined || cardSize == null
            ? _instance.cardSize
            : (cardSize as Enum$CardSectionSize),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection<TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$CardSection$metadata? metadata,
    Query$FetchMoreItemsForItemSection$section$$CardSection$items? items,
    Enum$CardSectionSize? cardSize,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items<TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$metadata
    implements
        Fragment$Section$$CardSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$CardSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$CardSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$CardSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$CardSection$metadata instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$metadata
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$CardSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$CardSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items
    implements Fragment$Section$$CardSection$items, Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchMoreItemsForItemSection$section$$CardSection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$CardSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$CardSection$items$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchMoreItemsForItemSection$section$$CardSection$items$items> Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items<
                      Query$FetchMoreItemsForItemSection$section$$CardSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$CardSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$CardSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchMoreItemsForItemSection$section$$CardSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchMoreItemsForItemSection$section$$CardSection$items$items> Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items<
                          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$CardSection$items$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items
    implements
        Fragment$Section$$CardSection$items$items,
        Fragment$ItemSectionItem {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item:
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item
              .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item
      item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items) ||
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
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item?
        item,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$CardSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item?
        item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item
    implements
        Fragment$Section$$CardSection$items$items$item,
        Fragment$ItemSectionItem$item {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item(
      {required this.$__typename});

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show
            .fromJson(json);

      case "StudyTopic":
        return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item(
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
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link
    implements
        Fragment$Section$$CardSection$items$items$item$$Link,
        Fragment$ItemSectionItem$item$$Link,
        Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page
    implements
        Fragment$Section$$CardSection$items$items$item$$Page,
        Fragment$ItemSectionItem$item$$Page,
        Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode
    implements
        Fragment$Section$$CardSection$items$items$item$$Episode,
        Fragment$ItemSectionItem$item$$Episode,
        Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show
    implements
        Fragment$Section$$CardSection$items$items$item$$Show,
        Fragment$ItemSectionItem$item$$Show,
        Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$Section$$CardSection$items$items$item$$Show$defaultEpisode,
        Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode(
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
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$ListSection
    implements
        Fragment$Section$$ListSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$ListSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$ListSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$ListSection$items
          .fromJson((l$items as Map<String, dynamic>)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$ListSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items items;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchMoreItemsForItemSection$section$$ListSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection
    on Query$FetchMoreItemsForItemSection$section$$ListSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection<
          Query$FetchMoreItemsForItemSection$section$$ListSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection(
    Query$FetchMoreItemsForItemSection$section$$ListSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$ListSection) then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$ListSection$metadata? metadata,
    Query$FetchMoreItemsForItemSection$section$$ListSection$items? items,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection<TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection _instance;

  final TRes Function(Query$FetchMoreItemsForItemSection$section$$ListSection)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$ListSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$ListSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$ListSection$items),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection<TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$ListSection$metadata? metadata,
    Query$FetchMoreItemsForItemSection$section$$ListSection$items? items,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items<TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$metadata
    implements
        Fragment$Section$$ListSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$ListSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$ListSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$ListSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$ListSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$ListSection$metadata instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$metadata
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$ListSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$ListSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items
    implements Fragment$Section$$ListSection$items, Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchMoreItemsForItemSection$section$$ListSection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$ListSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$ListSection$items$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchMoreItemsForItemSection$section$$ListSection$items$items> Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items<
                      Query$FetchMoreItemsForItemSection$section$$ListSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$ListSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$ListSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchMoreItemsForItemSection$section$$ListSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchMoreItemsForItemSection$section$$ListSection$items$items> Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items<
                          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$ListSection$items$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items$items
    implements
        Fragment$Section$$ListSection$items$items,
        Fragment$ItemSectionItem {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item:
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item
              .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item
      item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items$items) ||
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
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$items$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item?
        item,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$ListSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item?
        item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item
    implements
        Fragment$Section$$ListSection$items$items$item,
        Fragment$ItemSectionItem$item {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item(
      {required this.$__typename});

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item(
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
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link
    implements
        Fragment$Section$$ListSection$items$items$item$$Link,
        Fragment$ItemSectionItem$item$$Link,
        Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page
    implements
        Fragment$Section$$ListSection$items$items$item$$Page,
        Fragment$ItemSectionItem$item$$Page,
        Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode
    implements
        Fragment$Section$$ListSection$items$items$item$$Episode,
        Fragment$ItemSectionItem$item$$Episode,
        Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    required this.title,
    required this.ageRating,
    this.image,
    this.season,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$title = json['title'];
    final l$ageRating = json['ageRating'];
    final l$image = json['image'];
    final l$season = json['season'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      title: (l$title as String),
      ageRating: (l$ageRating as String),
      image: (l$image as String?),
      season: l$season == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final String title;

  final String ageRating;

  final String? image;

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$ageRating = ageRating;
    _resultData['ageRating'] = l$ageRating;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$title = title;
    final l$ageRating = ageRating;
    final l$image = image;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$title,
      l$ageRating,
      l$image,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$ageRating = ageRating;
    final lOther$ageRating = other.ageRating;
    if (l$ageRating != lOther$ageRating) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    String? title,
    String? ageRating,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season?
        season,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? title = _undefined,
    Object? ageRating = _undefined,
    Object? image = _undefined,
    Object? season = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        ageRating: ageRating == _undefined || ageRating == null
            ? _instance.ageRating
            : (ageRating as String),
        image: image == _undefined ? _instance.image : (image as String?),
        season: season == _undefined
            ? _instance.season
            : (season
                as Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    String? title,
    String? ageRating,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season?
        season,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show
    implements
        Fragment$Section$$ListSection$items$items$item$$Show,
        Fragment$ItemSectionItem$item$$Show,
        Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$Section$$ListSection$items$items$item$$Show$defaultEpisode,
        Fragment$ItemSectionItem$item$$Show$defaultEpisode {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode(
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
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season
    implements Fragment$Section$$ListSection$items$items$item$$Episode$season {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season({
    required this.$show,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season(
      $show:
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season;

  TRes call({
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show
    implements
        Fragment$Section$$ListSection$items$items$item$$Episode$season$show {
  Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show
    on Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show<
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show(
    Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$ListSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardListSection
    implements
        Fragment$Section$$CardListSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$CardListSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardListSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    return Query$FetchMoreItemsForItemSection$section$$CardListSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$CardListSection$items
          .fromJson((l$items as Map<String, dynamic>)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$CardListSection$items items;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardListSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardListSection
    on Query$FetchMoreItemsForItemSection$section$$CardListSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection<
          Query$FetchMoreItemsForItemSection$section$$CardListSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection(
    Query$FetchMoreItemsForItemSection$section$$CardListSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$CardListSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$CardListSection$items? items,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items<
      TRes> get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardListSection _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$CardListSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$CardListSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$CardListSection$items),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items<
      TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$CardListSection$items? items,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items<
          TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata
    implements
        Fragment$Section$$CardListSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata)
      _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardListSection$items
    implements
        Fragment$Section$$CardListSection$items,
        Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$CardListSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardListSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$CardListSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<Fragment$ItemSectionItem> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$CardListSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardListSection$items
    on Query$FetchMoreItemsForItemSection$section$$CardListSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items<
          Query$FetchMoreItemsForItemSection$section$$CardListSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items(
    Query$FetchMoreItemsForItemSection$section$$CardListSection$items instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardListSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardListSection$items
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$CardListSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$CardListSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ItemSectionItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$ItemSectionItem> Function(
                  Iterable<
                      CopyWith$Fragment$ItemSectionItem<
                          Fragment$ItemSectionItem>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$ItemSectionItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardListSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardListSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection
    implements
        Fragment$Section$$DefaultGridSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.gridSize,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$gridSize = json['gridSize'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items:
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items
              .fromJson((l$items as Map<String, dynamic>)),
      gridSize: fromJson$Enum$GridSectionSize((l$gridSize as String)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items
      items;

  final Enum$GridSectionSize gridSize;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$gridSize = gridSize;
    _resultData['gridSize'] = toJson$Enum$GridSectionSize(l$gridSize);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$gridSize = gridSize;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
      l$gridSize,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$gridSize = gridSize;
    final lOther$gridSize = other.gridSize;
    if (l$gridSize != lOther$gridSize) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items<
      TRes> get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$DefaultGridSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? gridSize = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$DefaultGridSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items),
        gridSize: gridSize == _undefined || gridSize == null
            ? _instance.gridSize
            : (gridSize as Enum$GridSectionSize),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items<
      TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items<
          TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata
    implements
        Fragment$Section$$DefaultGridSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata)
      _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items
    implements
        Fragment$Section$$DefaultGridSection$items,
        Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items> Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items<
                      Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items> Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items<
                          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items
    implements
        Fragment$Section$$DefaultGridSection$items$items,
        Fragment$ItemSectionItem,
        Fragment$GridSectionItem {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item:
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item
              .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item
      item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items) ||
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
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item?
        item,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item?
        item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item
    implements
        Fragment$Section$$DefaultGridSection$items$items$item,
        Fragment$ItemSectionItem$item,
        Fragment$GridSectionItem$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item(
      {required this.$__typename});

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item(
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
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link
    implements
        Fragment$Section$$DefaultGridSection$items$items$item$$Link,
        Fragment$ItemSectionItem$item$$Link,
        Fragment$GridSectionItem$item$$Link,
        Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page
    implements
        Fragment$Section$$DefaultGridSection$items$items$item$$Page,
        Fragment$ItemSectionItem$item$$Page,
        Fragment$GridSectionItem$item$$Page,
        Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode
    implements
        Fragment$Section$$DefaultGridSection$items$items$item$$Episode,
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$GridSectionItem$item$$Episode,
        Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    this.number,
    this.season,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$number = json['number'];
    final l$season = json['season'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      number: (l$number as int?),
      season: l$season == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final int? number;

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$number = number;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$number,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season?
        season,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? number = _undefined,
    Object? season = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        number: number == _undefined ? _instance.number : (number as int?),
        season: season == _undefined
            ? _instance.season
            : (season
                as Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season?
        season,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show
    implements
        Fragment$Section$$DefaultGridSection$items$items$item$$Show,
        Fragment$ItemSectionItem$item$$Show,
        Fragment$GridSectionItem$item$$Show,
        Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$Section$$DefaultGridSection$items$items$item$$Show$defaultEpisode,
        Fragment$ItemSectionItem$item$$Show$defaultEpisode,
        Fragment$GridSectionItem$item$$Show$defaultEpisode {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
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
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season
    implements
        Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season,
        Fragment$GridSectionItem$item$$Episode$season {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season({
    required this.number,
    required this.$show,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$number = json['number'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season(
      number: (l$number as int),
      $show:
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int number;

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$number = number;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$number,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season;

  TRes call({
    int? number,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season)
      _then;

  static const _undefined = {};

  TRes call({
    Object? number = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season(
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    int? number,
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show
    implements
        Fragment$Section$$DefaultGridSection$items$items$item$$Episode$season$show,
        Fragment$GridSectionItem$item$$Episode$season$show {
  Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show
    on Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show<
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show(
    Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$DefaultGridSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection
    implements
        Fragment$Section$$PosterGridSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.gridSize,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$gridSize = json['gridSize'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items
          .fromJson((l$items as Map<String, dynamic>)),
      gridSize: fromJson$Enum$GridSectionSize((l$gridSize as String)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items
      items;

  final Enum$GridSectionSize gridSize;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$gridSize = gridSize;
    _resultData['gridSize'] = toJson$Enum$GridSectionSize(l$gridSize);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$gridSize = gridSize;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
      l$gridSize,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$gridSize = gridSize;
    final lOther$gridSize = other.gridSize;
    if (l$gridSize != lOther$gridSize) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$PosterGridSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items<
      TRes> get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$PosterGridSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? gridSize = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$PosterGridSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items),
        gridSize: gridSize == _undefined || gridSize == null
            ? _instance.gridSize
            : (gridSize as Enum$GridSectionSize),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items<
      TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items<
          TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata
    implements
        Fragment$Section$$PosterGridSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata)
      _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items
    implements
        Fragment$Section$$PosterGridSection$items,
        Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items> Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items<
                      Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items> Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items<
                          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items
    implements
        Fragment$Section$$PosterGridSection$items$items,
        Fragment$ItemSectionItem,
        Fragment$GridSectionItem {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item:
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item
              .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item
      item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items) ||
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
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item?
        item,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item?
        item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item
    implements
        Fragment$Section$$PosterGridSection$items$items$item,
        Fragment$ItemSectionItem$item,
        Fragment$GridSectionItem$item {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item(
      {required this.$__typename});

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item(
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
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link
    implements
        Fragment$Section$$PosterGridSection$items$items$item$$Link,
        Fragment$ItemSectionItem$item$$Link,
        Fragment$GridSectionItem$item$$Link,
        Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page
    implements
        Fragment$Section$$PosterGridSection$items$items$item$$Page,
        Fragment$ItemSectionItem$item$$Page,
        Fragment$GridSectionItem$item$$Page,
        Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode
    implements
        Fragment$Section$$PosterGridSection$items$items$item$$Episode,
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$GridSectionItem$item$$Episode,
        Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    this.number,
    this.season,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$number = json['number'];
    final l$season = json['season'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      number: (l$number as int?),
      season: l$season == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final int? number;

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$number = number;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$number,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season?
        season,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? number = _undefined,
    Object? season = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        number: number == _undefined ? _instance.number : (number as int?),
        season: season == _undefined
            ? _instance.season
            : (season
                as Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season?
        season,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show
    implements
        Fragment$Section$$PosterGridSection$items$items$item$$Show,
        Fragment$ItemSectionItem$item$$Show,
        Fragment$GridSectionItem$item$$Show,
        Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$Section$$PosterGridSection$items$items$item$$Show$defaultEpisode,
        Fragment$ItemSectionItem$item$$Show$defaultEpisode,
        Fragment$GridSectionItem$item$$Show$defaultEpisode {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
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
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season
    implements
        Fragment$Section$$PosterGridSection$items$items$item$$Episode$season,
        Fragment$GridSectionItem$item$$Episode$season {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season({
    required this.number,
    required this.$show,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$number = json['number'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season(
      number: (l$number as int),
      $show:
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int number;

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$number = number;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$number,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season;

  TRes call({
    int? number,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season)
      _then;

  static const _undefined = {};

  TRes call({
    Object? number = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season(
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    int? number,
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show
    implements
        Fragment$Section$$PosterGridSection$items$items$item$$Episode$season$show,
        Fragment$GridSectionItem$item$$Episode$season$show {
  Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show
    on Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show<
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show(
    Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PosterGridSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection
    implements
        Fragment$Section$$IconGridSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
    required this.gridSize,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    final l$gridSize = json['gridSize'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$IconGridSection$items
          .fromJson((l$items as Map<String, dynamic>)),
      gridSize: fromJson$Enum$GridSectionSize((l$gridSize as String)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items items;

  final Enum$GridSectionSize gridSize;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$gridSize = gridSize;
    _resultData['gridSize'] = toJson$Enum$GridSectionSize(l$gridSize);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    final l$gridSize = gridSize;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
      l$gridSize,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$gridSize = gridSize;
    final lOther$gridSize = other.gridSize;
    if (l$gridSize != lOther$gridSize) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$IconGridSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items<
      TRes> get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$IconGridSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
    Object? gridSize = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$IconGridSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$IconGridSection$items),
        gridSize: gridSize == _undefined || gridSize == null
            ? _instance.gridSize
            : (gridSize as Enum$GridSectionSize),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items<
      TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata?
        metadata,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items? items,
    Enum$GridSectionSize? gridSize,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items<
          TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata
    implements
        Fragment$Section$$IconGridSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata)
      _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items
    implements
        Fragment$Section$$IconGridSection$items,
        Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items>?
        items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items> Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items<
                      Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$IconGridSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$IconGridSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items> Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items<
                          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items
    implements
        Fragment$Section$$IconGridSection$items$items,
        Fragment$ItemSectionItem,
        Fragment$GridSectionItem {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items({
    required this.id,
    required this.title,
    this.image,
    required this.item,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item:
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item
              .fromJson((l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item
      item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$item = item;
    _resultData['item'] = l$item.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$item,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items) ||
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
    final l$item = item;
    final lOther$item = other.item;
    if (l$item != lOther$item) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item?
        item,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item<
      TRes> get item;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined || item == null
            ? _instance.item
            : (item
                as Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item<
      TRes> get item {
    final local$item = _instance.item;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item(
        local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item?
        item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item<
          TRes>
      get item =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item
    implements
        Fragment$Section$$IconGridSection$items$items$item,
        Fragment$ItemSectionItem$item,
        Fragment$GridSectionItem$item {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item(
      {required this.$__typename});

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item(
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
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(
      Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link
    implements
        Fragment$Section$$IconGridSection$items$items$item$$Link,
        Fragment$ItemSectionItem$item$$Link,
        Fragment$GridSectionItem$item$$Link,
        Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$url = url;
    return Object.hashAll([
      l$$__typename,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page
    implements
        Fragment$Section$$IconGridSection$items$items$item$$Page,
        Fragment$ItemSectionItem$item$$Page,
        Fragment$GridSectionItem$item$$Page,
        Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$code = code;
    _resultData['code'] = l$code;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$code = code;
    return Object.hashAll([
      l$$__typename,
      l$code,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode
    implements
        Fragment$Section$$IconGridSection$items$items$item$$Episode,
        Fragment$ItemSectionItem$item$$Episode,
        Fragment$GridSectionItem$item$$Episode,
        Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    required this.duration,
    this.progress,
    required this.publishDate,
    this.number,
    this.season,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$duration = json['duration'];
    final l$progress = json['progress'];
    final l$publishDate = json['publishDate'];
    final l$number = json['number'];
    final l$season = json['season'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      duration: (l$duration as int),
      progress: (l$progress as int?),
      publishDate: (l$publishDate as String),
      number: (l$number as int?),
      season: l$season == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final int duration;

  final int? progress;

  final String publishDate;

  final int? number;

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$publishDate = publishDate;
    _resultData['publishDate'] = l$publishDate;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$duration = duration;
    final l$progress = progress;
    final l$publishDate = publishDate;
    final l$number = number;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$duration,
      l$progress,
      l$publishDate,
      l$number,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode) ||
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
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$publishDate = publishDate;
    final lOther$publishDate = other.publishDate;
    if (l$publishDate != lOther$publishDate) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season?
        season,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? duration = _undefined,
    Object? progress = _undefined,
    Object? publishDate = _undefined,
    Object? number = _undefined,
    Object? season = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        publishDate: publishDate == _undefined || publishDate == null
            ? _instance.publishDate
            : (publishDate as String),
        number: number == _undefined ? _instance.number : (number as int?),
        season: season == _undefined
            ? _instance.season
            : (season
                as Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? duration,
    int? progress,
    String? publishDate,
    int? number,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season?
        season,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show
    implements
        Fragment$Section$$IconGridSection$items$items$item$$Show,
        Fragment$ItemSectionItem$item$$Show,
        Fragment$GridSectionItem$item$$Show,
        Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show({
    required this.$__typename,
    required this.defaultEpisode,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$defaultEpisode = json['defaultEpisode'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      defaultEpisode:
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode
              .fromJson((l$defaultEpisode as Map<String, dynamic>)),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode
      defaultEpisode;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$defaultEpisode = defaultEpisode;
    _resultData['defaultEpisode'] = l$defaultEpisode.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$defaultEpisode = defaultEpisode;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
      l$defaultEpisode,
      l$id,
      l$episodeCount,
      l$seasonCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$defaultEpisode = defaultEpisode;
    final lOther$defaultEpisode = other.defaultEpisode;
    if (l$defaultEpisode != lOther$defaultEpisode) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    final l$seasonCount = seasonCount;
    final lOther$seasonCount = other.seasonCount;
    if (l$seasonCount != lOther$seasonCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? defaultEpisode = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        defaultEpisode: defaultEpisode == _undefined || defaultEpisode == null
            ? _instance.defaultEpisode
            : (defaultEpisode
                as Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode<
      TRes> get defaultEpisode {
    final local$defaultEpisode = _instance.defaultEpisode;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode(
        local$defaultEpisode, (e) => call(defaultEpisode: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode?
        defaultEpisode,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode<
          TRes>
      get defaultEpisode =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode
    implements
        Fragment$Section$$IconGridSection$items$items$item$$Show$defaultEpisode,
        Fragment$ItemSectionItem$item$$Show$defaultEpisode,
        Fragment$GridSectionItem$item$$Show$defaultEpisode {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode({
    required this.id,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode(
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
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Show$defaultEpisode(
      this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season
    implements
        Fragment$Section$$IconGridSection$items$items$item$$Episode$season,
        Fragment$GridSectionItem$item$$Episode$season {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season({
    required this.number,
    required this.$show,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$number = json['number'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season(
      number: (l$number as int),
      $show:
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int number;

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show
      $show;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$show = $show;
    _resultData['show'] = l$$show.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$number = number;
    final l$$show = $show;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$number,
      l$$show,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season;

  TRes call({
    int? number,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season)
      _then;

  static const _undefined = {};

  TRes call({
    Object? number = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season(
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    int? number,
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show
    implements
        Fragment$Section$$IconGridSection$items$items$item$$Episode$season$show,
        Fragment$GridSectionItem$item$$Episode$season$show {
  Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show(
      title: (l$title as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String title;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show
    on Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show<
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show(
    Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconGridSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$IconSection
    implements
        Fragment$Section$$IconSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$IconSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    return Query$FetchMoreItemsForItemSection$section$$IconSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$IconSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$IconSection$items
          .fromJson((l$items as Map<String, dynamic>)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$IconSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$IconSection$items items;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchMoreItemsForItemSection$section$$IconSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconSection
    on Query$FetchMoreItemsForItemSection$section$$IconSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection<
          Query$FetchMoreItemsForItemSection$section$$IconSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection(
    Query$FetchMoreItemsForItemSection$section$$IconSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$IconSection) then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$IconSection$metadata? metadata,
    Query$FetchMoreItemsForItemSection$section$$IconSection$items? items,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection<TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconSection _instance;

  final TRes Function(Query$FetchMoreItemsForItemSection$section$$IconSection)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$IconSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$IconSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$IconSection$items),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection<TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$IconSection$metadata? metadata,
    Query$FetchMoreItemsForItemSection$section$$IconSection$items? items,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items<TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$IconSection$metadata
    implements
        Fragment$Section$$IconSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$IconSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$IconSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$IconSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$IconSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$IconSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$IconSection$metadata instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$IconSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconSection$metadata
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$IconSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$IconSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$IconSection$items
    implements Fragment$Section$$IconSection$items, Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$IconSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$IconSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$IconSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<Fragment$ItemSectionItem> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$IconSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$IconSection$items
    on Query$FetchMoreItemsForItemSection$section$$IconSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items<
          Query$FetchMoreItemsForItemSection$section$$IconSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items(
    Query$FetchMoreItemsForItemSection$section$$IconSection$items instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$IconSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$IconSection$items _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$IconSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$IconSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ItemSectionItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$ItemSectionItem> Function(
                  Iterable<
                      CopyWith$Fragment$ItemSectionItem<
                          Fragment$ItemSectionItem>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$ItemSectionItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$IconSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$IconSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$LabelSection
    implements
        Fragment$Section$$LabelSection,
        Fragment$ItemSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$LabelSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.metadata,
    required this.items,
  });

  factory Query$FetchMoreItemsForItemSection$section$$LabelSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$metadata = json['metadata'];
    final l$items = json['items'];
    return Query$FetchMoreItemsForItemSection$section$$LabelSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      metadata: l$metadata == null
          ? null
          : Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata
              .fromJson((l$metadata as Map<String, dynamic>)),
      items: Query$FetchMoreItemsForItemSection$section$$LabelSection$items
          .fromJson((l$items as Map<String, dynamic>)),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata?
      metadata;

  final Query$FetchMoreItemsForItemSection$section$$LabelSection$items items;

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
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata?.toJson();
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$metadata = metadata;
    final l$items = items;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$metadata,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchMoreItemsForItemSection$section$$LabelSection) ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$LabelSection
    on Query$FetchMoreItemsForItemSection$section$$LabelSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection<
          Query$FetchMoreItemsForItemSection$section$$LabelSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection(
    Query$FetchMoreItemsForItemSection$section$$LabelSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$LabelSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata? metadata,
    Query$FetchMoreItemsForItemSection$section$$LabelSection$items? items,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata<
      TRes> get metadata;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$LabelSection _instance;

  final TRes Function(Query$FetchMoreItemsForItemSection$section$$LabelSection)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? metadata = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$LabelSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        metadata: metadata == _undefined
            ? _instance.metadata
            : (metadata
                as Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$FetchMoreItemsForItemSection$section$$LabelSection$items),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata<
      TRes> get metadata {
    final local$metadata = _instance.metadata;
    return local$metadata == null
        ? CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata
            .stub(_then(_instance))
        : CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata(
            local$metadata, (e) => call(metadata: e));
  }

  CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata? metadata,
    Query$FetchMoreItemsForItemSection$section$$LabelSection$items? items,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata<
          TRes>
      get metadata =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata
              .stub(_res);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items<TRes>
      get items =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata
    implements
        Fragment$Section$$LabelSection$metadata,
        Fragment$ItemSection$metadata {
  Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata({
    required this.continueWatching,
    required this.secondaryTitles,
    required this.collectionId,
    required this.useContext,
    required this.prependLiveElement,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata.fromJson(
      Map<String, dynamic> json) {
    final l$continueWatching = json['continueWatching'];
    final l$secondaryTitles = json['secondaryTitles'];
    final l$collectionId = json['collectionId'];
    final l$useContext = json['useContext'];
    final l$prependLiveElement = json['prependLiveElement'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata(
      continueWatching: (l$continueWatching as bool),
      secondaryTitles: (l$secondaryTitles as bool),
      collectionId: (l$collectionId as String),
      useContext: (l$useContext as bool),
      prependLiveElement: (l$prependLiveElement as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool continueWatching;

  final bool secondaryTitles;

  final String collectionId;

  final bool useContext;

  final bool prependLiveElement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$continueWatching = continueWatching;
    _resultData['continueWatching'] = l$continueWatching;
    final l$secondaryTitles = secondaryTitles;
    _resultData['secondaryTitles'] = l$secondaryTitles;
    final l$collectionId = collectionId;
    _resultData['collectionId'] = l$collectionId;
    final l$useContext = useContext;
    _resultData['useContext'] = l$useContext;
    final l$prependLiveElement = prependLiveElement;
    _resultData['prependLiveElement'] = l$prependLiveElement;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$continueWatching = continueWatching;
    final l$secondaryTitles = secondaryTitles;
    final l$collectionId = collectionId;
    final l$useContext = useContext;
    final l$prependLiveElement = prependLiveElement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$continueWatching,
      l$secondaryTitles,
      l$collectionId,
      l$useContext,
      l$prependLiveElement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$continueWatching = continueWatching;
    final lOther$continueWatching = other.continueWatching;
    if (l$continueWatching != lOther$continueWatching) {
      return false;
    }
    final l$secondaryTitles = secondaryTitles;
    final lOther$secondaryTitles = other.secondaryTitles;
    if (l$secondaryTitles != lOther$secondaryTitles) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    final l$useContext = useContext;
    final lOther$useContext = other.useContext;
    if (l$useContext != lOther$useContext) {
      return false;
    }
    final l$prependLiveElement = prependLiveElement;
    final lOther$prependLiveElement = other.prependLiveElement;
    if (l$prependLiveElement != lOther$prependLiveElement) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata
    on Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata<
          Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata(
    Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata;

  TRes call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata) _then;

  static const _undefined = {};

  TRes call({
    Object? continueWatching = _undefined,
    Object? secondaryTitles = _undefined,
    Object? collectionId = _undefined,
    Object? useContext = _undefined,
    Object? prependLiveElement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata(
        continueWatching:
            continueWatching == _undefined || continueWatching == null
                ? _instance.continueWatching
                : (continueWatching as bool),
        secondaryTitles:
            secondaryTitles == _undefined || secondaryTitles == null
                ? _instance.secondaryTitles
                : (secondaryTitles as bool),
        collectionId: collectionId == _undefined || collectionId == null
            ? _instance.collectionId
            : (collectionId as String),
        useContext: useContext == _undefined || useContext == null
            ? _instance.useContext
            : (useContext as bool),
        prependLiveElement:
            prependLiveElement == _undefined || prependLiveElement == null
                ? _instance.prependLiveElement
                : (prependLiveElement as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$metadata(
      this._res);

  TRes _res;

  call({
    bool? continueWatching,
    bool? secondaryTitles,
    String? collectionId,
    bool? useContext,
    bool? prependLiveElement,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$LabelSection$items
    implements
        Fragment$Section$$LabelSection$items,
        Fragment$ItemSection$items {
  Query$FetchMoreItemsForItemSection$section$$LabelSection$items({
    required this.offset,
    required this.first,
    required this.items,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$LabelSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$offset = json['offset'];
    final l$first = json['first'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$LabelSection$items(
      offset: (l$offset as int),
      first: (l$first as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int offset;

  final int first;

  final List<Fragment$ItemSectionItem> items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$offset = offset;
    _resultData['offset'] = l$offset;
    final l$first = first;
    _resultData['first'] = l$first;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$offset = offset;
    final l$first = first;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$offset,
      l$first,
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
            is Query$FetchMoreItemsForItemSection$section$$LabelSection$items) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$LabelSection$items
    on Query$FetchMoreItemsForItemSection$section$$LabelSection$items {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items<
          Query$FetchMoreItemsForItemSection$section$$LabelSection$items>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items(
    Query$FetchMoreItemsForItemSection$section$$LabelSection$items instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$LabelSection$items)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$items;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$items;

  TRes call({
    int? offset,
    int? first,
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$items(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$LabelSection$items
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$LabelSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? offset = _undefined,
    Object? first = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$LabelSection$items(
        offset: offset == _undefined || offset == null
            ? _instance.offset
            : (offset as int),
        first: first == _undefined || first == null
            ? _instance.first
            : (first as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ItemSectionItem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$ItemSectionItem> Function(
                  Iterable<
                      CopyWith$Fragment$ItemSectionItem<
                          Fragment$ItemSectionItem>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$ItemSectionItem(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$items<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$LabelSection$items<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$LabelSection$items(
      this._res);

  TRes _res;

  call({
    int? offset,
    int? first,
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$WebSection
    implements
        Fragment$Section$$WebSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$WebSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    required this.authentication,
    required this.widthRatio,
    this.height,
    required this.url,
  });

  factory Query$FetchMoreItemsForItemSection$section$$WebSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$authentication = json['authentication'];
    final l$widthRatio = json['widthRatio'];
    final l$height = json['height'];
    final l$url = json['url'];
    return Query$FetchMoreItemsForItemSection$section$$WebSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      authentication: (l$authentication as bool),
      widthRatio: (l$widthRatio as num).toDouble(),
      height: (l$height as int?),
      url: (l$url as String),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final bool authentication;

  final double widthRatio;

  final int? height;

  final String url;

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
    final l$authentication = authentication;
    _resultData['authentication'] = l$authentication;
    final l$widthRatio = widthRatio;
    _resultData['widthRatio'] = l$widthRatio;
    final l$height = height;
    _resultData['height'] = l$height;
    final l$url = url;
    _resultData['url'] = l$url;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$authentication = authentication;
    final l$widthRatio = widthRatio;
    final l$height = height;
    final l$url = url;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$authentication,
      l$widthRatio,
      l$height,
      l$url,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FetchMoreItemsForItemSection$section$$WebSection) ||
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
    final l$authentication = authentication;
    final lOther$authentication = other.authentication;
    if (l$authentication != lOther$authentication) {
      return false;
    }
    final l$widthRatio = widthRatio;
    final lOther$widthRatio = other.widthRatio;
    if (l$widthRatio != lOther$widthRatio) {
      return false;
    }
    final l$height = height;
    final lOther$height = other.height;
    if (l$height != lOther$height) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$WebSection
    on Query$FetchMoreItemsForItemSection$section$$WebSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$WebSection<
          Query$FetchMoreItemsForItemSection$section$$WebSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$WebSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$WebSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$WebSection(
    Query$FetchMoreItemsForItemSection$section$$WebSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$WebSection) then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$WebSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$WebSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$WebSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    bool? authentication,
    double? widthRatio,
    int? height,
    String? url,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$WebSection<TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$WebSection<TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$WebSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$WebSection _instance;

  final TRes Function(Query$FetchMoreItemsForItemSection$section$$WebSection)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? authentication = _undefined,
    Object? widthRatio = _undefined,
    Object? height = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$WebSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        authentication: authentication == _undefined || authentication == null
            ? _instance.authentication
            : (authentication as bool),
        widthRatio: widthRatio == _undefined || widthRatio == null
            ? _instance.widthRatio
            : (widthRatio as double),
        height: height == _undefined ? _instance.height : (height as int?),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$WebSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$WebSection<TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$WebSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    bool? authentication,
    double? widthRatio,
    int? height,
    String? url,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$MessageSection
    implements
        Fragment$Section$$MessageSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$MessageSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
    this.messages,
  });

  factory Query$FetchMoreItemsForItemSection$section$$MessageSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    final l$messages = json['messages'];
    return Query$FetchMoreItemsForItemSection$section$$MessageSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
      messages: (l$messages as List<dynamic>?)
          ?.map((e) =>
              Query$FetchMoreItemsForItemSection$section$$MessageSection$messages
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  final String id;

  final String? title;

  final String? description;

  final String $__typename;

  final List<
          Query$FetchMoreItemsForItemSection$section$$MessageSection$messages>?
      messages;

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
    final l$messages = messages;
    _resultData['messages'] = l$messages?.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$$__typename = $__typename;
    final l$messages = messages;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$$__typename,
      l$messages == null ? null : Object.hashAll(l$messages.map((v) => v)),
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$MessageSection) ||
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
    final l$messages = messages;
    final lOther$messages = other.messages;
    if (l$messages != null && lOther$messages != null) {
      if (l$messages.length != lOther$messages.length) {
        return false;
      }
      for (int i = 0; i < l$messages.length; i++) {
        final l$messages$entry = l$messages[i];
        final lOther$messages$entry = lOther$messages[i];
        if (l$messages$entry != lOther$messages$entry) {
          return false;
        }
      }
    } else if (l$messages != lOther$messages) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$MessageSection
    on Query$FetchMoreItemsForItemSection$section$$MessageSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection<
          Query$FetchMoreItemsForItemSection$section$$MessageSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection(
    Query$FetchMoreItemsForItemSection$section$$MessageSection instance,
    TRes Function(Query$FetchMoreItemsForItemSection$section$$MessageSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    List<Query$FetchMoreItemsForItemSection$section$$MessageSection$messages>?
        messages,
  });
  TRes messages(
      Iterable<Query$FetchMoreItemsForItemSection$section$$MessageSection$messages>? Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages<
                      Query$FetchMoreItemsForItemSection$section$$MessageSection$messages>>?)
          _fn);
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$MessageSection _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$MessageSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
    Object? messages = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$MessageSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        messages: messages == _undefined
            ? _instance.messages
            : (messages as List<
                Query$FetchMoreItemsForItemSection$section$$MessageSection$messages>?),
      ));
  TRes messages(
          Iterable<Query$FetchMoreItemsForItemSection$section$$MessageSection$messages>? Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages<
                          Query$FetchMoreItemsForItemSection$section$$MessageSection$messages>>?)
              _fn) =>
      call(
          messages: _fn(_instance.messages?.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages(
                e,
                (i) => i,
              )))?.toList());
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
    List<Query$FetchMoreItemsForItemSection$section$$MessageSection$messages>?
        messages,
  }) =>
      _res;
  messages(_fn) => _res;
}

class Query$FetchMoreItemsForItemSection$section$$MessageSection$messages
    implements Fragment$Section$$MessageSection$messages {
  Query$FetchMoreItemsForItemSection$section$$MessageSection$messages({
    required this.content,
    required this.style,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$MessageSection$messages.fromJson(
      Map<String, dynamic> json) {
    final l$content = json['content'];
    final l$style = json['style'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$MessageSection$messages(
      content: (l$content as String),
      style:
          Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style
              .fromJson((l$style as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String content;

  final Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style
      style;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$content = content;
    _resultData['content'] = l$content;
    final l$style = style;
    _resultData['style'] = l$style.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$content = content;
    final l$style = style;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$content,
      l$style,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$MessageSection$messages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$style = style;
    final lOther$style = other.style;
    if (l$style != lOther$style) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages
    on Query$FetchMoreItemsForItemSection$section$$MessageSection$messages {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages<
          Query$FetchMoreItemsForItemSection$section$$MessageSection$messages>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages(
    Query$FetchMoreItemsForItemSection$section$$MessageSection$messages
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$MessageSection$messages)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages;

  TRes call({
    String? content,
    Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style?
        style,
    String? $__typename,
  });
  CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style<
      TRes> get style;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$MessageSection$messages
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$MessageSection$messages)
      _then;

  static const _undefined = {};

  TRes call({
    Object? content = _undefined,
    Object? style = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$MessageSection$messages(
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        style: style == _undefined || style == null
            ? _instance.style
            : (style
                as Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style<
      TRes> get style {
    final local$style = _instance.style;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style(
        local$style, (e) => call(style: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages(
      this._res);

  TRes _res;

  call({
    String? content,
    Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style?
        style,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style<
          TRes>
      get style =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style
    implements Fragment$Section$$MessageSection$messages$style {
  Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style({
    required this.text,
    required this.background,
    required this.border,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style.fromJson(
      Map<String, dynamic> json) {
    final l$text = json['text'];
    final l$background = json['background'];
    final l$border = json['border'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style(
      text: (l$text as String),
      background: (l$background as String),
      border: (l$border as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String text;

  final String background;

  final String border;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$text = text;
    _resultData['text'] = l$text;
    final l$background = background;
    _resultData['background'] = l$background;
    final l$border = border;
    _resultData['border'] = l$border;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$text = text;
    final l$background = background;
    final l$border = border;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$text,
      l$background,
      l$border,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$background = background;
    final lOther$background = other.background;
    if (l$background != lOther$background) {
      return false;
    }
    final l$border = border;
    final lOther$border = other.border;
    if (l$border != lOther$border) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style
    on Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style<
          Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style(
    Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style;

  TRes call({
    String? text,
    String? background,
    String? border,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style)
      _then;

  static const _undefined = {};

  TRes call({
    Object? text = _undefined,
    Object? background = _undefined,
    Object? border = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style(
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        background: background == _undefined || background == null
            ? _instance.background
            : (background as String),
        border: border == _undefined || border == null
            ? _instance.border
            : (border as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$MessageSection$messages$style(
      this._res);

  TRes _res;

  call({
    String? text,
    String? background,
    String? border,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic
    implements
        Fragment$Section$$CardSection$items$items$item$$StudyTopic,
        Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic({
    required this.$__typename,
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.lessonsProgress,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$images = json['images'];
    final l$lessonsProgress = json['lessonsProgress'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String),
      images: (l$images as List<dynamic>)
          .map((e) =>
              Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      lessonsProgress:
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress
              .fromJson((l$lessonsProgress as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final String title;

  final String description;

  final List<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images>
      images;

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress
      lessonsProgress;

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
    final l$images = images;
    _resultData['images'] = l$images.map((e) => e.toJson()).toList();
    final l$lessonsProgress = lessonsProgress;
    _resultData['lessonsProgress'] = l$lessonsProgress.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$images = images;
    final l$lessonsProgress = lessonsProgress;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$title,
      l$description,
      Object.hashAll(l$images.map((v) => v)),
      l$lessonsProgress,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic) ||
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
    final l$images = images;
    final lOther$images = other.images;
    if (l$images.length != lOther$images.length) {
      return false;
    }
    for (int i = 0; i < l$images.length; i++) {
      final l$images$entry = l$images[i];
      final lOther$images$entry = lOther$images[i];
      if (l$images$entry != lOther$images$entry) {
        return false;
      }
    }
    final l$lessonsProgress = lessonsProgress;
    final lOther$lessonsProgress = other.lessonsProgress;
    if (l$lessonsProgress != lOther$lessonsProgress) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic;

  TRes call({
    String? $__typename,
    String? id,
    String? title,
    String? description,
    List<Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images>?
        images,
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress?
        lessonsProgress,
  });
  TRes images(
      Iterable<Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images> Function(
              Iterable<
                  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images<
                      Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images>>)
          _fn);
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress<
      TRes> get lessonsProgress;
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? images = _undefined,
    Object? lessonsProgress = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        images: images == _undefined || images == null
            ? _instance.images
            : (images as List<
                Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images>),
        lessonsProgress: lessonsProgress == _undefined ||
                lessonsProgress == null
            ? _instance.lessonsProgress
            : (lessonsProgress
                as Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress),
      ));
  TRes images(
          Iterable<Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images> Function(
                  Iterable<
                      CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images<
                          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images>>)
              _fn) =>
      call(
          images: _fn(_instance.images.map((e) =>
              CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress<
      TRes> get lessonsProgress {
    final local$lessonsProgress = _instance.lessonsProgress;
    return CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress(
        local$lessonsProgress, (e) => call(lessonsProgress: e));
  }
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    String? title,
    String? description,
    List<Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images>?
        images,
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress?
        lessonsProgress,
  }) =>
      _res;
  images(_fn) => _res;
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress<
          TRes>
      get lessonsProgress =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress
              .stub(_res);
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images
    implements
        Fragment$Section$$CardSection$items$items$item$$StudyTopic$images {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images({
    required this.style,
    required this.url,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images.fromJson(
      Map<String, dynamic> json) {
    final l$style = json['style'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images(
      style: (l$style as String),
      url: (l$url as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String style;

  final String url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$style = style;
    _resultData['style'] = l$style;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$style = style;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$style,
      l$url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$style = style;
    final lOther$style = other.style;
    if (l$style != lOther$style) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images;

  TRes call({
    String? style,
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images)
      _then;

  static const _undefined = {};

  TRes call({
    Object? style = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images(
        style: style == _undefined || style == null
            ? _instance.style
            : (style as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$images(
      this._res);

  TRes _res;

  call({
    String? style,
    String? url,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress
    implements
        Fragment$Section$$CardSection$items$items$item$$StudyTopic$lessonsProgress {
  Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress({
    required this.completed,
    required this.total,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress.fromJson(
      Map<String, dynamic> json) {
    final l$completed = json['completed'];
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress(
      completed: (l$completed as int),
      total: (l$total as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int completed;

  final int total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$completed = completed;
    _resultData['completed'] = l$completed;
    final l$total = total;
    _resultData['total'] = l$total;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$completed = completed;
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$completed,
      l$total,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$completed = completed;
    final lOther$completed = other.completed;
    if (l$completed != lOther$completed) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress
    on Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress<
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress(
    Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress
        instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress;

  TRes call({
    int? completed,
    int? total,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress
      _instance;

  final TRes Function(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress)
      _then;

  static const _undefined = {};

  TRes call({
    Object? completed = _undefined,
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress(
        completed: completed == _undefined || completed == null
            ? _instance.completed
            : (completed as int),
        total: total == _undefined || total == null
            ? _instance.total
            : (total as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$CardSection$items$items$item$$StudyTopic$lessonsProgress(
      this._res);

  TRes _res;

  call({
    int? completed,
    int? total,
    String? $__typename,
  }) =>
      _res;
}

class Query$FetchMoreItemsForItemSection$section$$PageDetailsSection
    implements
        Fragment$Section$$PageDetailsSection,
        Query$FetchMoreItemsForItemSection$section {
  Query$FetchMoreItemsForItemSection$section$$PageDetailsSection({
    required this.id,
    this.title,
    this.description,
    required this.$__typename,
  });

  factory Query$FetchMoreItemsForItemSection$section$$PageDetailsSection.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Query$FetchMoreItemsForItemSection$section$$PageDetailsSection(
      id: (l$id as String),
      title: (l$title as String?),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? title;

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
    if (!(other
            is Query$FetchMoreItemsForItemSection$section$$PageDetailsSection) ||
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

extension UtilityExtension$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection
    on Query$FetchMoreItemsForItemSection$section$$PageDetailsSection {
  CopyWith$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection<
          Query$FetchMoreItemsForItemSection$section$$PageDetailsSection>
      get copyWith =>
          CopyWith$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection<
    TRes> {
  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection(
    Query$FetchMoreItemsForItemSection$section$$PageDetailsSection instance,
    TRes Function(
            Query$FetchMoreItemsForItemSection$section$$PageDetailsSection)
        then,
  ) = _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection;

  factory CopyWith$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection<
            TRes> {
  _CopyWithImpl$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection(
    this._instance,
    this._then,
  );

  final Query$FetchMoreItemsForItemSection$section$$PageDetailsSection
      _instance;

  final TRes Function(
      Query$FetchMoreItemsForItemSection$section$$PageDetailsSection) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FetchMoreItemsForItemSection$section$$PageDetailsSection(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection<
        TRes>
    implements
        CopyWith$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection<
            TRes> {
  _CopyWithStubImpl$Query$FetchMoreItemsForItemSection$section$$PageDetailsSection(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? $__typename,
  }) =>
      _res;
}
