# BCC Media App

The source code for our video-on-demand app for iOS and Android.

# Development

## Initial setup

Recommended editor: VS Code, because we have some default debug options set up in [launch.json](./.vscode/launch.json).

0. Clone the submodules with `git submodule update --init`.
1. Install flutter, then run `flutter doctor -v` until it reports everything is OK.
2. Run in a terminal: `flutter pub get`
3. Inside lib/env/, copy the .env.dart.template file to .env.dart, and update the values according to the comments.
4. You can now run the app, e.g. with Run > Start Debugging in VSCode
5. For development, it's important to read the [Code generation](#code-generation) section below before you begin.

## Code generation

Some code is generated, for example routing and graphql queries.
The generated files are often suffixed with ._something_.dart (e.g. .g.dart).
To ensure your code is updated while developing, run the [build_runner](https://dart.dev/tools/build_runner) watcher:

```
dart run build_runner watch --delete-conflicting-outputs
```

## Troubleshooting

- **Android: "Unknown error" on login, issues with ssl, etc.**: Sometimes the android emulator's clock goes out of sync. You can run this adb command to update the clock: `adb shell "su 0 date `date +%m%d%H%M%Y.%S`"`

# Tests

## UI Tests

We are using [Maestro](https://maestro.mobile.dev/) for end-to-end UI tests. See [.maestro/README.md](./.maestro/README.md).
These use a normal build of the app to test the most critical user flows, e.g. logging in and then playing the livestream.
Most of the tests run during the release pipeline for the app.

# App architecture details

## Core library

The bccm_core package is located at /submodules/bccm_core as a submodule, and linked in pubspec.yaml to the local path for convenience.
This is where most of the core functionality is, e.g. graphql, auth, push, many utils, etc.
Anything that needs to be shared with other apps should be a part of the bccm_core package.

## Styling

You can find constants for colors, typography, etc. based on our design system under [/lib/theme](./lib/theme).

## Player library

We are maintaining a standalone player library to manage the native playback and chromecast code.
It's located at /submodules/bccm_player as a git submodule for convenience.

## Navigation architecture

We are using auto_route, but for deep linking we are using app_links, as it's less magical and more reliable than flutter's built-in solution for that.
We have some special routes, e.g. /r/, but these are only handled through a custom `navigateNamedFromRoot()` function.

## Translations

We are using Crowdin for translations.
In order to upload or download translations you need to have a [personal token](https://crowdin.com/settings#api-key) and the [crowdin cli tool](https://developer.crowdin.com/cli-tool/#installation).

You need to put the token into a `CROWDIN_TOKEN` environment variable.
Then you can run `crowdin upload` or `crowdin download`, e.g `CROWDIN_TOKEN=abc123 crowdin download`.
The config comes from the [./crowdin.yml](./crowdin.yml) file

After downloading the translations into the project you also need to run `flutter gen-l10n`, which will generate .dart files in the same folder as the .arb files, based on [/l10n.yaml](./l10n.yaml).
