#!/usr/bin/env bash
set -eu
# Install the pinned Flutter SDK ($FLUTTER_VERSION), (re)populating the Semaphore
# cache. Reinstalls when the cached/agent SDK is missing or the wrong version, which
# self-heals both a poisoned cache and a stale agent-preinstalled SDK. Detects the OS
# so the same script serves the Linux (Android) and macOS (iOS) jobs.
#
# The caller must still `export PATH="$HOME/flutter/bin:$PATH"` afterwards — a PATH
# export here would not survive into the parent job shell.
#
# The version is verified twice on purpose. The pre-check reads bin/cache/flutter.
# version.json, which is cheap but only accurate once the flutter tool has been built
# — a restored cache can carry a stale or missing one. We once shipped a cache stored
# under key flutter-sdk-macos-3.44.0 that actually contained 3.41.9; the pre-check
# passed it and the job then failed much later with a confusing transitive pub error
# ("app_links 7.2.1 requires Flutter >=3.44.0"). So after the tool is built we assert
# against `flutter --version --machine`, which is authoritative, and self-heal once.

case "$(uname -s)" in
  Darwin) OS=macos ;;
  *) OS=linux ;;
esac
KEY="flutter-sdk-$OS-$FLUTTER_VERSION"

install_sdk() {
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
}

# Authoritative version, straight from the tool. Builds the flutter tool on first call,
# which the job needs anyway.
actual_version() {
  [ -x "$HOME/flutter/bin/flutter" ] || return 0
  "$HOME/flutter/bin/flutter" --version --machine 2>/dev/null \
    | grep -o '"frameworkVersion" *: *"[^"]*"' | grep -o '[0-9][0-9.]*' || true
}

cache restore "$KEY"

# Cheap pre-check: skips building the tool when the cache is obviously wrong or absent.
INSTALLED_FLUTTER=$(grep -o '"frameworkVersion":[^,]*' "$HOME/flutter/bin/cache/flutter.version.json" 2>/dev/null | grep -o '[0-9][0-9.]*' || true)
if [ ! -x "$HOME/flutter/bin/flutter" ] || [ "$INSTALLED_FLUTTER" != "$FLUTTER_VERSION" ]; then
  install_sdk
fi

# Authoritative check. Catches a cache whose payload disagrees with its key name.
ACTUAL=$(actual_version)
if [ "$ACTUAL" != "$FLUTTER_VERSION" ]; then
  echo "WARNING: cache key '$KEY' contained Flutter '${ACTUAL:-<none>}', not '$FLUTTER_VERSION'. Reinstalling."
  install_sdk
  ACTUAL=$(actual_version)
  if [ "$ACTUAL" != "$FLUTTER_VERSION" ]; then
    echo "ERROR: after a clean install, Flutter reports '${ACTUAL:-<none>}' but FLUTTER_VERSION is '$FLUTTER_VERSION'."
    echo "       Refusing to continue — a wrong SDK surfaces later as a confusing pub version-solving error."
    exit 1
  fi
fi

cache store "$KEY" "$HOME/flutter"
"$HOME/flutter/bin/flutter" --version
