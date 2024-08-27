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
      auth: json['auth'] as bool? ?? false,
      publicSignup: json['publicSignup'] as bool? ?? false,
      socialSignup: json['socialSignup'] as bool? ?? false,
      autoplayNext: json['autoplayNext'] as bool? ?? false,
      shareVideoButton: json['shareVideoButton'] as bool? ?? false,
      flutterPlayerControls: json['flutterPlayerControls'] as bool? ?? false,
      playNextButton: json['playNextButton'] as bool? ?? false,
      chapters: json['chapters'] as bool? ?? true,
      chaptersFirstTab: json['chaptersFirstTab'] as bool? ?? false,
      download: json['download'] as bool? ?? false,
      shorts: json['shorts'] as bool? ?? false,
      shortsSourceButtonPrimary:
          json['shortsSourceButtonPrimary'] as bool? ?? false,
      shortsSharing: json['shortsSharing'] as bool? ?? false,
      shortsHideAutoGenerated:
          json['shortsHideAutoGenerated'] as bool? ?? false,
      shortsHideBeta: json['shortsHideBeta'] as bool? ?? false,
      shortsGuide: json['shortsGuide'] as bool? ?? false,
      disableNpawShorts: json['disableNpawShorts'] as bool? ?? false,
      featuredSectionVariant: json['featuredSectionVariant'] as String?,
      iconSectionVariant: json['iconSectionVariant'] as String?,
      skipToChapter: json['skipToChapter'] as bool? ?? false,
      startupDelay: json['startupDelay'] as bool? ?? false,
    );

Map<String, dynamic> _$$FeatureFlagsImplToJson(_$FeatureFlagsImpl instance) =>
    <String, dynamic>{
      'variants': instance.variants,
      'auth': instance.auth,
      'publicSignup': instance.publicSignup,
      'socialSignup': instance.socialSignup,
      'autoplayNext': instance.autoplayNext,
      'shareVideoButton': instance.shareVideoButton,
      'flutterPlayerControls': instance.flutterPlayerControls,
      'playNextButton': instance.playNextButton,
      'chapters': instance.chapters,
      'chaptersFirstTab': instance.chaptersFirstTab,
      'download': instance.download,
      'shorts': instance.shorts,
      'shortsSourceButtonPrimary': instance.shortsSourceButtonPrimary,
      'shortsSharing': instance.shortsSharing,
      'shortsHideAutoGenerated': instance.shortsHideAutoGenerated,
      'shortsHideBeta': instance.shortsHideBeta,
      'shortsGuide': instance.shortsGuide,
      'disableNpawShorts': instance.disableNpawShorts,
      'featuredSectionVariant': instance.featuredSectionVariant,
      'iconSectionVariant': instance.iconSectionVariant,
      'skipToChapter': instance.skipToChapter,
      'startupDelay': instance.startupDelay,
    };
