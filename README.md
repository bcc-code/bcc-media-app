# my_app

Note for M1 users: You need to `cd ios` and `arch -x86_64 pod install`

Install flutter, make env file, and you should be ready to go:

```
cp lib/env/.env.dart.example lib/env/.env.dart
flutter run
```

## Dev

codegen stuff: `flutter pub run build_runner watch`


# App architecture details

## Navigation architecture

Based on https://www.vojtech.net/posts/flutter-bottom-navigation

- RootScreen creates the bottom navigation bar, alongside a "IndexedStack" which holds all the tab-screens.
- NavigationProvider holds which tab we are on
- Each tab is wrapped in a Navigator, and what it shows is determined by the screens OnGenerateRoute().

