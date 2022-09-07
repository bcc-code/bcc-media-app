package media.bcc.bccm_player

import media.bcc.player.PlaybackPlatformApi


class PlaybackApiImpl(private val plugin: BccmPlayerPlugin) : PlaybackPlatformApi.PlaybackPlatformPigeon {
    override fun newPlayer(url: String?, result: PlaybackPlatformApi.Result<String>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }
        val playerController = playbackService.newPlayer()
        if (url != null) {
            playerController.replaceCurrentMediaItem(PlaybackPlatformApi.MediaItem.Builder().setUrl(url).build())
        }
        result?.success(playerController.id)
    }

    override fun replaceCurrentMediaItem(playerId: String, mediaItem: PlaybackPlatformApi.MediaItem, result: PlaybackPlatformApi.Result<Void>?) {
        if (playerId == "chromecast") {
            plugin.getCastController()?.addMediaItem(mediaItem)
            return
        }
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }

        val playerController = playbackService.getController(playerId) ?: throw Error("Player with id ${playerId} does not exist.")

        playerController.replaceCurrentMediaItem(mediaItem)
    }

    override fun queueMediaItem(playerId: String, mediaItem: PlaybackPlatformApi.MediaItem, result: PlaybackPlatformApi.Result<Void>?) {
        if (playerId == "chromecast") {
            plugin.getCastController()?.addMediaItem(mediaItem)
            return
        }

        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }
        val playerController = playbackService.getController(playerId) ?: throw Error("Player with id $playerId does not exist.")
        playerController.replaceCurrentMediaItem(mediaItem)
    }

    override fun setPrimary(id: String, result: PlaybackPlatformApi.Result<Void>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }

        playbackService.setPrimary(id)
        result?.success(null)
    }

    override fun getChromecastState(result: PlaybackPlatformApi.Result<PlaybackPlatformApi.ChromecastState>?) {
        result?.success(plugin.getCastController()?.getState());
    }
}