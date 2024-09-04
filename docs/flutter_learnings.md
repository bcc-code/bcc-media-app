# Summary of our learnings with flutter

## Tips for those adopting flutter

- State management: You can go crazy researching this. Just learn riverpod and use it, if only to share knowledge with us. Short summary: Bloc is too complex, provider is an old version of riverpod, GetX is non-idiomatic and hated, mobx is not as popular and is less flutter-y. (btw with riverpod you may want to start without the codegen. We had an issue with it)

- Widget code: flutter_hooks is nice to reduce boilerplate per widget, but it's easy to do mistakes, so I'd stay away from it until you get more experience with how flutter works.

- Routing: We use auto_route because of its strong types. It's good, but the documentation is a bit lacking. Flutter's official package is go_router | Flutter Package (pub.dev).

- Native code: If you're going to do any native code, you should quickly consider pigeon | Dart Package (pub.dev). Strongly typed and codegen saves you a lot of time.

- Localization: See our ⁠l10n.yaml file, especially synthetic-package: false and nullable-getter: false. And ⁠crowdin.yml.

- App icon: Flutter_launcher_icons will probably save you some time.

- Web: Flutter web is laggy on older devices. Hoping it improves with Support for WebAssembly (Wasm) | Flutter
