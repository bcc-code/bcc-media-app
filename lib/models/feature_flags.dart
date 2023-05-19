import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_flags.freezed.dart';

@freezed
class FeatureFlags with _$FeatureFlags {
  const FeatureFlags._();

  const factory FeatureFlags({
    @Default(true) bool auth,
    @Default(false) bool publicSignup,
    @Default(false) bool socialSignup,
    @Default(false) bool autoplayNext,
    @Default(true) bool shareVideoButton,
  }) = _FeatureFlags;
}
