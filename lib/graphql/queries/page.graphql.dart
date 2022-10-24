import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$ItemSection {
  Fragment$ItemSection({
    this.title,
    required this.items,
    required this.$__typename,
  });

  factory Fragment$ItemSection.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSection(
      title: (l$title as String?),
      items: Fragment$ItemSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String? title;

  final Fragment$ItemSection$items items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$items,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSection) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
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

extension UtilityExtension$Fragment$ItemSection on Fragment$ItemSection {
  CopyWith$Fragment$ItemSection<Fragment$ItemSection> get copyWith =>
      CopyWith$Fragment$ItemSection(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ItemSection<TRes> {
  factory CopyWith$Fragment$ItemSection(
    Fragment$ItemSection instance,
    TRes Function(Fragment$ItemSection) then,
  ) = _CopyWithImpl$Fragment$ItemSection;

  factory CopyWith$Fragment$ItemSection.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSection;

  TRes call({
    String? title,
    Fragment$ItemSection$items? items,
    String? $__typename,
  });
  CopyWith$Fragment$ItemSection$items<TRes> get items;
}

class _CopyWithImpl$Fragment$ItemSection<TRes>
    implements CopyWith$Fragment$ItemSection<TRes> {
  _CopyWithImpl$Fragment$ItemSection(
    this._instance,
    this._then,
  );

  final Fragment$ItemSection _instance;

  final TRes Function(Fragment$ItemSection) _then;

  static const _undefined = {};

  TRes call({
    Object? title = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ItemSection(
        title: title == _undefined ? _instance.title : (title as String?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Fragment$ItemSection$items),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$ItemSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Fragment$ItemSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Fragment$ItemSection<TRes>
    implements CopyWith$Fragment$ItemSection<TRes> {
  _CopyWithStubImpl$Fragment$ItemSection(this._res);

  TRes _res;

  call({
    String? title,
    Fragment$ItemSection$items? items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$ItemSection$items<TRes> get items =>
      CopyWith$Fragment$ItemSection$items.stub(_res);
}

const fragmentDefinitionItemSection = FragmentDefinitionNode(
  name: NameNode(value: 'ItemSection'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ItemSection'),
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
);
const documentNodeFragmentItemSection = DocumentNode(definitions: [
  fragmentDefinitionItemSection,
  fragmentDefinitionItemSectionItem,
]);

extension ClientExtension$Fragment$ItemSection on graphql.GraphQLClient {
  void writeFragment$ItemSection({
    required Fragment$ItemSection data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ItemSection',
            document: documentNodeFragmentItemSection,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ItemSection? readFragment$ItemSection({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ItemSection',
          document: documentNodeFragmentItemSection,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ItemSection.fromJson(result);
  }
}

class Fragment$ItemSection$items {
  Fragment$ItemSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Fragment$ItemSection$items.fromJson(Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Fragment$ItemSection$items) ||
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

extension UtilityExtension$Fragment$ItemSection$items
    on Fragment$ItemSection$items {
  CopyWith$Fragment$ItemSection$items<Fragment$ItemSection$items>
      get copyWith => CopyWith$Fragment$ItemSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSection$items<TRes> {
  factory CopyWith$Fragment$ItemSection$items(
    Fragment$ItemSection$items instance,
    TRes Function(Fragment$ItemSection$items) then,
  ) = _CopyWithImpl$Fragment$ItemSection$items;

  factory CopyWith$Fragment$ItemSection$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Fragment$ItemSection$items<TRes>
    implements CopyWith$Fragment$ItemSection$items<TRes> {
  _CopyWithImpl$Fragment$ItemSection$items(
    this._instance,
    this._then,
  );

  final Fragment$ItemSection$items _instance;

  final TRes Function(Fragment$ItemSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ItemSection$items(
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

class _CopyWithStubImpl$Fragment$ItemSection$items<TRes>
    implements CopyWith$Fragment$ItemSection$items<TRes> {
  _CopyWithStubImpl$Fragment$ItemSection$items(this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Fragment$ItemSectionItem {
  Fragment$ItemSectionItem({
    required this.id,
    required this.sort,
    required this.title,
    this.image,
    this.item,
    required this.$__typename,
  });

  factory Fragment$ItemSectionItem.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$sort = json['sort'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$item = json['item'];
    final l$$__typename = json['__typename'];
    return Fragment$ItemSectionItem(
      id: (l$id as String),
      sort: (l$sort as int),
      title: (l$title as String),
      image: (l$image as String?),
      item: l$item == null
          ? null
          : Fragment$ItemSectionItem$item.fromJson(
              (l$item as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int sort;

  final String title;

  final String? image;

  final Fragment$ItemSectionItem$item? item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$sort = sort;
    _resultData['sort'] = l$sort;
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
    final l$sort = sort;
    final l$title = title;
    final l$image = image;
    final l$item = item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$sort,
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
    if (!(other is Fragment$ItemSectionItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$sort = sort;
    final lOther$sort = other.sort;
    if (l$sort != lOther$sort) {
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

extension UtilityExtension$Fragment$ItemSectionItem
    on Fragment$ItemSectionItem {
  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem> get copyWith =>
      CopyWith$Fragment$ItemSectionItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ItemSectionItem<TRes> {
  factory CopyWith$Fragment$ItemSectionItem(
    Fragment$ItemSectionItem instance,
    TRes Function(Fragment$ItemSectionItem) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem;

  factory CopyWith$Fragment$ItemSectionItem.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem;

  TRes call({
    String? id,
    int? sort,
    String? title,
    String? image,
    Fragment$ItemSectionItem$item? item,
    String? $__typename,
  });
  CopyWith$Fragment$ItemSectionItem$item<TRes> get item;
}

class _CopyWithImpl$Fragment$ItemSectionItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem _instance;

  final TRes Function(Fragment$ItemSectionItem) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? sort = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ItemSectionItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        sort:
            sort == _undefined || sort == null ? _instance.sort : (sort as int),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        item: item == _undefined
            ? _instance.item
            : (item as Fragment$ItemSectionItem$item?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$ItemSectionItem$item<TRes> get item {
    final local$item = _instance.item;
    return local$item == null
        ? CopyWith$Fragment$ItemSectionItem$item.stub(_then(_instance))
        : CopyWith$Fragment$ItemSectionItem$item(
            local$item, (e) => call(item: e));
  }
}

class _CopyWithStubImpl$Fragment$ItemSectionItem<TRes>
    implements CopyWith$Fragment$ItemSectionItem<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem(this._res);

  TRes _res;

  call({
    String? id,
    int? sort,
    String? title,
    String? image,
    Fragment$ItemSectionItem$item? item,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$ItemSectionItem$item<TRes> get item =>
      CopyWith$Fragment$ItemSectionItem$item.stub(_res);
}

const fragmentDefinitionItemSectionItem = FragmentDefinitionNode(
  name: NameNode(value: 'ItemSectionItem'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'SectionItem'),
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
      name: NameNode(value: 'sort'),
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
            name: NameNode(value: 'Episode'),
            isNonNull: false,
          )),
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
              name: NameNode(value: 'episodeCount'),
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
const documentNodeFragmentItemSectionItem = DocumentNode(definitions: [
  fragmentDefinitionItemSectionItem,
]);

extension ClientExtension$Fragment$ItemSectionItem on graphql.GraphQLClient {
  void writeFragment$ItemSectionItem({
    required Fragment$ItemSectionItem data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ItemSectionItem',
            document: documentNodeFragmentItemSectionItem,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ItemSectionItem? readFragment$ItemSectionItem({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ItemSectionItem',
          document: documentNodeFragmentItemSectionItem,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ItemSectionItem.fromJson(result);
  }
}

class Fragment$ItemSectionItem$item {
  Fragment$ItemSectionItem$item({required this.$__typename});

  factory Fragment$ItemSectionItem$item.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "Episode":
        return Fragment$ItemSectionItem$item$$Episode.fromJson(json);

      case "Show":
        return Fragment$ItemSectionItem$item$$Show.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$ItemSectionItem$item(
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
    if (!(other is Fragment$ItemSectionItem$item) ||
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

extension UtilityExtension$Fragment$ItemSectionItem$item
    on Fragment$ItemSectionItem$item {
  CopyWith$Fragment$ItemSectionItem$item<Fragment$ItemSectionItem$item>
      get copyWith => CopyWith$Fragment$ItemSectionItem$item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSectionItem$item<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$item(
    Fragment$ItemSectionItem$item instance,
    TRes Function(Fragment$ItemSectionItem$item) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem$item;

  factory CopyWith$Fragment$ItemSectionItem$item.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$item;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$ItemSectionItem$item<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$item(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem$item _instance;

  final TRes Function(Fragment$ItemSectionItem$item) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Fragment$ItemSectionItem$item(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$item<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$item(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Fragment$ItemSectionItem$item$$Episode
    implements Fragment$ItemSectionItem$item {
  Fragment$ItemSectionItem$item$$Episode({
    required this.$__typename,
    this.number,
  });

  factory Fragment$ItemSectionItem$item$$Episode.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$number = json['number'];
    return Fragment$ItemSectionItem$item$$Episode(
      $__typename: (l$$__typename as String),
      number: (l$number as int?),
    );
  }

  final String $__typename;

  final int? number;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$number = number;
    return Object.hashAll([
      l$$__typename,
      l$number,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$item$$Episode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ItemSectionItem$item$$Episode
    on Fragment$ItemSectionItem$item$$Episode {
  CopyWith$Fragment$ItemSectionItem$item$$Episode<
          Fragment$ItemSectionItem$item$$Episode>
      get copyWith => CopyWith$Fragment$ItemSectionItem$item$$Episode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSectionItem$item$$Episode<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$item$$Episode(
    Fragment$ItemSectionItem$item$$Episode instance,
    TRes Function(Fragment$ItemSectionItem$item$$Episode) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem$item$$Episode;

  factory CopyWith$Fragment$ItemSectionItem$item$$Episode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Episode;

  TRes call({
    String? $__typename,
    int? number,
  });
}

class _CopyWithImpl$Fragment$ItemSectionItem$item$$Episode<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Episode<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$item$$Episode(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem$item$$Episode _instance;

  final TRes Function(Fragment$ItemSectionItem$item$$Episode) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Fragment$ItemSectionItem$item$$Episode(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        number: number == _undefined ? _instance.number : (number as int?),
      ));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Episode<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Episode<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Episode(this._res);

  TRes _res;

  call({
    String? $__typename,
    int? number,
  }) =>
      _res;
}

class Fragment$ItemSectionItem$item$$Show
    implements Fragment$ItemSectionItem$item {
  Fragment$ItemSectionItem$item$$Show({
    required this.$__typename,
    required this.episodeCount,
  });

  factory Fragment$ItemSectionItem$item$$Show.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$episodeCount = json['episodeCount'];
    return Fragment$ItemSectionItem$item$$Show(
      $__typename: (l$$__typename as String),
      episodeCount: (l$episodeCount as int),
    );
  }

  final String $__typename;

  final int episodeCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$episodeCount = episodeCount;
    _resultData['episodeCount'] = l$episodeCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$episodeCount = episodeCount;
    return Object.hashAll([
      l$$__typename,
      l$episodeCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ItemSectionItem$item$$Show) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$episodeCount = episodeCount;
    final lOther$episodeCount = other.episodeCount;
    if (l$episodeCount != lOther$episodeCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ItemSectionItem$item$$Show
    on Fragment$ItemSectionItem$item$$Show {
  CopyWith$Fragment$ItemSectionItem$item$$Show<
          Fragment$ItemSectionItem$item$$Show>
      get copyWith => CopyWith$Fragment$ItemSectionItem$item$$Show(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ItemSectionItem$item$$Show<TRes> {
  factory CopyWith$Fragment$ItemSectionItem$item$$Show(
    Fragment$ItemSectionItem$item$$Show instance,
    TRes Function(Fragment$ItemSectionItem$item$$Show) then,
  ) = _CopyWithImpl$Fragment$ItemSectionItem$item$$Show;

  factory CopyWith$Fragment$ItemSectionItem$item$$Show.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Show;

  TRes call({
    String? $__typename,
    int? episodeCount,
  });
}

class _CopyWithImpl$Fragment$ItemSectionItem$item$$Show<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Show<TRes> {
  _CopyWithImpl$Fragment$ItemSectionItem$item$$Show(
    this._instance,
    this._then,
  );

  final Fragment$ItemSectionItem$item$$Show _instance;

  final TRes Function(Fragment$ItemSectionItem$item$$Show) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? episodeCount = _undefined,
  }) =>
      _then(Fragment$ItemSectionItem$item$$Show(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        episodeCount: episodeCount == _undefined || episodeCount == null
            ? _instance.episodeCount
            : (episodeCount as int),
      ));
}

class _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Show<TRes>
    implements CopyWith$Fragment$ItemSectionItem$item$$Show<TRes> {
  _CopyWithStubImpl$Fragment$ItemSectionItem$item$$Show(this._res);

  TRes _res;

  call({
    String? $__typename,
    int? episodeCount,
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
                    name: NameNode(value: 'ItemSection'),
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
  fragmentDefinitionItemSection,
  fragmentDefinitionItemSectionItem,
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
          .map((e) => Query$Page$page$sections$items.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Page$page$sections$items> items;

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
    List<Query$Page$page$sections$items>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Query$Page$page$sections$items> Function(
              Iterable<
                  CopyWith$Query$Page$page$sections$items<
                      Query$Page$page$sections$items>>)
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
            : (items as List<Query$Page$page$sections$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes items(
          Iterable<Query$Page$page$sections$items> Function(
                  Iterable<
                      CopyWith$Query$Page$page$sections$items<
                          Query$Page$page$sections$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items
              .map((e) => CopyWith$Query$Page$page$sections$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$Page$page$sections<TRes>
    implements CopyWith$Query$Page$page$sections<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections(this._res);

  TRes _res;

  call({
    List<Query$Page$page$sections$items>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$Page$page$sections$items {
  Query$Page$page$sections$items({required this.$__typename});

  factory Query$Page$page$sections$items.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "PosterSection":
        return Query$Page$page$sections$items$$PosterSection.fromJson(json);

      case "FeaturedSection":
        return Query$Page$page$sections$items$$FeaturedSection.fromJson(json);

      case "DefaultSection":
        return Query$Page$page$sections$items$$DefaultSection.fromJson(json);

      case "DefaultGridSection":
        return Query$Page$page$sections$items$$DefaultGridSection.fromJson(
            json);

      case "PosterGridSection":
        return Query$Page$page$sections$items$$PosterGridSection.fromJson(json);

      case "IconSection":
        return Query$Page$page$sections$items$$IconSection.fromJson(json);

      case "LabelSection":
        return Query$Page$page$sections$items$$LabelSection.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$Page$page$sections$items(
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
    if (!(other is Query$Page$page$sections$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items
    on Query$Page$page$sections$items {
  CopyWith$Query$Page$page$sections$items<Query$Page$page$sections$items>
      get copyWith => CopyWith$Query$Page$page$sections$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items<TRes> {
  factory CopyWith$Query$Page$page$sections$items(
    Query$Page$page$sections$items instance,
    TRes Function(Query$Page$page$sections$items) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items;

  factory CopyWith$Query$Page$page$sections$items.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$Page$page$sections$items<TRes>
    implements CopyWith$Query$Page$page$sections$items<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items _instance;

  final TRes Function(Query$Page$page$sections$items) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$Page$page$sections$items(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$Page$page$sections$items<TRes>
    implements CopyWith$Query$Page$page$sections$items<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$Page$page$sections$items$$PosterSection
    implements Fragment$ItemSection, Query$Page$page$sections$items {
  Query$Page$page$sections$items$$PosterSection({
    required this.$__typename,
    this.title,
    required this.items,
  });

  factory Query$Page$page$sections$items$$PosterSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$title = json['title'];
    final l$items = json['items'];
    return Query$Page$page$sections$items$$PosterSection(
      $__typename: (l$$__typename as String),
      title: (l$title as String?),
      items: Query$Page$page$sections$items$$PosterSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String? title;

  final Query$Page$page$sections$items$$PosterSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$title = title;
    final l$items = items;
    return Object.hashAll([
      l$$__typename,
      l$title,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page$sections$items$$PosterSection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$Page$page$sections$items$$PosterSection
    on Query$Page$page$sections$items$$PosterSection {
  CopyWith$Query$Page$page$sections$items$$PosterSection<
          Query$Page$page$sections$items$$PosterSection>
      get copyWith => CopyWith$Query$Page$page$sections$items$$PosterSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$PosterSection<TRes> {
  factory CopyWith$Query$Page$page$sections$items$$PosterSection(
    Query$Page$page$sections$items$$PosterSection instance,
    TRes Function(Query$Page$page$sections$items$$PosterSection) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$PosterSection;

  factory CopyWith$Query$Page$page$sections$items$$PosterSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$PosterSection;

  TRes call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$PosterSection$items? items,
  });
  CopyWith$Query$Page$page$sections$items$$PosterSection$items<TRes> get items;
}

class _CopyWithImpl$Query$Page$page$sections$items$$PosterSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$PosterSection<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$PosterSection(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$PosterSection _instance;

  final TRes Function(Query$Page$page$sections$items$$PosterSection) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? title = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$PosterSection(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        title: title == _undefined ? _instance.title : (title as String?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Query$Page$page$sections$items$$PosterSection$items),
      ));
  CopyWith$Query$Page$page$sections$items$$PosterSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$Page$page$sections$items$$PosterSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$Page$page$sections$items$$PosterSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$PosterSection<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$PosterSection(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$PosterSection$items? items,
  }) =>
      _res;
  CopyWith$Query$Page$page$sections$items$$PosterSection$items<TRes>
      get items =>
          CopyWith$Query$Page$page$sections$items$$PosterSection$items.stub(
              _res);
}

class Query$Page$page$sections$items$$PosterSection$items
    implements Fragment$ItemSection$items {
  Query$Page$page$sections$items$$PosterSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Query$Page$page$sections$items$$PosterSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections$items$$PosterSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Query$Page$page$sections$items$$PosterSection$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items$$PosterSection$items
    on Query$Page$page$sections$items$$PosterSection$items {
  CopyWith$Query$Page$page$sections$items$$PosterSection$items<
          Query$Page$page$sections$items$$PosterSection$items>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$PosterSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$PosterSection$items<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$PosterSection$items(
    Query$Page$page$sections$items$$PosterSection$items instance,
    TRes Function(Query$Page$page$sections$items$$PosterSection$items) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$PosterSection$items;

  factory CopyWith$Query$Page$page$sections$items$$PosterSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$PosterSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections$items$$PosterSection$items<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$PosterSection$items<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$PosterSection$items(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$PosterSection$items _instance;

  final TRes Function(Query$Page$page$sections$items$$PosterSection$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$PosterSection$items(
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

class _CopyWithStubImpl$Query$Page$page$sections$items$$PosterSection$items<
        TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$PosterSection$items<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$PosterSection$items(
      this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$Page$page$sections$items$$FeaturedSection
    implements Fragment$ItemSection, Query$Page$page$sections$items {
  Query$Page$page$sections$items$$FeaturedSection({
    required this.$__typename,
    this.title,
    required this.items,
  });

  factory Query$Page$page$sections$items$$FeaturedSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$title = json['title'];
    final l$items = json['items'];
    return Query$Page$page$sections$items$$FeaturedSection(
      $__typename: (l$$__typename as String),
      title: (l$title as String?),
      items: Query$Page$page$sections$items$$FeaturedSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String? title;

  final Query$Page$page$sections$items$$FeaturedSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$title = title;
    final l$items = items;
    return Object.hashAll([
      l$$__typename,
      l$title,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page$sections$items$$FeaturedSection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$Page$page$sections$items$$FeaturedSection
    on Query$Page$page$sections$items$$FeaturedSection {
  CopyWith$Query$Page$page$sections$items$$FeaturedSection<
          Query$Page$page$sections$items$$FeaturedSection>
      get copyWith => CopyWith$Query$Page$page$sections$items$$FeaturedSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$FeaturedSection<TRes> {
  factory CopyWith$Query$Page$page$sections$items$$FeaturedSection(
    Query$Page$page$sections$items$$FeaturedSection instance,
    TRes Function(Query$Page$page$sections$items$$FeaturedSection) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$FeaturedSection;

  factory CopyWith$Query$Page$page$sections$items$$FeaturedSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$FeaturedSection;

  TRes call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$FeaturedSection$items? items,
  });
  CopyWith$Query$Page$page$sections$items$$FeaturedSection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$Page$page$sections$items$$FeaturedSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$FeaturedSection<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$FeaturedSection(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$FeaturedSection _instance;

  final TRes Function(Query$Page$page$sections$items$$FeaturedSection) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? title = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$FeaturedSection(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        title: title == _undefined ? _instance.title : (title as String?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Query$Page$page$sections$items$$FeaturedSection$items),
      ));
  CopyWith$Query$Page$page$sections$items$$FeaturedSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$Page$page$sections$items$$FeaturedSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$Page$page$sections$items$$FeaturedSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$FeaturedSection<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$FeaturedSection(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$FeaturedSection$items? items,
  }) =>
      _res;
  CopyWith$Query$Page$page$sections$items$$FeaturedSection$items<TRes>
      get items =>
          CopyWith$Query$Page$page$sections$items$$FeaturedSection$items.stub(
              _res);
}

class Query$Page$page$sections$items$$FeaturedSection$items
    implements Fragment$ItemSection$items {
  Query$Page$page$sections$items$$FeaturedSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Query$Page$page$sections$items$$FeaturedSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections$items$$FeaturedSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Query$Page$page$sections$items$$FeaturedSection$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items$$FeaturedSection$items
    on Query$Page$page$sections$items$$FeaturedSection$items {
  CopyWith$Query$Page$page$sections$items$$FeaturedSection$items<
          Query$Page$page$sections$items$$FeaturedSection$items>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$FeaturedSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$FeaturedSection$items<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$FeaturedSection$items(
    Query$Page$page$sections$items$$FeaturedSection$items instance,
    TRes Function(Query$Page$page$sections$items$$FeaturedSection$items) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$FeaturedSection$items;

  factory CopyWith$Query$Page$page$sections$items$$FeaturedSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$FeaturedSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections$items$$FeaturedSection$items<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$FeaturedSection$items<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$FeaturedSection$items(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$FeaturedSection$items _instance;

  final TRes Function(Query$Page$page$sections$items$$FeaturedSection$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$FeaturedSection$items(
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

class _CopyWithStubImpl$Query$Page$page$sections$items$$FeaturedSection$items<
        TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$FeaturedSection$items<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$FeaturedSection$items(
      this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$Page$page$sections$items$$DefaultSection
    implements Fragment$ItemSection, Query$Page$page$sections$items {
  Query$Page$page$sections$items$$DefaultSection({
    required this.$__typename,
    this.title,
    required this.items,
  });

  factory Query$Page$page$sections$items$$DefaultSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$title = json['title'];
    final l$items = json['items'];
    return Query$Page$page$sections$items$$DefaultSection(
      $__typename: (l$$__typename as String),
      title: (l$title as String?),
      items: Query$Page$page$sections$items$$DefaultSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String? title;

  final Query$Page$page$sections$items$$DefaultSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$title = title;
    final l$items = items;
    return Object.hashAll([
      l$$__typename,
      l$title,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page$sections$items$$DefaultSection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$Page$page$sections$items$$DefaultSection
    on Query$Page$page$sections$items$$DefaultSection {
  CopyWith$Query$Page$page$sections$items$$DefaultSection<
          Query$Page$page$sections$items$$DefaultSection>
      get copyWith => CopyWith$Query$Page$page$sections$items$$DefaultSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$DefaultSection<TRes> {
  factory CopyWith$Query$Page$page$sections$items$$DefaultSection(
    Query$Page$page$sections$items$$DefaultSection instance,
    TRes Function(Query$Page$page$sections$items$$DefaultSection) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$DefaultSection;

  factory CopyWith$Query$Page$page$sections$items$$DefaultSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultSection;

  TRes call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$DefaultSection$items? items,
  });
  CopyWith$Query$Page$page$sections$items$$DefaultSection$items<TRes> get items;
}

class _CopyWithImpl$Query$Page$page$sections$items$$DefaultSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$DefaultSection<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$DefaultSection(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$DefaultSection _instance;

  final TRes Function(Query$Page$page$sections$items$$DefaultSection) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? title = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$DefaultSection(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        title: title == _undefined ? _instance.title : (title as String?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Query$Page$page$sections$items$$DefaultSection$items),
      ));
  CopyWith$Query$Page$page$sections$items$$DefaultSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$Page$page$sections$items$$DefaultSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$DefaultSection<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultSection(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$DefaultSection$items? items,
  }) =>
      _res;
  CopyWith$Query$Page$page$sections$items$$DefaultSection$items<TRes>
      get items =>
          CopyWith$Query$Page$page$sections$items$$DefaultSection$items.stub(
              _res);
}

class Query$Page$page$sections$items$$DefaultSection$items
    implements Fragment$ItemSection$items {
  Query$Page$page$sections$items$$DefaultSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Query$Page$page$sections$items$$DefaultSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections$items$$DefaultSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Query$Page$page$sections$items$$DefaultSection$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items$$DefaultSection$items
    on Query$Page$page$sections$items$$DefaultSection$items {
  CopyWith$Query$Page$page$sections$items$$DefaultSection$items<
          Query$Page$page$sections$items$$DefaultSection$items>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$DefaultSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$DefaultSection$items<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$DefaultSection$items(
    Query$Page$page$sections$items$$DefaultSection$items instance,
    TRes Function(Query$Page$page$sections$items$$DefaultSection$items) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$DefaultSection$items;

  factory CopyWith$Query$Page$page$sections$items$$DefaultSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections$items$$DefaultSection$items<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$DefaultSection$items<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$DefaultSection$items(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$DefaultSection$items _instance;

  final TRes Function(Query$Page$page$sections$items$$DefaultSection$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$DefaultSection$items(
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

class _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultSection$items<
        TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$DefaultSection$items<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultSection$items(
      this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$Page$page$sections$items$$DefaultGridSection
    implements Fragment$ItemSection, Query$Page$page$sections$items {
  Query$Page$page$sections$items$$DefaultGridSection({
    required this.$__typename,
    this.title,
    required this.items,
  });

  factory Query$Page$page$sections$items$$DefaultGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$title = json['title'];
    final l$items = json['items'];
    return Query$Page$page$sections$items$$DefaultGridSection(
      $__typename: (l$$__typename as String),
      title: (l$title as String?),
      items: Query$Page$page$sections$items$$DefaultGridSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String? title;

  final Query$Page$page$sections$items$$DefaultGridSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$title = title;
    final l$items = items;
    return Object.hashAll([
      l$$__typename,
      l$title,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page$sections$items$$DefaultGridSection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$Page$page$sections$items$$DefaultGridSection
    on Query$Page$page$sections$items$$DefaultGridSection {
  CopyWith$Query$Page$page$sections$items$$DefaultGridSection<
          Query$Page$page$sections$items$$DefaultGridSection>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$DefaultGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$DefaultGridSection<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$DefaultGridSection(
    Query$Page$page$sections$items$$DefaultGridSection instance,
    TRes Function(Query$Page$page$sections$items$$DefaultGridSection) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$DefaultGridSection;

  factory CopyWith$Query$Page$page$sections$items$$DefaultGridSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultGridSection;

  TRes call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$DefaultGridSection$items? items,
  });
  CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$Page$page$sections$items$$DefaultGridSection<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$DefaultGridSection<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$DefaultGridSection(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$DefaultGridSection _instance;

  final TRes Function(Query$Page$page$sections$items$$DefaultGridSection) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? title = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$DefaultGridSection(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        title: title == _undefined ? _instance.title : (title as String?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$Page$page$sections$items$$DefaultGridSection$items),
      ));
  CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultGridSection<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$DefaultGridSection<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultGridSection(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$DefaultGridSection$items? items,
  }) =>
      _res;
  CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items<TRes>
      get items =>
          CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items
              .stub(_res);
}

class Query$Page$page$sections$items$$DefaultGridSection$items
    implements Fragment$ItemSection$items {
  Query$Page$page$sections$items$$DefaultGridSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Query$Page$page$sections$items$$DefaultGridSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections$items$$DefaultGridSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Query$Page$page$sections$items$$DefaultGridSection$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items$$DefaultGridSection$items
    on Query$Page$page$sections$items$$DefaultGridSection$items {
  CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items<
          Query$Page$page$sections$items$$DefaultGridSection$items>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items(
    Query$Page$page$sections$items$$DefaultGridSection$items instance,
    TRes Function(Query$Page$page$sections$items$$DefaultGridSection$items)
        then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$DefaultGridSection$items;

  factory CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultGridSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections$items$$DefaultGridSection$items<
        TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items<
            TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$DefaultGridSection$items(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$DefaultGridSection$items _instance;

  final TRes Function(Query$Page$page$sections$items$$DefaultGridSection$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$DefaultGridSection$items(
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

class _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultGridSection$items<
        TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$DefaultGridSection$items<
            TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$DefaultGridSection$items(
      this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$Page$page$sections$items$$PosterGridSection
    implements Fragment$ItemSection, Query$Page$page$sections$items {
  Query$Page$page$sections$items$$PosterGridSection({
    required this.$__typename,
    this.title,
    required this.items,
  });

  factory Query$Page$page$sections$items$$PosterGridSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$title = json['title'];
    final l$items = json['items'];
    return Query$Page$page$sections$items$$PosterGridSection(
      $__typename: (l$$__typename as String),
      title: (l$title as String?),
      items: Query$Page$page$sections$items$$PosterGridSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String? title;

  final Query$Page$page$sections$items$$PosterGridSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$title = title;
    final l$items = items;
    return Object.hashAll([
      l$$__typename,
      l$title,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page$sections$items$$PosterGridSection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$Page$page$sections$items$$PosterGridSection
    on Query$Page$page$sections$items$$PosterGridSection {
  CopyWith$Query$Page$page$sections$items$$PosterGridSection<
          Query$Page$page$sections$items$$PosterGridSection>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$PosterGridSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$PosterGridSection<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$PosterGridSection(
    Query$Page$page$sections$items$$PosterGridSection instance,
    TRes Function(Query$Page$page$sections$items$$PosterGridSection) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$PosterGridSection;

  factory CopyWith$Query$Page$page$sections$items$$PosterGridSection.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$PosterGridSection;

  TRes call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$PosterGridSection$items? items,
  });
  CopyWith$Query$Page$page$sections$items$$PosterGridSection$items<TRes>
      get items;
}

class _CopyWithImpl$Query$Page$page$sections$items$$PosterGridSection<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$PosterGridSection<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$PosterGridSection(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$PosterGridSection _instance;

  final TRes Function(Query$Page$page$sections$items$$PosterGridSection) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? title = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$PosterGridSection(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        title: title == _undefined ? _instance.title : (title as String?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items
                as Query$Page$page$sections$items$$PosterGridSection$items),
      ));
  CopyWith$Query$Page$page$sections$items$$PosterGridSection$items<TRes>
      get items {
    final local$items = _instance.items;
    return CopyWith$Query$Page$page$sections$items$$PosterGridSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$Page$page$sections$items$$PosterGridSection<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$PosterGridSection<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$PosterGridSection(
      this._res);

  TRes _res;

  call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$PosterGridSection$items? items,
  }) =>
      _res;
  CopyWith$Query$Page$page$sections$items$$PosterGridSection$items<TRes>
      get items =>
          CopyWith$Query$Page$page$sections$items$$PosterGridSection$items.stub(
              _res);
}

class Query$Page$page$sections$items$$PosterGridSection$items
    implements Fragment$ItemSection$items {
  Query$Page$page$sections$items$$PosterGridSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Query$Page$page$sections$items$$PosterGridSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections$items$$PosterGridSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Query$Page$page$sections$items$$PosterGridSection$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items$$PosterGridSection$items
    on Query$Page$page$sections$items$$PosterGridSection$items {
  CopyWith$Query$Page$page$sections$items$$PosterGridSection$items<
          Query$Page$page$sections$items$$PosterGridSection$items>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$PosterGridSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$PosterGridSection$items<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$PosterGridSection$items(
    Query$Page$page$sections$items$$PosterGridSection$items instance,
    TRes Function(Query$Page$page$sections$items$$PosterGridSection$items) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$PosterGridSection$items;

  factory CopyWith$Query$Page$page$sections$items$$PosterGridSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$PosterGridSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections$items$$PosterGridSection$items<
        TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$PosterGridSection$items<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$PosterGridSection$items(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$PosterGridSection$items _instance;

  final TRes Function(Query$Page$page$sections$items$$PosterGridSection$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$PosterGridSection$items(
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

class _CopyWithStubImpl$Query$Page$page$sections$items$$PosterGridSection$items<
        TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$PosterGridSection$items<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$PosterGridSection$items(
      this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$Page$page$sections$items$$IconSection
    implements Fragment$ItemSection, Query$Page$page$sections$items {
  Query$Page$page$sections$items$$IconSection({
    required this.$__typename,
    this.title,
    required this.items,
  });

  factory Query$Page$page$sections$items$$IconSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$title = json['title'];
    final l$items = json['items'];
    return Query$Page$page$sections$items$$IconSection(
      $__typename: (l$$__typename as String),
      title: (l$title as String?),
      items: Query$Page$page$sections$items$$IconSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String? title;

  final Query$Page$page$sections$items$$IconSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$title = title;
    final l$items = items;
    return Object.hashAll([
      l$$__typename,
      l$title,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page$sections$items$$IconSection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$Page$page$sections$items$$IconSection
    on Query$Page$page$sections$items$$IconSection {
  CopyWith$Query$Page$page$sections$items$$IconSection<
          Query$Page$page$sections$items$$IconSection>
      get copyWith => CopyWith$Query$Page$page$sections$items$$IconSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$IconSection<TRes> {
  factory CopyWith$Query$Page$page$sections$items$$IconSection(
    Query$Page$page$sections$items$$IconSection instance,
    TRes Function(Query$Page$page$sections$items$$IconSection) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$IconSection;

  factory CopyWith$Query$Page$page$sections$items$$IconSection.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$IconSection;

  TRes call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$IconSection$items? items,
  });
  CopyWith$Query$Page$page$sections$items$$IconSection$items<TRes> get items;
}

class _CopyWithImpl$Query$Page$page$sections$items$$IconSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$IconSection<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$IconSection(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$IconSection _instance;

  final TRes Function(Query$Page$page$sections$items$$IconSection) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? title = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$IconSection(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        title: title == _undefined ? _instance.title : (title as String?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Query$Page$page$sections$items$$IconSection$items),
      ));
  CopyWith$Query$Page$page$sections$items$$IconSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$Page$page$sections$items$$IconSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$Page$page$sections$items$$IconSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$IconSection<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$IconSection(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$IconSection$items? items,
  }) =>
      _res;
  CopyWith$Query$Page$page$sections$items$$IconSection$items<TRes> get items =>
      CopyWith$Query$Page$page$sections$items$$IconSection$items.stub(_res);
}

class Query$Page$page$sections$items$$IconSection$items
    implements Fragment$ItemSection$items {
  Query$Page$page$sections$items$$IconSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Query$Page$page$sections$items$$IconSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections$items$$IconSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Query$Page$page$sections$items$$IconSection$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items$$IconSection$items
    on Query$Page$page$sections$items$$IconSection$items {
  CopyWith$Query$Page$page$sections$items$$IconSection$items<
          Query$Page$page$sections$items$$IconSection$items>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$IconSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$IconSection$items<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$IconSection$items(
    Query$Page$page$sections$items$$IconSection$items instance,
    TRes Function(Query$Page$page$sections$items$$IconSection$items) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$IconSection$items;

  factory CopyWith$Query$Page$page$sections$items$$IconSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$IconSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections$items$$IconSection$items<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$IconSection$items<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$IconSection$items(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$IconSection$items _instance;

  final TRes Function(Query$Page$page$sections$items$$IconSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$IconSection$items(
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

class _CopyWithStubImpl$Query$Page$page$sections$items$$IconSection$items<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$IconSection$items<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$IconSection$items(
      this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}

class Query$Page$page$sections$items$$LabelSection
    implements Fragment$ItemSection, Query$Page$page$sections$items {
  Query$Page$page$sections$items$$LabelSection({
    required this.$__typename,
    this.title,
    required this.items,
  });

  factory Query$Page$page$sections$items$$LabelSection.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$title = json['title'];
    final l$items = json['items'];
    return Query$Page$page$sections$items$$LabelSection(
      $__typename: (l$$__typename as String),
      title: (l$title as String?),
      items: Query$Page$page$sections$items$$LabelSection$items.fromJson(
          (l$items as Map<String, dynamic>)),
    );
  }

  final String $__typename;

  final String? title;

  final Query$Page$page$sections$items$$LabelSection$items items;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$items = items;
    _resultData['items'] = l$items.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$title = title;
    final l$items = items;
    return Object.hashAll([
      l$$__typename,
      l$title,
      l$items,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Page$page$sections$items$$LabelSection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Query$Page$page$sections$items$$LabelSection
    on Query$Page$page$sections$items$$LabelSection {
  CopyWith$Query$Page$page$sections$items$$LabelSection<
          Query$Page$page$sections$items$$LabelSection>
      get copyWith => CopyWith$Query$Page$page$sections$items$$LabelSection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$LabelSection<TRes> {
  factory CopyWith$Query$Page$page$sections$items$$LabelSection(
    Query$Page$page$sections$items$$LabelSection instance,
    TRes Function(Query$Page$page$sections$items$$LabelSection) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$LabelSection;

  factory CopyWith$Query$Page$page$sections$items$$LabelSection.stub(TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$LabelSection;

  TRes call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$LabelSection$items? items,
  });
  CopyWith$Query$Page$page$sections$items$$LabelSection$items<TRes> get items;
}

class _CopyWithImpl$Query$Page$page$sections$items$$LabelSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$LabelSection<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$LabelSection(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$LabelSection _instance;

  final TRes Function(Query$Page$page$sections$items$$LabelSection) _then;

  static const _undefined = {};

  TRes call({
    Object? $__typename = _undefined,
    Object? title = _undefined,
    Object? items = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$LabelSection(
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        title: title == _undefined ? _instance.title : (title as String?),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as Query$Page$page$sections$items$$LabelSection$items),
      ));
  CopyWith$Query$Page$page$sections$items$$LabelSection$items<TRes> get items {
    final local$items = _instance.items;
    return CopyWith$Query$Page$page$sections$items$$LabelSection$items(
        local$items, (e) => call(items: e));
  }
}

class _CopyWithStubImpl$Query$Page$page$sections$items$$LabelSection<TRes>
    implements CopyWith$Query$Page$page$sections$items$$LabelSection<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$LabelSection(this._res);

  TRes _res;

  call({
    String? $__typename,
    String? title,
    Query$Page$page$sections$items$$LabelSection$items? items,
  }) =>
      _res;
  CopyWith$Query$Page$page$sections$items$$LabelSection$items<TRes> get items =>
      CopyWith$Query$Page$page$sections$items$$LabelSection$items.stub(_res);
}

class Query$Page$page$sections$items$$LabelSection$items
    implements Fragment$ItemSection$items {
  Query$Page$page$sections$items$$LabelSection$items({
    required this.items,
    required this.$__typename,
  });

  factory Query$Page$page$sections$items$$LabelSection$items.fromJson(
      Map<String, dynamic> json) {
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$Page$page$sections$items$$LabelSection$items(
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ItemSectionItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ItemSectionItem> items;

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
    if (!(other is Query$Page$page$sections$items$$LabelSection$items) ||
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

extension UtilityExtension$Query$Page$page$sections$items$$LabelSection$items
    on Query$Page$page$sections$items$$LabelSection$items {
  CopyWith$Query$Page$page$sections$items$$LabelSection$items<
          Query$Page$page$sections$items$$LabelSection$items>
      get copyWith =>
          CopyWith$Query$Page$page$sections$items$$LabelSection$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Page$page$sections$items$$LabelSection$items<
    TRes> {
  factory CopyWith$Query$Page$page$sections$items$$LabelSection$items(
    Query$Page$page$sections$items$$LabelSection$items instance,
    TRes Function(Query$Page$page$sections$items$$LabelSection$items) then,
  ) = _CopyWithImpl$Query$Page$page$sections$items$$LabelSection$items;

  factory CopyWith$Query$Page$page$sections$items$$LabelSection$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$Page$page$sections$items$$LabelSection$items;

  TRes call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  });
  TRes items(
      Iterable<Fragment$ItemSectionItem> Function(
              Iterable<
                  CopyWith$Fragment$ItemSectionItem<Fragment$ItemSectionItem>>)
          _fn);
}

class _CopyWithImpl$Query$Page$page$sections$items$$LabelSection$items<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$LabelSection$items<TRes> {
  _CopyWithImpl$Query$Page$page$sections$items$$LabelSection$items(
    this._instance,
    this._then,
  );

  final Query$Page$page$sections$items$$LabelSection$items _instance;

  final TRes Function(Query$Page$page$sections$items$$LabelSection$items) _then;

  static const _undefined = {};

  TRes call({
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Page$page$sections$items$$LabelSection$items(
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

class _CopyWithStubImpl$Query$Page$page$sections$items$$LabelSection$items<TRes>
    implements
        CopyWith$Query$Page$page$sections$items$$LabelSection$items<TRes> {
  _CopyWithStubImpl$Query$Page$page$sections$items$$LabelSection$items(
      this._res);

  TRes _res;

  call({
    List<Fragment$ItemSectionItem>? items,
    String? $__typename,
  }) =>
      _res;
  items(_fn) => _res;
}
