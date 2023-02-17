#!/bin/sh
set -e
set -x

#install maestro
curl -Ls "https://get.maestro.mobile.dev" | bash
export PATH="$PATH":"$HOME/.maestro/bin"

#run maestro e2e tests
envsubst < .env.js.template > .env.js
make ios-build
maestro cloud -e PLATFORM=ios --apiKey $MAESTRO_API_KEY ../build/ios/iphonesimulator/Runner.app flows/