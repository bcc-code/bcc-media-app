# Pigeons

Pigeon is used to generate type-safe code for communicating between flutter and iOS/Android.
Pigeon doesn't use build_runner, so the commands below need to be re-run whenever you change the dart pigeon files.

### Playback platform pigeon

```

flutter pub run pigeon \
  --input pigeons/playback_platform_pigeon.dart \
  --dart_out lib/src/pigeon/playback_platform_pigeon.g.dart \
  --objc_header_out ios/Classes/Pigeon/PlaybackPlatformApi.h \
  --objc_source_out ios/Classes/Pigeon/PlaybackPlatformApi.m \
  --java_out ./android/src/main/java/media/bcc/bccm_player/PlaybackPlatformApi.java \
  --java_package "media.bcc.bccm_player"

```

### Chromecast pigeon

```

flutter pub run pigeon \
  --input pigeons/chromecast_pigeon.dart \
  --dart_out lib/src/pigeon/chromecast_pigeon.g.dart \
  --objc_header_out ios/Classes/Pigeon/ChromecastPigeon.h \
  --objc_source_out ios/Classes/Pigeon/ChromecastPigeon.m \
  --java_out ./android/src/main/java/media/bcc/bccm_player/ChromecastControllerPigeon.java \
  --java_package "media.bcc.bccm_player"

```
