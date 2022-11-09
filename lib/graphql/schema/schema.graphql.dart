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

  static const _undefined = {};

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

enum Enum$Language { en, no, de, $unknown }

String toJson$Enum$Language(Enum$Language e) {
  switch (e) {
    case Enum$Language.en:
      return r'en';
    case Enum$Language.no:
      return r'no';
    case Enum$Language.de:
      return r'de';
    case Enum$Language.$unknown:
      return r'$unknown';
  }
}

Enum$Language fromJson$Enum$Language(String value) {
  switch (value) {
    case r'en':
      return Enum$Language.en;
    case r'no':
      return Enum$Language.no;
    case r'de':
      return Enum$Language.de;
    default:
      return Enum$Language.$unknown;
  }
}

const possibleTypesMap = {
  'Pagination': {
    'SeasonPagination',
    'EpisodePagination',
    'CollectionItemPagination',
    'QuestionPagination',
    'FAQCategoryPagination',
    'SectionPagination',
    'SectionItemPagination',
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
  'Section': {
    'PosterSection',
    'FeaturedSection',
    'DefaultSection',
    'DefaultGridSection',
    'PosterGridSection',
    'IconSection',
    'LabelSection',
    'MessageSection',
    'WebSection',
  },
  'ItemSection': {
    'PosterSection',
    'FeaturedSection',
    'DefaultSection',
    'DefaultGridSection',
    'PosterGridSection',
    'IconSection',
    'LabelSection',
  },
  'GridSection': {
    'DefaultGridSection',
    'PosterGridSection',
  },
  'SectionItemType': {
    'Show',
    'Season',
    'Episode',
    'Page',
    'Link',
  },
};
