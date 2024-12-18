// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_flags.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeatureFlags _$FeatureFlagsFromJson(Map<String, dynamic> json) {
  return _FeatureFlags.fromJson(json);
}

/// @nodoc
mixin _$FeatureFlags {
  List<String> get variants =>
      throw _privateConstructorUsedError; // For kids-mobile
  bool get kidsAuth => throw _privateConstructorUsedError;
  bool get publicSignup => throw _privateConstructorUsedError;
  bool get socialSignup =>
      throw _privateConstructorUsedError; // For bccm-mobile
  bool get shorts => throw _privateConstructorUsedError;
  bool get shortsHideBeta => throw _privateConstructorUsedError;
  bool get shortsGuide => throw _privateConstructorUsedError;
  bool get disableNpawShorts => throw _privateConstructorUsedError;
  bool get skipToChapter => throw _privateConstructorUsedError;
  bool get bccmAudioTest => throw _privateConstructorUsedError;
  bool get shortsWithScores => throw _privateConstructorUsedError;
  bool get elasticSearch => throw _privateConstructorUsedError;
  bool get chapterSlider => throw _privateConstructorUsedError;

  /// Serializes this FeatureFlags to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeatureFlags
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeatureFlagsCopyWith<FeatureFlags> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureFlagsCopyWith<$Res> {
  factory $FeatureFlagsCopyWith(
          FeatureFlags value, $Res Function(FeatureFlags) then) =
      _$FeatureFlagsCopyWithImpl<$Res, FeatureFlags>;
  @useResult
  $Res call(
      {List<String> variants,
      bool kidsAuth,
      bool publicSignup,
      bool socialSignup,
      bool shorts,
      bool shortsHideBeta,
      bool shortsGuide,
      bool disableNpawShorts,
      bool skipToChapter,
      bool bccmAudioTest,
      bool shortsWithScores,
      bool elasticSearch,
      bool chapterSlider});
}

/// @nodoc
class _$FeatureFlagsCopyWithImpl<$Res, $Val extends FeatureFlags>
    implements $FeatureFlagsCopyWith<$Res> {
  _$FeatureFlagsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeatureFlags
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variants = null,
    Object? kidsAuth = null,
    Object? publicSignup = null,
    Object? socialSignup = null,
    Object? shorts = null,
    Object? shortsHideBeta = null,
    Object? shortsGuide = null,
    Object? disableNpawShorts = null,
    Object? skipToChapter = null,
    Object? bccmAudioTest = null,
    Object? shortsWithScores = null,
    Object? elasticSearch = null,
    Object? chapterSlider = null,
  }) {
    return _then(_value.copyWith(
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      kidsAuth: null == kidsAuth
          ? _value.kidsAuth
          : kidsAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      publicSignup: null == publicSignup
          ? _value.publicSignup
          : publicSignup // ignore: cast_nullable_to_non_nullable
              as bool,
      socialSignup: null == socialSignup
          ? _value.socialSignup
          : socialSignup // ignore: cast_nullable_to_non_nullable
              as bool,
      shorts: null == shorts
          ? _value.shorts
          : shorts // ignore: cast_nullable_to_non_nullable
              as bool,
      shortsHideBeta: null == shortsHideBeta
          ? _value.shortsHideBeta
          : shortsHideBeta // ignore: cast_nullable_to_non_nullable
              as bool,
      shortsGuide: null == shortsGuide
          ? _value.shortsGuide
          : shortsGuide // ignore: cast_nullable_to_non_nullable
              as bool,
      disableNpawShorts: null == disableNpawShorts
          ? _value.disableNpawShorts
          : disableNpawShorts // ignore: cast_nullable_to_non_nullable
              as bool,
      skipToChapter: null == skipToChapter
          ? _value.skipToChapter
          : skipToChapter // ignore: cast_nullable_to_non_nullable
              as bool,
      bccmAudioTest: null == bccmAudioTest
          ? _value.bccmAudioTest
          : bccmAudioTest // ignore: cast_nullable_to_non_nullable
              as bool,
      shortsWithScores: null == shortsWithScores
          ? _value.shortsWithScores
          : shortsWithScores // ignore: cast_nullable_to_non_nullable
              as bool,
      elasticSearch: null == elasticSearch
          ? _value.elasticSearch
          : elasticSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      chapterSlider: null == chapterSlider
          ? _value.chapterSlider
          : chapterSlider // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureFlagsImplCopyWith<$Res>
    implements $FeatureFlagsCopyWith<$Res> {
  factory _$$FeatureFlagsImplCopyWith(
          _$FeatureFlagsImpl value, $Res Function(_$FeatureFlagsImpl) then) =
      __$$FeatureFlagsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> variants,
      bool kidsAuth,
      bool publicSignup,
      bool socialSignup,
      bool shorts,
      bool shortsHideBeta,
      bool shortsGuide,
      bool disableNpawShorts,
      bool skipToChapter,
      bool bccmAudioTest,
      bool shortsWithScores,
      bool elasticSearch,
      bool chapterSlider});
}

/// @nodoc
class __$$FeatureFlagsImplCopyWithImpl<$Res>
    extends _$FeatureFlagsCopyWithImpl<$Res, _$FeatureFlagsImpl>
    implements _$$FeatureFlagsImplCopyWith<$Res> {
  __$$FeatureFlagsImplCopyWithImpl(
      _$FeatureFlagsImpl _value, $Res Function(_$FeatureFlagsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeatureFlags
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variants = null,
    Object? kidsAuth = null,
    Object? publicSignup = null,
    Object? socialSignup = null,
    Object? shorts = null,
    Object? shortsHideBeta = null,
    Object? shortsGuide = null,
    Object? disableNpawShorts = null,
    Object? skipToChapter = null,
    Object? bccmAudioTest = null,
    Object? shortsWithScores = null,
    Object? elasticSearch = null,
    Object? chapterSlider = null,
  }) {
    return _then(_$FeatureFlagsImpl(
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      kidsAuth: null == kidsAuth
          ? _value.kidsAuth
          : kidsAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      publicSignup: null == publicSignup
          ? _value.publicSignup
          : publicSignup // ignore: cast_nullable_to_non_nullable
              as bool,
      socialSignup: null == socialSignup
          ? _value.socialSignup
          : socialSignup // ignore: cast_nullable_to_non_nullable
              as bool,
      shorts: null == shorts
          ? _value.shorts
          : shorts // ignore: cast_nullable_to_non_nullable
              as bool,
      shortsHideBeta: null == shortsHideBeta
          ? _value.shortsHideBeta
          : shortsHideBeta // ignore: cast_nullable_to_non_nullable
              as bool,
      shortsGuide: null == shortsGuide
          ? _value.shortsGuide
          : shortsGuide // ignore: cast_nullable_to_non_nullable
              as bool,
      disableNpawShorts: null == disableNpawShorts
          ? _value.disableNpawShorts
          : disableNpawShorts // ignore: cast_nullable_to_non_nullable
              as bool,
      skipToChapter: null == skipToChapter
          ? _value.skipToChapter
          : skipToChapter // ignore: cast_nullable_to_non_nullable
              as bool,
      bccmAudioTest: null == bccmAudioTest
          ? _value.bccmAudioTest
          : bccmAudioTest // ignore: cast_nullable_to_non_nullable
              as bool,
      shortsWithScores: null == shortsWithScores
          ? _value.shortsWithScores
          : shortsWithScores // ignore: cast_nullable_to_non_nullable
              as bool,
      elasticSearch: null == elasticSearch
          ? _value.elasticSearch
          : elasticSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      chapterSlider: null == chapterSlider
          ? _value.chapterSlider
          : chapterSlider // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureFlagsImpl extends _FeatureFlags {
  const _$FeatureFlagsImpl(
      {final List<String> variants = const [],
      this.kidsAuth = false,
      this.publicSignup = false,
      this.socialSignup = false,
      this.shorts = false,
      this.shortsHideBeta = false,
      this.shortsGuide = false,
      this.disableNpawShorts = false,
      this.skipToChapter = false,
      this.bccmAudioTest = false,
      this.shortsWithScores = false,
      this.elasticSearch = false,
      this.chapterSlider = false})
      : _variants = variants,
        super._();

  factory _$FeatureFlagsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureFlagsImplFromJson(json);

  final List<String> _variants;
  @override
  @JsonKey()
  List<String> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

// For kids-mobile
  @override
  @JsonKey()
  final bool kidsAuth;
  @override
  @JsonKey()
  final bool publicSignup;
  @override
  @JsonKey()
  final bool socialSignup;
// For bccm-mobile
  @override
  @JsonKey()
  final bool shorts;
  @override
  @JsonKey()
  final bool shortsHideBeta;
  @override
  @JsonKey()
  final bool shortsGuide;
  @override
  @JsonKey()
  final bool disableNpawShorts;
  @override
  @JsonKey()
  final bool skipToChapter;
  @override
  @JsonKey()
  final bool bccmAudioTest;
  @override
  @JsonKey()
  final bool shortsWithScores;
  @override
  @JsonKey()
  final bool elasticSearch;
  @override
  @JsonKey()
  final bool chapterSlider;

  @override
  String toString() {
    return 'FeatureFlags(variants: $variants, kidsAuth: $kidsAuth, publicSignup: $publicSignup, socialSignup: $socialSignup, shorts: $shorts, shortsHideBeta: $shortsHideBeta, shortsGuide: $shortsGuide, disableNpawShorts: $disableNpawShorts, skipToChapter: $skipToChapter, bccmAudioTest: $bccmAudioTest, shortsWithScores: $shortsWithScores, elasticSearch: $elasticSearch, chapterSlider: $chapterSlider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureFlagsImpl &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            (identical(other.kidsAuth, kidsAuth) ||
                other.kidsAuth == kidsAuth) &&
            (identical(other.publicSignup, publicSignup) ||
                other.publicSignup == publicSignup) &&
            (identical(other.socialSignup, socialSignup) ||
                other.socialSignup == socialSignup) &&
            (identical(other.shorts, shorts) || other.shorts == shorts) &&
            (identical(other.shortsHideBeta, shortsHideBeta) ||
                other.shortsHideBeta == shortsHideBeta) &&
            (identical(other.shortsGuide, shortsGuide) ||
                other.shortsGuide == shortsGuide) &&
            (identical(other.disableNpawShorts, disableNpawShorts) ||
                other.disableNpawShorts == disableNpawShorts) &&
            (identical(other.skipToChapter, skipToChapter) ||
                other.skipToChapter == skipToChapter) &&
            (identical(other.bccmAudioTest, bccmAudioTest) ||
                other.bccmAudioTest == bccmAudioTest) &&
            (identical(other.shortsWithScores, shortsWithScores) ||
                other.shortsWithScores == shortsWithScores) &&
            (identical(other.elasticSearch, elasticSearch) ||
                other.elasticSearch == elasticSearch) &&
            (identical(other.chapterSlider, chapterSlider) ||
                other.chapterSlider == chapterSlider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_variants),
      kidsAuth,
      publicSignup,
      socialSignup,
      shorts,
      shortsHideBeta,
      shortsGuide,
      disableNpawShorts,
      skipToChapter,
      bccmAudioTest,
      shortsWithScores,
      elasticSearch,
      chapterSlider);

  /// Create a copy of FeatureFlags
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureFlagsImplCopyWith<_$FeatureFlagsImpl> get copyWith =>
      __$$FeatureFlagsImplCopyWithImpl<_$FeatureFlagsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureFlagsImplToJson(
      this,
    );
  }
}

abstract class _FeatureFlags extends FeatureFlags {
  const factory _FeatureFlags(
      {final List<String> variants,
      final bool kidsAuth,
      final bool publicSignup,
      final bool socialSignup,
      final bool shorts,
      final bool shortsHideBeta,
      final bool shortsGuide,
      final bool disableNpawShorts,
      final bool skipToChapter,
      final bool bccmAudioTest,
      final bool shortsWithScores,
      final bool elasticSearch,
      final bool chapterSlider}) = _$FeatureFlagsImpl;
  const _FeatureFlags._() : super._();

  factory _FeatureFlags.fromJson(Map<String, dynamic> json) =
      _$FeatureFlagsImpl.fromJson;

  @override
  List<String> get variants; // For kids-mobile
  @override
  bool get kidsAuth;
  @override
  bool get publicSignup;
  @override
  bool get socialSignup; // For bccm-mobile
  @override
  bool get shorts;
  @override
  bool get shortsHideBeta;
  @override
  bool get shortsGuide;
  @override
  bool get disableNpawShorts;
  @override
  bool get skipToChapter;
  @override
  bool get bccmAudioTest;
  @override
  bool get shortsWithScores;
  @override
  bool get elasticSearch;
  @override
  bool get chapterSlider;

  /// Create a copy of FeatureFlags
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeatureFlagsImplCopyWith<_$FeatureFlagsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
