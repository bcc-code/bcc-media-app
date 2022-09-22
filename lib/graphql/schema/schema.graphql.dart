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

enum Enum$ItemSectionType { cards, slider, $unknown }

String toJson$Enum$ItemSectionType(Enum$ItemSectionType e) {
  switch (e) {
    case Enum$ItemSectionType.cards:
      return r'cards';
    case Enum$ItemSectionType.slider:
      return r'slider';
    case Enum$ItemSectionType.$unknown:
      return r'$unknown';
  }
}

Enum$ItemSectionType fromJson$Enum$ItemSectionType(String value) {
  switch (value) {
    case r'cards':
      return Enum$ItemSectionType.cards;
    case r'slider':
      return Enum$ItemSectionType.slider;
    default:
      return Enum$ItemSectionType.$unknown;
  }
}

enum Enum$StreamType { hls_ts, hls_cmaf, dash, $unknown }

String toJson$Enum$StreamType(Enum$StreamType e) {
  switch (e) {
    case Enum$StreamType.hls_ts:
      return r'hls_ts';
    case Enum$StreamType.hls_cmaf:
      return r'hls_cmaf';
    case Enum$StreamType.dash:
      return r'dash';
    case Enum$StreamType.$unknown:
      return r'$unknown';
  }
}

Enum$StreamType fromJson$Enum$StreamType(String value) {
  switch (value) {
    case r'hls_ts':
      return Enum$StreamType.hls_ts;
    case r'hls_cmaf':
      return Enum$StreamType.hls_cmaf;
    case r'dash':
      return Enum$StreamType.dash;
    default:
      return Enum$StreamType.$unknown;
  }
}

const possibleTypesMap = {
  'Pagination': {
    'PagePagination',
    'SectionPagination',
    'CollectionItemPagination',
    'ShowPagination',
    'SeasonPagination',
    'EpisodePagination',
    'QuestionPagination',
    'FAQCategoryPagination',
  },
  'Section': {'ItemSection'},
  'Item': {
    'URLItem',
    'ShowItem',
    'SeasonItem',
    'EpisodeItem',
    'PageItem',
  },
  'SearchResultItem': {
    'EpisodeSearchItem',
    'SeasonSearchItem',
    'ShowSearchItem',
  },
  'CalendarEntry': {
    'SimpleCalendarEntry',
    'EpisodeCalendarEntry',
    'SeasonCalendarEntry',
    'ShowCalendarEntry',
  },
};
