# my_app

Note for M1 users: You need to `cd ios` and `arch -x86_64 pod install`

Install flutter, then do these things:

```
cp lib/env/.env.dart.example lib/env/.env.dart
flutter pub get
flutter pub run build_runner watch´
```

I recommend using the "Flutter" VSCode extension to enable debugging etc.
But you can also run from cli: `flutter run`

## Dev

codegen stuff: `flutter pub run build_runner watch`


# App architecture details

## Navigation architecture

Auto_route  