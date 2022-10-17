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
