import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_flags.freezed.dart';
part 'feature_flags.g.dart';

@freezed
sealed class FeatureFlags with _$FeatureFlags {
  const FeatureFlags._();

  const factory FeatureFlags({
    @Default([]) List<String> variants,
    // For kids-mobile
    @Default(false) bool publicSignup,
    @Default(false) bool socialSignup,
    // For bccm-mobile
    @Default(false) bool shorts,
    @Default(false) bool shortsHideBeta,
    @Default(false) bool shortsGuide,
    @Default(false) bool disableNpawShorts,
    @Default(false) bool kidsNotificationPrompt,
    int? kidsNotificationPromptPosition,
    @Default(false) bool kidsNotificationPromptAfterDismissal,
    int? kidsNotificationPromptAfterDismissalCount,
    @Default(false) bool kidsDonationLink,
  }) = _FeatureFlags;

  factory FeatureFlags.fromJson(Map<String, dynamic> json) => _$FeatureFlagsFromJson(json);

  /// If the value is true in the original, then the value is always true
  ///
  /// Basically just a bunch of || operators
  FeatureFlags mergeWithTrueAlwaysWins(FeatureFlags newFlags) {
    return FeatureFlags(
      variants: newFlags.variants,
      publicSignup: newFlags.publicSignup || publicSignup,
      socialSignup: newFlags.socialSignup || socialSignup,
      shorts: newFlags.shorts || shorts,
      shortsHideBeta: newFlags.shortsHideBeta || shortsHideBeta,
      shortsGuide: newFlags.shortsGuide || shortsGuide,
      disableNpawShorts: newFlags.disableNpawShorts || disableNpawShorts,
      kidsNotificationPrompt: newFlags.kidsNotificationPrompt || kidsNotificationPrompt,
      kidsNotificationPromptPosition: newFlags.kidsNotificationPromptPosition ?? kidsNotificationPromptPosition,
      kidsNotificationPromptAfterDismissal: newFlags.kidsNotificationPromptAfterDismissal || kidsNotificationPromptAfterDismissal,
      kidsNotificationPromptAfterDismissalCount: newFlags.kidsNotificationPromptAfterDismissalCount ?? kidsNotificationPromptAfterDismissalCount,
      kidsDonationLink: newFlags.kidsDonationLink || kidsDonationLink,
    );
  }
}
