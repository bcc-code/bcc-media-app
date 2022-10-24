# bccm_player

# Architecture

### Data transfer between flutter, native and cc

| Flutter                          | iOS                                                       | Android                                                      | Chromecast                                       |
| -------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| MediaItem.Metadata.Extras["KEY"] | PlayerItem.externalMetadata["media.bcc.extras.**KEY**")   | MediaItem.MediaMetadata.Extras["media.bcc.extras.**KEY**"]   | mediaInfo.metadata["media.bcc.extras.**KEY**"]   |
| MediaItem.isLive                 | PlayerItem.externalMetadata["media.bcc.player.is_live"]   | MediaItem.MediaMetadata.Extras["media.bcc.player.is_live"]   | mediaInfo.metadata["media.bcc.player.is_live"]   |
| MediaItem.mimeType               | PlayerItem.externalMetadata["media.bcc.player.mime_type"] | MediaItem.MediaMetadata.Extras["media.bcc.player.mime_type"] | mediaInfo.metadata["media.bcc.player.mime_type"] |
