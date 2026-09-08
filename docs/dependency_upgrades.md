# Dependency upgrades: state, findings and remaining work

Living notes for the effort to bring `bccm_core` (and everything that shares its
dependency graph) up to date. Written mid-effort — the "Remaining work" section is
the roadmap, and the "Constraint facts" section is the evidence behind the ordering.
Update it as batches land.

Last updated: 2026-09-08.

## Codegen is blocked, and the way out is Flutter 3.47 (2026-09-08)

`build_runner` fails on Flutter **3.47.2**:

```
Exception: Missing implementation of visitDotShorthandPropertyAccess
W SDK language version 3.13.0 is newer than `analyzer` language version 3.9.0
```

The `analyzer` our generators resolve (7.7.1) tops out at language **3.9.0**. Dot
shorthand is Dart 3.13 syntax, so when the resolver walks Flutter's own framework source
it hits a node it cannot represent and summary linking throws. Every Flutter app resolves
that file, which is why it reproduced identically in `bcc-media-play` and
`bcc-connect-live` — one cause, not three bugs.

|                                                        | Dart   | dot-shorthands in framework | codegen |
| ------------------------------------------------------ | ------ | --------------------------- | ------- |
| Flutter **3.44.0** — current `FLUTTER_VERSION` and floor | 3.12.0 | **0**                       | works   |
| Flutter **3.47.2** — where we are going                 | 3.13.2 | 2                           | throws  |

At tag `3.44.0`, `packages/flutter/lib/src/animation/animation_controller.dart` reads
`_AnimationDirection _direction;`. On 3.47.2 the same field is
`_AnimationDirection _direction = .forward;`.

### Decision: target 3.47, do not go back to 3.44

Pinning the local SDK back to 3.44.0 does restore codegen, and it is the correct
emergency lever if someone is stuck. It is **not** the plan, because it is a dead end:

> **`freezed` 4.0.x is the only freezed that reaches `analyzer` 13, and it requires
> `sdk: >=3.13.0`. Flutter 3.44 ships Dart 3.12.0.**

There is no freezed with analyzer 13 *and* Dart 3.12, so the codegen cluster can never
land on 3.44. Moving to 3.47 and doing the cluster are the same project.

Two consequences to plan around:

- **No stopgap.** Codegen stays broken until the cluster lands, so any change needing
  regeneration is blocked meanwhile. This is a deadline, not extra scope.
- **No staging.** The cluster bump and the SDK floor bump are one atomic PR. On the 3.44
  path they could have been landed piecemeal with codegen working throughout; not here.

### The app itself is already 3.47-ready

Measured on 3.47.2, current tree: `flutter analyze` reports **0 errors** and
`flutter test` is **113/113 green**. The only deprecations are four infos —
`offset`→`cursor` (`kids/lib/screens/home.dart`, `lib/components/pages/page_renderer.dart`),
one `withOpacity`, and the known `dart:html`. So the framework side of the SDK bump is
close to free; the work is the toolchain, not the app.

### Also true regardless of SDK

- **`flutter analyze` keeps working**, which is why this is easy to misread as
  repo-specific. It uses the analyzer bundled with the Dart SDK; `build_runner` uses
  `package:analyzer` from pub. Same project, two analyzers, only one of them broken.
- **`graphql_codegen` is not the failing builder** — it processes all 56 inputs fine. The
  throw comes from the resolver-backed builders (freezed / json_serializable / riverpod)
  that need `package:analyzer` to model the SDK.
- **A failing run still deletes first.** `--delete-conflicting-outputs` removed all 97
  outputs in `bccm_core`, wrote none back, then hung rather than exiting. Expect a wiped
  tree and recover with `git checkout -- .` (instant, because they are committed).

## Toolchain compatibility matrix

Every row must hold at once; the resolved `analyzer` is the intersection.

| Package                 | Target       | analyzer constraint              | Dart floor      | Forces at runtime                                      |
| ----------------------- | ------------ | -------------------------------- | --------------- | ------------------------------------------------------ |
| `build_runner`          | `^2.16.0`    | `>=13.3.0 <15.0.0`               | `^3.11.0`       | `build ^4.0.9`                                         |
| `mockito`               | `5.8.1`      | `>=13.3.0 <15.0.0` ← **floor**   | `^3.7.0`        | —                                                      |
| `auto_route_generator`  | `10.6.0`     | `>=10.0.0 <14.0.0` ← **ceiling** | `>=3.4.0`       | `auto_route ^11.1.0`                                   |
| `freezed`               | `4.0.1`      | `>=13.0.0 <15.0.0`               | **`>=3.13.0`**  | `freezed_annotation 3.1.0` (exact)                     |
| `json_serializable`     | `6.14.1`     | `>=10.0.0 <15.0.0`               | `^3.9.0`        | `json_annotation >=4.12.0 <4.13.0`                     |
| `graphql_codegen`       | `3.0.2`      | none — only `build ^4.0.1`       | `>=3.8.0`       | —                                                      |
| `source_gen`            | `4.2.4`      | `>=8.1.1 <15.0.0`                | `^3.11.0`       | — (**do not take 4.3.0**, see below)                   |
| `riverpod_generator`    | _dropped_    | `^13.0.0`                        | —               | `riverpod_annotation 4.0.7` → `riverpod 3.4.3` (exact) |
| `riverpod_lint`         | _dropped_    | `>=13.0.0 <15.0.0`               | —               | `riverpod 3.4.3`, `analysis_server_plugin ^0.3.0`      |
| **resolved**            | —            | **`analyzer 13.3.x`**            | **Dart 3.13**   | → **Flutter 3.47+**                                    |

Things this makes visible that were not obvious from the changelogs:

- **`analyzer` 13.0.0 and up already speak Dart 3.13** (`_currentVersion = '3.13.0'` in
  `lib/src/dart/analysis/experiments.g.dart`; 7.7.1 says `3.9.0`). So the `<14` ceiling
  costs us nothing — the whole 13.x line clears the SDK. 14.3.0 is at `3.14.0`.
- **The window is exactly `13.3.x`**: `mockito` 5.8 and `build_runner` 2.16 set the floor
  at `>=13.3.0`, `auto_route_generator` 10.6 sets the ceiling at `<14`.
- **`auto_route_generator` 10.6.0 is the only release that reaches analyzer 13** (10.5.0
  is `>=9 <11`), and it pulls `auto_route` **11**, not 10. That is what makes the
  auto_route major non-optional.
- **Do not let `source_gen` float to 4.3.0** — it requires `analyzer >=14.0.0` and would
  fight the ceiling. Pin `4.2.4`.
- **`freezed` 4 is what forces the SDK bump.** It is the only freezed reaching analyzer 13
  and it declares `sdk: >=3.13.0`, i.e. Flutter 3.47+. `freezed` 2.5.8 is `analyzer <8` and
  3.2.5 is `analyzer <11`, so neither can share a graph with analyzer 13. This one
  constraint is why the cluster and the Flutter upgrade are a single change.

**Overriding `analyzer` alone does not work** (solver- and compiler-verified). With
`analyzer: ^9.0.0` forced, `build`, `build_resolvers` and `dart_style` all fail to compile
against removed APIs — `ErrorType`, `errorCode`, `definingCompilationUnit`. Bumping
`build_runner` alone fails earlier, at resolution: `auto_route_generator 9.3.1` pins
`build ^2.4.2` while `build_runner >=2.15.3` needs `build ^4.0.9`. The cluster moves
together or not at all.

Blockers to delete during the cutover:

- this repo: `analyzer_plugin: 0.13.4` in `dependency_overrides`
- `kids`: direct `analyzer: ^7.3.0`
- both: `custom_lint: any` and `riverpod_lint: any` — dropped outright for now (see
  "Dropping riverpod codegen"). When `riverpod_lint` 3 comes back it drops `custom_lint`
  for `analysis_server_plugin`, so `analysis_options.yaml` will need new wiring then
- both: `riverpod_generator` and `riverpod_annotation` — removable, one annotation
- `bcc-media-play` and `bcc-connect-live` have no lint stack at all, so they are simpler

SDK floors and CI pins to move in the same PR (Flutter 3.44.0 → 3.47.x):

- `sdk: ">=3.12.0 <4.0.0"` → `">=3.13.0 <4.0.0"` and `flutter: ">=3.44.0"` → `">=3.47.0"`
  in all four pubspecs: root, `kids`, `bccm_core`, `bccm_player`
- `FLUTTER_VERSION` in `.semaphore/semaphore.yml`
- `flutter-version: 3.44.0` in **both** GitHub workflows —
  `bccm-flutter/.github/workflows/test.yml` and `bccm-player/.github/workflows/test.yml`
- `bcc-media-play` and `bcc-connect-live` track `main` unpinned and will break on their
  next `pub get`, now on a **Dart floor** rather than just a package version. Pin them or
  move them in the same wave.
- New `FLUTTER_VERSION` means a new Semaphore cache key. The poisoned-cache failure mode
  is under Gotchas; `install-flutter.sh` now asserts the built tool's version, so it
  should fail loudly rather than silently serve the wrong SDK.

## Why this is more involved than it looks

`bccm_core` is not upgraded in isolation. Six packages resolve as one graph, and
pub allows exactly one version of each package across all of them — so anything
that leaks into the public surface (riverpod, freezed, auto_route) has to move
everywhere at once.

| Package                            | `bccm_core`                                  | `bccm_player`                     | Notes                                                          |
| ---------------------------------- | -------------------------------------------- | --------------------------------- | -------------------------------------------------------------- |
| `brunstadtv_app` (this repo)       | `path: submodules/bccm_flutter/bccm_core`    | `path: submodules/bccm_player`    |                                                                |
| `kids`                             | `path: ../submodules/bccm_flutter/bccm_core` | `path: ../submodules/bccm_player` |                                                                |
| `bcc-media-play` (separate repo)   | **`git: ref: main`**                         | **`git: ref: main`**              | Unpinned on **both**                                           |
| `bcc-connect-live` (separate repo) | **`git: ref: main`**                         | **`git: ref: main`**              | Unpinned on **both**                                           |
| `bccm_player`                      | Not a consumer, but shares the graph         | —                                 | Pins `riverpod`, `freezed`, `state_notifier` as _runtime_ deps |

**Two separate repos track `main` unpinned on the shared packages.** The moment this
migration lands on `bccm-player` or `bccm-flutter` main, `bcc-media-play` and
`bcc-connect-live` both break on their next `pub get` — without any change of their own.
Pin them, or migrate them in the same wave.

Two structural problems worth fixing independently of any version bump:

- **Consumers track `main` with no pin.** `bccm_core` has a version and a
  `CHANGELOG.md` that aren't really used. Tag releases and let consumers opt in.
- **CI covers each package alone, never the graph.** `bccm-flutter` and `bccm_player`
  each run `flutter analyze` + `flutter test` on PRs and pushes to `main`, and this
  repo's Semaphore `Test` block runs `flutter test` whenever `/submodules/` changes — but
  that block only runs _this_ app's `test/`. Nothing resolves core against all four
  consuming apps, which is exactly what a shared-graph bump breaks.

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
- **A poisoned Semaphore SDK cache can serve the wrong Flutter.** The key
  `flutter-sdk-macos-3.44.0` once contained Flutter **3.41.9** (revision `00b0c91f06`),
  while the Linux key of the same name correctly held 3.44.0 (`559ffa3f75`) — so the
  Android jobs passed and only iOS failed. It surfaced as a pub error that named
  `app_links`, not the SDK:
  `Because app_links 7.2.1 requires Flutter SDK version >=3.44.0 [...] version solving failed`.
  **Always read the `flutter --version` line that `install-flutter.sh` prints** before
  believing `FLUTTER_VERSION`. `install-flutter.sh` now asserts the built tool's version
  against `FLUTTER_VERSION`, reinstalls once, and fails loudly rather than continuing on
  the wrong SDK — but a stale key still has to be dropped with `cache delete` once.
- **`flutter analyze` counts are dominated by pre-existing noise.** Of 132 issues, 87 are
  warnings and 82 of those come from generated OpenAPI client code (75 `unused_import`,
  7 `unused_element_parameter`) — none from this effort. Only 50 issues are outside it.
  Exclude generated code before reading a count as a regression signal.

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

`sdk: ">=3.12.0 <4.0.0"`, `flutter: ">=3.44.0"` in all four app/lib pubspecs (root,
`kids`, `bccm_core`, `bccm_player`), matching the `FLUTTER_VERSION` pinned in
`.semaphore/semaphore.yml`. `bcc-media-play` and `bcc-connect-live` are on the same
floors. `bccm_player/example` (`sdk: ">=3.0.0"`) and `bmm_api/src` (`sdk: ">=2.15.0"`)
still lag; neither ships.

**These move again in the codegen cutover** — to `sdk: ">=3.13.0"` / `flutter: ">=3.47.0"`,
because `freezed` 4 requires Dart 3.13. Checklist under the toolchain matrix.

These floors were initially set to `>=3.11.0` / `>=3.41.6`, derived from share_plus 13 /
package_info_plus 10 / device_info_plus 13. That was **wrong**: `app_links` 7.2.1 requires
`sdk: ^3.12.0` and `flutter: ">=3.44.0"`, and nobody re-derived the floor after the trivial
batch raised the bar. **When bumping anything, re-check the floor of every package in the
batch, not just the ones you reasoned about up front** — a too-low declared floor doesn't
just under-document, it stops pub from producing a clear error and you get a confusing
transitive failure instead (see the next gotcha).

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
  errors, no deprecations from any upgraded package. (Now 20 + 14 as code has been added
  since — the rules, not the bump, are the source.)

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
   (both Podfiles `platform :ios, '15.0'`, minSdk 24) already clear it — but the main
   app's `ios/Runner.xcodeproj` still carries a stale `IPHONEOS_DEPLOYMENT_TARGET = 14.0`
   on at least one configuration; normalise it to 15.0 first. Risk is native build, not
   Dart. Also raise the `ios/Podfile` `post_install` hook, which still only floors pods
   at 12.0.
2. **`flutter_appauth` 7→12** — only real API change is 8.0.0 replacing
   `preferEphemeralSession` with an `externalUserAgent` enum. One file
   (`auth_state_notifier_mobile.dart`), but it's the login path — needs device testing on
   both flavors. Also lets us delete the Gate A `compileSdk` workaround.
3. **`flutter_local_notifications` 17→22** — v20 converted `initialize`, `show`,
   `zonedSchedule`, `cancel` from positional to named params. Two files in core. Needs
   Java 11+ (already have it).
4. **Codegen cluster + Flutter 3.47, one atomic PR — BLOCKING.** Nothing regenerates
   until this lands, and it cannot be split: `freezed` 4 needs Dart 3.13. See the top
   section for the decision and the matrix for why.
   `build_runner` → 2.16, `build` → 4.x, `analyzer` 7 → **13.3.x** (not 14 — see the
   matrix, `auto_route_generator` caps it at `<14`), `graphql_codegen` 1 → 3,
   `json_serializable` → 6.14, `json_annotation` → 4.12, `mockito` → 5.8,
   `freezed` 2 → **4** (not 3), `source_gen` held at 4.2.4. `build_resolvers`,
   `build_runner_core` and `flutter_secure_storage_macos` are all **discontinued**.
   Regenerates all 56 `.graphql.dart` files. Currently pinned by
   `analyzer_plugin: 0.13.4` in the main app's `dependency_overrides`, which exists
   because `custom_lint` 0.7.3 / `riverpod_lint` 2.6.4 cap analyzer at 7.x.

   **It does not drag riverpod 3 with it** — see "Dropping riverpod codegen" below. It
   does force **freezed 4** and **auto_route 11**, because those generators are the only
   ones that reach analyzer 13.

   Two prep PRs can land ahead of it, needing no version bump and no regeneration:
   - **A — freezed syntax, 49 classes.** `class X with _$X` → `abstract class X with _$X`.
     Verified that freezed 2.5.8 generates for the new form (see Constraint facts), so
     existing generated files stay valid and this is an analyze-and-test PR.
   - **B — drop riverpod codegen**, which also removes the `analyzer_plugin` override and
     kids' direct `analyzer`.

   That leaves the cutover itself as version bumps + the auto_route 11 API changes +
   regenerate.

### Dropping riverpod codegen (unblocks item 4 from item 7)

`riverpod_generator` is the only thing in the cluster that drags in `riverpod` 3.4.3
(via `riverpod_annotation` 4.0.7, an exact pin). We use it for **one annotation**:

- `lib/components/shorts/short_scroll_view.dart:343` — `@riverpod class WakeLockCount`,
  a notifier with `int build() => 0` plus `increment()`/`decrement()`. Hand-writing it
  against riverpod 2 is roughly ten lines.
- `bccm_core`'s only `riverpod_annotation` import
  (`src/features/providers/connectivity_provider.dart`) is **unused** — that file uses
  plain `Provider.autoDispose` / `StreamProvider.autoDispose`. Just delete the import.

So: hand-write that notifier, drop `riverpod_generator` and `riverpod_annotation`, and
drop `riverpod_lint` + `custom_lint` (lint-only, and the reason `analyzer_plugin` is
overridden). **riverpod 2→3 then stops being a prerequisite for anything** and becomes
independently schedulable. Re-add `riverpod_lint` 3.x after that migration, when it no
longer conflicts.

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
6. **`auto_route` 9→11 — not optional, and not separable from item 4.**
   `auto_route_generator` 10.6.0 is the only release reaching analyzer 13, and it pulls
   `auto_route ^11.1.0`, so this lands _with_ the codegen cutover rather than after it.
   Changes: `AutoRouteGuard.redirect` → `redirectUntil` (now returns `void`) — **we have
   zero guards**, they live in `bcc-media-play` and `bcc-connect-live`, so that part is
   theirs; `pushNamed`/`replaceNamed`/`navigateNamed`/`popForced` deleted in favour of
   `pushPath`/`replacePath`/`navigatePath`/`pop` (6 call sites here: 4 main app, 2 kids);
   and **deep links now navigate instead of push by default**, which is the sneaky one
   given `/r/`, `/tvlogin` and the legacy routes go through
   `helpers/router/special_routes.dart`. Core barely uses auto_route (5 files); the apps
   do — 39 `@RoutePage` + 62 imports in the main app, 16 + 28 in kids.

### Independently schedulable

7. **riverpod 2→3** — the big one, but **no longer on the critical path.** Once
   `riverpod_generator` is dropped (see above), nothing in the codegen cluster needs
   riverpod 3, so this can be scheduled on its own merits.
   - `StateProvider` / `StateNotifierProvider` move to `legacy.dart` imports. Real
     declaration counts are small — see the sizing table below; graph-wide it is 8 + 8.
     (Do **not** count these with a bare `grep StateProvider`: `authStateProvider` is a
     substring match and inflates the main app from 3 to ~52.) The `legacy.dart` import
     is a valid cheap first pass.
   - All `Ref` subclasses removed — we have zero, so this is a no-op.
   - `Provider.autoDispose()` → `Provider(isAutoDispose: true)`.
   - **Behavioural** changes: notifiers recreate on every provider rebuild,
     `StreamProvider` pauses when unlistened, providers auto-retry on failure. Core has
     7 `StreamProvider`s whose timing will change.
   - `riverpod_lint` 3.1.9 pins `riverpod` 3.4.3 exactly and **drops `custom_lint`** for
     the native `analysis_server_plugin`. Since we drop both lints ahead of the cutover,
     this becomes a re-adoption step here: `analysis_options.yaml` needs new plugin wiring
     when `riverpod_lint` 3 comes back.
   - **Prerequisite: `bccm_player` goes first.** 50 `StateNotifier` refs, 4 imports of the
     legacy `state_notifier` / `flutter_state_notifier` packages, and `riverpod ^2.6.1` /
     `freezed ^2.3.2` as _runtime_ deps. Its SDK floors are current (`>=3.12.0` /
     `>=3.44.0`); what is still old is the dev stack — `flutter_lints ^4`, `pigeon ^22`.

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
- `gql_dedupe_link` resolves to `2.0.4-alpha`, pulled in transitively by `graphql` 5.2.4.
  Upstream is on `4.0.0` stable, so this is our constraint, not an abandoned package —
  re-check when `graphql` moves.
- `kids/android/app/build.gradle` sets `targetSdkVersion` twice (36, then
  `flutter.targetSdkVersion`).

## Migration order for the codegen cluster

Dictated by the runtime pins, not preference. `bccm_player` and `bccm_core` pin
`freezed_annotation` and `auto_route` as **runtime** deps, and pub resolves one version of
each across the whole graph — so no app can move until both have. (`riverpod` is also a
runtime pin, but it no longer moves with this cluster.)

```
bccm_player  →  bccm_core  →  brunstadtv_app + kids  →  bcc-media-play  →  bcc-connect-live
```

Break the chicken-and-egg with `dependency_overrides` + local paths: validate a migrated
package against a real app before publishing it. `bcc-media-play/flutter/pubspec.yaml`
already has the pattern commented out in its `dependency_overrides` block.

Start with `bccm_player`. It has 284 Dart tests and a GitHub Actions workflow enforcing
them — by a wide margin the strongest safety net in the graph. Its freezed surface is
also already converted (2 classes, both `abstract class`), so for prep PR A it is a no-op
and `bccm_core` is the real work.

Suggested order overall:

1. Prep PR A (freezed syntax, 49 classes) and prep PR B (drop riverpod codegen). Both
   land on current versions with **no regeneration**, so they are verifiable today on
   3.47 with `flutter analyze` + `flutter test` despite codegen being down. Order:
   `bccm_player` → `bccm_core` → apps.
2. The cutover: bump the cluster, take `auto_route` 11, raise the SDK floors and CI pins
   to 3.47, regenerate everything, verify per "Verifying a batch". One PR, must land
   green — see the checklist under the matrix.
3. `riverpod` 2→3 whenever it suits, independently.

Anyone who gets genuinely stuck before step 2 lands can pin their local SDK to 3.44.0 as
an emergency lever — codegen works there. It is a personal unblock, not a project
direction; the floors and CI stay pointed at 3.47.

### Sizing (re-measured 2026-09-08, generated files excluded)

`@freezed` / `StateProvider` / `StateNotifierProvider` are **declaration** counts;
`.valueOrNull`, `.autoDispose` and `@RoutePage` are occurrences.

| Repo               | `@freezed` v2-style | `StateNotifierProvider` | `StateProvider` | `.valueOrNull` | `.autoDispose` | `@RoutePage` |
| ------------------ | ------------------- | ----------------------- | --------------- | -------------- | -------------- | ------------ |
| `bccm_player`      | 0 (2 already v3)    | 5                       | 0               | 0              | 0              | 0            |
| `bccm_core`        | **41**              | 1                       | 4               | 4              | 2              | 0            |
| `brunstadtv_app`   | 5                   | 2                       | 3               | 21             | 2              | 39           |
| `kids`             | 0                   | 0                       | 0               | 0              | 0              | 16           |
| `bcc-media-play`   | 2                   | 1                       | 0               | 2              | 0              | 20           |
| `bcc-connect-live` | 1                   | 1                       | 1               | 24             | 13             | 25           |

Zero occurrences anywhere of `Ref` subclasses (`FutureProviderRef` etc.) or
`ProviderObserver` — both riverpod 3 breaking changes are no-ops for us.

### What each piece actually involves

**riverpod 2→3 is smaller than its reputation.** `StateNotifierProvider` and
`StateProvider` are _moved to `legacy.dart`_, not removed — an import change, 16 declarations.
`.valueOrNull` → `.value` is mechanical, ~51 sites. The real risk is behavioural and
invisible to the compiler: all providers now filter updates with `==` instead of
identity, notifiers are recreated on every provider rebuild, and `StreamProvider` pauses
when unlistened. `bccm_core`'s 7 `StreamProvider`s change timing.

**freezed 2→4** is smaller than a two-major jump suggests. Only two breaking changes
touch us:

- Classes must be `abstract`, `sealed`, or manually implement `_$X` (freezed 3.0.0) —
  `class X with _$X` → `abstract class X with _$X`, 49 classes, 41 in `bccm_core`. This is
  prep PR A; see "Constraint facts" for why it can land early.
- `final` inside constructor parameters is gone (freezed 4.0.0, because Dart 3.13 removed
  the syntax), which also stops `@unfreezed` defining immutable fields. **We have zero
  `@unfreezed` and zero instances**, so this is a no-op.

`when`/`map` were removed in 3.0.0 but **restored in 3.1.0**, so the widely-cited
"freezed 3 deletes when/map" break does not apply at 4.0.1.

**auto_route 9→11** has a narrow surface, and it is narrowest here: **zero**
`AutoRouteGuard`s and zero uses of `redirect(` in this repo, `kids` or `bccm_core` — both
guards live in `bcc-media-play` and `bcc-connect-live`, so `redirectUntil` is their
migration, not ours. `*Named(` is 7 graph-wide (4 main app, 2 kids, 1 `bcc-media-play`).
The sneaky one for us is deep links defaulting to navigate instead of push — relevant to
`helpers/router/special_routes.dart`.

### One more gotcha, specific to this batch

Generated files are committed in every repo and nothing is gitignored. That is what made
recovery trivial when `--delete-conflicting-outputs` wiped them during investigation —
but it also means `build_runner` **prompts on stdin** on every cold build:

> Found N declared outputs which already exist on disk. Delete these files?

In a non-interactive shell that prompt blocks **forever**, with no output and flat CPU —
it looks exactly like a slow build. Always pass `--delete-conflicting-outputs`, and run
from a real terminal or with `< /dev/null` (which fails loudly instead of hanging).

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

**Resolved 2026-09-08 — freezed and the riverpod 3 lint stack _can_ coexist.**

The concern below was real for freezed **3**, and disappears at freezed **4**:

- `freezed 3.2.5` → `analyzer >=9.0.0 <11.0.0` (the conflict as originally described)
- `freezed 4.0.1` → `analyzer >=13.0.0 <15.0.0`
- `riverpod_lint 3.1.9` → `analyzer >=13.0.0 <15.0.0`

So target **freezed 4**, not 3, and the back half of this roadmap keeps its ordering.
Related: `riverpod` 3.4.3's changelog notes it dropped `analyzer` from its own dependency
graph entirely — "whose version ceiling was blocking other tooling" — which is precisely
the ceiling the `analyzer_plugin: 0.13.4` override exists to work around. That override
should come out with this batch.

**Resolved 2026-09-08 — `freezed` 2.5.8 _does_ generate for the v3-style declaration.**

Tested directly: a clean pure-Dart package (no Flutter, so the SDK-resolution bug cannot
interfere) on `freezed: 2.5.8` with `abstract class Thing with _$Thing` generates correct
output, byte-comparable in structure to the non-abstract form.

Note that `bccm_player` was _not_ evidence for this, despite being written that way — its
committed `.freezed.dart` files were last generated in Oct 2024, and the `abstract class`
change landed May 2025 (`fd6b62c`). They compile because the generated mixin does not care
about the declaration keyword; nobody had regenerated since.

Consequence: the 49-class conversion (41 in `bccm_core`) is an **independent, low-risk PR
that can land now**, on the current `freezed 2.5.8`, with no regeneration required — which
de-risks most of the freezed work ahead of the cutover.
