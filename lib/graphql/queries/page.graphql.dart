import '../schema/pages.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$Section {
  Fragment$Section({
    this.title,
    required this.$__typename,
  });

  factory Fragment$Section.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "PosterSection":
        return Fragment$Section$$PosterSection.fromJson(json);

      case "FeaturedSection":
        return Fragment$Section$$FeaturedSection.fromJson(json);

      case "DefaultSection":
        return Fragment$Section$$DefaultSection.fromJson(json);

      case "GridSection":
        return Fragment$Section$$GridSection.fromJson(json);

      case "IconSection":
        return Fragment$Section$$IconSection.fromJson(json);

      case "LabelSection":
        return Fragment$Section$$LabelSection.fromJson(json);

      default:
        final l$title = json['title'];
        final l$$__typename = json['__typename'];
        return Fragment$Section(
          title: (l$title as String?),
          $__typename: (l$$__typename as String),
        );
    }
  }

  final String? title;

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
    if (!(other is Fragment$Section) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$Section on Fragment$Section {
  CopyWith$Fragment$Section<Fragment$Section> get copyWith =>
      CopyWith$Fragment$Section(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$Section<TRes> {
  factory CopyWith$Fragment$Section(
    Fragment$Section instance,
    TRes Function(Fragment$Section) then,
  ) = _CopyWithImpl$Fragment$Section;

  factory CopyWith$Fragment$Section.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section<TRes>
    implements CopyWith$Fragment$Section<TRes> {
  _CopyWithImpl$Fragment$Section(
    this._instance,
    this._then,
  );

  final Fragment$Section _instance;

  final TRes Function(Fragment$Section) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section(
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section<TRes>
    implements CopyWith$Fragment$Section<TRes> {
  _CopyWithStubImpl$Fragment$Section(this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionSection = FragmentDefinitionNode(
  name: NameNode(value: 'Section'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Section'),
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
          arguments: [],
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
                  name: NameNode(value: 'item'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Link'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'url'),
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
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Page'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'code'),
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
                          name: NameNode(value: '__typename'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                      ]),
                    ),
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Show'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'LabelSection'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'items'),
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
                  name: NameNode(value: 'item'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Link'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'url'),
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
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Page'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'code'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'IconSection'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'items'),
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
                  name: NameNode(value: 'item'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Link'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'url'),
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
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Page'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'code'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'PosterSection'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'size'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'items'),
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
                  name: NameNode(value: 'item'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Show'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'episodeCount'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        FieldNode(
                          name: NameNode(value: 'seasonCount'),
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
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Episode'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'productionDate'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        FieldNode(
                          name: NameNode(value: 'duration'),
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
                              name: NameNode(value: 'show'),
                              alias: null,
                              arguments: [],
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
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'FeaturedSection'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'size'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'items'),
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
                  name: NameNode(value: 'image'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'item'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Show'),
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
                        name: NameNode(value: 'Episode'),
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
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'DefaultSection'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'size'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'items'),
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
                  name: NameNode(value: 'item'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Show'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'episodeCount'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        FieldNode(
                          name: NameNode(value: 'seasonCount'),
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
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Episode'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'productionDate'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        FieldNode(
                          name: NameNode(value: 'duration'),
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
                              name: NameNode(value: 'show'),
                              alias: null,
                              arguments: [],
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
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    InlineFragmentNode(
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
        name: NameNode(value: 'GridSection'),
        isNonNull: false,
      )),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'size'),
          alias: NameNode(value: 'gridSize'),
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'items'),
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
                  name: NameNode(value: 'item'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Show'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'episodeCount'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        FieldNode(
                          name: NameNode(value: 'seasonCount'),
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
                    InlineFragmentNode(
                      typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                        name: NameNode(value: 'Episode'),
                        isNonNull: false,
                      )),
                      directives: [],
                      selectionSet: SelectionSetNode(selections: [
                        FieldNode(
                          name: NameNode(value: 'productionDate'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        FieldNode(
                          name: NameNode(value: 'duration'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        FieldNode(
                          name: NameNode(value: 'number'),
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
                              name: NameNode(value: 'number'),
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
);
const documentNodeFragmentSection = DocumentNode(definitions: [
  fragmentDefinitionSection,
]);

extension ClientExtension$Fragment$Section on graphql.GraphQLClient {
  void writeFragment$Section({
    required Fragment$Section data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'Section',
            document: documentNodeFragmentSection,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$Section? readFragment$Section({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'Section',
          document: documentNodeFragmentSection,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$Section.fromJson(result);
  }
}

class Fragment$Section$$PosterSection implements Fragment$Section {
  Fragment$Section$$PosterSection({
    this.title,
    required this.$__typename,
    required this.items,
    required this.size,
  });

  factory Fragment$Section$$PosterSection.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$items = json['items'];
    final l$size = json['size'];
    return Fragment$Section$$PosterSection(
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      items: Fragment$Section$$PosterSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      size: fromJson$Enum$SectionSize((l$size as String)),
    );
  }

  final String? title;

  final String $__typename;

  final Fragment$Section$$PosterSection$items items;

  final Enum$SectionSize size;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$size = size;
    _resultData['size'] = toJson$Enum$SectionSize(l$size);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    final l$items = items;
    final l$size = size;
    return Object.hashAll([
      l$title,
      l$$__typename,
      l$items,
      l$size,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterSection) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection
    on Fragment$Section$$PosterSection {
  CopyWith$Fragment$Section$$PosterSection<Fragment$Section$$PosterSection>
      get copyWith => CopyWith$Fragment$Section$$PosterSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection<TRes> {
  factory CopyWith$Fragment$Section$$PosterSection(
    Fragment$Section$$PosterSection instance,
    TRes Function(Fragment$Section$$PosterSection) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection;

  factory CopyWith$Fragment$Section$$PosterSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection;

  TRes call({
    String? title,
    String? $__typename,
    Fragment$Section$$PosterSection$items? items,
    Enum$SectionSize? size,
  });
  CopyWith$Fragment$Section$$PosterSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$PosterSection<TRes>
    implements CopyWith$Fragment$Section$$PosterSection<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection _instance;

  final TRes Function(Fragment$Section$$PosterSection) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? items = _undefined,
    Object? size = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection(
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$PosterSection$items),
        size: size == _undefined || size == null
            ? _instance.size
            : (size as Enum$SectionSize),
      ));
  CopyWith$Fragment$Section$$PosterSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$PosterSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection<TRes>
    implements CopyWith$Fragment$Section$$PosterSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection(this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
    Fragment$Section$$PosterSection$items? items,
    Enum$SectionSize? size,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$PosterSection$items.stub(_res);
}

class Fragment$Section$$PosterSection$items {
  Fragment$Section$$PosterSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$PosterSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$PosterSection$items$items> items;

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
    if (!(other is Fragment$Section$$PosterSection$items) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items
    on Fragment$Section$$PosterSection$items {
  CopyWith$Fragment$Section$$PosterSection$items<
          Fragment$Section$$PosterSection$items>
      get copyWith => CopyWith$Fragment$Section$$PosterSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items<TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items(
    Fragment$Section$$PosterSection$items instance,
    TRes Function(Fragment$Section$$PosterSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items;

  factory CopyWith$Fragment$Section$$PosterSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items;

  TRes call({
    List<Fragment$Section$$PosterSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$PosterSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$PosterSection$items$items<
                      Fragment$Section$$PosterSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items _instance;

  final TRes Function(Fragment$Section$$PosterSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$PosterSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$PosterSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$PosterSection$items$items<
                          Fragment$Section$$PosterSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$Section$$PosterSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$PosterSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$PosterSection$items$items {
  Fragment$Section$$PosterSection$items$items({
    required this.id,
    required this.title,
    this.image,
    this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: l$item == null
          ? null
          : Fragment$Section$$PosterSection$items$items$item.fromJson(
              (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$PosterSection$items$items$item? item;

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
    _resultData['item'] = l$item?.toJson();
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
    if (!(other is Fragment$Section$$PosterSection$items$items) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items
    on Fragment$Section$$PosterSection$items$items {
  CopyWith$Fragment$Section$$PosterSection$items$items<
          Fragment$Section$$PosterSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$PosterSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items(
    Fragment$Section$$PosterSection$items$items instance,
    TRes Function(Fragment$Section$$PosterSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items;

  factory CopyWith$Fragment$Section$$PosterSection$items$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$PosterSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined
            ? _instance.item
            : (item as Fragment$Section$$PosterSection$items$items$item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return local$item == null
        ? CopyWith$Fragment$Section$$PosterSection$items$items$item.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$PosterSection$items$items$item(
            local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$PosterSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$PosterSection$items$items$item.stub(_res);
}

class Fragment$Section$$PosterSection$items$items$item {
  Fragment$Section$$PosterSection$items$items$item({required this.$__typename});

  factory Fragment$Section$$PosterSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$PosterSection$items$items$item$$Link.fromJson(
            json);

      case "Page":
        return Fragment$Section$$PosterSection$items$items$item$$Page.fromJson(
            json);

      case "Episode":
        return Fragment$Section$$PosterSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$PosterSection$items$items$item$$Show.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$PosterSection$items$items$item(
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
    if (!(other is Fragment$Section$$PosterSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item
    on Fragment$Section$$PosterSection$items$items$item {
  CopyWith$Fragment$Section$$PosterSection$items$items$item<
          Fragment$Section$$PosterSection$items$items$item>
      get copyWith => CopyWith$Fragment$Section$$PosterSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item(
    Fragment$Section$$PosterSection$items$items$item instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$PosterSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$PosterSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$PosterSection$items$items$item$$Link
    implements Fragment$Section$$PosterSection$items$items$item {
  Fragment$Section$$PosterSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$PosterSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$PosterSection$items$items$item$$Link) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Link
    on Fragment$Section$$PosterSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link<
          Fragment$Section$$PosterSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link(
    Fragment$Section$$PosterSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item$$Link) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Link<TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$PosterSection$items$items$item$$Page
    implements Fragment$Section$$PosterSection$items$items$item {
  Fragment$Section$$PosterSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$PosterSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$PosterSection$items$items$item$$Page) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Page
    on Fragment$Section$$PosterSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page<
          Fragment$Section$$PosterSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page(
    Fragment$Section$$PosterSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item$$Page) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Page<TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$PosterSection$items$items$item$$Episode
    implements Fragment$Section$$PosterSection$items$items$item {
  Fragment$Section$$PosterSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    this.productionDate,
    required this.duration,
    this.season,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$productionDate = json['productionDate'];
    final l$duration = json['duration'];
    final l$season = json['season'];
    return Fragment$Section$$PosterSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      productionDate: (l$productionDate as String?),
      duration: (l$duration as int),
      season: l$season == null
          ? null
          : Fragment$Section$$PosterSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final String? productionDate;

  final int duration;

  final Fragment$Section$$PosterSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$productionDate = productionDate;
    _resultData['productionDate'] = l$productionDate;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$productionDate = productionDate;
    final l$duration = duration;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$productionDate,
      l$duration,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$PosterSection$items$items$item$$Episode) ||
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
    final l$productionDate = productionDate;
    final lOther$productionDate = other.productionDate;
    if (l$productionDate != lOther$productionDate) {
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
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Episode
    on Fragment$Section$$PosterSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode<
          Fragment$Section$$PosterSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode(
    Fragment$Section$$PosterSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    String? productionDate,
    int? duration,
    Fragment$Section$$PosterSection$items$items$item$$Episode$season? season,
  });
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Episode _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? productionDate = _undefined,
    Object? duration = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        productionDate: productionDate == _undefined
            ? _instance.productionDate
            : (productionDate as String?),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        season: season == _undefined
            ? _instance.season
            : (season
                as Fragment$Section$$PosterSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    String? productionDate,
    int? duration,
    Fragment$Section$$PosterSection$items$items$item$$Episode$season? season,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season
              .stub(_res);
}

class Fragment$Section$$PosterSection$items$items$item$$Show
    implements Fragment$Section$$PosterSection$items$items$item {
  Fragment$Section$$PosterSection$items$items$item$$Show({
    required this.$__typename,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Fragment$Section$$PosterSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
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
    if (!(other is Fragment$Section$$PosterSection$items$items$item$$Show) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Show
    on Fragment$Section$$PosterSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show<
          Fragment$Section$$PosterSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show(
    Fragment$Section$$PosterSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$PosterSection$items$items$item$$Show) then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Show<TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show<TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$PosterSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
}

class Fragment$Section$$FeaturedSection implements Fragment$Section {
  Fragment$Section$$FeaturedSection({
    this.title,
    required this.$__typename,
    required this.items,
    required this.size,
  });

  factory Fragment$Section$$FeaturedSection.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$items = json['items'];
    final l$size = json['size'];
    return Fragment$Section$$FeaturedSection(
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      items: Fragment$Section$$FeaturedSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      size: fromJson$Enum$SectionSize((l$size as String)),
    );
  }

  final String? title;

  final String $__typename;

  final Fragment$Section$$FeaturedSection$items items;

  final Enum$SectionSize size;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$size = size;
    _resultData['size'] = toJson$Enum$SectionSize(l$size);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    final l$items = items;
    final l$size = size;
    return Object.hashAll([
      l$title,
      l$$__typename,
      l$items,
      l$size,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$FeaturedSection) ||
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

extension UtilityExtension$Fragment$Section$$FeaturedSection
    on Fragment$Section$$FeaturedSection {
  CopyWith$Fragment$Section$$FeaturedSection<Fragment$Section$$FeaturedSection>
      get copyWith => CopyWith$Fragment$Section$$FeaturedSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection<TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection(
    Fragment$Section$$FeaturedSection instance,
    TRes Function(Fragment$Section$$FeaturedSection) then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection;

  factory CopyWith$Fragment$Section$$FeaturedSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection;

  TRes call({
    String? title,
    String? $__typename,
    Fragment$Section$$FeaturedSection$items? items,
    Enum$SectionSize? size,
  });
  CopyWith$Fragment$Section$$FeaturedSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection<TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection _instance;

  final TRes Function(Fragment$Section$$FeaturedSection) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? items = _undefined,
    Object? size = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection(
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$FeaturedSection$items),
        size: size == _undefined || size == null
            ? _instance.size
            : (size as Enum$SectionSize),
      ));
  CopyWith$Fragment$Section$$FeaturedSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$FeaturedSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection(this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
    Fragment$Section$$FeaturedSection$items? items,
    Enum$SectionSize? size,
  }) =>
      _res;
  CopyWith$Fragment$Section$$FeaturedSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$FeaturedSection$items.stub(_res);
}

class Fragment$Section$$FeaturedSection$items {
  Fragment$Section$$FeaturedSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$FeaturedSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$FeaturedSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$FeaturedSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$FeaturedSection$items$items> items;

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
    if (!(other is Fragment$Section$$FeaturedSection$items) ||
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

extension UtilityExtension$Fragment$Section$$FeaturedSection$items
    on Fragment$Section$$FeaturedSection$items {
  CopyWith$Fragment$Section$$FeaturedSection$items<
          Fragment$Section$$FeaturedSection$items>
      get copyWith => CopyWith$Fragment$Section$$FeaturedSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items<TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items(
    Fragment$Section$$FeaturedSection$items instance,
    TRes Function(Fragment$Section$$FeaturedSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items;

  factory CopyWith$Fragment$Section$$FeaturedSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items;

  TRes call({
    List<Fragment$Section$$FeaturedSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$FeaturedSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$FeaturedSection$items$items<
                      Fragment$Section$$FeaturedSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$FeaturedSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$FeaturedSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$FeaturedSection$items$items<
                          Fragment$Section$$FeaturedSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map(
              (e) => CopyWith$Fragment$Section$$FeaturedSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$FeaturedSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$FeaturedSection$items$items {
  Fragment$Section$$FeaturedSection$items$items({
    required this.id,
    required this.title,
    this.image,
    this.item,
    required this.$__typename,
    required this.description,
  });

  factory Fragment$Section$$FeaturedSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    final l$description = json['description'];
    return Fragment$Section$$FeaturedSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: l$item == null
          ? null
          : Fragment$Section$$FeaturedSection$items$items$item.fromJson(
              (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      description: (l$description as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$FeaturedSection$items$items$item? item;

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
    _resultData['item'] = l$item?.toJson();
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
    if (!(other is Fragment$Section$$FeaturedSection$items$items) ||
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

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items
    on Fragment$Section$$FeaturedSection$items$items {
  CopyWith$Fragment$Section$$FeaturedSection$items$items<
          Fragment$Section$$FeaturedSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$FeaturedSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items(
    Fragment$Section$$FeaturedSection$items$items instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$FeaturedSection$items$items$item? item,
    String? $__typename,
    String? description,
  });
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
    Object? description = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined
            ? _instance.item
            : (item as Fragment$Section$$FeaturedSection$items$items$item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
      ));
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return local$item == null
        ? CopyWith$Fragment$Section$$FeaturedSection$items$items$item.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$FeaturedSection$items$items$item(
            local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$FeaturedSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$FeaturedSection$items$items$item? item,
    String? $__typename,
    String? description,
  }) =>
      _res;
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$FeaturedSection$items$items$item.stub(_res);
}

class Fragment$Section$$FeaturedSection$items$items$item {
  Fragment$Section$$FeaturedSection$items$items$item(
      {required this.$__typename});

  factory Fragment$Section$$FeaturedSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$FeaturedSection$items$items$item$$Link
            .fromJson(json);

      case "Page":
        return Fragment$Section$$FeaturedSection$items$items$item$$Page
            .fromJson(json);

      case "Episode":
        return Fragment$Section$$FeaturedSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$FeaturedSection$items$items$item$$Show
            .fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$FeaturedSection$items$items$item(
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
    if (!(other is Fragment$Section$$FeaturedSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item
    on Fragment$Section$$FeaturedSection$items$items$item {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item<
          Fragment$Section$$FeaturedSection$items$items$item>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item(
    Fragment$Section$$FeaturedSection$items$items$item instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$FeaturedSection$items$items$item$$Link
    implements Fragment$Section$$FeaturedSection$items$items$item {
  Fragment$Section$$FeaturedSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$FeaturedSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$FeaturedSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$FeaturedSection$items$items$item$$Link) ||
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

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item$$Link
    on Fragment$Section$$FeaturedSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link<
          Fragment$Section$$FeaturedSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link(
    Fragment$Section$$FeaturedSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Link)
        then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link<
            TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Link<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$FeaturedSection$items$items$item$$Page
    implements Fragment$Section$$FeaturedSection$items$items$item {
  Fragment$Section$$FeaturedSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$FeaturedSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$FeaturedSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$FeaturedSection$items$items$item$$Page) ||
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

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item$$Page
    on Fragment$Section$$FeaturedSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page<
          Fragment$Section$$FeaturedSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page(
    Fragment$Section$$FeaturedSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Page)
        then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page<
            TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Page<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$FeaturedSection$items$items$item$$Episode
    implements Fragment$Section$$FeaturedSection$items$items$item {
  Fragment$Section$$FeaturedSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
  });

  factory Fragment$Section$$FeaturedSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    return Fragment$Section$$FeaturedSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final String id;

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
    final l$$__typename = $__typename;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$FeaturedSection$items$items$item$$Episode) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item$$Episode
    on Fragment$Section$$FeaturedSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
          Fragment$Section$$FeaturedSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode(
    Fragment$Section$$FeaturedSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
  });
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item$$Episode _instance;

  final TRes Function(
      Fragment$Section$$FeaturedSection$items$items$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
  }) =>
      _res;
}

class Fragment$Section$$FeaturedSection$items$items$item$$Show
    implements Fragment$Section$$FeaturedSection$items$items$item {
  Fragment$Section$$FeaturedSection$items$items$item$$Show({
    required this.$__typename,
    required this.id,
  });

  factory Fragment$Section$$FeaturedSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    return Fragment$Section$$FeaturedSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final String id;

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
    final l$$__typename = $__typename;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$FeaturedSection$items$items$item$$Show) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$FeaturedSection$items$items$item$$Show
    on Fragment$Section$$FeaturedSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show<
          Fragment$Section$$FeaturedSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show(
    Fragment$Section$$FeaturedSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    String? id,
  });
}

class _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$FeaturedSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$FeaturedSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Fragment$Section$$FeaturedSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$FeaturedSection$items$items$item$$Show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$FeaturedSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
  }) =>
      _res;
}

class Fragment$Section$$DefaultSection implements Fragment$Section {
  Fragment$Section$$DefaultSection({
    this.title,
    required this.$__typename,
    required this.items,
    required this.size,
  });

  factory Fragment$Section$$DefaultSection.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$items = json['items'];
    final l$size = json['size'];
    return Fragment$Section$$DefaultSection(
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      items: Fragment$Section$$DefaultSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      size: fromJson$Enum$SectionSize((l$size as String)),
    );
  }

  final String? title;

  final String $__typename;

  final Fragment$Section$$DefaultSection$items items;

  final Enum$SectionSize size;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$size = size;
    _resultData['size'] = toJson$Enum$SectionSize(l$size);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    final l$items = items;
    final l$size = size;
    return Object.hashAll([
      l$title,
      l$$__typename,
      l$items,
      l$size,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$DefaultSection) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection
    on Fragment$Section$$DefaultSection {
  CopyWith$Fragment$Section$$DefaultSection<Fragment$Section$$DefaultSection>
      get copyWith => CopyWith$Fragment$Section$$DefaultSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection<TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection(
    Fragment$Section$$DefaultSection instance,
    TRes Function(Fragment$Section$$DefaultSection) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection;

  factory CopyWith$Fragment$Section$$DefaultSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection;

  TRes call({
    String? title,
    String? $__typename,
    Fragment$Section$$DefaultSection$items? items,
    Enum$SectionSize? size,
  });
  CopyWith$Fragment$Section$$DefaultSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$DefaultSection<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection _instance;

  final TRes Function(Fragment$Section$$DefaultSection) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? items = _undefined,
    Object? size = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection(
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$DefaultSection$items),
        size: size == _undefined || size == null
            ? _instance.size
            : (size as Enum$SectionSize),
      ));
  CopyWith$Fragment$Section$$DefaultSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$DefaultSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection(this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
    Fragment$Section$$DefaultSection$items? items,
    Enum$SectionSize? size,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$DefaultSection$items.stub(_res);
}

class Fragment$Section$$DefaultSection$items {
  Fragment$Section$$DefaultSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$DefaultSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$DefaultSection$items$items> items;

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
    if (!(other is Fragment$Section$$DefaultSection$items) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items
    on Fragment$Section$$DefaultSection$items {
  CopyWith$Fragment$Section$$DefaultSection$items<
          Fragment$Section$$DefaultSection$items>
      get copyWith => CopyWith$Fragment$Section$$DefaultSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items<TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items(
    Fragment$Section$$DefaultSection$items instance,
    TRes Function(Fragment$Section$$DefaultSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items;

  factory CopyWith$Fragment$Section$$DefaultSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items;

  TRes call({
    List<Fragment$Section$$DefaultSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$DefaultSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$DefaultSection$items$items<
                      Fragment$Section$$DefaultSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$DefaultSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$DefaultSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$DefaultSection$items$items<
                          Fragment$Section$$DefaultSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$Section$$DefaultSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$DefaultSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$DefaultSection$items$items {
  Fragment$Section$$DefaultSection$items$items({
    required this.id,
    required this.title,
    this.image,
    this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: l$item == null
          ? null
          : Fragment$Section$$DefaultSection$items$items$item.fromJson(
              (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$DefaultSection$items$items$item? item;

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
    _resultData['item'] = l$item?.toJson();
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
    if (!(other is Fragment$Section$$DefaultSection$items$items) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items
    on Fragment$Section$$DefaultSection$items$items {
  CopyWith$Fragment$Section$$DefaultSection$items$items<
          Fragment$Section$$DefaultSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$DefaultSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items(
    Fragment$Section$$DefaultSection$items$items instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$DefaultSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined
            ? _instance.item
            : (item as Fragment$Section$$DefaultSection$items$items$item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return local$item == null
        ? CopyWith$Fragment$Section$$DefaultSection$items$items$item.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$DefaultSection$items$items$item(
            local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$DefaultSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$DefaultSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$DefaultSection$items$items$item.stub(_res);
}

class Fragment$Section$$DefaultSection$items$items$item {
  Fragment$Section$$DefaultSection$items$items$item(
      {required this.$__typename});

  factory Fragment$Section$$DefaultSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$DefaultSection$items$items$item$$Link.fromJson(
            json);

      case "Page":
        return Fragment$Section$$DefaultSection$items$items$item$$Page.fromJson(
            json);

      case "Episode":
        return Fragment$Section$$DefaultSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$DefaultSection$items$items$item$$Show.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$DefaultSection$items$items$item(
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
    if (!(other is Fragment$Section$$DefaultSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item
    on Fragment$Section$$DefaultSection$items$items$item {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item<
          Fragment$Section$$DefaultSection$items$items$item>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item(
    Fragment$Section$$DefaultSection$items$items$item instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$DefaultSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item<TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$DefaultSection$items$items$item$$Link
    implements Fragment$Section$$DefaultSection$items$items$item {
  Fragment$Section$$DefaultSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$DefaultSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$DefaultSection$items$items$item$$Link) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Link
    on Fragment$Section$$DefaultSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link<
          Fragment$Section$$DefaultSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link(
    Fragment$Section$$DefaultSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Link) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$DefaultSection$items$items$item$$Page
    implements Fragment$Section$$DefaultSection$items$items$item {
  Fragment$Section$$DefaultSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$DefaultSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$DefaultSection$items$items$item$$Page) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Page
    on Fragment$Section$$DefaultSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page<
          Fragment$Section$$DefaultSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page(
    Fragment$Section$$DefaultSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Page) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$DefaultSection$items$items$item$$Episode
    implements Fragment$Section$$DefaultSection$items$items$item {
  Fragment$Section$$DefaultSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    this.productionDate,
    required this.duration,
    this.season,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$productionDate = json['productionDate'];
    final l$duration = json['duration'];
    final l$season = json['season'];
    return Fragment$Section$$DefaultSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      productionDate: (l$productionDate as String?),
      duration: (l$duration as int),
      season: l$season == null
          ? null
          : Fragment$Section$$DefaultSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final String? productionDate;

  final int duration;

  final Fragment$Section$$DefaultSection$items$items$item$$Episode$season?
      season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$productionDate = productionDate;
    _resultData['productionDate'] = l$productionDate;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$season = season;
    _resultData['season'] = l$season?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$productionDate = productionDate;
    final l$duration = duration;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$productionDate,
      l$duration,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$Section$$DefaultSection$items$items$item$$Episode) ||
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
    final l$productionDate = productionDate;
    final lOther$productionDate = other.productionDate;
    if (l$productionDate != lOther$productionDate) {
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
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Episode
    on Fragment$Section$$DefaultSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode<
          Fragment$Section$$DefaultSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode(
    Fragment$Section$$DefaultSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    String? productionDate,
    int? duration,
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season? season,
  });
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
      TRes> get season;
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Episode _instance;

  final TRes Function(
      Fragment$Section$$DefaultSection$items$items$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? productionDate = _undefined,
    Object? duration = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        productionDate: productionDate == _undefined
            ? _instance.productionDate
            : (productionDate as String?),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        season: season == _undefined
            ? _instance.season
            : (season
                as Fragment$Section$$DefaultSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
      TRes> get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    String? productionDate,
    int? duration,
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season? season,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
          TRes>
      get season =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season
              .stub(_res);
}

class Fragment$Section$$DefaultSection$items$items$item$$Show
    implements Fragment$Section$$DefaultSection$items$items$item {
  Fragment$Section$$DefaultSection$items$items$item$$Show({
    required this.$__typename,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Fragment$Section$$DefaultSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
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
    if (!(other is Fragment$Section$$DefaultSection$items$items$item$$Show) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Show
    on Fragment$Section$$DefaultSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show<
          Fragment$Section$$DefaultSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show(
    Fragment$Section$$DefaultSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Show) then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show<TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$DefaultSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
}

class Fragment$Section$$GridSection implements Fragment$Section {
  Fragment$Section$$GridSection({
    this.title,
    required this.$__typename,
    required this.items,
    required this.gridSize,
  });

  factory Fragment$Section$$GridSection.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$items = json['items'];
    final l$gridSize = json['gridSize'];
    return Fragment$Section$$GridSection(
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      items: Fragment$Section$$GridSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      gridSize: fromJson$Enum$GridSectionSize((l$gridSize as String)),
    );
  }

  final String? title;

  final String $__typename;

  final Fragment$Section$$GridSection$items items;

  final Enum$GridSectionSize gridSize;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$gridSize = gridSize;
    _resultData['gridSize'] = toJson$Enum$GridSectionSize(l$gridSize);
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$$__typename = $__typename;
    final l$items = items;
    final l$gridSize = gridSize;
    return Object.hashAll([
      l$title,
      l$$__typename,
      l$items,
      l$gridSize,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$GridSection) ||
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

extension UtilityExtension$Fragment$Section$$GridSection
    on Fragment$Section$$GridSection {
  CopyWith$Fragment$Section$$GridSection<Fragment$Section$$GridSection>
      get copyWith => CopyWith$Fragment$Section$$GridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection<TRes> {
  factory CopyWith$Fragment$Section$$GridSection(
    Fragment$Section$$GridSection instance,
    TRes Function(Fragment$Section$$GridSection) then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection;

  factory CopyWith$Fragment$Section$$GridSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection;

  TRes call({
    String? title,
    String? $__typename,
    Fragment$Section$$GridSection$items? items,
    Enum$GridSectionSize? gridSize,
  });
  CopyWith$Fragment$Section$$GridSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$GridSection<TRes>
    implements CopyWith$Fragment$Section$$GridSection<TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection _instance;

  final TRes Function(Fragment$Section$$GridSection) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? items = _undefined,
    Object? gridSize = _undefined,
  }) =>
      _then(Fragment$Section$$GridSection(
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$GridSection$items),
        gridSize: gridSize == _undefined || gridSize == null
            ? _instance.gridSize
            : (gridSize as Enum$GridSectionSize),
      ));
  CopyWith$Fragment$Section$$GridSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$GridSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$GridSection<TRes>
    implements CopyWith$Fragment$Section$$GridSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection(this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
    Fragment$Section$$GridSection$items? items,
    Enum$GridSectionSize? gridSize,
  }) =>
      _res;
  CopyWith$Fragment$Section$$GridSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$GridSection$items.stub(_res);
}

class Fragment$Section$$GridSection$items {
  Fragment$Section$$GridSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$GridSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$GridSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$GridSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$GridSection$items$items> items;

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
    if (!(other is Fragment$Section$$GridSection$items) ||
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

extension UtilityExtension$Fragment$Section$$GridSection$items
    on Fragment$Section$$GridSection$items {
  CopyWith$Fragment$Section$$GridSection$items<
          Fragment$Section$$GridSection$items>
      get copyWith => CopyWith$Fragment$Section$$GridSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection$items<TRes> {
  factory CopyWith$Fragment$Section$$GridSection$items(
    Fragment$Section$$GridSection$items instance,
    TRes Function(Fragment$Section$$GridSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection$items;

  factory CopyWith$Fragment$Section$$GridSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection$items;

  TRes call({
    List<Fragment$Section$$GridSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$GridSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$GridSection$items$items<
                      Fragment$Section$$GridSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$GridSection$items<TRes>
    implements CopyWith$Fragment$Section$$GridSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection$items _instance;

  final TRes Function(Fragment$Section$$GridSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$GridSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$GridSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$GridSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$GridSection$items$items<
                          Fragment$Section$$GridSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$Section$$GridSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$GridSection$items<TRes>
    implements CopyWith$Fragment$Section$$GridSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$GridSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$GridSection$items$items {
  Fragment$Section$$GridSection$items$items({
    required this.id,
    required this.title,
    this.image,
    this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$GridSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$GridSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: l$item == null
          ? null
          : Fragment$Section$$GridSection$items$items$item.fromJson(
              (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$GridSection$items$items$item? item;

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
    _resultData['item'] = l$item?.toJson();
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
    if (!(other is Fragment$Section$$GridSection$items$items) ||
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

extension UtilityExtension$Fragment$Section$$GridSection$items$items
    on Fragment$Section$$GridSection$items$items {
  CopyWith$Fragment$Section$$GridSection$items$items<
          Fragment$Section$$GridSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$GridSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$GridSection$items$items(
    Fragment$Section$$GridSection$items$items instance,
    TRes Function(Fragment$Section$$GridSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection$items$items;

  factory CopyWith$Fragment$Section$$GridSection$items$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$GridSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$GridSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$GridSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$GridSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection$items$items _instance;

  final TRes Function(Fragment$Section$$GridSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$GridSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined
            ? _instance.item
            : (item as Fragment$Section$$GridSection$items$items$item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$GridSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return local$item == null
        ? CopyWith$Fragment$Section$$GridSection$items$items$item.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$GridSection$items$items$item(
            local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$GridSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$GridSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$GridSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$GridSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$GridSection$items$items$item.stub(_res);
}

class Fragment$Section$$GridSection$items$items$item {
  Fragment$Section$$GridSection$items$items$item({required this.$__typename});

  factory Fragment$Section$$GridSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$GridSection$items$items$item$$Link.fromJson(
            json);

      case "Page":
        return Fragment$Section$$GridSection$items$items$item$$Page.fromJson(
            json);

      case "Episode":
        return Fragment$Section$$GridSection$items$items$item$$Episode.fromJson(
            json);

      case "Show":
        return Fragment$Section$$GridSection$items$items$item$$Show.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$GridSection$items$items$item(
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
    if (!(other is Fragment$Section$$GridSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$GridSection$items$items$item
    on Fragment$Section$$GridSection$items$items$item {
  CopyWith$Fragment$Section$$GridSection$items$items$item<
          Fragment$Section$$GridSection$items$items$item>
      get copyWith => CopyWith$Fragment$Section$$GridSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection$items$items$item<TRes> {
  factory CopyWith$Fragment$Section$$GridSection$items$items$item(
    Fragment$Section$$GridSection$items$items$item instance,
    TRes Function(Fragment$Section$$GridSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection$items$items$item;

  factory CopyWith$Fragment$Section$$GridSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$GridSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$GridSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$GridSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$GridSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$GridSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$GridSection$items$items$item$$Link
    implements Fragment$Section$$GridSection$items$items$item {
  Fragment$Section$$GridSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$GridSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$GridSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$GridSection$items$items$item$$Link) ||
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

extension UtilityExtension$Fragment$Section$$GridSection$items$items$item$$Link
    on Fragment$Section$$GridSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Link<
          Fragment$Section$$GridSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$GridSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Link(
    Fragment$Section$$GridSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$GridSection$items$items$item$$Link) then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Link<TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Link<TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$GridSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$GridSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$GridSection$items$items$item$$Page
    implements Fragment$Section$$GridSection$items$items$item {
  Fragment$Section$$GridSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$GridSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$GridSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$GridSection$items$items$item$$Page) ||
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

extension UtilityExtension$Fragment$Section$$GridSection$items$items$item$$Page
    on Fragment$Section$$GridSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Page<
          Fragment$Section$$GridSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$GridSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Page(
    Fragment$Section$$GridSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$GridSection$items$items$item$$Page) then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Page<TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Page<TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$GridSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$GridSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$GridSection$items$items$item$$Episode
    implements Fragment$Section$$GridSection$items$items$item {
  Fragment$Section$$GridSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
    this.productionDate,
    required this.duration,
    this.number,
    this.season,
  });

  factory Fragment$Section$$GridSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$productionDate = json['productionDate'];
    final l$duration = json['duration'];
    final l$number = json['number'];
    final l$season = json['season'];
    return Fragment$Section$$GridSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      productionDate: (l$productionDate as String?),
      duration: (l$duration as int),
      number: (l$number as int?),
      season: l$season == null
          ? null
          : Fragment$Section$$GridSection$items$items$item$$Episode$season
              .fromJson((l$season as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String id;

  final String? productionDate;

  final int duration;

  final int? number;

  final Fragment$Section$$GridSection$items$items$item$$Episode$season? season;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$productionDate = productionDate;
    _resultData['productionDate'] = l$productionDate;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
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
    final l$productionDate = productionDate;
    final l$duration = duration;
    final l$number = number;
    final l$season = season;
    return Object.hashAll([
      l$$__typename,
      l$id,
      l$productionDate,
      l$duration,
      l$number,
      l$season,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$GridSection$items$items$item$$Episode) ||
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
    final l$productionDate = productionDate;
    final lOther$productionDate = other.productionDate;
    if (l$productionDate != lOther$productionDate) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
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

extension UtilityExtension$Fragment$Section$$GridSection$items$items$item$$Episode
    on Fragment$Section$$GridSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode<
          Fragment$Section$$GridSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode(
    Fragment$Section$$GridSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$GridSection$items$items$item$$Episode) then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
    String? productionDate,
    int? duration,
    int? number,
    Fragment$Section$$GridSection$items$items$item$$Episode$season? season,
  });
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season<TRes>
      get season;
}

class _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode<TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection$items$items$item$$Episode _instance;

  final TRes Function(Fragment$Section$$GridSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? productionDate = _undefined,
    Object? duration = _undefined,
    Object? number = _undefined,
    Object? season = _undefined,
  }) =>
      _then(Fragment$Section$$GridSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        productionDate: productionDate == _undefined
            ? _instance.productionDate
            : (productionDate as String?),
        duration: duration == _undefined || duration == null
            ? _instance.duration
            : (duration as int),
        number: number == _undefined ? _instance.number : (number as int?),
        season: season == _undefined
            ? _instance.season
            : (season
                as Fragment$Section$$GridSection$items$items$item$$Episode$season?),
      ));
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season<TRes>
      get season {
    final local$season = _instance.season;
    return local$season == null
        ? CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season
            .stub(_then(_instance))
        : CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season(
            local$season, (e) => call(season: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode<TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    String? productionDate,
    int? duration,
    int? number,
    Fragment$Section$$GridSection$items$items$item$$Episode$season? season,
  }) =>
      _res;
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season<TRes>
      get season =>
          CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season
              .stub(_res);
}

class Fragment$Section$$GridSection$items$items$item$$Show
    implements Fragment$Section$$GridSection$items$items$item {
  Fragment$Section$$GridSection$items$items$item$$Show({
    required this.$__typename,
    required this.id,
    required this.episodeCount,
    required this.seasonCount,
  });

  factory Fragment$Section$$GridSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    final l$episodeCount = json['episodeCount'];
    final l$seasonCount = json['seasonCount'];
    return Fragment$Section$$GridSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
      episodeCount: (l$episodeCount as int),
      seasonCount: (l$seasonCount as int),
    );
  }

  final String $__typename;

  final String id;

  final int episodeCount;

  final int seasonCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$seasonCount = seasonCount;
    _resultData['seasonCount'] = l$seasonCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$id = id;
    final l$episodeCount = episodeCount;
    final l$seasonCount = seasonCount;
    return Object.hashAll([
      l$$__typename,
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
    if (!(other is Fragment$Section$$GridSection$items$items$item$$Show) ||
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

extension UtilityExtension$Fragment$Section$$GridSection$items$items$item$$Show
    on Fragment$Section$$GridSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Show<
          Fragment$Section$$GridSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$GridSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Show(
    Fragment$Section$$GridSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$GridSection$items$items$item$$Show) then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    String? id,
    int? episodeCount,
    int? seasonCount,
  });
}

class _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Show<TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Show<TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$GridSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
    Object? episodeCount = _undefined,
    Object? seasonCount = _undefined,
  }) =>
      _then(Fragment$Section$$GridSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
        seasonCount: seasonCount == _undefined || seasonCount == null
            ? _instance.seasonCount
            : (seasonCount as int),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
    int? episodeCount,
    int? seasonCount,
  }) =>
      _res;
}

class Fragment$Section$$IconSection implements Fragment$Section {
  Fragment$Section$$IconSection({
    this.title,
    required this.$__typename,
    required this.items,
  });

  factory Fragment$Section$$IconSection.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$items = json['items'];
    return Fragment$Section$$IconSection(
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      items: Fragment$Section$$IconSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String? title;

  final String $__typename;

  final Fragment$Section$$IconSection$items items;

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
    final l$title = title;
    final l$$__typename = $__typename;
    final l$items = items;
    return Object.hashAll([
      l$title,
      l$$__typename,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconSection) ||
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
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$IconSection
    on Fragment$Section$$IconSection {
  CopyWith$Fragment$Section$$IconSection<Fragment$Section$$IconSection>
      get copyWith => CopyWith$Fragment$Section$$IconSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection<TRes> {
  factory CopyWith$Fragment$Section$$IconSection(
    Fragment$Section$$IconSection instance,
    TRes Function(Fragment$Section$$IconSection) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection;

  factory CopyWith$Fragment$Section$$IconSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection;

  TRes call({
    String? title,
    String? $__typename,
    Fragment$Section$$IconSection$items? items,
  });
  CopyWith$Fragment$Section$$IconSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$IconSection<TRes>
    implements CopyWith$Fragment$Section$$IconSection<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection _instance;

  final TRes Function(Fragment$Section$$IconSection) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection(
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$IconSection$items),
      ));
  CopyWith$Fragment$Section$$IconSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$IconSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$IconSection<TRes>
    implements CopyWith$Fragment$Section$$IconSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection(this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
    Fragment$Section$$IconSection$items? items,
  }) =>
      _res;
  CopyWith$Fragment$Section$$IconSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$IconSection$items.stub(_res);
}

class Fragment$Section$$IconSection$items {
  Fragment$Section$$IconSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$IconSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$IconSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$IconSection$items$items> items;

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
    if (!(other is Fragment$Section$$IconSection$items) ||
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

extension UtilityExtension$Fragment$Section$$IconSection$items
    on Fragment$Section$$IconSection$items {
  CopyWith$Fragment$Section$$IconSection$items<
          Fragment$Section$$IconSection$items>
      get copyWith => CopyWith$Fragment$Section$$IconSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection$items<TRes> {
  factory CopyWith$Fragment$Section$$IconSection$items(
    Fragment$Section$$IconSection$items instance,
    TRes Function(Fragment$Section$$IconSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection$items;

  factory CopyWith$Fragment$Section$$IconSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection$items;

  TRes call({
    List<Fragment$Section$$IconSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$IconSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$IconSection$items$items<
                      Fragment$Section$$IconSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$IconSection$items<TRes>
    implements CopyWith$Fragment$Section$$IconSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection$items _instance;

  final TRes Function(Fragment$Section$$IconSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$IconSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$IconSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$IconSection$items$items<
                          Fragment$Section$$IconSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$Section$$IconSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$IconSection$items<TRes>
    implements CopyWith$Fragment$Section$$IconSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$IconSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$IconSection$items$items {
  Fragment$Section$$IconSection$items$items({
    required this.id,
    required this.title,
    this.image,
    this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$IconSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$IconSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: l$item == null
          ? null
          : Fragment$Section$$IconSection$items$items$item.fromJson(
              (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$IconSection$items$items$item? item;

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
    _resultData['item'] = l$item?.toJson();
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
    if (!(other is Fragment$Section$$IconSection$items$items) ||
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

extension UtilityExtension$Fragment$Section$$IconSection$items$items
    on Fragment$Section$$IconSection$items$items {
  CopyWith$Fragment$Section$$IconSection$items$items<
          Fragment$Section$$IconSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$IconSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$IconSection$items$items(
    Fragment$Section$$IconSection$items$items instance,
    TRes Function(Fragment$Section$$IconSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection$items$items;

  factory CopyWith$Fragment$Section$$IconSection$items$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$IconSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$IconSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$IconSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$IconSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection$items$items _instance;

  final TRes Function(Fragment$Section$$IconSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined
            ? _instance.item
            : (item as Fragment$Section$$IconSection$items$items$item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$IconSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return local$item == null
        ? CopyWith$Fragment$Section$$IconSection$items$items$item.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$IconSection$items$items$item(
            local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$IconSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$IconSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$IconSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$IconSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$IconSection$items$items$item.stub(_res);
}

class Fragment$Section$$IconSection$items$items$item {
  Fragment$Section$$IconSection$items$items$item({required this.$__typename});

  factory Fragment$Section$$IconSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$IconSection$items$items$item$$Link.fromJson(
            json);

      case "Page":
        return Fragment$Section$$IconSection$items$items$item$$Page.fromJson(
            json);

      case "Episode":
        return Fragment$Section$$IconSection$items$items$item$$Episode.fromJson(
            json);

      case "Show":
        return Fragment$Section$$IconSection$items$items$item$$Show.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$IconSection$items$items$item(
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
    if (!(other is Fragment$Section$$IconSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$IconSection$items$items$item
    on Fragment$Section$$IconSection$items$items$item {
  CopyWith$Fragment$Section$$IconSection$items$items$item<
          Fragment$Section$$IconSection$items$items$item>
      get copyWith => CopyWith$Fragment$Section$$IconSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection$items$items$item<TRes> {
  factory CopyWith$Fragment$Section$$IconSection$items$items$item(
    Fragment$Section$$IconSection$items$items$item instance,
    TRes Function(Fragment$Section$$IconSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection$items$items$item;

  factory CopyWith$Fragment$Section$$IconSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$IconSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$IconSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$IconSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$IconSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$IconSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$IconSection$items$items$item$$Link
    implements Fragment$Section$$IconSection$items$items$item {
  Fragment$Section$$IconSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$IconSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$IconSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$IconSection$items$items$item$$Link) ||
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

extension UtilityExtension$Fragment$Section$$IconSection$items$items$item$$Link
    on Fragment$Section$$IconSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$IconSection$items$items$item$$Link<
          Fragment$Section$$IconSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$IconSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$IconSection$items$items$item$$Link(
    Fragment$Section$$IconSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$IconSection$items$items$item$$Link) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$IconSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Link<TRes>
    implements
        CopyWith$Fragment$Section$$IconSection$items$items$item$$Link<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$IconSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconSection$items$items$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$IconSection$items$items$item$$Page
    implements Fragment$Section$$IconSection$items$items$item {
  Fragment$Section$$IconSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$IconSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$IconSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$IconSection$items$items$item$$Page) ||
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

extension UtilityExtension$Fragment$Section$$IconSection$items$items$item$$Page
    on Fragment$Section$$IconSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$IconSection$items$items$item$$Page<
          Fragment$Section$$IconSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$IconSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$IconSection$items$items$item$$Page(
    Fragment$Section$$IconSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$IconSection$items$items$item$$Page) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$IconSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Page<TRes>
    implements
        CopyWith$Fragment$Section$$IconSection$items$items$item$$Page<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$IconSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconSection$items$items$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$IconSection$items$items$item$$Episode
    implements Fragment$Section$$IconSection$items$items$item {
  Fragment$Section$$IconSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
  });

  factory Fragment$Section$$IconSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    return Fragment$Section$$IconSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final String id;

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
    final l$$__typename = $__typename;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconSection$items$items$item$$Episode) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$IconSection$items$items$item$$Episode
    on Fragment$Section$$IconSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$IconSection$items$items$item$$Episode<
          Fragment$Section$$IconSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$IconSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$IconSection$items$items$item$$Episode(
    Fragment$Section$$IconSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$IconSection$items$items$item$$Episode) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$IconSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
  });
}

class _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconSection$items$items$item$$Episode<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection$items$items$item$$Episode _instance;

  final TRes Function(Fragment$Section$$IconSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconSection$items$items$item$$Episode<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
  }) =>
      _res;
}

class Fragment$Section$$IconSection$items$items$item$$Show
    implements Fragment$Section$$IconSection$items$items$item {
  Fragment$Section$$IconSection$items$items$item$$Show({
    required this.$__typename,
    required this.id,
  });

  factory Fragment$Section$$IconSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    return Fragment$Section$$IconSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final String id;

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
    final l$$__typename = $__typename;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$IconSection$items$items$item$$Show) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$IconSection$items$items$item$$Show
    on Fragment$Section$$IconSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$IconSection$items$items$item$$Show<
          Fragment$Section$$IconSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$IconSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$IconSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$IconSection$items$items$item$$Show(
    Fragment$Section$$IconSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$IconSection$items$items$item$$Show) then,
  ) = _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$IconSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    String? id,
  });
}

class _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Show<TRes>
    implements
        CopyWith$Fragment$Section$$IconSection$items$items$item$$Show<TRes> {
  _CopyWithImpl$Fragment$Section$$IconSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$IconSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$IconSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Fragment$Section$$IconSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$IconSection$items$items$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$Section$$IconSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
  }) =>
      _res;
}

class Fragment$Section$$LabelSection implements Fragment$Section {
  Fragment$Section$$LabelSection({
    this.title,
    required this.$__typename,
    required this.items,
  });

  factory Fragment$Section$$LabelSection.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    final l$items = json['items'];
    return Fragment$Section$$LabelSection(
      title: (l$title as String?),
      $__typename: (l$$__typename as String),
      items: Fragment$Section$$LabelSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String? title;

  final String $__typename;

  final Fragment$Section$$LabelSection$items items;

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
    final l$title = title;
    final l$$__typename = $__typename;
    final l$items = items;
    return Object.hashAll([
      l$title,
      l$$__typename,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$LabelSection) ||
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
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$LabelSection
    on Fragment$Section$$LabelSection {
  CopyWith$Fragment$Section$$LabelSection<Fragment$Section$$LabelSection>
      get copyWith => CopyWith$Fragment$Section$$LabelSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection<TRes> {
  factory CopyWith$Fragment$Section$$LabelSection(
    Fragment$Section$$LabelSection instance,
    TRes Function(Fragment$Section$$LabelSection) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection;

  factory CopyWith$Fragment$Section$$LabelSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection;

  TRes call({
    String? title,
    String? $__typename,
    Fragment$Section$$LabelSection$items? items,
  });
  CopyWith$Fragment$Section$$LabelSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$Section$$LabelSection<TRes>
    implements CopyWith$Fragment$Section$$LabelSection<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection _instance;

  final TRes Function(Fragment$Section$$LabelSection) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection(
        title: title == _undefined ? _instance.title : (title as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$Section$$LabelSection$items),
      ));
  CopyWith$Fragment$Section$$LabelSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$Section$$LabelSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection<TRes>
    implements CopyWith$Fragment$Section$$LabelSection<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection(this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
    Fragment$Section$$LabelSection$items? items,
  }) =>
      _res;
  CopyWith$Fragment$Section$$LabelSection$items<TRes> get items =>
      CopyWith$Fragment$Section$$LabelSection$items.stub(_res);
}

class Fragment$Section$$LabelSection$items {
  Fragment$Section$$LabelSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$Section$$LabelSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$LabelSection$items(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section$$LabelSection$items$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section$$LabelSection$items$items> items;

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
    if (!(other is Fragment$Section$$LabelSection$items) ||
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

extension UtilityExtension$Fragment$Section$$LabelSection$items
    on Fragment$Section$$LabelSection$items {
  CopyWith$Fragment$Section$$LabelSection$items<
          Fragment$Section$$LabelSection$items>
      get copyWith => CopyWith$Fragment$Section$$LabelSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection$items<TRes> {
  factory CopyWith$Fragment$Section$$LabelSection$items(
    Fragment$Section$$LabelSection$items instance,
    TRes Function(Fragment$Section$$LabelSection$items) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection$items;

  factory CopyWith$Fragment$Section$$LabelSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection$items;

  TRes call({
    List<Fragment$Section$$LabelSection$items$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section$$LabelSection$items$items> Function(
              Iterable<
                  CopyWith$Fragment$Section$$LabelSection$items$items<
                      Fragment$Section$$LabelSection$items$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$Section$$LabelSection$items<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$items<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection$items _instance;

  final TRes Function(Fragment$Section$$LabelSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection$items(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section$$LabelSection$items$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section$$LabelSection$items$items> Function(
                  Iterable<
                      CopyWith$Fragment$Section$$LabelSection$items$items<
                          Fragment$Section$$LabelSection$items$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$Section$$LabelSection$items$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection$items<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$Section$$LabelSection$items$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$Section$$LabelSection$items$items {
  Fragment$Section$$LabelSection$items$items({
    required this.id,
    required this.title,
    this.image,
    this.item,
    required this.$__typename,
  });

  factory Fragment$Section$$LabelSection$items$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$LabelSection$items$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      item: l$item == null
          ? null
          : Fragment$Section$$LabelSection$items$items$item.fromJson(
              (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final Fragment$Section$$LabelSection$items$items$item? item;

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
    _resultData['item'] = l$item?.toJson();
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
    if (!(other is Fragment$Section$$LabelSection$items$items) ||
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

extension UtilityExtension$Fragment$Section$$LabelSection$items$items
    on Fragment$Section$$LabelSection$items$items {
  CopyWith$Fragment$Section$$LabelSection$items$items<
          Fragment$Section$$LabelSection$items$items>
      get copyWith => CopyWith$Fragment$Section$$LabelSection$items$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection$items$items<TRes> {
  factory CopyWith$Fragment$Section$$LabelSection$items$items(
    Fragment$Section$$LabelSection$items$items instance,
    TRes Function(Fragment$Section$$LabelSection$items$items) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection$items$items;

  factory CopyWith$Fragment$Section$$LabelSection$items$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$LabelSection$items$items$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$LabelSection$items$items$item<TRes> get item;
}

class _CopyWithImpl$Fragment$Section$$LabelSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$items$items<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection$items$items(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection$items$items _instance;

  final TRes Function(Fragment$Section$$LabelSection$items$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection$items$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined
            ? _instance.item
            : (item as Fragment$Section$$LabelSection$items$items$item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$LabelSection$items$items$item<TRes> get item {
    final local$item = _instance.item;
    return local$item == null
        ? CopyWith$Fragment$Section$$LabelSection$items$items$item.stub(
            _then(_instance))
        : CopyWith$Fragment$Section$$LabelSection$items$items$item(
            local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$items$items<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    Fragment$Section$$LabelSection$items$items$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$LabelSection$items$items$item<TRes> get item =>
      CopyWith$Fragment$Section$$LabelSection$items$items$item.stub(_res);
}

class Fragment$Section$$LabelSection$items$items$item {
  Fragment$Section$$LabelSection$items$items$item({required this.$__typename});

  factory Fragment$Section$$LabelSection$items$items$item.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Link":
        return Fragment$Section$$LabelSection$items$items$item$$Link.fromJson(
            json);

      case "Page":
        return Fragment$Section$$LabelSection$items$items$item$$Page.fromJson(
            json);

      case "Episode":
        return Fragment$Section$$LabelSection$items$items$item$$Episode
            .fromJson(json);

      case "Show":
        return Fragment$Section$$LabelSection$items$items$item$$Show.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$Section$$LabelSection$items$items$item(
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
    if (!(other is Fragment$Section$$LabelSection$items$items$item) ||
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

extension UtilityExtension$Fragment$Section$$LabelSection$items$items$item
    on Fragment$Section$$LabelSection$items$items$item {
  CopyWith$Fragment$Section$$LabelSection$items$items$item<
          Fragment$Section$$LabelSection$items$items$item>
      get copyWith => CopyWith$Fragment$Section$$LabelSection$items$items$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection$items$items$item<TRes> {
  factory CopyWith$Fragment$Section$$LabelSection$items$items$item(
    Fragment$Section$$LabelSection$items$items$item instance,
    TRes Function(Fragment$Section$$LabelSection$items$items$item) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item;

  factory CopyWith$Fragment$Section$$LabelSection$items$items$item.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$items$items$item<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection$items$items$item _instance;

  final TRes Function(Fragment$Section$$LabelSection$items$items$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$Section$$LabelSection$items$items$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item<TRes>
    implements CopyWith$Fragment$Section$$LabelSection$items$items$item<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$Section$$LabelSection$items$items$item$$Link
    implements Fragment$Section$$LabelSection$items$items$item {
  Fragment$Section$$LabelSection$items$items$item$$Link({
    required this.$__typename,
    required this.url,
  });

  factory Fragment$Section$$LabelSection$items$items$item$$Link.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$url = json['url'];
    return Fragment$Section$$LabelSection$items$items$item$$Link(
      $__typename: (l$$__typename as String),
      url: (l$url as String),
    );
  }

  final String $__typename;

  final String url;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$LabelSection$items$items$item$$Link) ||
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

extension UtilityExtension$Fragment$Section$$LabelSection$items$items$item$$Link
    on Fragment$Section$$LabelSection$items$items$item$$Link {
  CopyWith$Fragment$Section$$LabelSection$items$items$item$$Link<
          Fragment$Section$$LabelSection$items$items$item$$Link>
      get copyWith =>
          CopyWith$Fragment$Section$$LabelSection$items$items$item$$Link(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection$items$items$item$$Link<
    TRes> {
  factory CopyWith$Fragment$Section$$LabelSection$items$items$item$$Link(
    Fragment$Section$$LabelSection$items$items$item$$Link instance,
    TRes Function(Fragment$Section$$LabelSection$items$items$item$$Link) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Link;

  factory CopyWith$Fragment$Section$$LabelSection$items$items$item$$Link.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Link;

  TRes call({
    String? $__typename,
    String? url,
  });
}

class _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Link<TRes>
    implements
        CopyWith$Fragment$Section$$LabelSection$items$items$item$$Link<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Link(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection$items$items$item$$Link _instance;

  final TRes Function(Fragment$Section$$LabelSection$items$items$item$$Link)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? url = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection$items$items$item$$Link(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Link<
        TRes>
    implements
        CopyWith$Fragment$Section$$LabelSection$items$items$item$$Link<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Link(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? url,
  }) =>
      _res;
}

class Fragment$Section$$LabelSection$items$items$item$$Page
    implements Fragment$Section$$LabelSection$items$items$item {
  Fragment$Section$$LabelSection$items$items$item$$Page({
    required this.$__typename,
    required this.code,
  });

  factory Fragment$Section$$LabelSection$items$items$item$$Page.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$code = json['code'];
    return Fragment$Section$$LabelSection$items$items$item$$Page(
      $__typename: (l$$__typename as String),
      code: (l$code as String),
    );
  }

  final String $__typename;

  final String code;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
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
    if (!(other is Fragment$Section$$LabelSection$items$items$item$$Page) ||
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

extension UtilityExtension$Fragment$Section$$LabelSection$items$items$item$$Page
    on Fragment$Section$$LabelSection$items$items$item$$Page {
  CopyWith$Fragment$Section$$LabelSection$items$items$item$$Page<
          Fragment$Section$$LabelSection$items$items$item$$Page>
      get copyWith =>
          CopyWith$Fragment$Section$$LabelSection$items$items$item$$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection$items$items$item$$Page<
    TRes> {
  factory CopyWith$Fragment$Section$$LabelSection$items$items$item$$Page(
    Fragment$Section$$LabelSection$items$items$item$$Page instance,
    TRes Function(Fragment$Section$$LabelSection$items$items$item$$Page) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Page;

  factory CopyWith$Fragment$Section$$LabelSection$items$items$item$$Page.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Page;

  TRes call({
    String? $__typename,
    String? code,
  });
}

class _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Page<TRes>
    implements
        CopyWith$Fragment$Section$$LabelSection$items$items$item$$Page<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Page(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection$items$items$item$$Page _instance;

  final TRes Function(Fragment$Section$$LabelSection$items$items$item$$Page)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? code = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection$items$items$item$$Page(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Page<
        TRes>
    implements
        CopyWith$Fragment$Section$$LabelSection$items$items$item$$Page<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Page(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? code,
  }) =>
      _res;
}

class Fragment$Section$$LabelSection$items$items$item$$Episode
    implements Fragment$Section$$LabelSection$items$items$item {
  Fragment$Section$$LabelSection$items$items$item$$Episode({
    required this.$__typename,
    required this.id,
  });

  factory Fragment$Section$$LabelSection$items$items$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    return Fragment$Section$$LabelSection$items$items$item$$Episode(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final String id;

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
    final l$$__typename = $__typename;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$LabelSection$items$items$item$$Episode) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$LabelSection$items$items$item$$Episode
    on Fragment$Section$$LabelSection$items$items$item$$Episode {
  CopyWith$Fragment$Section$$LabelSection$items$items$item$$Episode<
          Fragment$Section$$LabelSection$items$items$item$$Episode>
      get copyWith =>
          CopyWith$Fragment$Section$$LabelSection$items$items$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection$items$items$item$$Episode<
    TRes> {
  factory CopyWith$Fragment$Section$$LabelSection$items$items$item$$Episode(
    Fragment$Section$$LabelSection$items$items$item$$Episode instance,
    TRes Function(Fragment$Section$$LabelSection$items$items$item$$Episode)
        then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Episode;

  factory CopyWith$Fragment$Section$$LabelSection$items$items$item$$Episode.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Episode;

  TRes call({
    String? $__typename,
    String? id,
  });
}

class _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$LabelSection$items$items$item$$Episode<
            TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection$items$items$item$$Episode _instance;

  final TRes Function(Fragment$Section$$LabelSection$items$items$item$$Episode)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection$items$items$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Episode<
        TRes>
    implements
        CopyWith$Fragment$Section$$LabelSection$items$items$item$$Episode<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Episode(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
  }) =>
      _res;
}

class Fragment$Section$$LabelSection$items$items$item$$Show
    implements Fragment$Section$$LabelSection$items$items$item {
  Fragment$Section$$LabelSection$items$items$item$$Show({
    required this.$__typename,
    required this.id,
  });

  factory Fragment$Section$$LabelSection$items$items$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$id = json['id'];
    return Fragment$Section$$LabelSection$items$items$item$$Show(
      $__typename: (l$$__typename as String),
      id: (l$id as String),
    );
  }

  final String $__typename;

  final String id;

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
    final l$$__typename = $__typename;
    final l$id = id;
    return Object.hashAll([
      l$$__typename,
      l$id,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$Section$$LabelSection$items$items$item$$Show) ||
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
    return true;
  }
}

extension UtilityExtension$Fragment$Section$$LabelSection$items$items$item$$Show
    on Fragment$Section$$LabelSection$items$items$item$$Show {
  CopyWith$Fragment$Section$$LabelSection$items$items$item$$Show<
          Fragment$Section$$LabelSection$items$items$item$$Show>
      get copyWith =>
          CopyWith$Fragment$Section$$LabelSection$items$items$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$LabelSection$items$items$item$$Show<
    TRes> {
  factory CopyWith$Fragment$Section$$LabelSection$items$items$item$$Show(
    Fragment$Section$$LabelSection$items$items$item$$Show instance,
    TRes Function(Fragment$Section$$LabelSection$items$items$item$$Show) then,
  ) = _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Show;

  factory CopyWith$Fragment$Section$$LabelSection$items$items$item$$Show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Show;

  TRes call({
    String? $__typename,
    String? id,
  });
}

class _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Show<TRes>
    implements
        CopyWith$Fragment$Section$$LabelSection$items$items$item$$Show<TRes> {
  _CopyWithImpl$Fragment$Section$$LabelSection$items$items$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$LabelSection$items$items$item$$Show _instance;

  final TRes Function(Fragment$Section$$LabelSection$items$items$item$$Show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? id = _undefined,
  }) =>
      _then(Fragment$Section$$LabelSection$items$items$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        id: id == _undefined || id == null ? _instance.id : (id as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Show<
        TRes>
    implements
        CopyWith$Fragment$Section$$LabelSection$items$items$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$Section$$LabelSection$items$items$item$$Show(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? id,
  }) =>
      _res;
}

class Fragment$Section$$PosterSection$items$items$item$$Episode$season {
  Fragment$Section$$PosterSection$items$items$item$$Episode$season({
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$items$items$item$$Episode$season(
      $show:
          Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
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
            is Fragment$Section$$PosterSection$items$items$item$$Episode$season) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Episode$season
    on Fragment$Section$$PosterSection$items$items$item$$Episode$season {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
          Fragment$Section$$PosterSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
    Fragment$Section$$PosterSection$items$items$item$$Episode$season instance,
    TRes Function(
            Fragment$Section$$PosterSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season;

  TRes call({
    Fragment$Section$$PosterSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
      Fragment$Section$$PosterSection$items$items$item$$Episode$season) _then;

  static const _undefined = {};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$PosterSection$items$items$item$$Episode$season(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Fragment$Section$$PosterSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    Fragment$Section$$PosterSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Fragment$Section$$PosterSection$items$items$item$$Episode$season$show {
  Fragment$Section$$PosterSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$Section$$PosterSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
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
            is Fragment$Section$$PosterSection$items$items$item$$Episode$season$show) ||
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

extension UtilityExtension$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
    on Fragment$Section$$PosterSection$items$items$item$$Episode$season$show {
  CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
          Fragment$Section$$PosterSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
    Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Fragment$Section$$PosterSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show;

  factory CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$PosterSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Fragment$Section$$PosterSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$PosterSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$DefaultSection$items$items$item$$Episode$season {
  Fragment$Section$$DefaultSection$items$items$item$$Episode$season({
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
      $show:
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
              .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
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
            is Fragment$Section$$DefaultSection$items$items$item$$Episode$season) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Episode$season
    on Fragment$Section$$DefaultSection$items$items$item$$Episode$season {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season instance,
    TRes Function(
            Fragment$Section$$DefaultSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season;

  TRes call({
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
      Fragment$Section$$DefaultSection$items$items$item$$Episode$season) _then;

  static const _undefined = {};

  TRes call({
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show?
        $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show {
  Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
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
            is Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show) ||
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

extension UtilityExtension$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
    on Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show {
  CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
    Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show;

  factory CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$DefaultSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$Section$$GridSection$items$items$item$$Episode$season {
  Fragment$Section$$GridSection$items$items$item$$Episode$season({
    required this.number,
    required this.$show,
    required this.$__typename,
  });

  factory Fragment$Section$$GridSection$items$items$item$$Episode$season.fromJson(
      Map<String, dynamic> json) {
    final l$number = json['number'];
    final l$$show = json['show'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$GridSection$items$items$item$$Episode$season(
      number: (l$number as int),
      $show: Fragment$Section$$GridSection$items$items$item$$Episode$season$show
          .fromJson((l$$show as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int number;

  final Fragment$Section$$GridSection$items$items$item$$Episode$season$show
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
            is Fragment$Section$$GridSection$items$items$item$$Episode$season) ||
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

extension UtilityExtension$Fragment$Section$$GridSection$items$items$item$$Episode$season
    on Fragment$Section$$GridSection$items$items$item$$Episode$season {
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season<
          Fragment$Section$$GridSection$items$items$item$$Episode$season>
      get copyWith =>
          CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season<
    TRes> {
  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season(
    Fragment$Section$$GridSection$items$items$item$$Episode$season instance,
    TRes Function(
            Fragment$Section$$GridSection$items$items$item$$Episode$season)
        then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season;

  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season;

  TRes call({
    int? number,
    Fragment$Section$$GridSection$items$items$item$$Episode$season$show? $show,
    String? $__typename,
  });
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show<
      TRes> get $show;
}

class _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection$items$items$item$$Episode$season
      _instance;

  final TRes Function(
      Fragment$Section$$GridSection$items$items$item$$Episode$season) _then;

  static const _undefined = {};

  TRes call({
    Object? number = _undefined,
    Object? $show = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$GridSection$items$items$item$$Episode$season(
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $show: $show == _undefined || $show == null
            ? _instance.$show
            : ($show
                as Fragment$Section$$GridSection$items$items$item$$Episode$season$show),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show<
      TRes> get $show {
    final local$$show = _instance.$show;
    return CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show(
        local$$show, (e) => call($show: e));
  }
}

class _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season<
        TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season(
      this._res);

  TRes _res;

  call({
    int? number,
    Fragment$Section$$GridSection$items$items$item$$Episode$season$show? $show,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show<
          TRes>
      get $show =>
          CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show
              .stub(_res);
}

class Fragment$Section$$GridSection$items$items$item$$Episode$season$show {
  Fragment$Section$$GridSection$items$items$item$$Episode$season$show({
    required this.title,
    required this.$__typename,
  });

  factory Fragment$Section$$GridSection$items$items$item$$Episode$season$show.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$$__typename = json['__typename'];
    return Fragment$Section$$GridSection$items$items$item$$Episode$season$show(
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
            is Fragment$Section$$GridSection$items$items$item$$Episode$season$show) ||
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

extension UtilityExtension$Fragment$Section$$GridSection$items$items$item$$Episode$season$show
    on Fragment$Section$$GridSection$items$items$item$$Episode$season$show {
  CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show<
          Fragment$Section$$GridSection$items$items$item$$Episode$season$show>
      get copyWith =>
          CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show<
    TRes> {
  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show(
    Fragment$Section$$GridSection$items$items$item$$Episode$season$show
        instance,
    TRes Function(
            Fragment$Section$$GridSection$items$items$item$$Episode$season$show)
        then,
  ) = _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season$show;

  factory CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season$show;

  TRes call({
    String? title,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season$show(
    this._instance,
    this._then,
  );

  final Fragment$Section$$GridSection$items$items$item$$Episode$season$show
      _instance;

  final TRes Function(
          Fragment$Section$$GridSection$items$items$item$$Episode$season$show)
      _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$Section$$GridSection$items$items$item$$Episode$season$show(
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season$show<
        TRes>
    implements
        CopyWith$Fragment$Section$$GridSection$items$items$item$$Episode$season$show<
            TRes> {
  _CopyWithStubImpl$Fragment$Section$$GridSection$items$items$item$$Episode$season$show(
      this._res);

  TRes _res;

  call({
    String? title,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$Page {
  factory Variables$Query$Page({required String code}) =>
      Variables$Query$Page._({
        r'code': code,
      });

  Variables$Query$Page._(this._$data);

  factory Variables$Query$Page.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$code = data['code'];
    result$data['code'] = (l$code as String);
    return Variables$Query$Page._(result$data);
  }

  Map<String, dynamic> _$data;

  String get code => (_$data['code'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$code = code;
    result$data['code'] = l$code;
    return result$data;
  }

  CopyWith$Variables$Query$Page<Variables$Query$Page> get copyWith =>
      CopyWith$Variables$Query$Page(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$Page) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$code = code;
    return Object.hashAll([l$code]);
  }
}

abstract class CopyWith$Variables$Query$Page<TRes> {
  factory CopyWith$Variables$Query$Page(
    Variables$Query$Page instance,
    TRes Function(Variables$Query$Page) then,
  ) = _CopyWithImpl$Variables$Query$Page;

  factory CopyWith$Variables$Query$Page.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Page;

  TRes call({String? code});
}

class _CopyWithImpl$Variables$Query$Page<TRes>
    implements CopyWith$Variables$Query$Page<TRes> {
  _CopyWithImpl$Variables$Query$Page(
    this._instance,
    this._then,
  );

  final Variables$Query$Page _instance;

  final TRes Function(Variables$Query$Page) _then;

  static const _undefined = {};

  TRes call({Object? code = _undefined}) => _then(Variables$Query$Page._({
        ..._instance._$data,
        if (code != _undefined && code != null) 'code': (code as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$Page<TRes>
    implements CopyWith$Variables$Query$Page<TRes> {
  _CopyWithStubImpl$Variables$Query$Page(this._res);

  TRes _res;

  call({String? code}) => _res;
}

class Query$Page {
  Query$Page({
    required this.page,
    required this.$__typename,
  });

  factory Query$Page.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$$__typename = json['__typename'];
    return Query$Page(
      page: Query$Page$page.fromJson((l$page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Page$page page;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$page,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
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

extension UtilityExtension$Query$Page on Query$Page {
  CopyWith$Query$Page<Query$Page> get copyWith => CopyWith$Query$Page(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Page<TRes> {
  factory CopyWith$Query$Page(
    Query$Page instance,
    TRes Function(Query$Page) then,
  ) = _CopyWithImpl$Query$Page;

  factory CopyWith$Query$Page.stub(TRes res) = _CopyWithStubImpl$Query$Page;

  TRes call({
    Query$Page$page? page,
    String? $__typename,
  });
  CopyWith$Query$Page$page<TRes> get page;
}

class _CopyWithImpl$Query$Page<TRes> implements CopyWith$Query$Page<TRes> {
  _CopyWithImpl$Query$Page(
    this._instance,
    this._then,
  );

  final Query$Page _instance;

  final TRes Function(Query$Page) _then;

  static const _undefined = {};

  TRes call({
    Object? page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page(
        page: page == _undefined || page == null
            ? _instance.page
            : (page as Query$Page$page),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Page$page<TRes> get page {
    final local$page = _instance.page;
    return CopyWith$Query$Page$page(local$page, (e) => call(page: e));
  }
}

class _CopyWithStubImpl$Query$Page<TRes> implements CopyWith$Query$Page<TRes> {
  _CopyWithStubImpl$Query$Page(this._res);

  TRes _res;

  call({
    Query$Page$page? page,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Page$page<TRes> get page =>
      CopyWith$Query$Page$page.stub(_res);
}

const documentNodeQueryPage = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Page'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'code')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'page'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'code'),
            value: VariableNode(name: NameNode(value: 'code')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'sections'),
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
                    name: NameNode(value: 'Section'),
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
  fragmentDefinitionSection,
]);
Query$Page _parserFn$Query$Page(Map<String, dynamic> data) =>
    Query$Page.fromJson(data);

class Options$Query$Page extends graphql.QueryOptions<Query$Page> {
  Options$Query$Page({
    String? operationName,
    required Variables$Query$Page variables,
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
          document: documentNodeQueryPage,
          parserFn: _parserFn$Query$Page,
        );
}

class WatchOptions$Query$Page extends graphql.WatchQueryOptions<Query$Page> {
  WatchOptions$Query$Page({
    String? operationName,
    required Variables$Query$Page variables,
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
          document: documentNodeQueryPage,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Page,
        );
}

class FetchMoreOptions$Query$Page extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Page({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$Page variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryPage,
        );
}

extension ClientExtension$Query$Page on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Page>> query$Page(
          Options$Query$Page options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$Page> watchQuery$Page(
          WatchOptions$Query$Page options) =>
      this.watchQuery(options);
  void writeQuery$Page({
    required Query$Page data,
    required Variables$Query$Page variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryPage),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Page? readQuery$Page({
    required Variables$Query$Page variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryPage),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Page.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Page> useQuery$Page(
        Options$Query$Page options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$Page> useWatchQuery$Page(
        WatchOptions$Query$Page options) =>
    graphql_flutter.useWatchQuery(options);

class Query$Page$Widget extends graphql_flutter.Query<Query$Page> {
  Query$Page$Widget({
    widgets.Key? key,
    required Options$Query$Page options,
    required graphql_flutter.QueryBuilder<Query$Page> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$Page$page {
  Query$Page$page({
    required this.sections,
    required this.$__typename,
  });

  factory Query$Page$page.fromJson(Map<String, dynamic> json) {
    final l$sections = json['sections'];
    final l$$__typename = json['__typename'];
    return Query$Page$page(
      sections: Query$Page$page$sections.fromJson(
          (l$sections as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Page$page$sections sections;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sections = sections;
    _resultData['sections'] = l$sections.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sections = sections;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$sections,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sections = sections;
    final lOther$sections = other.sections;
    if (l$sections != lOther$sections) {
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

extension UtilityExtension$Query$Page$page on Query$Page$page {
  CopyWith$Query$Page$page<Query$Page$page> get copyWith =>
      CopyWith$Query$Page$page(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Page$page<TRes> {
  factory CopyWith$Query$Page$page(
    Query$Page$page instance,
    TRes Function(Query$Page$page) then,
  ) = _CopyWithImpl$Query$Page$page;

  factory CopyWith$Query$Page$page.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page;

  TRes call({
    Query$Page$page$sections? sections,
    String? $__typename,
  });
  CopyWith$Query$Page$page$sections<TRes> get sections;
}

class _CopyWithImpl$Query$Page$page<TRes>
    implements CopyWith$Query$Page$page<TRes> {
  _CopyWithImpl$Query$Page$page(
    this._instance,
    this._then,
  );

  final Query$Page$page _instance;

  final TRes Function(Query$Page$page) _then;

  static const _undefined = {};

  TRes call({
    Object? sections = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page(
        sections: sections == _undefined || sections == null
            ? _instance.sections
            : (sections as Query$Page$page$sections),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Page$page$sections<TRes> get sections {
    final local$sections = _instance.sections;
    return CopyWith$Query$Page$page$sections(
        local$sections, (e) => call(sections: e));
  }
}

class _CopyWithStubImpl$Query$Page$page<TRes>
    implements CopyWith$Query$Page$page<TRes> {
  _CopyWithStubImpl$Query$Page$page(this._res);

  TRes _res;

  call({
    Query$Page$page$sections? sections,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Page$page$sections<TRes> get sections =>
      CopyWith$Query$Page$page$sections.stub(_res);
}

class Query$Page$page$sections {
  Query$Page$page$sections({
    required this.items,
    required this.$__typename,
  });

  factory Query$Page$page$sections.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$Section.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$Section> items;

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
    if (!(other is Query$Page$page$sections) ||
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

extension UtilityExtension$Query$Page$page$sections
    on Query$Page$page$sections {
  CopyWith$Query$Page$page$sections<Query$Page$page$sections> get copyWith =>
      CopyWith$Query$Page$page$sections(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Page$page$sections<TRes> {
  factory CopyWith$Query$Page$page$sections(
    Query$Page$page$sections instance,
    TRes Function(Query$Page$page$sections) then,
  ) = _CopyWithImpl$Query$Page$page$sections;

  factory CopyWith$Query$Page$page$sections.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections;

  TRes call({
    List<Fragment$Section>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$Section> Function(
              Iterable<CopyWith$Fragment$Section<Fragment$Section>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections<TRes>
    implements CopyWith$Query$Page$page$sections<TRes> {
  _CopyWithImpl$Query$Page$page$sections(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections _instance;

  final TRes Function(Query$Page$page$sections) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page$sections(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$Section>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$Section> Function(
                  Iterable<CopyWith$Fragment$Section<Fragment$Section>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) => CopyWith$Fragment$Section(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$Page$page$sections<TRes>
    implements CopyWith$Query$Page$page$sections<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections(this._res);

  TRes _res;

  call({
    List<Fragment$Section>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}
