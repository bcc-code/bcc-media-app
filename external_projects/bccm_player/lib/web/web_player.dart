import 'dart:html' as html;
import 'dart:html';
import 'package:bccm_player/playback_platform_pigeon.g.dart';
import 'package:js/js.dart';
import 'dart:ui' as ui;

import '../playback_service_interface.dart';

@JS()
external void bccmCreatePlayer(Element element, Options options);

@JS()
@anonymous
class Options {
  external factory Options({SrcOptions src});
}

@JS()
@anonymous
class SrcOptions {
  external factory SrcOptions({String type, String src});
}

playOnWeb(MediaItem mediaItem) {
  assert(mediaItem.url != null);
  final v = html.window.document.getElementById('primary_player');
  if (v != null) {
    final videoEl = document.createElement("video");
    videoEl.classes.addAll(["video-js", "vjs--brunstadtv-skin"]);
    videoEl.id = 'bccm-player-123';

    bccmCreatePlayer(videoEl, Options(src: SrcOptions(src: mediaItem.url!, type: 'application/x-mpegURL')));

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('bccm-player', (int viewId) => (PlaybackPlatformInterface.playerHtmlElement!) as HtmlElement);

    for (var element in listeners) {
      element.onMediaItemTransition(
        MediaItemTransitionEvent(playerId: 'web', mediaItem: mediaItem),
      );
    }
  }
}

List<PlaybackListenerPigeon> listeners = [];

addListener(PlaybackListenerPigeon p) {
  listeners.add(p);
}
