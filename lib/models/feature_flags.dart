import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_flags.freezed.dart';
part 'feature_flags.g.dart';

@freezed
sealed class FeatureFlags with _$FeatureFlags {
  const FeatureFlags._();

  const factory FeatureFlags({
    required List<String> variants,
    required bool auth,
    required bool publicSignup,
    required bool socialSignup,
    required bool autoplayNext,
    required bool shareVideoButton,
    required bool flutterPlayerControls,
    required bool playNextButton,
    required bool chapters,
    required bool chaptersFirstTab,
    required bool download,
    required bool shorts,
    required bool shortsSourceButtonPrimary,
    required bool shortsSharing,
    required bool shortsHideAutoGenerated,
    required bool shortsHideBeta,
    required bool shortsGuide,
    required bool disableNpawShorts,
  }) = _FeatureFlags;

  factory FeatureFlags.fromJson(Map<String, dynamic> json) => _$FeatureFlagsFromJson(json);

  /// If the value is true in the original, then the value is always true
  ///
  /// Basically just a bunch of || operators
  FeatureFlags mergeWithTrueAlwaysWins(FeatureFlags newFlags) {
    return FeatureFlags(
      variants: newFlags.variants,
      auth: auth || newFlags.auth,
      publicSignup: publicSignup || newFlags.publicSignup,
      socialSignup: socialSignup || newFlags.socialSignup,
      autoplayNext: autoplayNext || newFlags.autoplayNext,
      shareVideoButton: shareVideoButton || newFlags.shareVideoButton,
      flutterPlayerControls: flutterPlayerControls || newFlags.flutterPlayerControls,
      playNextButton: playNextButton || newFlags.playNextButton,
      chapters: chapters || newFlags.chapters,
      chaptersFirstTab: chaptersFirstTab || newFlags.chaptersFirstTab,
      download: download || newFlags.download,
      shorts: shorts || newFlags.shorts,
      shortsSourceButtonPrimary: shortsSourceButtonPrimary || newFlags.shortsSourceButtonPrimary,
      shortsSharing: shortsSharing || newFlags.shortsSharing,
      shortsHideAutoGenerated: shortsHideAutoGenerated || newFlags.shortsHideAutoGenerated,
      shortsHideBeta: shortsHideBeta || newFlags.shortsHideBeta,
      shortsGuide: shortsGuide || newFlags.shortsGuide,
      disableNpawShorts: disableNpawShorts || newFlags.disableNpawShorts,
    );
  }
}
