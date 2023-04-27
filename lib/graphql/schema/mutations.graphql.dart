class Input$BirthOptions {
  factory Input$BirthOptions({required int year}) => Input$BirthOptions._({
        r'year': year,
      });

  Input$BirthOptions._(this._$data);

  factory Input$BirthOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$year = data['year'];
    result$data['year'] = (l$year as int);
    return Input$BirthOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  int get year => (_$data['year'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$year = year;
    result$data['year'] = l$year;
    return result$data;
  }

  CopyWith$Input$BirthOptions<Input$BirthOptions> get copyWith =>
      CopyWith$Input$BirthOptions(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$BirthOptions) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$year = year;
    return Object.hashAll([l$year]);
  }
}

abstract class CopyWith$Input$BirthOptions<TRes> {
  factory CopyWith$Input$BirthOptions(
    Input$BirthOptions instance,
    TRes Function(Input$BirthOptions) then,
  ) = _CopyWithImpl$Input$BirthOptions;

  factory CopyWith$Input$BirthOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$BirthOptions;

  TRes call({int? year});
}

class _CopyWithImpl$Input$BirthOptions<TRes>
    implements CopyWith$Input$BirthOptions<TRes> {
  _CopyWithImpl$Input$BirthOptions(
    this._instance,
    this._then,
  );

  final Input$BirthOptions _instance;

  final TRes Function(Input$BirthOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? year = _undefined}) => _then(Input$BirthOptions._({
        ..._instance._$data,
        if (year != _undefined && year != null) 'year': (year as int),
      }));
}

class _CopyWithStubImpl$Input$BirthOptions<TRes>
    implements CopyWith$Input$BirthOptions<TRes> {
  _CopyWithStubImpl$Input$BirthOptions(this._res);

  TRes _res;

  call({int? year}) => _res;
}

class Input$NameOptions {
  factory Input$NameOptions({
    required String first,
    required String last,
  }) =>
      Input$NameOptions._({
        r'first': first,
        r'last': last,
      });

  Input$NameOptions._(this._$data);

  factory Input$NameOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$first = data['first'];
    result$data['first'] = (l$first as String);
    final l$last = data['last'];
    result$data['last'] = (l$last as String);
    return Input$NameOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  String get first => (_$data['first'] as String);
  String get last => (_$data['last'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$first = first;
    result$data['first'] = l$first;
    final l$last = last;
    result$data['last'] = l$last;
    return result$data;
  }

  CopyWith$Input$NameOptions<Input$NameOptions> get copyWith =>
      CopyWith$Input$NameOptions(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$NameOptions) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
      return false;
    }
    final l$last = last;
    final lOther$last = other.last;
    if (l$last != lOther$last) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$last = last;
    return Object.hashAll([
      l$first,
      l$last,
    ]);
  }
}

abstract class CopyWith$Input$NameOptions<TRes> {
  factory CopyWith$Input$NameOptions(
    Input$NameOptions instance,
    TRes Function(Input$NameOptions) then,
  ) = _CopyWithImpl$Input$NameOptions;

  factory CopyWith$Input$NameOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$NameOptions;

  TRes call({
    String? first,
    String? last,
  });
}

class _CopyWithImpl$Input$NameOptions<TRes>
    implements CopyWith$Input$NameOptions<TRes> {
  _CopyWithImpl$Input$NameOptions(
    this._instance,
    this._then,
  );

  final Input$NameOptions _instance;

  final TRes Function(Input$NameOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? last = _undefined,
  }) =>
      _then(Input$NameOptions._({
        ..._instance._$data,
        if (first != _undefined && first != null) 'first': (first as String),
        if (last != _undefined && last != null) 'last': (last as String),
      }));
}

class _CopyWithStubImpl$Input$NameOptions<TRes>
    implements CopyWith$Input$NameOptions<TRes> {
  _CopyWithStubImpl$Input$NameOptions(this._res);

  TRes _res;

  call({
    String? first,
    String? last,
  }) =>
      _res;
}
