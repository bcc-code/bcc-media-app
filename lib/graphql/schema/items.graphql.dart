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
