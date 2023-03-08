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

maestro cloud -e PLATFORM=ios --apiKey $MAESTRO_API_KEY ../build/ios/iphonesimulator/Runner.app flows/ || exit 1
exit 0