@JS('window.bccmVideoPlayer')
library bccm_video_player;

import 'dart:html';
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
  });
}

@JS()
@anonymous
class VideoJsOptions {
  external factory VideoJsOptions({bool? autoplay, bool? fluid});
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
