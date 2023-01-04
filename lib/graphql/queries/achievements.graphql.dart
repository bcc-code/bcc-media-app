import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$AchievementTitleImage {
  Fragment$AchievementTitleImage({
    required this.id,
    required this.title,
    this.image,
    required this.$__typename,
  });

  factory Fragment$AchievementTitleImage.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Fragment$AchievementTitleImage(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$title = title;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
    if (!(other is Fragment$AchievementTitleImage) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$AchievementTitleImage
    on Fragment$AchievementTitleImage {
  CopyWith$Fragment$AchievementTitleImage<Fragment$AchievementTitleImage>
      get copyWith => CopyWith$Fragment$AchievementTitleImage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$AchievementTitleImage<TRes> {
  factory CopyWith$Fragment$AchievementTitleImage(
    Fragment$AchievementTitleImage instance,
    TRes Function(Fragment$AchievementTitleImage) then,
  ) = _CopyWithImpl$Fragment$AchievementTitleImage;

  factory CopyWith$Fragment$AchievementTitleImage.stub(TRes res) =
      _CopyWithStubImpl$Fragment$AchievementTitleImage;

  TRes call({
    String? id,
    String? title,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$AchievementTitleImage<TRes>
    implements CopyWith$Fragment$AchievementTitleImage<TRes> {
  _CopyWithImpl$Fragment$AchievementTitleImage(
    this._instance,
    this._then,
  );

  final Fragment$AchievementTitleImage _instance;

  final TRes Function(Fragment$AchievementTitleImage) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$AchievementTitleImage(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$AchievementTitleImage<TRes>
    implements CopyWith$Fragment$AchievementTitleImage<TRes> {
  _CopyWithStubImpl$Fragment$AchievementTitleImage(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionAchievementTitleImage = FragmentDefinitionNode(
  name: NameNode(value: 'AchievementTitleImage'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Achievement'),
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
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentAchievementTitleImage = DocumentNode(definitions: [
  fragmentDefinitionAchievementTitleImage,
]);

extension ClientExtension$Fragment$AchievementTitleImage
    on graphql.GraphQLClient {
  void writeFragment$AchievementTitleImage({
    required Fragment$AchievementTitleImage data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'AchievementTitleImage',
            document: documentNodeFragmentAchievementTitleImage,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$AchievementTitleImage? readFragment$AchievementTitleImage({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'AchievementTitleImage',
          document: documentNodeFragmentAchievementTitleImage,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$AchievementTitleImage.fromJson(result);
  }
}

class Fragment$AchievementGroup {
  Fragment$AchievementGroup({
    required this.id,
    required this.title,
    required this.achievements,
    required this.$__typename,
  });

  factory Fragment$AchievementGroup.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$achievements = json['achievements'];
    final l$$__typename = json['__typename'];
    return Fragment$AchievementGroup(
      id: (l$id as String),
      title: (l$title as String),
      achievements: Fragment$AchievementGroup$achievements.fromJson(
          (l$achievements as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final Fragment$AchievementGroup$achievements achievements;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$achievements = achievements;
    _resultData['achievements'] = l$achievements.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$achievements = achievements;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$achievements,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$AchievementGroup) ||
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
    final l$achievements = achievements;
    final lOther$achievements = other.achievements;
    if (l$achievements != lOther$achievements) {
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

extension UtilityExtension$Fragment$AchievementGroup
    on Fragment$AchievementGroup {
  CopyWith$Fragment$AchievementGroup<Fragment$AchievementGroup> get copyWith =>
      CopyWith$Fragment$AchievementGroup(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$AchievementGroup<TRes> {
  factory CopyWith$Fragment$AchievementGroup(
    Fragment$AchievementGroup instance,
    TRes Function(Fragment$AchievementGroup) then,
  ) = _CopyWithImpl$Fragment$AchievementGroup;

  factory CopyWith$Fragment$AchievementGroup.stub(TRes res) =
      _CopyWithStubImpl$Fragment$AchievementGroup;

  TRes call({
    String? id,
    String? title,
    Fragment$AchievementGroup$achievements? achievements,
    String? $__typename,
  });
  CopyWith$Fragment$AchievementGroup$achievements<TRes> get achievements;
}

class _CopyWithImpl$Fragment$AchievementGroup<TRes>
    implements CopyWith$Fragment$AchievementGroup<TRes> {
  _CopyWithImpl$Fragment$AchievementGroup(
    this._instance,
    this._then,
  );

  final Fragment$AchievementGroup _instance;

  final TRes Function(Fragment$AchievementGroup) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? achievements = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$AchievementGroup(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        achievements: achievements == _undefined || achievements == null
            ? _instance.achievements
            : (achievements as Fragment$AchievementGroup$achievements),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$AchievementGroup$achievements<TRes> get achievements {
    final local$achievements = _instance.achievements;
    return CopyWith$Fragment$AchievementGroup$achievements(
        local$achievements, (e) => call(achievements: e));
  }
}

class _CopyWithStubImpl$Fragment$AchievementGroup<TRes>
    implements CopyWith$Fragment$AchievementGroup<TRes> {
  _CopyWithStubImpl$Fragment$AchievementGroup(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    Fragment$AchievementGroup$achievements? achievements,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$AchievementGroup$achievements<TRes> get achievements =>
      CopyWith$Fragment$AchievementGroup$achievements.stub(_res);
}

const fragmentDefinitionAchievementGroup = FragmentDefinitionNode(
  name: NameNode(value: 'AchievementGroup'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'AchievementGroup'),
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
      name: NameNode(value: 'achievements'),
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
              name: NameNode(value: 'AchievementTitleImage'),
              directives: [],
            ),
            FieldNode(
              name: NameNode(value: 'achieved'),
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
const documentNodeFragmentAchievementGroup = DocumentNode(definitions: [
  fragmentDefinitionAchievementGroup,
  fragmentDefinitionAchievementTitleImage,
]);

extension ClientExtension$Fragment$AchievementGroup on graphql.GraphQLClient {
  void writeFragment$AchievementGroup({
    required Fragment$AchievementGroup data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'AchievementGroup',
            document: documentNodeFragmentAchievementGroup,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$AchievementGroup? readFragment$AchievementGroup({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'AchievementGroup',
          document: documentNodeFragmentAchievementGroup,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$AchievementGroup.fromJson(result);
  }
}

class Fragment$AchievementGroup$achievements {
  Fragment$AchievementGroup$achievements({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$AchievementGroup$achievements.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$AchievementGroup$achievements(
      items: (l$items as List<dynamic>)
          .map((e) => Fragment$AchievementGroup$achievements$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$AchievementGroup$achievements$items> items;

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
    if (!(other is Fragment$AchievementGroup$achievements) ||
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

extension UtilityExtension$Fragment$AchievementGroup$achievements
    on Fragment$AchievementGroup$achievements {
  CopyWith$Fragment$AchievementGroup$achievements<
          Fragment$AchievementGroup$achievements>
      get copyWith => CopyWith$Fragment$AchievementGroup$achievements(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$AchievementGroup$achievements<TRes> {
  factory CopyWith$Fragment$AchievementGroup$achievements(
    Fragment$AchievementGroup$achievements instance,
    TRes Function(Fragment$AchievementGroup$achievements) then,
  ) = _CopyWithImpl$Fragment$AchievementGroup$achievements;

  factory CopyWith$Fragment$AchievementGroup$achievements.stub(TRes res) =
      _CopyWithStubImpl$Fragment$AchievementGroup$achievements;

  TRes call({
    List<Fragment$AchievementGroup$achievements$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$AchievementGroup$achievements$items> Function(
              Iterable<
                  CopyWith$Fragment$AchievementGroup$achievements$items<
                      Fragment$AchievementGroup$achievements$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$AchievementGroup$achievements<TRes>
    implements CopyWith$Fragment$AchievementGroup$achievements<TRes> {
  _CopyWithImpl$Fragment$AchievementGroup$achievements(
    this._instance,
    this._then,
  );

  final Fragment$AchievementGroup$achievements _instance;

  final TRes Function(Fragment$AchievementGroup$achievements) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$AchievementGroup$achievements(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$AchievementGroup$achievements$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$AchievementGroup$achievements$items> Function(
                  Iterable<
                      CopyWith$Fragment$AchievementGroup$achievements$items<
                          Fragment$AchievementGroup$achievements$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Fragment$AchievementGroup$achievements$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$AchievementGroup$achievements<TRes>
    implements CopyWith$Fragment$AchievementGroup$achievements<TRes> {
  _CopyWithStubImpl$Fragment$AchievementGroup$achievements(this._res);

  TRes _res;

  call({
    List<Fragment$AchievementGroup$achievements$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$AchievementGroup$achievements$items
    implements Fragment$AchievementTitleImage {
  Fragment$AchievementGroup$achievements$items({
    required this.id,
    required this.title,
    this.image,
    required this.$__typename,
    required this.achieved,
  });

  factory Fragment$AchievementGroup$achievements$items.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    final l$achieved = json['achieved'];
    return Fragment$AchievementGroup$achievements$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
      achieved: (l$achieved as bool),
    );
  }

  final String id;

  final String title;

  final String? image;

  final String $__typename;

  final bool achieved;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$achieved = achieved;
    _resultData['achieved'] = l$achieved;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$$__typename = $__typename;
    final l$achieved = achieved;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$$__typename,
      l$achieved,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$AchievementGroup$achievements$items) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$achieved = achieved;
    final lOther$achieved = other.achieved;
    if (l$achieved != lOther$achieved) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$AchievementGroup$achievements$items
    on Fragment$AchievementGroup$achievements$items {
  CopyWith$Fragment$AchievementGroup$achievements$items<
          Fragment$AchievementGroup$achievements$items>
      get copyWith => CopyWith$Fragment$AchievementGroup$achievements$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$AchievementGroup$achievements$items<TRes> {
  factory CopyWith$Fragment$AchievementGroup$achievements$items(
    Fragment$AchievementGroup$achievements$items instance,
    TRes Function(Fragment$AchievementGroup$achievements$items) then,
  ) = _CopyWithImpl$Fragment$AchievementGroup$achievements$items;

  factory CopyWith$Fragment$AchievementGroup$achievements$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$AchievementGroup$achievements$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    String? $__typename,
    bool? achieved,
  });
}

class _CopyWithImpl$Fragment$AchievementGroup$achievements$items<TRes>
    implements CopyWith$Fragment$AchievementGroup$achievements$items<TRes> {
  _CopyWithImpl$Fragment$AchievementGroup$achievements$items(
    this._instance,
    this._then,
  );

  final Fragment$AchievementGroup$achievements$items _instance;

  final TRes Function(Fragment$AchievementGroup$achievements$items) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
    Object? achieved = _undefined,
  }) =>
      _then(Fragment$AchievementGroup$achievements$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        achieved: achieved == _undefined || achieved == null
            ? _instance.achieved
            : (achieved as bool),
      ));
}

class _CopyWithStubImpl$Fragment$AchievementGroup$achievements$items<TRes>
    implements CopyWith$Fragment$AchievementGroup$achievements$items<TRes> {
  _CopyWithStubImpl$Fragment$AchievementGroup$achievements$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    String? $__typename,
    bool? achieved,
  }) =>
      _res;
}

class Query$getAchievementGroups {
  Query$getAchievementGroups({
    required this.achievementGroups,
    required this.$__typename,
  });

  factory Query$getAchievementGroups.fromJson(Map<String, dynamic> json) {
    final l$achievementGroups = json['achievementGroups'];
    final l$$__typename = json['__typename'];
    return Query$getAchievementGroups(
      achievementGroups: Query$getAchievementGroups$achievementGroups.fromJson(
          (l$achievementGroups as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getAchievementGroups$achievementGroups achievementGroups;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$achievementGroups = achievementGroups;
    _resultData['achievementGroups'] = l$achievementGroups.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$achievementGroups = achievementGroups;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$achievementGroups,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getAchievementGroups) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$achievementGroups = achievementGroups;
    final lOther$achievementGroups = other.achievementGroups;
    if (l$achievementGroups != lOther$achievementGroups) {
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

extension UtilityExtension$Query$getAchievementGroups
    on Query$getAchievementGroups {
  CopyWith$Query$getAchievementGroups<Query$getAchievementGroups>
      get copyWith => CopyWith$Query$getAchievementGroups(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getAchievementGroups<TRes> {
  factory CopyWith$Query$getAchievementGroups(
    Query$getAchievementGroups instance,
    TRes Function(Query$getAchievementGroups) then,
  ) = _CopyWithImpl$Query$getAchievementGroups;

  factory CopyWith$Query$getAchievementGroups.stub(TRes res) =
      _CopyWithStubImpl$Query$getAchievementGroups;

  TRes call({
    Query$getAchievementGroups$achievementGroups? achievementGroups,
    String? $__typename,
  });
  CopyWith$Query$getAchievementGroups$achievementGroups<TRes>
      get achievementGroups;
}

class _CopyWithImpl$Query$getAchievementGroups<TRes>
    implements CopyWith$Query$getAchievementGroups<TRes> {
  _CopyWithImpl$Query$getAchievementGroups(
    this._instance,
    this._then,
  );

  final Query$getAchievementGroups _instance;

  final TRes Function(Query$getAchievementGroups) _then;

  static const _undefined = {};

  TRes call({
    Object? achievementGroups = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAchievementGroups(
        achievementGroups:
            achievementGroups == _undefined || achievementGroups == null
                ? _instance.achievementGroups
                : (achievementGroups
                    as Query$getAchievementGroups$achievementGroups),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getAchievementGroups$achievementGroups<TRes>
      get achievementGroups {
    final local$achievementGroups = _instance.achievementGroups;
    return CopyWith$Query$getAchievementGroups$achievementGroups(
        local$achievementGroups, (e) => call(achievementGroups: e));
  }
}

class _CopyWithStubImpl$Query$getAchievementGroups<TRes>
    implements CopyWith$Query$getAchievementGroups<TRes> {
  _CopyWithStubImpl$Query$getAchievementGroups(this._res);

  TRes _res;

  call({
    Query$getAchievementGroups$achievementGroups? achievementGroups,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getAchievementGroups$achievementGroups<TRes>
      get achievementGroups =>
          CopyWith$Query$getAchievementGroups$achievementGroups.stub(_res);
}

const documentNodeQuerygetAchievementGroups = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getAchievementGroups'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'achievementGroups'),
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
                name: NameNode(value: 'AchievementGroup'),
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
  fragmentDefinitionAchievementGroup,
  fragmentDefinitionAchievementTitleImage,
]);
Query$getAchievementGroups _parserFn$Query$getAchievementGroups(
        Map<String, dynamic> data) =>
    Query$getAchievementGroups.fromJson(data);

class Options$Query$getAchievementGroups
    extends graphql.QueryOptions<Query$getAchievementGroups> {
  Options$Query$getAchievementGroups({
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
          document: documentNodeQuerygetAchievementGroups,
          parserFn: _parserFn$Query$getAchievementGroups,
        );
}

class WatchOptions$Query$getAchievementGroups
    extends graphql.WatchQueryOptions<Query$getAchievementGroups> {
  WatchOptions$Query$getAchievementGroups({
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
          document: documentNodeQuerygetAchievementGroups,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getAchievementGroups,
        );
}

class FetchMoreOptions$Query$getAchievementGroups
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getAchievementGroups(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetAchievementGroups,
        );
}

extension ClientExtension$Query$getAchievementGroups on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getAchievementGroups>>
      query$getAchievementGroups(
              [Options$Query$getAchievementGroups? options]) async =>
          await this.query(options ?? Options$Query$getAchievementGroups());
  graphql.ObservableQuery<Query$getAchievementGroups>
      watchQuery$getAchievementGroups(
              [WatchOptions$Query$getAchievementGroups? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$getAchievementGroups());
  void writeQuery$getAchievementGroups({
    required Query$getAchievementGroups data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerygetAchievementGroups)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getAchievementGroups? readQuery$getAchievementGroups(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetAchievementGroups)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getAchievementGroups.fromJson(result);
  }
}

graphql_flutter
    .QueryHookResult<Query$getAchievementGroups> useQuery$getAchievementGroups(
        [Options$Query$getAchievementGroups? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$getAchievementGroups());
graphql.ObservableQuery<Query$getAchievementGroups>
    useWatchQuery$getAchievementGroups(
            [WatchOptions$Query$getAchievementGroups? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$getAchievementGroups());

class Query$getAchievementGroups$Widget
    extends graphql_flutter.Query<Query$getAchievementGroups> {
  Query$getAchievementGroups$Widget({
    widgets.Key? key,
    Options$Query$getAchievementGroups? options,
    required graphql_flutter.QueryBuilder<Query$getAchievementGroups> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getAchievementGroups(),
          builder: builder,
        );
}

class Query$getAchievementGroups$achievementGroups {
  Query$getAchievementGroups$achievementGroups({
    required this.items,
    required this.$__typename,
  });

  factory Query$getAchievementGroups$achievementGroups.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getAchievementGroups$achievementGroups(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$AchievementGroup.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$AchievementGroup> items;

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
    if (!(other is Query$getAchievementGroups$achievementGroups) ||
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

extension UtilityExtension$Query$getAchievementGroups$achievementGroups
    on Query$getAchievementGroups$achievementGroups {
  CopyWith$Query$getAchievementGroups$achievementGroups<
          Query$getAchievementGroups$achievementGroups>
      get copyWith => CopyWith$Query$getAchievementGroups$achievementGroups(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getAchievementGroups$achievementGroups<TRes> {
  factory CopyWith$Query$getAchievementGroups$achievementGroups(
    Query$getAchievementGroups$achievementGroups instance,
    TRes Function(Query$getAchievementGroups$achievementGroups) then,
  ) = _CopyWithImpl$Query$getAchievementGroups$achievementGroups;

  factory CopyWith$Query$getAchievementGroups$achievementGroups.stub(TRes res) =
      _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups;

  TRes call({
    List<Fragment$AchievementGroup>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$AchievementGroup> Function(
              Iterable<
                  CopyWith$Fragment$AchievementGroup<
                      Fragment$AchievementGroup>>)
          _fn);
}

class _CopyWithImpl$Query$getAchievementGroups$achievementGroups<TRes>
    implements CopyWith$Query$getAchievementGroups$achievementGroups<TRes> {
  _CopyWithImpl$Query$getAchievementGroups$achievementGroups(
    this._instance,
    this._then,
  );

  final Query$getAchievementGroups$achievementGroups _instance;

  final TRes Function(Query$getAchievementGroups$achievementGroups) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAchievementGroups$achievementGroups(
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$AchievementGroup>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Fragment$AchievementGroup> Function(
                  Iterable<
                      CopyWith$Fragment$AchievementGroup<
                          Fragment$AchievementGroup>>)
              _fn) =>
      call(
          items:
              _fn(_instance.items.map((e) => CopyWith$Fragment$AchievementGroup(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups<TRes>
    implements CopyWith$Query$getAchievementGroups$achievementGroups<TRes> {
  _CopyWithStubImpl$Query$getAchievementGroups$achievementGroups(this._res);

  TRes _res;

  call({
    List<Fragment$AchievementGroup>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Variables$Query$getAchievementGroup {
  factory Variables$Query$getAchievementGroup({required String id}) =>
      Variables$Query$getAchievementGroup._({
        r'id': id,
      });

  Variables$Query$getAchievementGroup._(this._$data);

  factory Variables$Query$getAchievementGroup.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$getAchievementGroup._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getAchievementGroup<
          Variables$Query$getAchievementGroup>
      get copyWith => CopyWith$Variables$Query$getAchievementGroup(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getAchievementGroup) ||
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

abstract class CopyWith$Variables$Query$getAchievementGroup<TRes> {
  factory CopyWith$Variables$Query$getAchievementGroup(
    Variables$Query$getAchievementGroup instance,
    TRes Function(Variables$Query$getAchievementGroup) then,
  ) = _CopyWithImpl$Variables$Query$getAchievementGroup;

  factory CopyWith$Variables$Query$getAchievementGroup.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getAchievementGroup;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$getAchievementGroup<TRes>
    implements CopyWith$Variables$Query$getAchievementGroup<TRes> {
  _CopyWithImpl$Variables$Query$getAchievementGroup(
    this._instance,
    this._then,
  );

  final Variables$Query$getAchievementGroup _instance;

  final TRes Function(Variables$Query$getAchievementGroup) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getAchievementGroup._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getAchievementGroup<TRes>
    implements CopyWith$Variables$Query$getAchievementGroup<TRes> {
  _CopyWithStubImpl$Variables$Query$getAchievementGroup(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$getAchievementGroup {
  Query$getAchievementGroup({
    required this.achievementGroup,
    required this.$__typename,
  });

  factory Query$getAchievementGroup.fromJson(Map<String, dynamic> json) {
    final l$achievementGroup = json['achievementGroup'];
    final l$$__typename = json['__typename'];
    return Query$getAchievementGroup(
      achievementGroup: Fragment$AchievementGroup.fromJson(
          (l$achievementGroup as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$AchievementGroup achievementGroup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$achievementGroup = achievementGroup;
    _resultData['achievementGroup'] = l$achievementGroup.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$achievementGroup = achievementGroup;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$achievementGroup,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getAchievementGroup) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$achievementGroup = achievementGroup;
    final lOther$achievementGroup = other.achievementGroup;
    if (l$achievementGroup != lOther$achievementGroup) {
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

extension UtilityExtension$Query$getAchievementGroup
    on Query$getAchievementGroup {
  CopyWith$Query$getAchievementGroup<Query$getAchievementGroup> get copyWith =>
      CopyWith$Query$getAchievementGroup(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getAchievementGroup<TRes> {
  factory CopyWith$Query$getAchievementGroup(
    Query$getAchievementGroup instance,
    TRes Function(Query$getAchievementGroup) then,
  ) = _CopyWithImpl$Query$getAchievementGroup;

  factory CopyWith$Query$getAchievementGroup.stub(TRes res) =
      _CopyWithStubImpl$Query$getAchievementGroup;

  TRes call({
    Fragment$AchievementGroup? achievementGroup,
    String? $__typename,
  });
  CopyWith$Fragment$AchievementGroup<TRes> get achievementGroup;
}

class _CopyWithImpl$Query$getAchievementGroup<TRes>
    implements CopyWith$Query$getAchievementGroup<TRes> {
  _CopyWithImpl$Query$getAchievementGroup(
    this._instance,
    this._then,
  );

  final Query$getAchievementGroup _instance;

  final TRes Function(Query$getAchievementGroup) _then;

  static const _undefined = {};

  TRes call({
    Object? achievementGroup = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAchievementGroup(
        achievementGroup:
            achievementGroup == _undefined || achievementGroup == null
                ? _instance.achievementGroup
                : (achievementGroup as Fragment$AchievementGroup),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$AchievementGroup<TRes> get achievementGroup {
    final local$achievementGroup = _instance.achievementGroup;
    return CopyWith$Fragment$AchievementGroup(
        local$achievementGroup, (e) => call(achievementGroup: e));
  }
}

class _CopyWithStubImpl$Query$getAchievementGroup<TRes>
    implements CopyWith$Query$getAchievementGroup<TRes> {
  _CopyWithStubImpl$Query$getAchievementGroup(this._res);

  TRes _res;

  call({
    Fragment$AchievementGroup? achievementGroup,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$AchievementGroup<TRes> get achievementGroup =>
      CopyWith$Fragment$AchievementGroup.stub(_res);
}

const documentNodeQuerygetAchievementGroup = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getAchievementGroup'),
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
        name: NameNode(value: 'achievementGroup'),
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
            name: NameNode(value: 'AchievementGroup'),
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
  fragmentDefinitionAchievementGroup,
  fragmentDefinitionAchievementTitleImage,
]);
Query$getAchievementGroup _parserFn$Query$getAchievementGroup(
        Map<String, dynamic> data) =>
    Query$getAchievementGroup.fromJson(data);

class Options$Query$getAchievementGroup
    extends graphql.QueryOptions<Query$getAchievementGroup> {
  Options$Query$getAchievementGroup({
    String? operationName,
    required Variables$Query$getAchievementGroup variables,
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
          document: documentNodeQuerygetAchievementGroup,
          parserFn: _parserFn$Query$getAchievementGroup,
        );
}

class WatchOptions$Query$getAchievementGroup
    extends graphql.WatchQueryOptions<Query$getAchievementGroup> {
  WatchOptions$Query$getAchievementGroup({
    String? operationName,
    required Variables$Query$getAchievementGroup variables,
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
          document: documentNodeQuerygetAchievementGroup,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getAchievementGroup,
        );
}

class FetchMoreOptions$Query$getAchievementGroup
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getAchievementGroup({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getAchievementGroup variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetAchievementGroup,
        );
}

extension ClientExtension$Query$getAchievementGroup on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getAchievementGroup>>
      query$getAchievementGroup(
              Options$Query$getAchievementGroup options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getAchievementGroup>
      watchQuery$getAchievementGroup(
              WatchOptions$Query$getAchievementGroup options) =>
          this.watchQuery(options);
  void writeQuery$getAchievementGroup({
    required Query$getAchievementGroup data,
    required Variables$Query$getAchievementGroup variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetAchievementGroup),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getAchievementGroup? readQuery$getAchievementGroup({
    required Variables$Query$getAchievementGroup variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetAchievementGroup),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getAchievementGroup.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getAchievementGroup>
    useQuery$getAchievementGroup(Options$Query$getAchievementGroup options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getAchievementGroup>
    useWatchQuery$getAchievementGroup(
            WatchOptions$Query$getAchievementGroup options) =>
        graphql_flutter.useWatchQuery(options);

class Query$getAchievementGroup$Widget
    extends graphql_flutter.Query<Query$getAchievementGroup> {
  Query$getAchievementGroup$Widget({
    widgets.Key? key,
    required Options$Query$getAchievementGroup options,
    required graphql_flutter.QueryBuilder<Query$getAchievementGroup> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getPendingAchievements {
  Query$getPendingAchievements({
    required this.pendingAchievements,
    required this.$__typename,
  });

  factory Query$getPendingAchievements.fromJson(Map<String, dynamic> json) {
    final l$pendingAchievements = json['pendingAchievements'];
    final l$$__typename = json['__typename'];
    return Query$getPendingAchievements(
      pendingAchievements: (l$pendingAchievements as List<dynamic>)
          .map((e) => Fragment$AchievementTitleImage.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$AchievementTitleImage> pendingAchievements;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pendingAchievements = pendingAchievements;
    _resultData['pendingAchievements'] =
        l$pendingAchievements.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pendingAchievements = pendingAchievements;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$pendingAchievements.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getPendingAchievements) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pendingAchievements = pendingAchievements;
    final lOther$pendingAchievements = other.pendingAchievements;
    if (l$pendingAchievements.length != lOther$pendingAchievements.length) {
      return false;
    }
    for (int i = 0; i < l$pendingAchievements.length; i++) {
      final l$pendingAchievements$entry = l$pendingAchievements[i];
      final lOther$pendingAchievements$entry = lOther$pendingAchievements[i];
      if (l$pendingAchievements$entry != lOther$pendingAchievements$entry) {
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

extension UtilityExtension$Query$getPendingAchievements
    on Query$getPendingAchievements {
  CopyWith$Query$getPendingAchievements<Query$getPendingAchievements>
      get copyWith => CopyWith$Query$getPendingAchievements(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getPendingAchievements<TRes> {
  factory CopyWith$Query$getPendingAchievements(
    Query$getPendingAchievements instance,
    TRes Function(Query$getPendingAchievements) then,
  ) = _CopyWithImpl$Query$getPendingAchievements;

  factory CopyWith$Query$getPendingAchievements.stub(TRes res) =
      _CopyWithStubImpl$Query$getPendingAchievements;

  TRes call({
    List<Fragment$AchievementTitleImage>? pendingAchievements,
    String? $__typename,
  });
  TRes pendingAchievements(
      Iterable<Fragment$AchievementTitleImage> Function(
              Iterable<
                  CopyWith$Fragment$AchievementTitleImage<
                      Fragment$AchievementTitleImage>>)
          _fn);
}

class _CopyWithImpl$Query$getPendingAchievements<TRes>
    implements CopyWith$Query$getPendingAchievements<TRes> {
  _CopyWithImpl$Query$getPendingAchievements(
    this._instance,
    this._then,
  );

  final Query$getPendingAchievements _instance;

  final TRes Function(Query$getPendingAchievements) _then;

  static const _undefined = {};

  TRes call({
    Object? pendingAchievements = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getPendingAchievements(
        pendingAchievements:
            pendingAchievements == _undefined || pendingAchievements == null
                ? _instance.pendingAchievements
                : (pendingAchievements as List<Fragment$AchievementTitleImage>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes pendingAchievements(
          Iterable<Fragment$AchievementTitleImage> Function(
                  Iterable<
                      CopyWith$Fragment$AchievementTitleImage<
                          Fragment$AchievementTitleImage>>)
              _fn) =>
      call(
          pendingAchievements: _fn(_instance.pendingAchievements
              .map((e) => CopyWith$Fragment$AchievementTitleImage(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getPendingAchievements<TRes>
    implements CopyWith$Query$getPendingAchievements<TRes> {
  _CopyWithStubImpl$Query$getPendingAchievements(this._res);

  TRes _res;

  call({
    List<Fragment$AchievementTitleImage>? pendingAchievements,
    String? $__typename,
  }) =>
      _res;
  pendingAchievements(_fn) => _res;
}

const documentNodeQuerygetPendingAchievements = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getPendingAchievements'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'pendingAchievements'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'AchievementTitleImage'),
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
  fragmentDefinitionAchievementTitleImage,
]);
Query$getPendingAchievements _parserFn$Query$getPendingAchievements(
        Map<String, dynamic> data) =>
    Query$getPendingAchievements.fromJson(data);

class Options$Query$getPendingAchievements
    extends graphql.QueryOptions<Query$getPendingAchievements> {
  Options$Query$getPendingAchievements({
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
          document: documentNodeQuerygetPendingAchievements,
          parserFn: _parserFn$Query$getPendingAchievements,
        );
}

class WatchOptions$Query$getPendingAchievements
    extends graphql.WatchQueryOptions<Query$getPendingAchievements> {
  WatchOptions$Query$getPendingAchievements({
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
          document: documentNodeQuerygetPendingAchievements,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getPendingAchievements,
        );
}

class FetchMoreOptions$Query$getPendingAchievements
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getPendingAchievements(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetPendingAchievements,
        );
}

extension ClientExtension$Query$getPendingAchievements
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getPendingAchievements>>
      query$getPendingAchievements(
              [Options$Query$getPendingAchievements? options]) async =>
          await this.query(options ?? Options$Query$getPendingAchievements());
  graphql.ObservableQuery<
      Query$getPendingAchievements> watchQuery$getPendingAchievements(
          [WatchOptions$Query$getPendingAchievements? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getPendingAchievements());
  void writeQuery$getPendingAchievements({
    required Query$getPendingAchievements data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQuerygetPendingAchievements)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getPendingAchievements? readQuery$getPendingAchievements(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetPendingAchievements)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getPendingAchievements.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getPendingAchievements>
    useQuery$getPendingAchievements(
            [Options$Query$getPendingAchievements? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$getPendingAchievements());
graphql.ObservableQuery<Query$getPendingAchievements>
    useWatchQuery$getPendingAchievements(
            [WatchOptions$Query$getPendingAchievements? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$getPendingAchievements());

class Query$getPendingAchievements$Widget
    extends graphql_flutter.Query<Query$getPendingAchievements> {
  Query$getPendingAchievements$Widget({
    widgets.Key? key,
    Options$Query$getPendingAchievements? options,
    required graphql_flutter.QueryBuilder<Query$getPendingAchievements> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$getPendingAchievements(),
          builder: builder,
        );
}

class Variables$Mutation$confirmAchievement {
  factory Variables$Mutation$confirmAchievement({required String id}) =>
      Variables$Mutation$confirmAchievement._({
        r'id': id,
      });

  Variables$Mutation$confirmAchievement._(this._$data);

  factory Variables$Mutation$confirmAchievement.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$confirmAchievement._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$confirmAchievement<
          Variables$Mutation$confirmAchievement>
      get copyWith => CopyWith$Variables$Mutation$confirmAchievement(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$confirmAchievement) ||
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

abstract class CopyWith$Variables$Mutation$confirmAchievement<TRes> {
  factory CopyWith$Variables$Mutation$confirmAchievement(
    Variables$Mutation$confirmAchievement instance,
    TRes Function(Variables$Mutation$confirmAchievement) then,
  ) = _CopyWithImpl$Variables$Mutation$confirmAchievement;

  factory CopyWith$Variables$Mutation$confirmAchievement.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$confirmAchievement;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$confirmAchievement<TRes>
    implements CopyWith$Variables$Mutation$confirmAchievement<TRes> {
  _CopyWithImpl$Variables$Mutation$confirmAchievement(
    this._instance,
    this._then,
  );

  final Variables$Mutation$confirmAchievement _instance;

  final TRes Function(Variables$Mutation$confirmAchievement) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$confirmAchievement._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$confirmAchievement<TRes>
    implements CopyWith$Variables$Mutation$confirmAchievement<TRes> {
  _CopyWithStubImpl$Variables$Mutation$confirmAchievement(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$confirmAchievement {
  Mutation$confirmAchievement({
    required this.confirmAchievement,
    required this.$__typename,
  });

  factory Mutation$confirmAchievement.fromJson(Map<String, dynamic> json) {
    final l$confirmAchievement = json['confirmAchievement'];
    final l$$__typename = json['__typename'];
    return Mutation$confirmAchievement(
      confirmAchievement:
          Mutation$confirmAchievement$confirmAchievement.fromJson(
              (l$confirmAchievement as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$confirmAchievement$confirmAchievement confirmAchievement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$confirmAchievement = confirmAchievement;
    _resultData['confirmAchievement'] = l$confirmAchievement.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$confirmAchievement = confirmAchievement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$confirmAchievement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$confirmAchievement) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$confirmAchievement = confirmAchievement;
    final lOther$confirmAchievement = other.confirmAchievement;
    if (l$confirmAchievement != lOther$confirmAchievement) {
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

extension UtilityExtension$Mutation$confirmAchievement
    on Mutation$confirmAchievement {
  CopyWith$Mutation$confirmAchievement<Mutation$confirmAchievement>
      get copyWith => CopyWith$Mutation$confirmAchievement(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$confirmAchievement<TRes> {
  factory CopyWith$Mutation$confirmAchievement(
    Mutation$confirmAchievement instance,
    TRes Function(Mutation$confirmAchievement) then,
  ) = _CopyWithImpl$Mutation$confirmAchievement;

  factory CopyWith$Mutation$confirmAchievement.stub(TRes res) =
      _CopyWithStubImpl$Mutation$confirmAchievement;

  TRes call({
    Mutation$confirmAchievement$confirmAchievement? confirmAchievement,
    String? $__typename,
  });
  CopyWith$Mutation$confirmAchievement$confirmAchievement<TRes>
      get confirmAchievement;
}

class _CopyWithImpl$Mutation$confirmAchievement<TRes>
    implements CopyWith$Mutation$confirmAchievement<TRes> {
  _CopyWithImpl$Mutation$confirmAchievement(
    this._instance,
    this._then,
  );

  final Mutation$confirmAchievement _instance;

  final TRes Function(Mutation$confirmAchievement) _then;

  static const _undefined = {};

  TRes call({
    Object? confirmAchievement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$confirmAchievement(
        confirmAchievement:
            confirmAchievement == _undefined || confirmAchievement == null
                ? _instance.confirmAchievement
                : (confirmAchievement
                    as Mutation$confirmAchievement$confirmAchievement),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$confirmAchievement$confirmAchievement<TRes>
      get confirmAchievement {
    final local$confirmAchievement = _instance.confirmAchievement;
    return CopyWith$Mutation$confirmAchievement$confirmAchievement(
        local$confirmAchievement, (e) => call(confirmAchievement: e));
  }
}

class _CopyWithStubImpl$Mutation$confirmAchievement<TRes>
    implements CopyWith$Mutation$confirmAchievement<TRes> {
  _CopyWithStubImpl$Mutation$confirmAchievement(this._res);

  TRes _res;

  call({
    Mutation$confirmAchievement$confirmAchievement? confirmAchievement,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$confirmAchievement$confirmAchievement<TRes>
      get confirmAchievement =>
          CopyWith$Mutation$confirmAchievement$confirmAchievement.stub(_res);
}

const documentNodeMutationconfirmAchievement = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'confirmAchievement'),
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
        name: NameNode(value: 'confirmAchievement'),
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
            name: NameNode(value: 'success'),
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
Mutation$confirmAchievement _parserFn$Mutation$confirmAchievement(
        Map<String, dynamic> data) =>
    Mutation$confirmAchievement.fromJson(data);
typedef OnMutationCompleted$Mutation$confirmAchievement = FutureOr<void>
    Function(
  dynamic,
  Mutation$confirmAchievement?,
);

class Options$Mutation$confirmAchievement
    extends graphql.MutationOptions<Mutation$confirmAchievement> {
  Options$Mutation$confirmAchievement({
    String? operationName,
    required Variables$Mutation$confirmAchievement variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$confirmAchievement? onCompleted,
    graphql.OnMutationUpdate<Mutation$confirmAchievement>? update,
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
                        : _parserFn$Mutation$confirmAchievement(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationconfirmAchievement,
          parserFn: _parserFn$Mutation$confirmAchievement,
        );

  final OnMutationCompleted$Mutation$confirmAchievement? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$confirmAchievement
    extends graphql.WatchQueryOptions<Mutation$confirmAchievement> {
  WatchOptions$Mutation$confirmAchievement({
    String? operationName,
    required Variables$Mutation$confirmAchievement variables,
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
          document: documentNodeMutationconfirmAchievement,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$confirmAchievement,
        );
}

extension ClientExtension$Mutation$confirmAchievement on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$confirmAchievement>>
      mutate$confirmAchievement(
              Options$Mutation$confirmAchievement options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$confirmAchievement>
      watchMutation$confirmAchievement(
              WatchOptions$Mutation$confirmAchievement options) =>
          this.watchMutation(options);
}

class Mutation$confirmAchievement$HookResult {
  Mutation$confirmAchievement$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$confirmAchievement runMutation;

  final graphql.QueryResult<Mutation$confirmAchievement> result;
}

Mutation$confirmAchievement$HookResult useMutation$confirmAchievement(
    [WidgetOptions$Mutation$confirmAchievement? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$confirmAchievement());
  return Mutation$confirmAchievement$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$confirmAchievement>
    useWatchMutation$confirmAchievement(
            WatchOptions$Mutation$confirmAchievement options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$confirmAchievement
    extends graphql.MutationOptions<Mutation$confirmAchievement> {
  WidgetOptions$Mutation$confirmAchievement({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$confirmAchievement? onCompleted,
    graphql.OnMutationUpdate<Mutation$confirmAchievement>? update,
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
                        : _parserFn$Mutation$confirmAchievement(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationconfirmAchievement,
          parserFn: _parserFn$Mutation$confirmAchievement,
        );

  final OnMutationCompleted$Mutation$confirmAchievement? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$confirmAchievement
    = graphql.MultiSourceResult<Mutation$confirmAchievement> Function(
  Variables$Mutation$confirmAchievement, {
  Object? optimisticResult,
});
typedef Builder$Mutation$confirmAchievement = widgets.Widget Function(
  RunMutation$Mutation$confirmAchievement,
  graphql.QueryResult<Mutation$confirmAchievement>?,
);

class Mutation$confirmAchievement$Widget
    extends graphql_flutter.Mutation<Mutation$confirmAchievement> {
  Mutation$confirmAchievement$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$confirmAchievement? options,
    required Builder$Mutation$confirmAchievement builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$confirmAchievement(),
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

class Mutation$confirmAchievement$confirmAchievement {
  Mutation$confirmAchievement$confirmAchievement({
    required this.success,
    required this.$__typename,
  });

  factory Mutation$confirmAchievement$confirmAchievement.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$$__typename = json['__typename'];
    return Mutation$confirmAchievement$confirmAchievement(
      success: (l$success as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool success;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$confirmAchievement$confirmAchievement) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
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

extension UtilityExtension$Mutation$confirmAchievement$confirmAchievement
    on Mutation$confirmAchievement$confirmAchievement {
  CopyWith$Mutation$confirmAchievement$confirmAchievement<
          Mutation$confirmAchievement$confirmAchievement>
      get copyWith => CopyWith$Mutation$confirmAchievement$confirmAchievement(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$confirmAchievement$confirmAchievement<TRes> {
  factory CopyWith$Mutation$confirmAchievement$confirmAchievement(
    Mutation$confirmAchievement$confirmAchievement instance,
    TRes Function(Mutation$confirmAchievement$confirmAchievement) then,
  ) = _CopyWithImpl$Mutation$confirmAchievement$confirmAchievement;

  factory CopyWith$Mutation$confirmAchievement$confirmAchievement.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$confirmAchievement$confirmAchievement;

  TRes call({
    bool? success,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$confirmAchievement$confirmAchievement<TRes>
    implements CopyWith$Mutation$confirmAchievement$confirmAchievement<TRes> {
  _CopyWithImpl$Mutation$confirmAchievement$confirmAchievement(
    this._instance,
    this._then,
  );

  final Mutation$confirmAchievement$confirmAchievement _instance;

  final TRes Function(Mutation$confirmAchievement$confirmAchievement) _then;

  static const _undefined = {};

  TRes call({
    Object? success = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$confirmAchievement$confirmAchievement(
        success: success == _undefined || success == null
            ? _instance.success
            : (success as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$confirmAchievement$confirmAchievement<TRes>
    implements CopyWith$Mutation$confirmAchievement$confirmAchievement<TRes> {
  _CopyWithStubImpl$Mutation$confirmAchievement$confirmAchievement(this._res);

  TRes _res;

  call({
    bool? success,
    String? $__typename,
  }) =>
      _res;
}
