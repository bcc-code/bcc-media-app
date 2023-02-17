#!/bin/sh
set -e
set -x

#install maestro
curl -Ls "https://get.maestro.mobile.dev" | bash
export PATH="$PATH":"$HOME/.maestro/bin"

#run maestro e2e tests
envsubst < flows/scripts/.env.js.template > flows/scripts/.env.js
flutter doctor -v

# backup and replace podspec
mv ../external_projects/bccm_player/ios/bccm_player.podspec bccm_player.podspec
mv ../external_projects/bccm_player/ios/bccm_player_simulator.podspec.template ../external_projects/bccm_player/ios/bccm_player.podspec

# build the app for the simulator
make ios-build

# restore podspec
rm ../external_projects/bccm_player/ios/bccm_player.podspec
mv bccm_player.podspec ../external_projects/bccm_player/ios/bccm_player.podspec
cat ../external_projects/bccm_player/ios/bccm_player.podspec

maestro cloud -e PLATFORM=ios --apiKey $MAESTRO_API_KEY ../build/ios/iphonesimulator/Runner.app flows/ || exit 1
exit 0