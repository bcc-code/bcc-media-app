# BrunstadTV app

# Development

## Initial setup

Install flutter, then run `flutter doctor` until it reports everything is OK.

```
cp lib/env/.env.dart.example lib/env/.env.dart
flutter pub get
flutter pub run build_runner watch
```

I recommend using the "Flutter" VSCode extension to enable debugging etc.
You can also run the app via the cli: `flutter run`.

## Code generation

Some code is generated based on other files, e.g. routing.
To ensure your code is updated, run this watcher while developing: 

```
flutter pub run build_runner watch
```

# App architecture details

## Styling

We primarily use components from `flutter/widgets.dart` or `flutter/material.dart` as a starting point, and customize them to fit the figma design.

## Playback library

We are developing a standalone playback library to manage the player and chromecast code.
It's located at /external_projects/bccm_player which will be converted to a git submodule at a later date.

You need to create a new "Player" before displaying it, i.e.
```dart
let playerId = await PlaybackApi.instance.newPlayer(mediaItem);
let playerViewWidget = BccmPlayer(id: playerId)
```

## Navigation architecture

We are using auto_route.