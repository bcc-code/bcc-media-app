import 'dart:html' as html;
import 'dart:html';
import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart';
import 'dart:ui' as ui;

import '../../bccm_player_web.dart';
import 'js/bccm_video_player.dart';

const lanTo3letter = {
  'no': "nor",
  'en': "eng",
  'nl': "nld",
  'de': "deu",
  'fr': "fra",
  'es': "spa",
  'fi': "fin",
  'ru': "rus",
  'pt': "por",
  'ro': "ron",
  'tr': "tur",
  'pl': "pol",
  'hu': "hun",
  'it': "ita",
  'da': "dan",
};

class VideoJsPlayer {
  final String playerId;
  final PlaybackListenerPigeon listener;
  final BccmPlayerWeb plugin;
  html.Element? currentElement;

  VideoJsPlayer(
    this.playerId, {
    required this.listener,
    required this.plugin,
  }) {
    // use this.currentElement in registerViewFactory's callback below if we want to embed.
    // not implemented because of a fullscreen bug: https://github.com/flutter/flutter/issues/124799

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('bccm-player-$playerId', (int viewId) => html.document.createElement('div'));
  }

  void replaceCurrentMediaItem(MediaItem mediaItem, {bool? autoplay}) {
    assert(mediaItem.url != null);
    var v = html.window.document.getElementById('bccm-player-$playerId');
    if (v == null) {
      v = html.document.createElement("div");
      v.id = 'bccm-player-$playerId';
      v.style.width = "100%";
      v.style.height = "100%";
      v.style.backgroundColor = "#000000";
      v.style.position = "fixed";
      v.style.zIndex = "50";
      v.appendHtml('''<style>#${v.id} > .video-js { width: 100%; height: 100% }</style>''', treeSanitizer: NodeTreeSanitizer.trusted);
      html.window.document.getElementById('primary-player-wrapper')?.append(v);
      final topLeftWrapper = html.document.createElement("div");
      topLeftWrapper.style
        ..position = "absolute"
        ..top = "0"
        ..left = "0"
        ..width = "300px"
        ..height = "40px"
        ..zIndex = "100"
        ..padding = "32px";
      final backButton = html.Element.html(
        '''<div style="cursor: pointer; height: 100%; display: flex; align-items: center; justify-items: center;"><svg height="100%" viewBox="0 0 11 18" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M10 1L2 9L10 17" stroke="white" stroke-width="2"/></svg> <span style="color: white; padding-left: 16px; font-size: 1.5rem">Back</span></div>''',
        validator: html.NodeValidatorBuilder()
          ..allowHtml5()
          ..allowInlineStyles()
          ..allowSvg(),
      );
      backButton.onClick.listen((event) {
        v?.remove();
        listener.onMediaItemTransition(
          MediaItemTransitionEvent(playerId: playerId, mediaItem: null),
        );
      });
      topLeftWrapper.append(backButton);
      v.append(topLeftWrapper);
    }

    final npawExtraEntries = mediaItem.metadata?.extras?.entries
        .where(
          (e) => e.key != null && e.key?.startsWith('npaw.') == true,
        )
        .map(
          (e) => MapEntry(e.key!.replaceFirst('npaw.', ''), e.value),
        );
    final npawOverrides = npawExtraEntries != null ? Map.fromEntries(npawExtraEntries) : null;

    createPlayer(
      'bccm-player-$playerId',
      Options(
        src: SrcOptions(src: mediaItem.url!, type: 'application/x-mpegURL'),
        languagePreferenceDefaults: LanguagePreferenceDefaults(
          audio: lanTo3letter[plugin.appConfig?.audioLanguage],
          subtitles: lanTo3letter[plugin.appConfig?.subtitleLanguage],
        ),
        videojs: VideoJsOptions(
          autoplay: true,
          fluid: false,
        ),
        npaw: NpawOptions(
          enabled: plugin.npawConfig?.accountCode != null,
          accountCode: plugin.npawConfig?.accountCode,
          tracking: NpawTrackingOptions(
            isLive: mediaItem.isLive,
            userId: plugin.appConfig?.analyticsId,
            sessionId: plugin.appConfig?.sessionId?.toString(),
            metadata: NpawMetadataOptions(
              overrides: npawOverrides,
            ),
          ),
        ),
      ),
    );

    currentElement = v;

    listener.onMediaItemTransition(
      MediaItemTransitionEvent(playerId: playerId, mediaItem: mediaItem),
    );
  }
}
