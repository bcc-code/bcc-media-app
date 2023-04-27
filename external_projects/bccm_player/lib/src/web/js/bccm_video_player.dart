@JS('window.bccmVideoPlayer')
library bccm_video_player;

import 'package:js/js.dart';

@JS()
external void createPlayer(String? elementId, Options options);

@JS()
@anonymous
class Options {
  external factory Options({
    SrcOptions src,
    LanguagePreferenceDefaults languagePreferenceDefaults,
    VideoJsOptions? videojs,
    NpawOptions? npaw,
  });
}

@JS()
@anonymous
class SrcOptions {
  external factory SrcOptions({String type, String src});
}

@JS()
@anonymous
class LanguagePreferenceDefaults {
  external factory LanguagePreferenceDefaults({String? audio, String? subtitles});
}

@JS()
@anonymous
class VideoJsOptions {
  external factory VideoJsOptions({bool? autoplay, bool? fluid});
}

@JS()
@anonymous
class NpawOptions {
  external factory NpawOptions({
    bool? enabled,
    String? accountCode,
    NpawTrackingOptions? tracking,
  });
}

@JS()
@anonymous
class NpawTrackingOptions {
  external factory NpawTrackingOptions({
    bool? isLive,
    String? userId,
    String? sessionId,
    String? ageGroup,
    NpawMetadataOptions? metadata,
  });
}

@JS()
@anonymous
class NpawMetadataOptions {
  external factory NpawMetadataOptions({
    String? contentId,
    String? title,
    String? episodeTitle,
    String? seasonTitle,
    String? seasonId,
    String? showTitle,
    String? showId,
    Map<String, Object?>? overrides,
  });
}
