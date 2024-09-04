ma# Maestro UI Tests

We are using [Maestro](https://maestro.mobile.dev/), which allows us to use a normal build of the app to test the most critical user flows, e.g. logging in and playing content.
The tests run during the CI pipeline for the app (except those with the `no-cloud` tag in its yml file)

## Setup

NOTE: We are only maintaining the **iOS** tests, because there are some differences between the OS's, so that made it a bit tedious to maintain.
This means you need a Mac to run the flows.

1. Install [Maestro](https://maestro.mobile.dev/getting-started/installing-maestro/).
2. Run `make ios-setup`, which will do an ios build of the app and install it on the simulator.
3. Create flows/scripts/.env.js based on the [.env.js.template](flows/scripts/.env.js.template).
4. Run tests
   - Run e.g. `make debug FLOW=flows/1_play-shorts.yml` to run a flow.
   - Run `make test` to run the whole suite
   - You can run any maestro command, but include `-e PLATFORM=ios`. Example: `maestro test -c -e PLATFORM=ios flows/1_play-shorts.yml`.

### Quick ADR about maestro vs appium/flutter

The benefit of something like maestro over pure flutter-based widget testing is that you can create more realistic tests, which might include any native features (e.g. video playback for us), login, deep linking, etc.

I tried flutter integration tests and Patrol first, but it required rebuilding the app and was very tedious to write.
Maestro is very easy to use (yml) and has a good DX (no rebuilding the app, has hot restart etc).
I think appium is a "technically superior" framework, as it's more flexible on how you run the tests, write real code etc etc, but I never tried it.
It (appium) seems a bit too heavy, and I feel ui testing needs to be easy otherwise we'll never do it.
