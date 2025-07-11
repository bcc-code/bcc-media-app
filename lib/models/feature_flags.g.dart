// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_flags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureFlagsImpl _$$FeatureFlagsImplFromJson(Map<String, dynamic> json) =>
    _$FeatureFlagsImpl(
      variants: (json['variants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      kidsAuth: json['kidsAuth'] as bool? ?? false,
      publicSignup: json['publicSignup'] as bool? ?? false,
      socialSignup: json['socialSignup'] as bool? ?? false,
      shorts: json['shorts'] as bool? ?? false,
      shortsHideBeta: json['shortsHideBeta'] as bool? ?? false,
      shortsGuide: json['shortsGuide'] as bool? ?? false,
      disableNpawShorts: json['disableNpawShorts'] as bool? ?? false,
      skipToChapter: json['skipToChapter'] as bool? ?? false,
      bccmAudioTest: json['bccmAudioTest'] as bool? ?? false,
      shortsWithScores: json['shortsWithScores'] as bool? ?? false,
      elasticSearch: json['elasticSearch'] as bool? ?? false,
      chapterSlider: json['chapterSlider'] as bool? ?? false,
      showBmmStreak: json['showBmmStreak'] as bool? ?? false,
      kidsMoreNorwegianContent:
          json['kidsMoreNorwegianContent'] as bool? ?? false,
      kidsNotificationPrompt: json['kidsNotificationPrompt'] as bool? ?? false,
      kidsNotificationPromptPosition:
          (json['kidsNotificationPromptPosition'] as num?)?.toInt(),
      kidsNotificationPromptAfterDismissal:
          json['kidsNotificationPromptAfterDismissal'] as bool? ?? false,
      kidsNotificationPromptAfterDismissalCount:
          (json['kidsNotificationPromptAfterDismissalCount'] as num?)?.toInt(),
      kidsDonationLink: json['kidsDonationLink'] as bool? ?? false,
    );

Map<String, dynamic> _$$FeatureFlagsImplToJson(_$FeatureFlagsImpl instance) =>
    <String, dynamic>{
      'variants': instance.variants,
      'kidsAuth': instance.kidsAuth,
      'publicSignup': instance.publicSignup,
      'socialSignup': instance.socialSignup,
      'shorts': instance.shorts,
      'shortsHideBeta': instance.shortsHideBeta,
      'shortsGuide': instance.shortsGuide,
      'disableNpawShorts': instance.disableNpawShorts,
      'skipToChapter': instance.skipToChapter,
      'bccmAudioTest': instance.bccmAudioTest,
      'shortsWithScores': instance.shortsWithScores,
      'elasticSearch': instance.elasticSearch,
      'chapterSlider': instance.chapterSlider,
      'showBmmStreak': instance.showBmmStreak,
      'kidsMoreNorwegianContent': instance.kidsMoreNorwegianContent,
      'kidsNotificationPrompt': instance.kidsNotificationPrompt,
      'kidsNotificationPromptPosition': instance.kidsNotificationPromptPosition,
      'kidsNotificationPromptAfterDismissal':
          instance.kidsNotificationPromptAfterDismissal,
      'kidsNotificationPromptAfterDismissalCount':
          instance.kidsNotificationPromptAfterDismissalCount,
      'kidsDonationLink': instance.kidsDonationLink,
    };
