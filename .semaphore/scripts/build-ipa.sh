#!/usr/bin/env bash
# Build a signed release IPA, retrying on flaky SwiftPM binary-artifact downloads.
#
# Usage: build-ipa.sh <dart-entrypoint> [flavor]
#   e.g. build-ipa.sh lib/main_prod.dart prod   (run from repo root)
#        build-ipa.sh lib/main.dart             (run from the kids/ dir)
#
# Relies on BUILD_NUMBER (and DART_VM_OPTIONS) being exported by the caller; child
# processes inherit exported env, so both are visible here. `ios/ExportOptions.plist`
# is resolved relative to the current directory, matching how the caller cd's in.
#
# No `set -e`: the retry loop deliberately tolerates a failing build attempt, and the
# final test is the script's exit status (success only if a build attempt succeeded).

entrypoint="$1"
flavor_arg=""
[ "${2:-}" ] && flavor_arg="--flavor $2"

attempt=0
until [ "$attempt" -ge 3 ]; do
  # SwiftPM leaves a partial artifact dir when a download is interrupted and then aborts
  # with "already exists in file system". Wipe its cache so each attempt starts clean.
  rm -rf "$HOME/Library/Caches/org.swift.swiftpm"
  flutter build ipa --release $flavor_arg -t "$entrypoint" \
    --build-number="$BUILD_NUMBER" --export-options-plist=ios/ExportOptions.plist && break
  attempt=$((attempt + 1))
  echo "flutter build ipa failed (attempt $attempt/3); cleared SwiftPM cache, retrying in 20s..."
  sleep 20
done
[ "$attempt" -lt 3 ]
