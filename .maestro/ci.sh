#!/bin/sh
set -e
set -x

#install maestro
export MAESTRO_VERSION=1.39.7; curl -Ls "https://get.maestro.mobile.dev" | bash
export PATH="$PATH":"$HOME/.maestro/bin"

#install devicecloud cli
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 22
npm install -g @devicecloud.dev/dcd

#run maestro e2e tests
envsubst < flows/scripts/.env.js.template > flows/scripts/.env.js
flutter doctor -v

# build the app for the simulator
make ios-build

dcd cloud --apiKey $MAESTRO_API_KEY -e PLATFORM=ios --exclude-tags=no-cloud ../build/ios/iphonesimulator/Runner.app flows/ || exit 1
exit 0