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
