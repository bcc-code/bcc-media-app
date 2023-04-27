# Maestro UI Tests

We are using [Maestro](https://maestro.mobile.dev/), which allows us to use a normal build of the app to test the most critical user flows, e.g. logging in and then playing the livestream.
Most of the tests run during the release pipeline for the app.

## Setup

NOTE: We are only maintaining the **iOS** tests, because Android was more flaky and made it too tedious to maintain both.
This means you need a Mac to run the flows.

1. Install [Maestro](https://maestro.mobile.dev/getting-started/installing-maestro/).
2. Run `make ios-setup`, which will do an ios build of the app and install it on the simulator.
3. Create flows/scripts/.env.js based on the [.env.js.template](flows/scripts/.env.js.template).
4. Run any maestro command, but include `-e PLATFORM=ios`. Example: `maestro test -c -e PLATFORM=ios flows/1_start-livestream.yml`.
