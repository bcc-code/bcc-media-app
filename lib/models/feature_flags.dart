import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_flags.freezed.dart';
part 'feature_flags.g.dart';

@freezed
sealed class FeatureFlags with _$FeatureFlags {
  const FeatureFlags._();

  const factory FeatureFlags({
    @Default([]) List<String> variants,
    // For kids-mobile
    @Default(false) bool kidsAuth,
    @Default(false) bool publicSignup,
    @Default(false) bool socialSignup,
    // For bccm-mobile
    @Default(false) bool shorts,
    @Default(false) bool shortsHideBeta,
    @Default(false) bool shortsGuide,
    @Default(false) bool disableNpawShorts,
    @Default(false) bool skipToChapter,
    @Default(false) bool bccmAudioTest,
    @Default(false) bool shortsWithScores,
    @Default(false) bool elasticSearch,
    @Default(false) bool chapterSlider,
    @Default(false) bool showBmmStreak,
  }) = _FeatureFlags;

  factory FeatureFlags.fromJson(Map<String, dynamic> json) => _$FeatureFlagsFromJson(json);

  /// If the value is true in the original, then the value is always true
  ///
  /// Basically just a bunch of || operators
  FeatureFlags mergeWithTrueAlwaysWins(FeatureFlags newFlags) {
    return FeatureFlags(
      variants: newFlags.variants,
      kidsAuth: newFlags.kidsAuth || kidsAuth,
      publicSignup: newFlags.publicSignup || publicSignup,
      socialSignup: newFlags.socialSignup || socialSignup,
      shorts: newFlags.shorts || shorts,
      shortsHideBeta: newFlags.shortsHideBeta || shortsHideBeta,
      shortsGuide: newFlags.shortsGuide || shortsGuide,
      disableNpawShorts: newFlags.disableNpawShorts || disableNpawShorts,
      skipToChapter: newFlags.skipToChapter || skipToChapter,
      bccmAudioTest: newFlags.bccmAudioTest || bccmAudioTest,
      shortsWithScores: newFlags.shortsWithScores || shortsWithScores,
      elasticSearch: newFlags.elasticSearch || elasticSearch,
      chapterSlider: newFlags.chapterSlider || chapterSlider,
      showBmmStreak: newFlags.showBmmStreak || showBmmStreak,
    );
  }
}
