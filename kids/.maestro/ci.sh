#!/bin/sh
set -e
set -x

#install maestro
# 2.1.0+ is required: earlier versions cannot see inside web views on iOS 26.
# 2.8.0 is the newest version DeviceCloud supports, so bumping past it needs a
# check against their supported-versions list.
export MAESTRO_VERSION=2.8.0; curl -Ls "https://get.maestro.mobile.dev" | bash
export PATH="$PATH":"$HOME/.maestro/bin"

#install devicecloud cli
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 22
npm install -g @devicecloud.dev/dcd

# No .env.js here: unlike the parent app's flows, none of the kids flows log in,
# so there is no credential template to substitute.
flutter doctor -v

# build the app for the simulator
make ios-build

dcd cloud --apiKey $MAESTRO_API_KEY --maestro-version $MAESTRO_VERSION --quiet --exclude-tags=no-cloud -e PLATFORM=ios ../build/ios/iphonesimulator/Runner.app flows/ || exit 1
exit 0