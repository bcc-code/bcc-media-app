# BCC Media Player

# Why we maintain our own package

There are other options for video playback in flutter, e.g. [video_player](https://pub.dev/packages/video_player) and [betterplayer](https://github.com/jhomlala/betterplayer).
These are the main reasons we are not using these plugins:

1. They rely on rendering to textures and going via flutter's rendering engine, which we found caused stuttering for 1080@50fps on Android. We believe it's a better architectural decision to let the OS handle video playback natively through hybrid composition.
2. We need audio track selection and picture-in-picture support, and `video_player` does not support that. It also can't do DRM because of its architecture, and we _might_ want that. `betterplayer` has some of these things, but it was maintained by someone on their free time and now there hasn't been a commit in 10 months.
3. We need seamless chromecast support.
4. We want to have the flexibility to plug in our own plugins and customize configurations. It's of course possible to make a fork of an existing package, but it's a bit more tedious as you don't want to stray too far from the upstream repo. Maintaining our own code lowers the bar for customizations, and allows us to easily plug in native SDKs (e.g. chromecast and npaw), etc.

The main downside here is that hybrid composition has some performance impact on the flutter UI itself, which _might_ make it complicated to do stuff like a vertical scrolling feed of short-form videos. Another downside is that we cant make custom player controls with flutter. We could try, but we might quickly run into issues with fullscreening, picture-in-picture etc, and the codebase might become quite complex.

# Usage

## Initialize

In main.dart, add this:

```dart
await BccmPlayerInterface.instance.setup();
```

## (Optional) Riverpod setup

The riverpod providers are there to simplify usage of the StateNotifiers and event streams. See [./lib/src/plugins/riverpod/providers](./lib/src/plugins/riverpod/providers) to find available providers.

In your main.dart, when initializing your ProviderContainer:

```dart
// TODO: this shouldn't be necessary, we should make the listener use the statenotifiers directly.
providerContainer.setupBccmPlayer(BccmPlayerInterface.instance)
```

## For BCC Media apps

Add the BCC Media playback listener (sends episode progress to API and that kind of stuff)

```dart
BccmPlayerInterface.instance.addPlaybackListener(
    BccmPlaybackListener(ref: ref, apiProvider: apiProvider),
)
```

## Configure languages, etc

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

## Configure NPAW

```dart
BccmPlayerInterface.instance.setNpawConfig(
    NpawConfig(
        accountCode: '',
        appName: '',
    ),
)
```

## Widgets

Use the widgets:

```dart
BccmPlayer(ref.watch(primaryPlayerProvider).id)
BccmCastButton()
BottomSheetMiniPlayer() // TODO: move this to bccm_player
MiniPlayer() //  TODO: move this to bccm_player
```

# Architecture details (recommended to read for contributors)

## Players and controllers

The plugin manages a list of "PlayerControllers", which currently has the following implementations:

- (iOS) AVQueuePlayerController, which uses AVQueuePlayer.
- (Android) ExoPlayerController, which uses Media3 ExoPlayer.
- CastPlayerController, for chromecasts. Expected to be only one of this.

## Player views

The following views are accessible from flutter:

## Primary player

The plugin has the concept of a "primary" player. The plugin guarantees a primary player during initialization. The riverpod provider `primaryPlayerProvider` makes it easy for flutter to know which player to use by default, for example in an app-wide mini-player.

The primary player also has some extra superpowers:

- it controls what's shown in the notification center
- it automatically transfers its state to chromecasts, see [Chromecast](#chromecast).
- it's the only one which can go picture-in-picture (?)

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

## Chromecast

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
