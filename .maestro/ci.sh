#!/bin/sh
set -e
set -x

#install maestro
curl -Ls "https://get.maestro.mobile.dev" | bash
export PATH="$PATH":"$HOME/.maestro/bin"

#run maestro e2e tests
envsubst < flows/scripts/.env.js.template > flows/scripts/.env.js
flutter doctor -v

# build the app for the simulator
make ios-build

maestro cloud --apiKey $MAESTRO_API_KEY -e PLATFORM=ios --exclude-tags=no-cloud ../build/ios/iphonesimulator/Runner.app flows/ || exit 1
exit 0