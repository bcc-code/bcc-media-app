// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_flags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureFlagsImpl _$$FeatureFlagsImplFromJson(Map<String, dynamic> json) =>
    _$FeatureFlagsImpl(
      variants:
          (json['variants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publicSignup: json['publicSignup'] as bool? ?? false,
      socialSignup: json['socialSignup'] as bool? ?? false,
      shorts: json['shorts'] as bool? ?? false,
      shortsHideBeta: json['shortsHideBeta'] as bool? ?? false,
      shortsGuide: json['shortsGuide'] as bool? ?? false,
      disableNpawShorts: json['disableNpawShorts'] as bool? ?? false,
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
      'publicSignup': instance.publicSignup,
      'socialSignup': instance.socialSignup,
      'shorts': instance.shorts,
      'shortsHideBeta': instance.shortsHideBeta,
      'shortsGuide': instance.shortsGuide,
      'disableNpawShorts': instance.disableNpawShorts,
      'kidsNotificationPrompt': instance.kidsNotificationPrompt,
      'kidsNotificationPromptPosition': instance.kidsNotificationPromptPosition,
      'kidsNotificationPromptAfterDismissal':
          instance.kidsNotificationPromptAfterDismissal,
      'kidsNotificationPromptAfterDismissalCount':
          instance.kidsNotificationPromptAfterDismissalCount,
      'kidsDonationLink': instance.kidsDonationLink,
    };
