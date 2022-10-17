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
  'CalendarEntry': {
    'SimpleCalendarEntry',
    'EpisodeCalendarEntry',
    'SeasonCalendarEntry',
    'ShowCalendarEntry',
  },
  'Pagination': {
    'QuestionPagination',
    'FAQCategoryPagination',
    'CollectionItemPagination',
    'SeasonPagination',
    'EpisodePagination',
    'SectionPagination',
    'LinkItemPagination',
    'SectionItemPagination',
  },
  'CollectionItem': {
    'URLItem',
    'ShowItem',
    'SeasonItem',
    'EpisodeItem',
    'PageItem',
  },
  'Section': {
    'IconSection',
    'LabelSection',
    'PosterSection',
    'FeaturedSection',
    'DefaultSection',
    'GridSection',
  },
  'LinkSection': {
    'IconSection',
    'LabelSection',
  },
  'LinkItem': {
    'PageLinkItem',
    'URLLinkItem',
  },
  'ItemSection': {
    'PosterSection',
    'FeaturedSection',
    'DefaultSection',
    'GridSection',
  },
  'SectionItemType': {
    'Show',
    'Season',
    'Episode',
    'Page',
  },
  'SearchResultItem': {
    'EpisodeSearchItem',
    'SeasonSearchItem',
    'ShowSearchItem',
  },
};
