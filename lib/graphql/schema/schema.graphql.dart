class Input$LegacyIDLookupOptions {
  factory Input$LegacyIDLookupOptions({
    int? episodeID,
    int? programID,
  }) =>
      Input$LegacyIDLookupOptions._({
        if (episodeID != null) r'episodeID': episodeID,
        if (programID != null) r'programID': programID,
      });

  Input$LegacyIDLookupOptions._(this._$data);

  factory Input$LegacyIDLookupOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('episodeID')) {
      final l$episodeID = data['episodeID'];
      result$data['episodeID'] = (l$episodeID as int?);
    }
    if (data.containsKey('programID')) {
      final l$programID = data['programID'];
      result$data['programID'] = (l$programID as int?);
    }
    return Input$LegacyIDLookupOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get episodeID => (_$data['episodeID'] as int?);
  int? get programID => (_$data['programID'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('episodeID')) {
      final l$episodeID = episodeID;
      result$data['episodeID'] = l$episodeID;
    }
    if (_$data.containsKey('programID')) {
      final l$programID = programID;
      result$data['programID'] = l$programID;
    }
    return result$data;
  }

  CopyWith$Input$LegacyIDLookupOptions<Input$LegacyIDLookupOptions>
      get copyWith => CopyWith$Input$LegacyIDLookupOptions(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$LegacyIDLookupOptions) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$episodeID = episodeID;
    final lOther$episodeID = other.episodeID;
    if (_$data.containsKey('episodeID') !=
        other._$data.containsKey('episodeID')) {
      return false;
    }
    if (l$episodeID != lOther$episodeID) {
      return false;
    }
    final l$programID = programID;
    final lOther$programID = other.programID;
    if (_$data.containsKey('programID') !=
        other._$data.containsKey('programID')) {
      return false;
    }
    if (l$programID != lOther$programID) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$episodeID = episodeID;
    final l$programID = programID;
    return Object.hashAll([
      _$data.containsKey('episodeID') ? l$episodeID : const {},
      _$data.containsKey('programID') ? l$programID : const {},
    ]);
  }
}

abstract class CopyWith$Input$LegacyIDLookupOptions<TRes> {
  factory CopyWith$Input$LegacyIDLookupOptions(
    Input$LegacyIDLookupOptions instance,
    TRes Function(Input$LegacyIDLookupOptions) then,
  ) = _CopyWithImpl$Input$LegacyIDLookupOptions;

  factory CopyWith$Input$LegacyIDLookupOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$LegacyIDLookupOptions;

  TRes call({
    int? episodeID,
    int? programID,
  });
}

class _CopyWithImpl$Input$LegacyIDLookupOptions<TRes>
    implements CopyWith$Input$LegacyIDLookupOptions<TRes> {
  _CopyWithImpl$Input$LegacyIDLookupOptions(
    this._instance,
    this._then,
  );

  final Input$LegacyIDLookupOptions _instance;

  final TRes Function(Input$LegacyIDLookupOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? episodeID = _undefined,
    Object? programID = _undefined,
  }) =>
      _then(Input$LegacyIDLookupOptions._({
        ..._instance._$data,
        if (episodeID != _undefined) 'episodeID': (episodeID as int?),
        if (programID != _undefined) 'programID': (programID as int?),
      }));
}

class _CopyWithStubImpl$Input$LegacyIDLookupOptions<TRes>
    implements CopyWith$Input$LegacyIDLookupOptions<TRes> {
  _CopyWithStubImpl$Input$LegacyIDLookupOptions(this._res);

  TRes _res;

  call({
    int? episodeID,
    int? programID,
  }) =>
      _res;
}

class Input$EpisodeContext {
  factory Input$EpisodeContext({String? collectionId}) =>
      Input$EpisodeContext._({
        if (collectionId != null) r'collectionId': collectionId,
      });

  Input$EpisodeContext._(this._$data);

  factory Input$EpisodeContext.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('collectionId')) {
      final l$collectionId = data['collectionId'];
      result$data['collectionId'] = (l$collectionId as String?);
    }
    return Input$EpisodeContext._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get collectionId => (_$data['collectionId'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('collectionId')) {
      final l$collectionId = collectionId;
      result$data['collectionId'] = l$collectionId;
    }
    return result$data;
  }

  CopyWith$Input$EpisodeContext<Input$EpisodeContext> get copyWith =>
      CopyWith$Input$EpisodeContext(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$EpisodeContext) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$collectionId = collectionId;
    final lOther$collectionId = other.collectionId;
    if (_$data.containsKey('collectionId') !=
        other._$data.containsKey('collectionId')) {
      return false;
    }
    if (l$collectionId != lOther$collectionId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$collectionId = collectionId;
    return Object.hashAll(
        [_$data.containsKey('collectionId') ? l$collectionId : const {}]);
  }
}

abstract class CopyWith$Input$EpisodeContext<TRes> {
  factory CopyWith$Input$EpisodeContext(
    Input$EpisodeContext instance,
    TRes Function(Input$EpisodeContext) then,
  ) = _CopyWithImpl$Input$EpisodeContext;

  factory CopyWith$Input$EpisodeContext.stub(TRes res) =
      _CopyWithStubImpl$Input$EpisodeContext;

  TRes call({String? collectionId});
}

class _CopyWithImpl$Input$EpisodeContext<TRes>
    implements CopyWith$Input$EpisodeContext<TRes> {
  _CopyWithImpl$Input$EpisodeContext(
    this._instance,
    this._then,
  );

  final Input$EpisodeContext _instance;

  final TRes Function(Input$EpisodeContext) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? collectionId = _undefined}) =>
      _then(Input$EpisodeContext._({
        ..._instance._$data,
        if (collectionId != _undefined)
          'collectionId': (collectionId as String?),
      }));
}

class _CopyWithStubImpl$Input$EpisodeContext<TRes>
    implements CopyWith$Input$EpisodeContext<TRes> {
  _CopyWithStubImpl$Input$EpisodeContext(this._res);

  TRes _res;

  call({String? collectionId}) => _res;
}

enum Enum$ImageStyle { poster, featured, $default, $unknown }

String toJson$Enum$ImageStyle(Enum$ImageStyle e) {
  switch (e) {
    case Enum$ImageStyle.poster:
      return r'poster';
    case Enum$ImageStyle.featured:
      return r'featured';
    case Enum$ImageStyle.$default:
      return r'default';
    case Enum$ImageStyle.$unknown:
      return r'$unknown';
  }
}

Enum$ImageStyle fromJson$Enum$ImageStyle(String value) {
  switch (value) {
    case r'poster':
      return Enum$ImageStyle.poster;
    case r'featured':
      return Enum$ImageStyle.featured;
    case r'default':
      return Enum$ImageStyle.$default;
    default:
      return Enum$ImageStyle.$unknown;
  }
}

enum Enum$Status { published, unlisted, $unknown }

String toJson$Enum$Status(Enum$Status e) {
  switch (e) {
    case Enum$Status.published:
      return r'published';
    case Enum$Status.unlisted:
      return r'unlisted';
    case Enum$Status.$unknown:
      return r'$unknown';
  }
}

Enum$Status fromJson$Enum$Status(String value) {
  switch (value) {
    case r'published':
      return Enum$Status.published;
    case r'unlisted':
      return Enum$Status.unlisted;
    default:
      return Enum$Status.$unknown;
  }
}

enum Enum$Gender { male, female, unknown, $unknown }

String toJson$Enum$Gender(Enum$Gender e) {
  switch (e) {
    case Enum$Gender.male:
      return r'male';
    case Enum$Gender.female:
      return r'female';
    case Enum$Gender.unknown:
      return r'unknown';
    case Enum$Gender.$unknown:
      return r'$unknown';
  }
}

Enum$Gender fromJson$Enum$Gender(String value) {
  switch (value) {
    case r'male':
      return Enum$Gender.male;
    case r'female':
      return Enum$Gender.female;
    case r'unknown':
      return Enum$Gender.unknown;
    default:
      return Enum$Gender.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'Pagination': {
    'SurveyQuestionPagination',
    'UserCollectionEntryPagination',
    'CollectionItemPagination',
    'SeasonPagination',
    'QuestionPagination',
    'FAQCategoryPagination',
    'LessonPagination',
    'TaskPagination',
    'SectionPagination',
    'LinkPagination',
    'SectionItemPagination',
    'AchievementPagination',
    'AchievementGroupPagination',
    'EpisodePagination',
  },
  'SurveyQuestion': {
    'SurveyTextQuestion',
    'SurveyRatingQuestion',
  },
  'UserCollectionEntryItem': {
    'Show',
    'Episode',
  },
  'CollectionItem': {
    'ShowItem',
    'SeasonItem',
    'EpisodeItem',
    'PageItem',
  },
  'CalendarEntry': {
    'SimpleCalendarEntry',
    'EpisodeCalendarEntry',
    'SeasonCalendarEntry',
    'ShowCalendarEntry',
  },
  'SearchResultItem': {
    'EpisodeSearchItem',
    'SeasonSearchItem',
    'ShowSearchItem',
  },
  'Prompt': {'SurveyPrompt'},
  'Task': {
    'AlternativesTask',
    'TextTask',
    'PosterTask',
    'QuoteTask',
    'VideoTask',
    'LinkTask',
  },
  'Section': {
    'PosterSection',
    'FeaturedSection',
    'DefaultSection',
    'CardSection',
    'ListSection',
    'CardListSection',
    'DefaultGridSection',
    'PosterGridSection',
    'IconGridSection',
    'IconSection',
    'LabelSection',
    'MessageSection',
    'WebSection',
    'AchievementSection',
    'PageDetailsSection',
  },
  'ItemSection': {
    'PosterSection',
    'FeaturedSection',
    'DefaultSection',
    'CardSection',
    'ListSection',
    'CardListSection',
    'DefaultGridSection',
    'PosterGridSection',
    'IconGridSection',
    'IconSection',
    'LabelSection',
  },
  'GridSection': {
    'DefaultGridSection',
    'PosterGridSection',
    'IconGridSection',
  },
  'SectionItemType': {
    'Show',
    'Season',
    'Episode',
    'Page',
    'Link',
    'StudyTopic',
  },
  'EpisodeContextUnion': {
    'Season',
    'ContextCollection',
  },
};
