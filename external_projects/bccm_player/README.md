# BccmPlayer - a flutter video player package

## Platforms

- [x] iOS
- [x] Android
- [-] Web (partial/hacky)

## Features

- [x] Native video via hybrid composition
- [x] HLS, DASH, MP4 (anything exoplayer and avplayer supports)
- [x] Chromecast
- [x] Background playback
- [x] Picture in picture
- [x] Notification center
- [x] Audio track selection
- [x] Subtitle track selection
- [x] Fullscreen
- [x] NPAW/Youbora analytics
- [x] Metadata
- [x] HDR content
- [ ] Custom controls (almost, see [Custom controls](#custom-controls))
- [ ] DRM
- [ ] Sideloaded subtitles

# Installation

1. Add the dependency

   ```bash
   flutter pub add bccm_player
   ```

# Usage

## Initialize

This is necessary to ensure some of the more advanced features work smoothly.
Add this to your main.dart before runApp().

```dart
await BccmPlayerInterface.instance.setup(); // don't worry, it completes in milliseconds.
```

## Basic usage

_Note: This is mostly to explain how things work. Even for simple use cases, I recommend skipping straight to the [Advanced Usage section](#advanced-usage)._

```dart
// Create a player
final playerId = await BccmPlayerInterface.instance.newPlayer();

// Play something
await BccmPlayerInterface.instance.replaceCurrentMediaItem(
    playerId,
    MediaItem(
        url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        mimeType: 'video/mp4',
        metadata: MediaMetadata(title: 'Bick Buck Bunny (MP4)'),
    ),
);

// Show it via a widget
@override
Widget build(BuildContext context, WidgetRef ref) {
    return VideoPlayerView(playerId: playerId);
}
```

Use the widgets:

- VideoPlayerView(): The normal widget for displaying a video with controls.
- VideoPlatformView(): A raw video widget
- BccmCastButton(): A button to connect to cast-enabled devices
- MiniPlayer(): A skeleton widget included for convenience.

## Advanced usage

### Primary player

As this plugin is designed for a VOD-type application, the plugin has the concept of a "primary" player. The plugin guarantees a primary player during initialization.
This makes it easy for flutter to know which player to use by default across your app.
The primary player also has some extra superpowers:

- it controls what's shown in the notification center
- it automatically transfers the current video to chromecasts when you start a session ([technical details here](#chromecast-technical-details)).
- cast sessions will automatically claim the primaryPlayer (so you don't need extra logic for handling the cast sessions)

The primaryPlayerId is available via the StateNotifier at BccmPlayerInterface.instance.stateNotifier.
Example usage with our builtin [riverpod integration](#riverpod):

```dart
final primaryPlayerState = ref.watch(primaryPlayerProvider);
final widget = VideoPlayerView(playerId: primaryPlayerState.id);
debugPrint('Currently playing: ${primaryPlayerState.currentMediaItem?.metadata?.title}');
```

### Configure default languages

```dart
BccmPlayerInterface.instance.setAppConfig(
    AppConfig(
      appLanguage: appLanguage.languageCode, // 2-letter IETF BCP 47 code
      audioLanguage: audioLanguage, // 2-letter IETF BCP 47 code
      subtitleLanguage: subtitleLanguage, // 2-letter IETF BCP 47 code
      analyticsId: analyticsId, // Can be used by analytics services like NPAW
      sessionId: sessionId, // Can be used by analytics services like NPAW
    ),
)
```

### Custom controls

This is designed to be possible but it's not possible yet.
If anyone needs this I can make it possible very quickly so just create an issue and tag @andreasgangso.

### Chromecast

Casting requires some extra steps to setup.

1. Change your android FlutterActivity to be a FlutterFragmentActivity (required for the native chromecast views):

   ```diff
   // android/app/src/main/kotlin/your/bundle/name/MainActivity.kt
   - class MainActivity : FlutterActivity() {
   + class MainActivity : FlutterFragmentActivity() {
   ```

2. (iOS) Follow the cast sdk documentation on how to add the "NSBonjourServices" and "NSLocalNetworkUsageDescription" plist values: https://developers.google.com/cast/docs/ios_sender#ios_14
3. (iOS) Add your receiver id to your Info.plist:
   ```diff
   +  <key>cast_app_id</key>
   +  <string>ABCD1234</string>
   ```
4. (Android) Add a values.xml with your own receiver id: `<string name="cast_app_id">ABCD1234</string>`

# Plugins

## Riverpod

The riverpod providers are there to simplify usage of the StateNotifiers and event streams. See [./lib/src/plugins/riverpod/providers](./lib/src/plugins/riverpod/providers) to find available providers.

```dart

final player = ref.watch(primaryPlayerProvider); // should never be null when the plugin is initialized
VideoPlayerView(id: player.playerId);

```

## Npaw / Youbora

NPAW can be enabled with "setNpawConfig()":

```dart
BccmPlayerInterface.instance.setNpawConfig(
    NpawConfig(
        accountCode: '',
        appName: '',
    ),
)
```

It uses title etc from your MediaMetadata by default, but you can customize it via `extras`.
Currently limited to the following properties:

```dart
MediaMetadata(
    extras: {
        'npaw.content.id': '123',
        'npaw.content.title': 'Live',
        'npaw.content.tvShow': 'Show',
        'npaw.content.season': 'Season',
        'npaw.content.episodeTitle': 'Livestream',
        'npaw.content.isLive': 'true',
    },
);
```

## For BCC Media apps

Add the BCC Media playback listener (sends episode progress to API and that kind of stuff).
Add it in main.dart.

```dart
BccmPlayerInterface.instance.addPlaybackListener(
    BccmPlaybackListener(ref: ref, apiProvider: apiProvider),
)
```

# Architecture / codebase details

## Players and controllers

The plugin manages a list of "PlayerControllers", which currently has the following implementations:

- (iOS) AVQueuePlayerController, which uses AVQueuePlayer.
- (Android) ExoPlayerController, which uses Media3 ExoPlayer.
- CastPlayerController, for chromecasts. Expected to be only one of this.

## Player views

The following views are accessible from flutter:

## State management

State management is built-in, see [PluginStateNotifier](./lib/src/state/plugin_state_notifier.dart). This has a `players` map with [PlayerStateNotifiers](./lib/src/state/player_state_notifier.dart). The PluginStateNotifier is kept in sync with the native side counterparts: `PlaybackService` (Android) and `PlaybackApiImpl` (iOS).

Data is transferred back and forth via pigeons: PlaybackPlatformPigeon, ChromecastPigeon, PlaybackListenerPigeon etc.
See [./pigeons/README.md](./pigeons/README.md).

## Plugin initialization

The plugin does the following during init:

**Native**

- (Android only) Creates a _bounded_ service, PlaybackService, which enables background playback and a notification.
- Creates 1x PlayerController to be used as primary by default.
- Creates a CastPlayerController. Expected to be only one. Becomes primary if a session exists.

**Dart**

- Calls .attach() which hooks in the listeners etc for the plugin. This is necessary because all dart isolates enables all plugins, at least on Android, and this makes it easy to identify which is the 'real' dart isolate.
- Gets state for the primary player

## Chromecast technical details

On session start/resume:

- If the current primary player is playing, transfers the state automatically to the chromecast so that it continues playing on the chromecast instead.
- It then does `.setPrimary('chromecast');`

On session stop:

- Currently the state is only transferred back to the primary player manually on the episode page.
- CastPlayerController does `.unclaimPrimary()` which sets the previous primary player to be primary again. A random native PlayerController will be chosen if there was no previous primary, for example if the app was launched while a session was active.

## Data transfer between flutter, native and chromecast

This table outlines where metadata is stored during its journey up and down the stack.

| Flutter                          | iOS                                                       | Android                                                      | Chromecast                                       |
| -------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| MediaItem.Metadata.Extras["KEY"] | PlayerItem.externalMetadata["media.bcc.extras.**KEY**")   | MediaItem.MediaMetadata.Extras["media.bcc.extras.**KEY**"]   | mediaInfo.metadata["media.bcc.extras.**KEY**"]   |
| MediaItem.isLive                 | PlayerItem.externalMetadata["media.bcc.player.is_live"]   | MediaItem.MediaMetadata.Extras["media.bcc.player.is_live"]   | mediaInfo.metadata["media.bcc.player.is_live"]   |
| MediaItem.mimeType               | PlayerItem.externalMetadata["media.bcc.player.mime_type"] | MediaItem.MediaMetadata.Extras["media.bcc.player.mime_type"] | mediaInfo.metadata["media.bcc.player.mime_type"] |

# Idea dump

- Move chromecast logic to a standalone package? We could set it as primary via listeners on the flutter-side. Would it simplify? Probably not. It would maintain its own custom "MediaItem" types, so we would have to do some extra mapping. The native side would have to have to import it as a plugin which could be annoying. If we want to enable usage of the castplayer without hijacking primaryplayer etc, then it would make more sense to just add a configuration flag to disable that feature.
