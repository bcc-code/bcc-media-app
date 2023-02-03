// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;
import 'dart:html';
import 'dart:ui' as ui;

import 'package:bccm_player/playback_platform_pigeon.g.dart' as pigeon;
import 'package:bccm_player/playback_service_interface.dart';
import 'package:bccm_player/web/web_player.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the BccmPlayerPlatform of the BccmPlayer plugin.
class BccmPlayerWeb extends PlaybackPlatformInterface {
  /// Constructs a BccmPlayerWeb
  BccmPlayerWeb();

  static void registerWith(Registrar registrar) {
    PlaybackPlatformInterface.instance = BccmPlayerWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  Future<String> newPlayer({String? url}) async {
    return 'web';
  }

  @override
  Future<void> replaceCurrentMediaItem(String playerId, pigeon.MediaItem mediaItem,
      {bool? playbackPositionFromPrimary, bool? autoplay = true}) async {
    playOnWeb(mediaItem);
  }

  @override
  Future<bool> setPrimary(String id) async {
    return true;
  }

  @override
  Future<void> queueMediaItem(String playerId, pigeon.MediaItem mediaItem) async {
    throw UnimplementedError('addMediaItem() has not been implemented.');
  }

  @override
  Future<pigeon.ChromecastState?> getChromecastState() async {
    return null;
  }

  @override
  void openExpandedCastController() {
    throw UnimplementedError('openExpandedCastController() has not been implemented.');
  }

  @override
  void openCastDialog() {
    throw UnimplementedError('openCastDialog() has not been implemented.');
  }

  @override
  Future<void> setPlaybackListener(pigeon.PlaybackListenerPigeon listener) async {
    addListener(listener);
  }

  @override
  void play(String playerId) {
    throw UnimplementedError('play() has not been implemented.');
  }

  @override
  void pause(String playerId) {
    throw UnimplementedError('pause() has not been implemented.');
  }

  @override
  void stop(String playerId, bool reset) {
    throw UnimplementedError('stop() has not been implemented.');
  }

  @override
  void setNpawConfig(pigeon.NpawConfig? config) {
    return;
  }

  @override
  void setAppConfig(pigeon.AppConfig? config) {
    return;
  }

  @override
  void setPlayerViewVisibility(int viewId, bool visible) {
    throw UnimplementedError('setAppConfig() has not been implemented.');
  }
}
