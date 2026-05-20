# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

BCC Media App — a Flutter video-on-demand app for iOS, Android, and web. Has two flavors: **BCC Media** (main) and **Kids** (in `kids/` directory, separate Flutter project that imports the main app).

## Development Setup

```bash
git submodule update --init
make pubgetall          # flutter pub get for all packages
# Copy lib/env/.env.dart.template → lib/env/.env.dart and fill in values
```

## Common Commands

```bash
# Code generation (run during development — required after model/route/GraphQL changes)
dart run build_runner watch --delete-conflicting-outputs

# Generate localization files (after editing lib/l10n/bccm_en.arb)
flutter gen-l10n

# Analyze
flutter analyze

# Run tests
flutter test                    # all tests
flutter test test/some_test.dart  # single test

# Build web
make web-build

# Version management
make bump          # bump main app version
make bump-kids     # bump kids app version
make release       # create release tag and push
make release-kids  # kids release

# Useful
make help          # list all make targets
make pubgetall     # pub get for all packages
make main-branch   # sync submodules to their main branches
make fix-time      # fix android emulator clock drift (SSL issues)
```

Use VS Code debug configurations in `.vscode/launch.json` for running/debugging (e.g. `bccm-mobile: debug`, `kids-mobile: debug`).

## Architecture

### State Management
**Riverpod** with code generation. Key providers in `lib/providers/`:
- `settingsProvider` — user preferences (Freezed model)
- `playbackServiceProvider` — video playback
- `bccmGraphQLProvider` — GraphQL client
- `featureFlagsProvider` — Unleash feature flags
- `authStateProvider` — authentication state

### Routing
**auto_route** for navigation, **app_links** for deep linking (not Flutter's built-in deep linking). Routes defined in `lib/router/router.dart`, generated to `router.gr.dart`. Special routes (`/r/`, `/tvlogin`, legacy routes) handled via `lib/helpers/router/special_routes.dart`.

### Submodules
- `submodules/bccm_flutter/bccm_core` — shared core library (GraphQL, auth, push notifications, utils). Anything shared with other apps goes here.
- `submodules/bccm_flutter/bmm_api` — BMM audio API client
- `submodules/bccm_player` — standalone native video player library (playback, Chromecast, AirPlay)

### API Layer
- **GraphQL** (main content API) — queries in `.graphql` files, code-generated to `.graphql.dart`
- **BMM API** — audio/podcast content
- **Auth0** — authentication
- **Unleash** — feature flags

### Flavors
Configured in `lib/flavors.dart`. Entry points: `lib/main_prod.dart` (production), `lib/main_dev.dart` (development). Each flavor specifies Firebase options, design system, assets, and default language.

### Translations
Phrase-managed i18n. Source strings in `lib/l10n/bccm_en.arb`. Pushing to master triggers Phrase to distribute translation jobs; completed translations arrive as automated PRs.

## Code Generation

Generated files (do not edit manually):
- `.freezed.dart` — immutable models (Freezed)
- `.g.dart` — JSON serialization, Riverpod providers
- `.graphql.dart` — GraphQL types and operations
- `.gr.dart` — auto_route routes
- `lib/l10n/app_localizations*.dart` — localization

These are excluded from analysis in `analysis_options.yaml`.

## Linting

Uses `package:flutter_lints/flutter.yaml` with `prefer_single_quotes: true` and `avoid_print: false`.

## Testing

- Unit/widget tests: `test/` directory, run with `flutter test`
- E2E UI tests: `.maestro/` directory using [Maestro](https://maestro.mobile.dev/), run during release pipeline
