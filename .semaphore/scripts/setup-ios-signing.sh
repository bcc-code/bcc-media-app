#!/usr/bin/env bash
set -eu
# Set up an ad-hoc keychain + provisioning profile for a manual-signed release build,
# then append the signing settings to the given Release.xcconfig.
#
# Usage: setup-ios-signing.sh <path-to-Release.xcconfig>
#   e.g. setup-ios-signing.sh ios/Flutter/Release.xcconfig
#        setup-ios-signing.sh kids/ios/Flutter/Release.xcconfig
#
# Reads CERTIFICATE_P12_BASE64, CERTIFICATE_PASSWORD, PROVISIONING_PROFILE_BASE64 from
# the environment (Semaphore secrets). Keychain + profile state lives on disk / in the
# security db, so it survives into the build step even though this runs in a subshell.

xcconfig="$1"

echo "$CERTIFICATE_P12_BASE64" | base64 -d > /tmp/certificate.p12
security create-keychain -p "" build.keychain
security import /tmp/certificate.p12 -k ~/Library/Keychains/build.keychain-db -P "$CERTIFICATE_PASSWORD" -T /usr/bin/codesign
# The .p12 holds only the leaf cert + key. Import the Apple WWDR G3 intermediate
# (issuer of our Apple Distribution cert) so the chain validates and the identity
# shows up as valid in `security find-identity -v`; otherwise CODE_SIGN_IDENTITY is empty.
curl -fsSL https://www.apple.com/certificateauthority/AppleWWDRCAG3.cer -o /tmp/AppleWWDRCAG3.cer
security import /tmp/AppleWWDRCAG3.cer -k ~/Library/Keychains/build.keychain-db -T /usr/bin/codesign || true
security list-keychains -s ~/Library/Keychains/build.keychain-db
security default-keychain -s ~/Library/Keychains/build.keychain-db
security unlock-keychain -p "" ~/Library/Keychains/build.keychain-db
security set-keychain-settings ~/Library/Keychains/build.keychain-db
security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain-db

CODE_SIGN_IDENTITY=$(security find-identity -v -p codesigning | grep -o '"[^"]*"' | head -1 | tr -d '"')
echo "Signing identity: $CODE_SIGN_IDENTITY"
# Fail fast (with diagnostics) if no valid signing identity was found, instead of
# wasting a ~6 min archive that only dies at the export step.
if [ -z "$CODE_SIGN_IDENTITY" ]; then
  echo "ERROR: no valid code-signing identity in build.keychain."
  echo "--- codesigning identities (valid + invalid) ---"
  security find-identity -p codesigning ~/Library/Keychains/build.keychain-db || true
  echo "--- WWDR intermediates in build.keychain ---"
  security find-certificate -a -c "Worldwide Developer Relations" ~/Library/Keychains/build.keychain-db | grep labl || true
  echo "--- keychain search list ---"
  security list-keychains
  echo "--- distribution cert trust check ---"
  security find-certificate -c "Apple Distribution" -p ~/Library/Keychains/build.keychain-db > /tmp/leaf.pem 2>/dev/null || true
  security verify-cert -c /tmp/leaf.pem -p codeSign 2>&1 || true
  exit 1
fi

# Xcode 16+ reads installed profiles from Developer/Xcode/UserData; the build/archive
# phase still reads the legacy MobileDevice path, so install into both.
mkdir -p "$HOME/Library/Developer/Xcode/UserData/Provisioning Profiles" "$HOME/Library/MobileDevice/Provisioning Profiles"
echo "$PROVISIONING_PROFILE_BASE64" | base64 -d > "$HOME/Library/Developer/Xcode/UserData/Provisioning Profiles/profile.mobileprovision"
cp "$HOME/Library/Developer/Xcode/UserData/Provisioning Profiles/profile.mobileprovision" "$HOME/Library/MobileDevice/Provisioning Profiles/profile.mobileprovision"
PROVISIONING_PROFILE_UUID=$(security cms -D -i "$HOME/Library/Developer/Xcode/UserData/Provisioning Profiles/profile.mobileprovision" | grep -A 1 "UUID" | grep -o '<string>.*</string>' | sed 's/<string>\(.*\)<\/string>/\1/')
echo "Provisioning profile UUID: $PROVISIONING_PROFILE_UUID"

{
  echo "CODE_SIGN_STYLE = Manual"
  echo "PROVISIONING_PROFILE = $PROVISIONING_PROFILE_UUID"
  echo "CODE_SIGN_IDENTITY = $CODE_SIGN_IDENTITY"
} >> "$xcconfig"
