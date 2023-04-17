// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.

import 'package:bccm_player/src/native/root_pigeon_playback_listener.dart';
import 'package:bccm_player/src/pigeon/playback_platform_pigeon.g.dart' as pigeon;
import 'package:bccm_player/src/playback_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'bccm_player.dart';
import 'src/web/video_js_player.dart';

/// A web implementation of the BccmPlayerPlatform of the BccmPlayer plugin.
class BccmPlayerWeb extends BccmPlayerInterface {
  /// Constructs a BccmPlayerWeb
  BccmPlayerWeb();

  AppConfig? appConfig;
  NpawConfig? npawConfig;
  Map<String, VideoJsPlayer> webVideoPlayers = {};
  final RootPigeonPlaybackListener _rootPlaybackListener = RootPigeonPlaybackListener();

  static void registerWith(Registrar registrar) {
    BccmPlayerInterface.instance = BccmPlayerWeb();
  }

  @override
  chromecastEventStream() => const Stream.empty();

  @override
  Future<String> newPlayer({String? url}) async {
    final playerId = DateTime.now().microsecondsSinceEpoch.toString();
    final player = VideoJsPlayer(playerId, listener: _rootPlaybackListener, plugin: this);
    webVideoPlayers[playerId] = player;
    stateNotifier.addPlayerNotifier(playerId);
    return playerId;
  }

  @override
  Future<void> replaceCurrentMediaItem(
    String playerId,
    pigeon.MediaItem mediaItem, {
    bool? playbackPositionFromPrimary,
    bool? autoplay = true,
  }) async {
    webVideoPlayers[playerId]?.replaceCurrentMediaItem(
      mediaItem,
      autoplay: autoplay,
    );
  }

  @override
  Future<bool> setPrimary(String id) async {
    stateNotifier.setPrimaryPlayer(id);
    return true;
  }

  @override
  Future<void> queueMediaItem(String playerId, pigeon.MediaItem mediaItem) async {}

  @override
  Future<pigeon.ChromecastState?> getChromecastState() async {
    return null;
  }

  @override
  void openExpandedCastController() {}

  @override
  void openCastDialog() {}

  @override
  Future<void> addPlaybackListener(pigeon.PlaybackListenerPigeon listener) async {
    _rootPlaybackListener.addListener(listener);
  }

  @override
  void play(String playerId) {}

  @override
  void pause(String playerId) {}

  @override
  void stop(String playerId, bool reset) {}

  @override
  Future setNpawConfig(pigeon.NpawConfig? config) async {
    npawConfig = config;
  }

  @override
  void setAppConfig(pigeon.AppConfig? config) {
    appConfig = config;
  }

  @override
  void setPlayerViewVisibility(int viewId, bool visible) {}
}
