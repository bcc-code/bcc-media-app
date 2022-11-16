## Adding a new flavor

So this is a bit cumbersome, sorry. A quick ADR: I decided it was better to just do this manually than use a tool like flutter_flavorizr, primarily because I expect that this is something we rarely need to do. A tool like that can also become outdated and have breaking changes from each time we use it, so maybe it's better to just define the steps here explicitly. Can also be automated with a script if we end up making flavors often. This is mostly just duplicating config lines and files.

Dart setup

- Create main\_{flavor}.dart
- (Optional) Add the flavor as a debug thing in .vscode/launch.json

Android setup

- Define the flavor in [/android/app/build.gradle](/android/app/build.gradle)
- Duplicate /android/app/src/{flavor}/res/values/string.xml and update the values as needed.

iOS setup

- Click the root project in xcode. Under Info -> Configurations. Duplicate the existing configurations so that you get Debug-{flavor}, Profile-{flavor} and Release-{flavor}
- Duplicate the existing plist files located at /ios/Runner/ so that you get /ios/Runner/Info-{Debug/Profile/Release}-{flavor}.plist.
- Duplicate the existing schemes, and update each step inside of them to have the correct "Build Configuration".

Firebase setup

- Run flutterfire: `flutterfire configure -i tv.brunstad.app -a tv.brunstad.app -o lib/env/prod/firebase_options.dart --project=btv-platform-prod-2`
- Move the generated google-services.json into /android/app/src/{flavor}/
- Move the generated firebase_app_id_file.json to this folder: /firebase/{flavor}/
- Download GoogleService-Info.plist from Firebase Console -> Settings -> General -> iOS, and place it in /firebase/{flavor}
- (iOS) Go to Runner -> Build Settings -> FLUTTER_TARGET, set it to the correct file: lib/main\_{flavor}.dart.
- (Troubleshooting)
  - If you get issues on ios, make sure that the /firebase/ios_copy_script.sh exists as a "Run script" action under Edit Scheme -> Build -> Pre-actions. This script is responsible for copying the flavor files to the correct location when building.
  - Also make sure the xcode project doesn't have any "firebase_app_id_file.json" or "GoogleService-Info.plist" under Runner.
  - General tips: Clean project, run `pod install` in the /ios folder.
