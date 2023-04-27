# BCC Media Player

# Why build our own package

There are other options for video playback in flutter, e.g. [video_player](https://pub.dev/packages/video_player) and [betterplayer](https://github.com/jhomlala/betterplayer).
These are the main reasons we are not using these plugins:

1. They rely on rendering to textures and going via flutter's rendering engine, which we found caused stuttering for 1080@50fps on Android. We believe it's a better architectural decision to let the OS handle video playback natively through hybrid composition.
2. We need audio track selection and picture-in-picture support, and `video_player` does not support that. It also can't do DRM because of its architecture, and we _might_ want that. `betterplayer` has some of these things, but it was maintained by someone on their free time and now there hasn't been a commit in 10 months.
3. We need seamless chromecast support.
4. We want to have the flexibility to plug in our own plugins and customize configurations. It's of course possible to make a fork of an existing package, but it's a bit more tedious as you don't want to stray too far from the upstream repo. Maintaining our own code lowers the bar for customizations, and allows us to easily plug in native SDKs (e.g. chromecast and npaw), etc.

The main downside here is that hybrid composition has some performance impact on the flutter UI itself, which _might_ make it complicated to do stuff like a vertical scrolling feed of short-form videos. If we would like to make custom player controls with flutter it would also require quite a bit of wiring, and has some uncertainty as to how it would work with fullscreening, picture-in-picture etc.

# Architecture

### Data transfer between flutter, native and cc

| Flutter                          | iOS                                                       | Android                                                      | Chromecast                                       |
| -------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| MediaItem.Metadata.Extras["KEY"] | PlayerItem.externalMetadata["media.bcc.extras.**KEY**")   | MediaItem.MediaMetadata.Extras["media.bcc.extras.**KEY**"]   | mediaInfo.metadata["media.bcc.extras.**KEY**"]   |
| MediaItem.isLive                 | PlayerItem.externalMetadata["media.bcc.player.is_live"]   | MediaItem.MediaMetadata.Extras["media.bcc.player.is_live"]   | mediaInfo.metadata["media.bcc.player.is_live"]   |
| MediaItem.mimeType               | PlayerItem.externalMetadata["media.bcc.player.mime_type"] | MediaItem.MediaMetadata.Extras["media.bcc.player.mime_type"] | mediaInfo.metadata["media.bcc.player.mime_type"] |
