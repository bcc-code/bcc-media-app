
```

flutter pub run pigeon \
  --input pigeons/playback_platform_pigeon.dart \
  --dart_out lib/playback_platform_pigeon.g.dart \
  --objc_header_out ios/Classes/PlaybackPlatformApi.h \
  --objc_source_out ios/Classes/PlaybackPlatformApi.m \
  --java_out ./android/src/main/java/media/bcc/player/PlaybackPlatformApi.java \
  --java_package "media.bcc.bccm_player"

```
```

flutter pub run pigeon \
  --input pigeons/chromecast_pigeon.dart \
  --dart_out lib/chromecast_pigeon.g.dart \
  --objc_header_out ios/Classes/ChromecastPigeon.h \
  --objc_source_out ios/Classes/ChromecastPigeon.m \
  --java_out ./android/src/main/java/media/bcc/player/ChromecastControllerPigeon.java \
  --java_package "media.bcc.bccm_player"

```
```

flutter pub run pigeon \
  --input pigeons/playback_listener_pigeon.dart \
  --dart_out lib/playback_listener_pigeon.g.dart \
  --objc_header_out ios/Classes/PlaybackListenerPigeon.h \
  --objc_source_out ios/Classes/PlaybackListenerPigeon.m \
  --java_out ./android/src/main/java/media/bcc/player/PlaybackListenerPigeonImpl.java \
  --java_package "media.bcc.bccm_player"

```