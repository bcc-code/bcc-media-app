#!/bin/bash
#
# Refresh the Semaphore `ios-signing-certs` org secret from the cert +
# provisioning profile that `fastlane match` installs.
#
# Run this locally on a Mac with Xcode signing access. Re-run whenever
# the distribution cert rotates or the App Store profile changes.
#
# Prereqs:
#   - You can run `bundle exec fastlane match appstore --readonly`
#     from ios/. The Matchfile / env vars (MATCH_GIT_URL, MATCH_PASSWORD,
#     etc.) need to be set up however your team configures match.
#   - `sem` CLI is signed in to the BCC Semaphore org with rights to
#     replace org secrets.
#
# Usage:
#   scripts/refresh-ios-signing-secrets.sh
#
set -euo pipefail

APP_IDENTIFIER="tv.brunstad.app"
TEAM_ID="6734NUF6AV"
SECRET_NAME="ios-signing-certs"
MATCH_TYPE="appstore"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT/ios"

for bin in bundle sem security base64 openssl plutil; do
  command -v "$bin" >/dev/null 2>&1 || { echo "error: missing '$bin' in PATH" >&2; exit 1; }
done

WORK_DIR=$(mktemp -d)
chmod 700 "$WORK_DIR"
trap 'rm -rf "$WORK_DIR"' EXIT
echo "==> Working dir: $WORK_DIR (auto-removed on exit)"

echo "==> Running fastlane match $MATCH_TYPE (readonly)..."
bundle exec fastlane match "$MATCH_TYPE" --readonly \
  --app_identifier "$APP_IDENTIFIER" --team_id "$TEAM_ID"

echo "==> Locating App Store provisioning profile for $APP_IDENTIFIER..."
# Xcode 16+ installs profiles under Developer/Xcode/UserData; older Xcode used
# the MobileDevice path. Search both so this works regardless of Xcode version.
PROFILES_DIRS=(
  "$HOME/Library/Developer/Xcode/UserData/Provisioning Profiles"
  "$HOME/Library/MobileDevice/Provisioning Profiles"
)
PROFILE=""
LATEST_TS=0
for dir in "${PROFILES_DIRS[@]}"; do
  [ -d "$dir" ] || continue
  for f in "$dir"/*.mobileprovision; do
    [ -f "$f" ] || continue
    security cms -D -i "$f" > "$WORK_DIR/prof.plist" 2>/dev/null || continue
    # 'plutil -convert json' chokes on the profile's <date> fields, so read keys
    # individually with -extract instead.
    team=$(plutil -extract TeamIdentifier.0 raw -o - "$WORK_DIR/prof.plist" 2>/dev/null) || continue
    bid_raw=$(plutil -extract Entitlements.application-identifier raw -o - "$WORK_DIR/prof.plist" 2>/dev/null) || continue
    bid="${bid_raw#*.}"
    # App Store profiles have no ProvisionedDevices key; -extract fails on it.
    if plutil -extract ProvisionedDevices raw -o - "$WORK_DIR/prof.plist" >/dev/null 2>&1; then
      has_devices=true
    else
      has_devices=false
    fi
    [ "$team" = "$TEAM_ID" ] || continue
    [ "$bid" = "$APP_IDENTIFIER" ] || continue
    [ "$has_devices" = "false" ] || continue
    ts=$(stat -f %m "$f")
    if [ "$ts" -gt "$LATEST_TS" ]; then
      LATEST_TS=$ts
      PROFILE=$f
    fi
  done
done

if [ -z "$PROFILE" ]; then
  echo "error: no App Store profile for $APP_IDENTIFIER (team $TEAM_ID) found in:" >&2
  for dir in "${PROFILES_DIRS[@]}"; do echo "       $dir" >&2; done
  echo "       Did 'fastlane match $MATCH_TYPE --readonly' install anything?" >&2
  exit 1
fi

security cms -D -i "$PROFILE" > "$WORK_DIR/prof.plist"

PROFILE_NAME=$(plutil -extract Name raw -o - "$WORK_DIR/prof.plist")
PROFILE_UUID=$(plutil -extract UUID raw -o - "$WORK_DIR/prof.plist")
PROFILE_EXP=$(plutil -extract ExpirationDate raw -o - "$WORK_DIR/prof.plist")
echo "==> Profile file:    $PROFILE"
echo "==> Profile name:    $PROFILE_NAME"
echo "==> Profile UUID:    $PROFILE_UUID"
echo "==> Profile expires: $PROFILE_EXP"

EXPECTED_NAME=$(/usr/libexec/PlistBuddy -c "Print :provisioningProfiles:$APP_IDENTIFIER" "$REPO_ROOT/ios/ExportOptions.plist" 2>/dev/null || true)
if [ -n "$EXPECTED_NAME" ] && [ "$EXPECTED_NAME" != "$PROFILE_NAME" ]; then
  echo
  echo "WARNING: ios/ExportOptions.plist expects profile name:"
  echo "           '$EXPECTED_NAME'"
  echo "         but match installed:"
  echo "           '$PROFILE_NAME'"
  echo "         Update ExportOptions.plist (or change the profile name in match)"
  echo "         and commit before re-running the pipeline, or xcodebuild's"
  echo "         export step will fail with 'no profiles matching ... installed'."
  echo
fi

echo "==> Extracting signing certificate from profile..."
plutil -extract DeveloperCertificates.0 raw -o - "$WORK_DIR/prof.plist" | base64 -D > "$WORK_DIR/cert.der"
CERT_SHA1=$(openssl x509 -in "$WORK_DIR/cert.der" -inform DER -noout -fingerprint -sha1 | sed 's/.*=//; s/://g' | tr 'A-F' 'a-f')
echo "==> Cert SHA1:       $CERT_SHA1"

echo "==> Finding matching identity in keychain..."
IDENTITY_LINE=$(security find-identity -v -p codesigning | grep -i "$CERT_SHA1" || true)
if [ -z "$IDENTITY_LINE" ]; then
  echo "error: certificate $CERT_SHA1 not found in any keychain." >&2
  echo "       'fastlane match $MATCH_TYPE --readonly' should have installed" >&2
  echo "       it into the login keychain. Check the match output above." >&2
  exit 1
fi
IDENTITY_NAME=$(echo "$IDENTITY_LINE" | sed -E 's/.*"(.*)".*/\1/')
echo "==> Identity:        $IDENTITY_NAME"

echo "==> Exporting identities from login keychain to .p12..."
P12_PASSWORD=$(openssl rand -base64 24 | tr -d '=+/')
P12_FILE="$WORK_DIR/identity.p12"
security export \
  -k "$HOME/Library/Keychains/login.keychain-db" \
  -t identities -f pkcs12 \
  -P "$P12_PASSWORD" \
  -o "$P12_FILE"

if [ ! -s "$P12_FILE" ]; then
  echo "error: .p12 export was empty" >&2
  exit 1
fi

# Verify our cert ended up in the .p12 (advisory only — must never abort the upload).
# 'security export' writes legacy-encrypted PKCS#12, so OpenSSL 3.x needs -legacy to
# read it; older LibreSSL rejects that flag. Try both, and swallow any failure so a
# read error here can't kill the script before the secret is pushed.
P12_FIRST_SHA1=$( { openssl pkcs12 -in "$P12_FILE" -nokeys -legacy -passin pass:"$P12_PASSWORD" 2>/dev/null \
  || openssl pkcs12 -in "$P12_FILE" -nokeys -passin pass:"$P12_PASSWORD" 2>/dev/null; } \
  | openssl x509 -noout -fingerprint -sha1 2>/dev/null \
  | sed 's/.*=//; s/://g' | tr 'A-F' 'a-f' || true )
if [ -n "$P12_FIRST_SHA1" ] && ! printf '%s' "$P12_FIRST_SHA1" | grep -q "$CERT_SHA1"; then
  echo "warning: first cert in .p12 doesn't match expected SHA1." >&2
  echo "         The .p12 contains every codesigning identity in login.keychain-db" >&2
  echo "         (that's how 'security export' works). The build keychain on CI" >&2
  echo "         will hold all of them and xcodebuild picks by provisioning profile," >&2
  echo "         so this is usually fine. Continue only if you trust the other identities." >&2
fi

P12_B64=$(base64 -i "$P12_FILE" | tr -d '\n')
PROFILE_B64=$(base64 -i "$PROFILE" | tr -d '\n')

echo "==> Replacing Semaphore secret '$SECRET_NAME'..."
sem delete secret "$SECRET_NAME" 2>/dev/null || echo "    (no existing secret to delete)"
sem create secret "$SECRET_NAME" \
  -e "CERTIFICATE_P12_BASE64=$P12_B64" \
  -e "CERTIFICATE_PASSWORD=$P12_PASSWORD" \
  -e "PROVISIONING_PROFILE_BASE64=$PROFILE_B64" \
  -e "TEAM_ID=$TEAM_ID"

unset P12_B64 PROFILE_B64 P12_PASSWORD

echo "==> Done. Verifying..."
sem get secrets "$SECRET_NAME"
echo
echo "Re-run the Semaphore iOS pipeline. If the profile-name warning above fired,"
echo "fix ios/ExportOptions.plist first."
