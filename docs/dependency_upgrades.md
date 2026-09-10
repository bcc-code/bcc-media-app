# Dependency upgrades: state, findings and remaining work

Living notes for the effort to bring `bccm_core` (and everything that shares its
dependency graph) up to date. Written mid-effort — the "Remaining work" section is
the roadmap, and the "Constraint facts" section is the evidence behind the ordering.
Update it as batches land.

Last updated: 2026-09-10.

## Status (2026-09-09)

**Codegen works again. The cluster landed and the SDK is on Flutter 3.47.2.**

`bccm_player` 2.0.0, `bccm_core` 2.0.0 and `brunstadtv_app`/`kids` are all merged on
`main`/`master`, resolving at `analyzer 13.3.0`, with `build_runner` running normally.

`bcc-media-play` and `bcc-connect-live` are migrated too (2026-09-10) — both resolve at
`analyzer 13.3.0` against post-cutover `bccm_core`, both at their analyze baselines with
tests and Android/iOS builds green. **The whole graph is on the new toolchain.**

They still track `git: ref: main`, so the next graph-wide bump will arm the same trap:
they break only when something forces a re-resolve, which means the failure surfaces late
and far from its cause. Pinning them to a tag is the fix — see Remaining work.

Still outstanding: Firebase, `flutter_appauth`, `flutter_local_notifications`,
`flutter_secure_storage` (the two-release one), and riverpod 2→3.

## Toolchain compatibility matrix

**Landed 2026-09-09** — kept because it is the map for migrating the two remaining
consumers, and the constraints still bind. Every row must hold at once; the resolved
`analyzer` is the intersection.

One row the original matrix missed: **`pigeon`** (dev dep of `bccm_player`) also caps
`analyzer`, at `<8` up to 22.x. The floor for analyzer 13 is **27.3.1**.

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

Analyzer pins blocking the cutover — **all already removed by prep PR B**, listed here
because they are the things that would otherwise pin `analyzer` at 7.x:

- ~~this repo: `analyzer_plugin: 0.13.4` in `dependency_overrides`~~ ✅ removed
- ~~`kids`: direct `analyzer: ^7.3.0`~~ ✅ removed
- ~~both: `custom_lint: any` and `riverpod_lint: any`~~ ✅ removed
- ~~both: `riverpod_generator` and `riverpod_annotation`~~ ✅ removed (also from
  `bcc-media-play` and `bcc-connect-live`, where they were unused)

**The remaining analyzer cap is `freezed` 2.5.8 (`analyzer <8.0.0`)**, and only the
cutover itself lifts it. The `js: ^0.7.1` override stays — still load-bearing.

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
dart run build_runner build   # core AND main app
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

**These moved again in the cutover** (2026-09-09) to `sdk: ">=3.13.0"` /
`flutter: ">=3.47.0"`, because `freezed` 4 requires Dart 3.13, along with
`FLUTTER_VERSION` and both GitHub workflows to 3.47.2.

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

### Prep PR A — freezed abstract-class syntax (landed 2026-09-08)

All **49** `@freezed` classes converted from `class X with _$X` to
`abstract class X with _$X`, across all four repos. Zero v2-style declarations remain
anywhere.

| Repo               | Classes | PR   |
| ------------------ | ------- | ---- |
| `bccm_core`        | 41      | #14  |
| `brunstadtv_app`   | 5       | #644 |
| `bcc-media-play`   | 2       | #26  |
| `bcc-connect-live` | 1       | #179 |
| `bccm_player`      | 0       | already converted |
| `kids`             | 0       | none present |

No regeneration was required — the generated mixin does not depend on the declaration
keyword, so the committed `.freezed.dart` files stayed valid. Verified: `bccm_core`
analyze clean + 68/68 tests; main app 132 issues (unchanged baseline, 0 errors) + 113/113;
`bcc-media-play` 103/103; `bcc-connect-live` 99/99.

None of the 49 were unions (each has one public factory plus `fromJson` where serialized),
so `abstract` was correct throughout and nothing needed `sealed`. Nothing hand-extends or
implements these types.

Worth knowing *why* this is safe, since it looks like a visibility change: freezed 2's
generated mixin gives every field a **concrete** getter body of
`throw _privateConstructorUsedError`, which is why the class compiled as non-abstract.
`abstract` only forbids calling a *generative* constructor, and construction goes through
`const factory X(...) = _X`, which is legal on an abstract class. It removes the ability
to hold a bare instance whose every getter throws — a compile error instead of a runtime
one. That is exactly why freezed 3 made the keyword mandatory.

### Dropping riverpod codegen — prep PR B (✅ done 2026-09-08)

`riverpod_generator` was the only thing in the cluster dragging in `riverpod` 3.4.3
(via `riverpod_annotation` 4.0.7, an exact pin). It was used for **one annotation**:

- `lib/components/shorts/short_scroll_view.dart:343` — `@riverpod class WakeLockCount`,
  a notifier with `int build() => 0` plus `increment()`/`decrement()`. Hand-writing it
  against riverpod 2 is roughly ten lines.
- `bccm_core`'s only `riverpod_annotation` import
  (`src/features/providers/connectivity_provider.dart`) is **unused** — that file uses
  plain `Provider.autoDispose` / `StreamProvider.autoDispose`. Just delete the import.

The generated provider was a plain `AutoDisposeNotifierProvider`, which riverpod 2 already
has, so the replacement is a near-copy — type-identical, `name:` preserved for devtools,
and every call site (`ref.read(wakeLockCountProvider.notifier)`, `ref.listen(...)`)
untouched:

```dart
final wakeLockCountProvider =
    NotifierProvider.autoDispose<WakeLockCount, int>(WakeLockCount.new, name: 'wakeLockCountProvider');

class WakeLockCount extends AutoDisposeNotifier<int> {
  @override
  int build() => 0;
  void increment() => state++;
  void decrement() => state--;
}
```

What landed: that notifier hand-written, `short_scroll_view.g.dart` and its `part`
directive deleted, `riverpod_generator` + `riverpod_annotation` dropped, `riverpod_lint` +
`custom_lint` dropped, the `analyzer_plugin: 0.13.4` override removed, and kids' direct
`analyzer: ^7.3.0` removed. `riverpod_generator` was also dead weight in `bcc-media-play`
and `bcc-connect-live` (neither had an annotation) and came out of both.

**riverpod 2→3 no longer gates anything** and is independently schedulable.

Two things worth knowing about the result:

- **It does not free the analyzer by itself.** `analyzer` still resolves to 7.6.0/7.7.1,
  because `freezed` 2.5.8 caps it at `<8.0.0`. Removing the lint stack removed one cap;
  only the cutover lifts the other. What PR B bought is the decoupling, not the analyzer.
- **It added 2 sites to the eventual riverpod 3 rename** — see the debt note in item 7.
  The `@riverpod` form it replaced was already riverpod 3's class-based syntax.

Verified across all five packages, every baseline matched: `bccm_core` no issues + 68/68 ·
main app 132 issues + 113/113 · kids 10 issues · `bcc-media-play` 13 issues + 103/103 ·
`bcc-connect-live` 1 issue + 99/99. Resolved with `make pubgetall`.

**Dropping the two lint packages costs nothing.** Two independent reasons, both checked:

1. **They were never switched on.** `custom_lint` is a plugin *host* that only loads when
   `analysis_options.yaml` registers it under `analyzer: plugins:` (its own README states
   this). **None of the 8 `analysis_options.yaml` files across the four repos has a
   `plugins:` entry**, the only `include:` is `flutter_lints/flutter.yaml` (no plugins),
   and nothing in `Makefile`, Semaphore or any GitHub workflow runs `dart run custom_lint`.
   Git history agrees: `custom_lint` was never registered — the only `plugins:` entry this
   repo ever had was `flutter_hooks_lint_plugin` (added 2023-02, removed 2024-04).
2. **They would not work anyway on Dart 3.13.** Wiring `plugins: - custom_lint` back in and
   planting deliberate violations (`avoid_public_notifier_properties`, then
   `prefer_final_provider`) produced **no** riverpod diagnostics, via `flutter analyze` or
   `dart run custom_lint` directly — even though `riverpod_lint` 2.6.4 is a correctly
   registered plugin (`custom_lint_builder: ^0.7.0`). It resolves `analyzer` 7.x, held
   there by the `analyzer_plugin: 0.13.4` override, and 7.x cannot parse Dart 3.13. **The
   lint stack is dead for the same root cause as codegen**, and it fails silently rather
   than erroring.

So `custom_lint: any` + `riverpod_lint: any` + the `analyzer_plugin: 0.13.4` override are
dead weight whose only live effect is pinning `analyzer` to 7.x — the very thing blocking
the cutover.

Re-adopting riverpod lints later is **not** "put the `plugins:` line back". Wiring it in
today also emits:

> `warning • Support for legacy plugins is deprecated, and will be removed in an upcoming
> version of Dart` — `analysis_options_deprecated_plugins`

The legacy analyzer-plugin system that `custom_lint` uses is on its way out; the
replacement is `analysis_server_plugin`, which is exactly what `riverpod_lint` 3.x moved
to. So it is a deliberate piece of work after riverpod 3: `riverpod_lint` 3.x on the new
plugin system, not the old wiring.

### Codegen cluster + Flutter 3.47 — the cutover (landed 2026-09-09)

The atomic PR. `bccm_player` 2.0.0 (#87), `bccm_core` 2.0.0 (#16), `brunstadtv_app`+`kids`
(#646). Resolves at **`analyzer 13.3.0`** exactly as predicted, with `source_gen`
backtracking to 4.2.4 rather than taking 4.3.0.

Landed: `build_runner` 2.16.1 · `build` 4.0.11 · `freezed` 4.0.1 ·
`freezed_annotation` 3.1.0 · `mockito` 5.8.1 · `graphql_codegen` 3.0.2 ·
`json_serializable` 6.14.1 · `json_annotation` 4.12.0 · `auto_route` 11.1.0 ·
`auto_route_generator` 10.6.0 · `pigeon` 28.0.0 · SDK floors to 3.13.0/3.47.0 ·
`FLUTTER_VERSION` and both GitHub workflows to 3.47.2. `freezed` also moved out of
`bccm_player`'s **runtime** deps into dev deps, where a generator belongs.

Verified: `bccm_player` clean + 284/284 · `bccm_core` clean + 68/68 · main app 132 issues
(unchanged baseline, 0 errors) + 113/113 · kids 10 issues (baseline) · Android and iOS
simulator builds for both apps. Manually smoke-tested on Android and iOS.

**Three things the plan did not predict:**

- **`pigeon` blocked resolution.** `bccm_player` pinned `pigeon ^22.3.0`, which caps
  `analyzer <8`. The floor for analyzer 13 is **27.3.1**; went to `^28.0.0`. Pigeon is a
  standalone CLI (`make pigeons`), not a `build_runner` builder, so nothing regenerated —
  but **its committed output is now six majors behind the generator**, and the next
  `make pigeons` will produce a large Dart/Kotlin/Swift diff. Do that on its own.
- **freezed 4 broke a mockito fake.** Freezed 2 put `DiagnosticableTreeMixin` only on the
  concrete impl; freezed 4 hoists it onto the generated *mixin*, so a freezed type's
  interface now requires `toString({DiagnosticLevel minLevel})` — which mockito's
  `SmartFake` cannot satisfy:
  `'SmartFake.toString' isn't a valid concrete implementation of '_$PlayerState.toString'`.
  There is **no opt-out**: freezed enables this whenever `DiagnosticableTreeMixin` is
  importable in that library (`freezed/lib/src/models.dart:1571`), with no build.yaml or
  annotation toggle, and mockito's `unsupportedMembers` does not help (it only covers
  unknown return types like type variables). Here the fix was trivial —
  `MockSpec<PlayerStateNotifier>` was generated but referenced nowhere, so the spec was
  deleted. **Anywhere a freezed type is genuinely mocked, this needs a hand-written fake.**
- **`auto_route` 11 deprecated more than the docs suggested.** Beyond the 6 predicted
  `pushNamed` → `pushPath` renames (identical signatures), there were 66 uses of
  `durationInMilliseconds`/`reverseDurationInMilliseconds` → `duration:`/`reverseDuration:
  const Duration(...)` across both `router.dart` files, plus one `pathParams` → `params`.

**Deep links turned out to be a non-event.** The doc had flagged auto_route 11's
navigate-instead-of-push default as the sneaky risk. In practice `navigateNamedFromRoot`
is *our own* extension in `bccm_core/lib/src/utils/router_utils.dart`, already calling
`root.matcher.match(...)` + `navigateAll(...)` — i.e. already navigate semantics. It
needed no change.

### Consumer repos migrated (2026-09-10)

`bcc-media-play` and `bcc-connect-live` brought onto the new toolchain. Same bumps as the
cutover, SDK floors to 3.13.0/3.47.0, `FLUTTER_VERSION` to 3.47.2. Both resolve at
`analyzer 13.3.0`. Verified: `bcc-media-play` 13 issues (baseline) + 103/103,
`bcc-connect-live` 1 issue (baseline) + 99/99, Android and iOS simulator builds for both.

Smaller than the table suggested:

- **`AutoRouteGuard` needed no change in either repo.** Both `AuthGuard`s implement
  `onNavigation`, not `redirect`, so `redirectUntil` never applied. The doc had this
  listed as "theirs, not ours" — it was in fact nobody's.
- **`pushNamed` → `pushPath`: 1 site total** (`bcc-media-play/lib/utils/main_js_channel.dart`).
- Two more auto_route 11 deprecations in `bcc-connect-live`:
  `durationInMilliseconds`/`reverseDurationInMilliseconds` again, plus
  **`animatePageTransition: false` → `duration: Duration.zero`** on
  `AutoTabsRouter.tabBar` (`lib/screens/tv/tv_tabs.dart`). Exactly equivalent — the
  constructor does `duration ?? (animatePageTransition ? null : Duration.zero)`.
- **`bcc-media-play`'s CI was already on Flutter 3.47.2** while its pubspec floor said
  `>=3.44.0`, so codegen would already have been broken in that pipeline.
- **The Gradle-clean gotcha fired again.** `bcc-media-play` failed with
  `GeneratedPluginRegistrant.java:99: cannot find symbol`; `flutter clean` fixed it.
  Third time this session an existing note in here saved a wrong diagnosis.

### `flutter_appauth` 7→12 + Gate A clamp narrowed (2026-09-10)

`flutter_appauth` and `flutter_appauth_platform_interface` both 7.0.1 → 12.1.0 in
`bccm_core` — they must move together, 12.1.0 pins the interface to `^12.1.0`.

**Zero source changes.** The migration note everyone cites — 8.0.0 replacing
`preferEphemeralSession` with the `externalUserAgent` enum — **does not apply to us**;
`preferEphemeralSession` appears nowhere in the graph. The two call sites (`TokenRequest`,
`AuthorizationTokenRequest`) compile untouched. Floors are fine: 12.0.0 wants Flutter
3.38.1 / Dart 3.10 (we are on 3.47.2 / 3.13), Android 24 ✓, iOS 13 ✓.

**The Gate A `compileSdk` clamp is now narrowed, not deleted.** Removing it outright is
what the old note promised, and it works for the main app — but **kids still fails**, on
`soundpool` (the `hohoins` git fork, kids-only) which compiles against android-31. So:

- main app: blanket clamp **removed**
- kids: replaced with a clamp on `soundpool` alone

That matters for item 5: the blanket version would have silently held
`flutter_secure_storage` 11 below the `compileSdk 37` it requires. A per-plugin clamp
does not. Remove the kids one once `soundpool` is forked forward or replaced.

Verified: `bccm_core` clean + 68/68 · main app Android + iOS sim · kids Android + iOS sim,
kids analyze at its 10-issue baseline.

**Not verified: login itself.** Neither analyze nor the unit tests exercise a real Auth0
round-trip. Needs device testing on both flavors — sign-in, sign-out, refresh, and the
`signedOutManually` prompt path. Also new in appauth 11: Android throws a
`PlatformException` with code `null_activity` when the Flutter activity is detached. Our
handler branches only on `FlutterAppAuthOAuthError.invalidGrant`, so `null_activity` falls
through to "retry later" — plausible, but nobody has exercised it.

### The iOS Podfile deployment-target hack (removed 2026-09-08)

Simulator builds started failing on Flutter 3.47 with ~50 Swift errors of the form
`'AnyCancellable' is only available in iOS 13.0 or newer`, all in `bccm_player`.

Cause was a stale `post_install` hook in `ios/Podfile` and `kids/ios/Podfile`:

```ruby
if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 12.0
  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
end
```

Flutter's `podhelper.rb` **deletes** `IPHONEOS_DEPLOYMENT_TARGET` from pod targets so they
inherit the higher value from Runner (`platform :ios, '15.0'`). The hook then read the
absent key as `nil`, and `nil.to_f` is `0.0` — which is `< 12.0` — so it wrote `12.0` back
onto every pod Flutter had just cleared. 153 pod targets sat at 12.0 against 36 at 15.0;
`bccm_player` compiled at iOS 12 despite its podspec asking for 13.0.

**This is the second instance of the same pattern as the analyzer break: a workaround that
was harmless on 3.44 and actively wrong on 3.47.** The threshold in `podhelper.rb` moved:

| Flutter | `inherit_deployment_target` | Effect on `bccm_player` (podspec 13.0) |
| ------- | --------------------------- | -------------------------------------- |
| 3.44.0  | `... < 13`                  | 13 is not < 13 → key kept at 13.0, fine |
| 3.47.2  | `... < 15`                  | 13 < 15 → key deleted → hook wrote 12.0 |

Fix was to delete the loop from both Podfiles; pods now inherit 15.0. Expect more of these
during the cutover — grep for old `post_install` workarounds before blaming new code.

The same commit normalised five stale `IPHONEOS_DEPLOYMENT_TARGET = 14.0` entries in
`ios/Runner.xcodeproj` up to 15.0.

## Remaining work

Ordering reflects the corrections below, not the original guess.

### Medium

1. **Firebase as one unit** — `firebase_core` 3→4, `firebase_messaging` 15→16,
   `cloud_firestore` 5→6. Pulls firebase-ios-sdk 12 and Android BoM 34. Our floors
   (both Podfiles `platform :ios, '15.0'`, `Runner.xcodeproj` now uniformly 15.0,
   minSdk 24) already clear it. Risk is native build, not Dart. The old `post_install`
   deployment-target hook that would have fought this is already gone — see Done.
2. **`flutter_appauth` 7→12 — ✅ done 2026-09-10** (see Done). The Gate A clamp it was
   blocking is now narrowed to `soundpool` in kids and gone from the main app, so
   `compileSdk 37` is available for item 5.

3. **`flutter_local_notifications` 17→22** — v20 converted `initialize`, `show`,
   `zonedSchedule`, `cancel` from positional to named params. Two files in core. Needs
   Java 11+ (already have it).
4. **Pin `bcc-media-play` and `bcc-connect-live` to tags instead of `ref: main`.** Their
   migration is ✅ done (2026-09-10, see Done); this is the leftover structural fix.
   Both consume `bccm_core` and `bccm_player` as `git: ref: main` with committed
   lockfiles, so a breaking change upstream does not fail them at merge time — it fails
   whenever something next forces a re-resolve. That is exactly how the cutover played
   out: they kept resolving against the pre-cutover commit until `pub upgrade` was run.

   Pair it with the `CHANGELOG.md`/version discipline noted under "Why this is more
   involved than it looks" — the versions only mean something if consumers opt in.

### High

5. **`flutter_secure_storage` 9→10→11 — can log out the entire user base.** Verified
   against the 10.0.0 and 11.0.0 changelogs, not just release notes.

   **v10 must ship and be launched on device before v11.** v11 states plainly: *"Any data
   saved using deprecated algorithms or features will be unusable after this upgrade. If
   you used a version prior to v10, upgrade to v10 first so existing data is migrated."*
   v10 does the migration on first launch via `migrateOnAlgorithmChange: true` (default):
   `RSA_ECB_PKCS1Padding` → `RSA_ECB_OAEPwithSHA_256andMGF1Padding`,
   `AES_CBC_PKCS7Padding` → `AES_GCM_NoPadding`, and EncryptedSharedPreferences → custom
   cipher storage. The soak is therefore not a formality — it is waiting for the install
   base to actually open a v10 build. Anyone going 9.x → 11 in one step loses their
   refresh token.

   v11 then removes `encryptedSharedPreferences` and `sharedPreferencesName`
   (→ `storageNamespace`), both of which we set in `auth_state_notifier_mobile.dart`.

   Three things that are easy to miss:

   - **v11 needs `compileSdk 37`; we are on 36.** The Gate A block that would have
     silently clamped it is ✅ handled (item 2) — gone from the main app, narrowed to
     `soundpool` in kids. Raising the app's own `compileSdk` to 37 is still to do.
   - **v10 flips `resetOnError` to `true` by default** and we set it nowhere. "Reset"
     means discarding stored credentials. Given this app's history of users being logged
     out on every launch, decide this deliberately rather than inheriting it.
   - **v10 merges iOS/macOS into `flutter_secure_storage_darwin`** and can *"remove keys
     regardless of synchronizable state or accessibility constraints"*. That is exactly
     what `_iosCredentialVariants` works around today. Read the comments in
     `auth_state_notifier_mobile.dart` before touching it — they are the most carefully
     reasoned code in the auth path, and they were written after real incidents.

   Floors are fine: minSdk 24 ✓ (v11 needs 24), iOS 15 ✓ (v10 needs 12).

   Unblocks: the `js` override, and device_info_plus 13 / package_info_plus 10 /
   share_plus 13.

   Suggested order: appauth → secure_storage 10, ship, soak (do Firebase /
   local_notifications / riverpod 3 meanwhile) → secure_storage 11 + `compileSdk 37`.

6. **`auto_route` 9→11 — ✅ done for this repo** (landed with the cutover; see Done).
   Still to do in `bcc-media-play` and `bcc-connect-live` — item 4. The part that is
   genuinely theirs is `AutoRouteGuard.redirect` → `redirectUntil` (now returns `void`),
   since both guards live there.

### Independently schedulable

7. **riverpod 2→3** — **no longer on the critical path.** Once `riverpod_generator` is
   dropped (prep PR B), nothing in the codegen cluster needs riverpod 3, so this is
   scheduled on its own merits.

   Everything below is checked against the official guide,
   <https://riverpod.dev/docs/3.0_migration>, and against riverpod 3.4.3's source where
   the guide is silent. Earlier revisions of this section were written from changelogs and
   were wrong in two places — noted inline.

   **Mechanical (compiler catches these):**

   - `StateProvider` / `StateNotifierProvider` / `ChangeNotifierProvider` move to
     `legacy.dart` imports — not removed. Declaration counts are small (sizing table
     below; graph-wide 8 + 8, and zero `ChangeNotifierProvider`). The `legacy.dart` import
     is a valid cheap first pass. Do **not** count these with a bare `grep StateProvider`:
     `authStateProvider` is a substring match and inflates the main app from 3 to ~52.
   - **The `AutoDispose` prefix is gone.** `AutoDisposeNotifier`, `AutoDisposeProvider`
     etc. are unified into `Notifier`, `Provider`. The guide's advice is a case-sensitive
     replace of `AutoDispose` → empty string. Confirmed against 3.4.3: the public
     `AutoDisposeNotifier` class is absent; only an `@internal`
     `AutoDisposeNotifierProviderBuilder` remains, and `isAutoDispose` is a real
     constructor parameter. Surface: **21 sites**, and they are lopsided —

     | Repo               | `AutoDisposeXxx` | `.autoDispose` | total |
     | ------------------ | ---------------- | -------------- | ----- |
     | `bcc-connect-live` | 2                | 13             | 15    |
     | `brunstadtv_app`   | 1                | 3              | 4     |
     | `bccm_core`        | 0                | 2              | 2     |
     | others             | 0                | 0              | 0     |

   - `Ref` loses its type parameter, and all `Ref` subclasses (`ProviderRef`,
     `FutureProviderRef`, …) are removed — **we have zero, so this is a no-op**. Beware a
     false positive: `extension ScheduleProviderRefreshX on Ref` in `bccm_core` and
     `bcc-connect-live` matches a naive `ProviderRef` grep but is an extension *on* `Ref`.
   - `ProviderRef.state` → `Notifier.state`, `Ref.listenSelf` → `Notifier.listenSelf`,
     `FutureProviderRef.future` → `AsyncNotifier.future`. Zero uses of any.
   - `FamilyNotifier` / `FamilyAsyncNotifier` / `FamilyStreamNotifier` are removed, folded
     into `Notifier` / `AsyncNotifier` / `StreamNotifier` with the family parameter moving
     from `build()` to the constructor. Zero uses.
   - `ProviderObserver` takes a single `ProviderObserverContext` instead of separate
     container/provider parameters. Zero uses — `bccm_core`'s `analytics_observer.dart` is
     an auto_route `AutoRouteObserver`, not a riverpod one.

   **Behavioural (compiler catches none of these — this is the real work):**

   - **`UnmountedRefException`.** Using a `Ref` after its provider is disposed now throws;
     async gaps must be guarded with `ref.mounted`. We currently have **zero** `ref.mounted`
     guards against **927** `ref.read`/`watch`/`listen`/`invalidate`/`refresh` calls
     (main app 385, `bcc-connect-live` 249, `bcc-media-play` 162, kids 90, core 41). Not
     every call sits after an `await`, but this needs a real audit, not a replace.
     **This is the single largest risk in the riverpod 3 migration and earlier revisions of
     this doc did not mention it at all.**
   - **`ProviderException` wrapping.** Provider failures are wrapped, so `catch` sites
     become `on ProviderException catch (e)` with `e.exception` unwrapped. `AsyncValue`
     error checking is unchanged.
   - **Out-of-view providers pause by default**, controlled per-consumer via `TickerMode`.
     (An earlier revision said "`StreamProvider` pauses when unlistened" — that is wrong;
     the behaviour is broader and not StreamProvider-specific.) `bccm_core`'s 7
     `StreamProvider`s are still the things whose timing changes most.
   - **Providers auto-retry on failure** by default. Opt out globally on
     `ProviderScope`/`ProviderContainer` with `retry: (retryCount, error) => null`, or
     per-provider via the `retry` parameter.
   - **All providers filter updates with `==`** rather than a mix of `==` and `identical`.
     `StreamProvider` values are now equality-filtered; override `updateShouldNotify`
     where that matters.
   - (An earlier revision claimed "notifiers recreate on every provider rebuild". That
     appears nowhere in the migration guide — treat it as unfounded unless someone
     reproduces it.)

   **Debt prep PR B deliberately took on.** The hand-written `wakeLockCountProvider` uses
   `NotifierProvider.autoDispose` + `AutoDisposeNotifier`, so it is 2 of the 21 rename
   sites above. The generated `@riverpod class WakeLockCount extends _$WakeLockCount` it
   replaced was *already* riverpod 3's class-based generator syntax and would have needed
   no change. This was the right trade — it removes riverpod 3 as a forcing constraint on
   an atomic cutover — but it is a real two-line cost, and unavoidable, since riverpod 2
   has no spelling matching riverpod 3's naming.

   **Re-adopting the lints is a separate task.** `riverpod_lint` 3.1.9 pins `riverpod`
   3.4.3 exactly and drops `custom_lint` for the native `analysis_server_plugin`. Since
   prep PR B removed both lint packages (see "Dropping riverpod codegen" — they never ran,
   and do not work on Dart 3.13 anyway), bringing lints back means `riverpod_lint` 3.x
   *plus* new `analysis_options.yaml` wiring on the new plugin system.

   **Prerequisite: `bccm_player` goes first.** 50 `StateNotifier` refs, 4 imports of the
   legacy `state_notifier` / `flutter_state_notifier` packages, and `riverpod ^2.6.1` /
   `freezed ^2.3.2` as _runtime_ deps. Its SDK floors are current (`>=3.12.0` /
   `>=3.44.0`); what is still old is the dev stack — `flutter_lints ^4`, `pigeon ^22`.

   **New in 3.0, not required:** mutations and offline persistence, both experimental,
   behind separate imports.

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
them — by a wide margin the strongest safety net in the graph, so it is the right place to
shake out each step before the other repos see it.

Suggested order overall:

1. Prep PR A (freezed syntax, 49 classes) and prep PR B (drop riverpod codegen) —
   **both ✅ done 2026-09-08**. Both landed on current versions with **no regeneration**,
   so they were verifiable on 3.47 with `flutter analyze` + `flutter test` despite codegen
   being down.
2. The cutover: bump the cluster, take `auto_route` 11, raise the SDK floors and CI pins
   to 3.47, regenerate everything. **✅ done 2026-09-09.**
3. `bcc-media-play`, then `bcc-connect-live` — **next**, see Remaining work item 4.
4. `riverpod` 2→3 whenever it suits, independently.

Anyone who gets genuinely stuck before step 2 lands can pin their local SDK to 3.44.0 as
an emergency lever — codegen works there. It is a personal unblock, not a project
direction; the floors and CI stay pointed at 3.47.

### Sizing (re-measured 2026-09-08, generated files excluded)

`@freezed` / `StateProvider` / `StateNotifierProvider` are **declaration** counts;
`.valueOrNull`, `.autoDispose` and `@RoutePage` are occurrences.

| Repo               | `@freezed` v2-style | `StateNotifierProvider` | `StateProvider` | `.valueOrNull` | `.autoDispose` | `@RoutePage` |
| ------------------ | ------------------- | ----------------------- | --------------- | -------------- | -------------- | ------------ |
| `bccm_player`      | 0 (was 0)           | 5                       | 0               | 0              | 0              | 0            |
| `bccm_core`        | 0 (was 41)          | 1                       | 4               | 4              | 2              | 0            |
| `brunstadtv_app`   | 0 (was 5)           | 2                       | 3               | 21             | 2              | 39           |
| `kids`             | 0                   | 0                       | 0               | 0              | 0              | 16           |
| `bcc-media-play`   | 0 (was 2)           | 1                       | 0               | 2              | 0              | 20           |
| `bcc-connect-live` | 0 (was 1)           | 1                       | 1               | 24             | 13             | 25           |

The `@freezed` column is zero because prep PR A landed; the "was" figures are what it
converted. Every other column is still outstanding.

Zero occurrences anywhere of `Ref` subclasses (`FutureProviderRef` etc.) or
`ProviderObserver` — both riverpod 3 breaking changes are no-ops for us.

### What each piece actually involves

**riverpod 2→3 has a small mechanical surface and a large behavioural one.** The
mechanical part really is minor: `StateNotifierProvider` / `StateProvider` move to
`legacy.dart` (16 declarations), `.valueOrNull` → `.value` (~51 sites), and the
`AutoDispose` prefix drops (21 sites, 15 of them in `bcc-connect-live`). Zero `Ref`
subclasses, zero `ProviderObserver`, zero family notifiers.

The behavioural part is where the work is, and none of it is compiler-visible:
`UnmountedRefException` on post-dispose `Ref` use (927 `ref.*` calls, **0** `ref.mounted`
guards today), `ProviderException` wrapping at catch sites, out-of-view providers pausing
by default, auto-retry on failure, and `==` update filtering everywhere. `bccm_core`'s 7
`StreamProvider`s change timing. See item 7 for the detail and the sources.

**freezed 2→4** is smaller than a two-major jump suggests. Only two breaking changes
touch us:

- Classes must be `abstract`, `sealed`, or manually implement `_$X` (freezed 3.0.0) —
  `class X with _$X` → `abstract class X with _$X`, 49 classes, 41 in `bccm_core`.
  **Already done** — prep PR A landed 2026-09-08, so the cutover carries none of this.
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

### `--delete-conflicting-outputs` is gone (build_runner 2.16)

**Obsolete as of the cutover.** `build_runner` 2.16 removed the flag — it warns
`These options have been removed and were ignored` — and no longer prompts on stdin.
Just run `dart run build_runner build`.

Kept for history, because it cost real time on the old toolchain: generated files are
committed in every repo and nothing is gitignored, so on build_runner 2.5 a cold build
would **prompt on stdin** —

> Found N declared outputs which already exist on disk. Delete these files?

— and in a non-interactive shell that prompt blocked forever with flat CPU, looking
exactly like a slow build. The committed-generated-files part still matters: it is why
`git checkout -- .` instantly recovers a build that deleted its outputs and then died.

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

Consequence: the 49-class conversion (41 in `bccm_core`) was an **independent, low-risk PR
landed on the current `freezed 2.5.8`** with no regeneration required — which took most of
the freezed work out of the cutover. ✅ Done 2026-09-08.
