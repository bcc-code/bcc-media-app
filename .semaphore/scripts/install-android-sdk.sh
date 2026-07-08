#!/usr/bin/env bash
set -eu
# Install the Android SDK (platform-tools, platform 36, build-tools 36) into
# $ANDROID_HOME, restoring/repopulating the Semaphore cache. Skips the download when
# the target platform is already present (cache hit).
#
# The caller must `export ANDROID_HOME=...` first (child processes inherit it) and add
# its tools to PATH afterwards — a PATH export here would not survive into the job shell.

cache restore android-sdk

if [ ! -d "$ANDROID_HOME/platforms/android-36" ]; then
  mkdir -p "$ANDROID_HOME/cmdline-tools"
  curl -sSL -o /tmp/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
  unzip -q /tmp/cmdline-tools.zip -d "$ANDROID_HOME/cmdline-tools"
  mv "$ANDROID_HOME/cmdline-tools/cmdline-tools" "$ANDROID_HOME/cmdline-tools/latest"
  yes | "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" --licenses > /dev/null
  "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" "platform-tools" "platforms;android-36" "build-tools;36.0.0"
fi

cache store android-sdk "$ANDROID_HOME"
