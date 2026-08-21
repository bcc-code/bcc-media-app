# Dependency upgrades: state, findings and remaining work

Living notes for the effort to bring `bccm_core` (and everything that shares its
dependency graph) up to date. Written mid-effort — the "Remaining work" section is
the roadmap, and the "Constraint facts" section is the evidence behind the ordering.
Update it as batches land.

Last updated: 2026-08-21.

## Why this is more involved than it looks

`bccm_core` is not upgraded in isolation. Four packages resolve as one graph, and
pub allows exactly one version of each package across all of them — so anything
that leaks into the public surface (riverpod, freezed) has to move everywhere at once.

| Package                           | How it consumes `bccm_core`                  | Notes                                                            |
| --------------------------------- | -------------------------------------------- | ---------------------------------------------------------------- |
| `brunstadtv_app` (this repo)      | `path: submodules/bccm_flutter/bccm_core`    |                                                                  |
| `kids`                            | `path: ../submodules/bccm_flutter/bccm_core` |                                                                  |
| `bmm_flutter_app` (separate repo) | **`git: ref: main`**                         | Unpinned — every push to `bccm-flutter` main hits it immediately |
| `bccm_player`                     | Not a consumer, but shares the graph         | Pins `riverpod` and `freezed` as _runtime_ deps                  |

Two structural problems worth fixing independently of any version bump:

- **`bmm_flutter_app` tracks `main` with no pin.** `bccm_core` has a version and a
  `CHANGELOG.md` that aren't really used. Tag releases and let consumers opt in.
- **No CI for `bccm_core`.** The `bccm-flutter` repo has no workflows at all, and this
  repo only has docs + Phrase. Nothing verifies core before it reaches three apps.

## Verifying a batch

Do all of these. Several problems only show up in one of them.

```bash
make pubgetall     # NOT per-package `flutter pub get` — see gotcha below
flutter analyze && flutter test                     # main app
cd kids && flutter analyze                          # kids (no test dir)
cd submodules/bccm_flutter/bccm_core && flutter analyze && flutter test
dart run build_runner build --delete-conflicting-outputs   # core AND main app
git status --short   # generated files should show NO diff unless intended
flutter build apk --flavor prod --debug -t lib/main_prod.dart
cd kids && flutter build apk --debug
flutter build ios --no-codesign --debug -t lib/main_prod.dart --flavor prod
cd kids && flutter build ios --simulator --debug
```

### Gotchas that cost real time

- **Use `make pubgetall`, not per-package `pub get`.** There are six pubspecs in the
  tree, and `submodules/bccm_player/example/pubspec.yaml` is resolved implicitly when
  pub runs in `bccm_player`. A stale constraint there broke CI while every package
  resolved fine individually. The six are: root, `kids`, `bccm_core`, `bmm_api/src`,
  `bccm_player`, `bccm_player/example`.
- **`flutter clean` after any plugin _major_ bump.** Stale Gradle/build state produces
  wildly misleading errors — we saw `:share_plus:compileDebugKotlin` failing and
  `PackageInfoPlugin` "cannot find symbol" in `GeneratedPluginRegistrant.java`, both of
  which vanished after a clean. `compileDebugKotlin` passed in isolation. If CI caches
  build output across a plugin major, clean there too.
- **The `dev` Android flavor cannot build**, and this predates the upgrade work. Only
  `flutter_launcher_icons-prod.yaml` exists and `android/app/src/dev/res/` has no
  mipmaps, so `assembleDevDebug` dies on `resource mipmap/ic_launcher not found`.
  Verify Gate-A-type changes against `prod`.
- **`flutter analyze` counts include `bmm_api`.** 82 of the main app's ~87 warnings are
  pre-existing `unused_import`s in generated OpenAPI client code under
  `submodules/bccm_flutter/bmm_api`. They drown out real findings; worth excluding.

## Done

### Gate A — Android toolchain

Unblocked the whole `_plus` plugin family, which requires AGP >= 8.12.1, Gradle >= 8.13,
Kotlin 2.2.0.

|        | Before | After  |
| ------ | ------ | ------ |
| AGP    | 8.10.0 | 8.13.2 |
| Gradle | 8.11.1 | 8.14.3 |
| Kotlin | 2.1.0  | 2.2.21 |

Stayed on the 8.x line deliberately. AGP 9.3 exists and Flutter 3.44's template defaults
to 9.0.1, but AGP 9 needs Gradle 9.5 and is a separate migration. Flutter's own
compatibility table (`flutter_tools/lib/src/android/gradle_utils.dart`) confirms
AGP 8.13.x + Gradle >= 8.13, and 8.13 is the highest 8.x.

Two things surfaced here:

- Both root `build.gradle` files declared AGP and Kotlin a **second time** on the
  `buildscript` classpath, alongside the `plugins {}` block in `settings.gradle`. Left
  alone they fight the upgrade. Bumped to match; ideally collapse to `plugins {}` only.
- **Kids failed where the main app passed.** `:flutter_appauth` compiles against
  `android-31`, and AGP 8.13 hard-fails when a transitive androidx artifact
  (`androidx.fragment:1.7.1`, `androidx.window:1.2.0` — in kids' graph, not the main
  app's) requires 34+. Fixed by normalizing plugin subprojects to `compileSdk 36` in the
  existing `afterEvaluate` block in both root `build.gradle` files. **Delete that block
  once `flutter_appauth` >= 10 lands** (it compiles against 35).

### Gate B — SDK floors

`sdk: ">=3.11.0 <4.0.0"`, `flutter: ">=3.41.6"` in all three app/lib pubspecs. That's the
highest floor anything on the roadmap needs (share_plus 13 / package_info_plus 10 /
device_info_plus 13). **`bmm_flutter_app` still declares `sdk: ^3.8.0` and will fail to
resolve** until it matches.

### Trivial batch

`app_links` 7.2.1 · `flutter_hooks` 0.21.3+1 · `extended_image` 10.1.0 ·
`graphql_flutter` 5.3.0 (pulled `graphql` 5.2.4) · `connectivity_plus` 7.3.1 ·
`vibration` 3.2.0 · `synchronized` 3.4.1+2 · `flutter_lints` 6.0.0 ·
removed unused `clock` · removed the main app's unused direct `js` dep.

- `haptic_feedback.dart` had `hasVibrator ?? false`; vibration 3's `hasVibrator()`
  returns non-nullable `Future<bool>`, so the `??` was dead. Removed.
- `bccm_player` pinned `flutter_hooks: ^0.20.5`, and **caret on a `0.x` version pins the
  minor**, so it excluded 0.21 for every consumer. Had to bump `bccm_player` and its
  `example/`.
- flutter_lints 6 added 32 infos in the main app, all from just two rules:
  `strict_top_level_inference` (19) and `use_null_aware_elements` (13). No warnings, no
  errors, no deprecations from any upgraded package.

### Low batch (partial — see re-ranking below)

`device_info_plus` 12.4.0 · `package_info_plus` 9.0.1 · `share_plus` 12.0.2.

share_plus needed a real code migration off the deprecated `Share` API (6 sites):
`Share.share` / `Share.shareXFiles` → `SharePlus.instance.share(ShareParams(...))`, and
`extension ShareUrl on Share` (an extension on a deprecated class, instantiated as
`Share()`) became a plain `shareUrl()` function on both sides of the
`lib/helpers/share_extension/` conditional export. `Share` still exists in 12 but is gone
in 13, so 13 is now a pure version bump for us.

## Remaining work

Ordering reflects the corrections below, not the original guess.

### Medium

1. **Firebase as one unit** — `firebase_core` 3→4, `firebase_messaging` 15→16,
   `cloud_firestore` 5→6. Pulls firebase-ios-sdk 12 and Android BoM 34. Our floors
   (iOS 15, minSdk 24) already clear it. Risk is native build, not Dart. Also bump the
   `ios/Podfile` `post_install` hook that still forces pods below 12.0 up to 12.0.
2. **`flutter_appauth` 7→12** — only real API change is 8.0.0 replacing
   `preferEphemeralSession` with an `externalUserAgent` enum. One file
   (`auth_state_notifier_mobile.dart`), but it's the login path — needs device testing on
   both flavors. Also lets us delete the Gate A `compileSdk` workaround.
3. **`flutter_local_notifications` 17→22** — v20 converted `initialize`, `show`,
   `zonedSchedule`, `cancel` from positional to named params. Two files in core. Needs
   Java 11+ (already have it).
4. **Codegen cluster, all at once** — `build_runner` → 2.16, `build` → 4.x,
   `analyzer` 7 → 14, `graphql_codegen` 1 → 3, `json_serializable` → 6.14,
   `json_annotation` → 4.12, `mockito` → 5.8, `freezed` 2 → 3. `build_resolvers`,
   `build_runner_core` and `flutter_secure_storage_macos` are all **discontinued**.
   Regenerates all 56 `.graphql.dart` files. Currently pinned by
   `analyzer_plugin: 0.13.4` in the main app's `dependency_overrides`, which exists
   because `custom_lint` 0.7.3 / `riverpod_lint` 2.6.4 cap analyzer at 7.x.

### High

5. **`flutter_secure_storage` 9→11 — can log out the entire user base.** We use both
   `encryptedSharedPreferences: true` and `sharedPreferencesName: 'auth'`
   (`auth_state_notifier_mobile.dart`), and **v11 removed both**. The changelog is
   explicit that you must ship v10 first, which performs the automatic data migration.
   Jumping 9→11 directly makes Android refresh tokens unreadable. This is a
   **two-release migration with a soak period**, and it's the item to plan around most
   carefully. Also merges the iOS/macOS impls into `flutter_secure_storage_darwin`.
   Unblocks: the `js` override, and device_info_plus 13 / package_info_plus 10 /
   share_plus 13.
6. **`auto_route` 9→11** — `AutoRouteGuard.redirect` → `redirectUntil` (now returns
   `void`); `pushNamed`/`replaceNamed`/`navigateNamed`/`popForced` deleted in favour of
   `pushPath`/`replacePath`/`navigatePath`/`pop`; **deep links now navigate instead of
   push by default**, which is the sneaky one given `/r/`, `/tvlogin` and the legacy
   routes go through `helpers/router/special_routes.dart`. Core barely uses auto_route
   (5 refs); the apps do — 39 `@RoutePage` + 62 imports in the main app, 16 + 28 in kids.

### Blocked on other repos

7. **riverpod 2→3** — the big one; the codegen cluster partly waits on it.
   - `StateProvider` / `StateNotifierProvider` move to `legacy.dart` imports. Counts:
     core 10 + 12, main app **52** `StateProvider` + 7 `StateNotifier`, kids 10. The
     `legacy.dart` import is a valid cheap first pass.
   - All `Ref` subclasses removed (we're nearly clean: 0 in core, 2 in the main app).
   - `Provider.autoDispose()` → `Provider(isAutoDispose: true)`.
   - **Behavioural** changes: notifiers recreate on every provider rebuild,
     `StreamProvider` pauses when unlistened, providers auto-retry on failure. Core has
     7 `StreamProvider`s whose timing will change.
   - `riverpod_lint` 3.1.8 pins `riverpod` 3.4.2 exactly and **drops `custom_lint`** for
     the native `analysis_server_plugin`. So `custom_lint: any` comes out of dev deps and
     `analysis_options.yaml` needs new plugin wiring.
   - **Prerequisite: `bccm_player` goes first.** 50 `StateNotifier` refs, 4 imports of the
     legacy `state_notifier` / `flutter_state_notifier` packages, `riverpod` and `freezed`
     as runtime deps, `sdk: ">=3.0.0"`, `flutter: ">=2.5.0"`, `flutter_lints ^4`,
     `pigeon ^22`. Oldest thing in the graph.

### Also outstanding, lower priority

- **Flutter's Built-in Kotlin migration.** Builds now warn that applying KGP "will cause
  build failures in future versions of Flutter", naming `bccm_player`,
  `device_info_plus`, `open_mail_app_plus`, `package_info_plus`, `restart_app`,
  `rudder_plugin_android`, `sentry_flutter`, `share_plus`, `soundpool`, `wakelock_plus`.
  Several are fixed by upgrades above; `bccm_player`, `open_mail_app_plus`,
  `restart_app` and the `soundpool` git fork need their own attention.
- **Swift Package Manager.** `pub get` warns that `open_mail_app_plus`,
  `flutter_to_airplay`, `bccm_player`, `flutter_secure_storage`,
  `flutter_local_notifications` and `flutter_appauth` don't support SPM ("will become an
  error in a future version of Flutter"). Three are on the roadmap already;
  `bccm_player`, `flutter_to_airplay` and `open_mail_app_plus` are not.
- **Discontinued packages in use:** `flutter_markdown` (→ `flutter_markdown_plus`),
  `flutter_image` (kids only), `js`.
- `bccm_player` uses `package:js` with `@JS()` annotations for its web interop; should
  move to `dart:js_interop` / `package:web`. `lib/helpers/share_extension/share_extension_web.dart`
  still uses `dart:html`.
- `gql_dedupe_link` is stuck on `2.0.4-alpha`.
- `kids/android/app/build.gradle` sets `targetSdkVersion` twice (36, then
  `flutter.targetSdkVersion`).

## Constraint facts

Anything marked **solver-verified** came from an actual `pub get` failure, so it's
reliable. Treat the rest as needing confirmation before you plan around it — the
originally-published changelog summaries were wrong or misleading more than once.

**Solver-verified:**

- `freezed` 2.x depends on `build ^2.3.1`.
- `mockito >=5.5.1` depends on `build >=3.0.0 <5.0.0` — so mockito's latest is blocked by
  freezed 2.x. Max usable is 5.5.0. (`pub outdated` claimed 5.7.0 was "Resolvable";
  it isn't.)
- `json_serializable >=6.11.3` needs `build ^4.0.3`; `>=6.13.1` needs `^4.0.4`; and
  `6.8.0`–`6.12.0` pin `json_annotation >=4.9.0 <4.10.0`. So **`json_annotation` 4.10+
  drags the whole build 4.x cluster** — it is not an independent bump.
- `device_info_plus >=13.1.0` needs `win32 ^6.0.1`, while `flutter_secure_storage_windows`
  3.1.2 (via secure_storage 9.x) pins `win32 ^5.0.0`. **The win32-6 majors
  (device_info_plus 13, package_info_plus 10, share_plus 13) are gated on item 5**, not
  independent as first assumed.
- `graphql_flutter >=5.3.0` requires `connectivity_plus ^7`.
- `flutter_secure_storage_web` 1.2.1 wants `js ^0.6.3` while `bccm_player` wants
  `^0.7.1`. **This is why the `js` override in both app pubspecs is load-bearing** — it is
  not, as first assumed, redundant once extended*image moved. It clears with item 5 or by
  migrating `bccm_player` off `package:js`. It \_was* safely removable from `bccm_core`
  itself, since `dependency_overrides` only apply to the root package.

**Not yet verified — check before planning:**

- pub.dev lists `freezed` 3.2.5 as requiring `analyzer >=9.0.0 <11.0.0`, while
  `riverpod_lint` 3.1.8 requires `analyzer ^13`. If accurate, **freezed 3 and the
  riverpod 3 lint stack cannot coexist**, which would reorder the back half of this
  roadmap. Worth a throwaway resolution attempt to confirm.
