enum Enum$SectionSize { small, medium, $unknown }

String toJson$Enum$SectionSize(Enum$SectionSize e) {
  switch (e) {
    case Enum$SectionSize.small:
      return r'small';
    case Enum$SectionSize.medium:
      return r'medium';
    case Enum$SectionSize.$unknown:
      return r'$unknown';
  }
}

Enum$SectionSize fromJson$Enum$SectionSize(String value) {
  switch (value) {
    case r'small':
      return Enum$SectionSize.small;
    case r'medium':
      return Enum$SectionSize.medium;
    default:
      return Enum$SectionSize.$unknown;
  }
}

enum Enum$CardSectionSize { large, mini, $unknown }

String toJson$Enum$CardSectionSize(Enum$CardSectionSize e) {
  switch (e) {
    case Enum$CardSectionSize.large:
      return r'large';
    case Enum$CardSectionSize.mini:
      return r'mini';
    case Enum$CardSectionSize.$unknown:
      return r'$unknown';
  }
}

Enum$CardSectionSize fromJson$Enum$CardSectionSize(String value) {
  switch (value) {
    case r'large':
      return Enum$CardSectionSize.large;
    case r'mini':
      return Enum$CardSectionSize.mini;
    default:
      return Enum$CardSectionSize.$unknown;
  }
}

enum Enum$GridSectionSize { half, $unknown }

String toJson$Enum$GridSectionSize(Enum$GridSectionSize e) {
  switch (e) {
    case Enum$GridSectionSize.half:
      return r'half';
    case Enum$GridSectionSize.$unknown:
      return r'$unknown';
  }
}

Enum$GridSectionSize fromJson$Enum$GridSectionSize(String value) {
  switch (value) {
    case r'half':
      return Enum$GridSectionSize.half;
    default:
      return Enum$GridSectionSize.$unknown;
  }
}

enum Enum$LinkType { text, audio, video, other, $unknown }

String toJson$Enum$LinkType(Enum$LinkType e) {
  switch (e) {
    case Enum$LinkType.text:
      return r'text';
    case Enum$LinkType.audio:
      return r'audio';
    case Enum$LinkType.video:
      return r'video';
    case Enum$LinkType.other:
      return r'other';
    case Enum$LinkType.$unknown:
      return r'$unknown';
  }
}

Enum$LinkType fromJson$Enum$LinkType(String value) {
  switch (value) {
    case r'text':
      return Enum$LinkType.text;
    case r'audio':
      return Enum$LinkType.audio;
    case r'video':
      return Enum$LinkType.video;
    case r'other':
      return Enum$LinkType.other;
    default:
      return Enum$LinkType.$unknown;
  }
}
