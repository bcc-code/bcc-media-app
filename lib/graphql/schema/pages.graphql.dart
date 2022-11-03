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

enum Enum$WebSectionSize { r16_9, r4_3, r9_16, r1_1, $unknown }

String toJson$Enum$WebSectionSize(Enum$WebSectionSize e) {
  switch (e) {
    case Enum$WebSectionSize.r16_9:
      return r'r16_9';
    case Enum$WebSectionSize.r4_3:
      return r'r4_3';
    case Enum$WebSectionSize.r9_16:
      return r'r9_16';
    case Enum$WebSectionSize.r1_1:
      return r'r1_1';
    case Enum$WebSectionSize.$unknown:
      return r'$unknown';
  }
}

Enum$WebSectionSize fromJson$Enum$WebSectionSize(String value) {
  switch (value) {
    case r'r16_9':
      return Enum$WebSectionSize.r16_9;
    case r'r4_3':
      return Enum$WebSectionSize.r4_3;
    case r'r9_16':
      return Enum$WebSectionSize.r9_16;
    case r'r1_1':
      return Enum$WebSectionSize.r1_1;
    default:
      return Enum$WebSectionSize.$unknown;
  }
}
