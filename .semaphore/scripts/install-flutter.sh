#!/usr/bin/env bash
set -eu
# Install the pinned Flutter SDK ($FLUTTER_VERSION), (re)populating the Semaphore
# cache. Reinstalls when the cached/agent SDK is missing or the wrong version, which
# self-heals both a poisoned cache and a stale agent-preinstalled SDK. Detects the OS
# so the same script serves the Linux (Android) and macOS (iOS) jobs.
#
# The caller must still `export PATH="$HOME/flutter/bin:$PATH"` afterwards — a PATH
# export here would not survive into the parent job shell.

case "$(uname -s)" in
  Darwin) OS=macos ;;
  *) OS=linux ;;
esac
KEY="flutter-sdk-$OS-$FLUTTER_VERSION"

cache restore "$KEY"

INSTALLED_FLUTTER=$(grep -o '"frameworkVersion":[^,]*' "$HOME/flutter/bin/cache/flutter.version.json" 2>/dev/null | grep -o '[0-9][0-9.]*' || true)
if [ ! -x "$HOME/flutter/bin/flutter" ] || [ "$INSTALLED_FLUTTER" != "$FLUTTER_VERSION" ]; then
  rm -rf "$HOME/flutter"
  if [ "$OS" = macos ]; then
    # macOS ships as a .zip with a separate arm64 build (Semaphore's a2 agents are Apple silicon).
    if [ "$(uname -m)" = arm64 ]; then ARCH=_arm64; else ARCH=""; fi
    curl -sSL -o /tmp/flutter.zip "https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos${ARCH}_${FLUTTER_VERSION}-stable.zip"
    unzip -q /tmp/flutter.zip -d "$HOME"
  else
    wget -q "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" -O /tmp/flutter.tar.xz
    tar xf /tmp/flutter.tar.xz -C "$HOME"
  fi
  # Drop the stale key so the `cache store` below actually repopulates it (Semaphore's
  # cache store is a no-op when the key already exists).
  cache delete "$KEY"
fi

cache store "$KEY" "$HOME/flutter"
"$HOME/flutter/bin/flutter" --version
