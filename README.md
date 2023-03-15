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
flutter pub run build_runner watch --delete-conflicting-outputs
```

# App architecture details

## Styling

We primarily use components from `flutter/widgets.dart` or `flutter/material.dart` as a starting point, and customize them to fit the figma design.

## Playback library

We are developing a standalone playback library to manage the player and chromecast code.
It's located at /external_projects/bccm_player which will be converted to a git submodule at a later date.

You need to create a new "Player" before displaying it, i.e.

```dart
let playerId = await PlaybackPlatformInterface.instance.newPlayer(mediaItem);
let playerViewWidget = BccmPlayer(id: playerId)
```

## Navigation architecture

We are using auto_route.

## GraphQL

Schema files are copied from [the brunstadtv repo](https://github.com/bcc-code/brunstadtv).
For a local workflow where the brunstadtv repo is side-by-side with this repo, see the [Makefile](Makefile).

## Translations

We are using Crowdin service for translations.
In order up or download translations you need to have a [personal token](https://crowdin.com/settings#api-key) and [crowdin cli tool](https://developer.crowdin.com/cli-tool/#installation).

You need to put the token into `CROWDIN_TOKEN` env var.
Then you can run `crowdin upload` or `crowdin download` in the root of the project as apropriate.

After downloading the translations into the project you also need to run `flutter gen-l10n`, which will generate .dart files in the same folder as the .arb files, based on [/l10n.yaml](/l10n.yaml).

# Other

## "Unknown error" on login, issues with ssl, etc.

Sometimes the android emulator's clock goes out of sync. You can run this adb command to update the clock

```
adb shell "su 0 date `date +%m%d%H%M%Y.%S`"
```
