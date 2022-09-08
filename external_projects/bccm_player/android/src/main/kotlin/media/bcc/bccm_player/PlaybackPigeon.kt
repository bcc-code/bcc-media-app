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
        playerController.player.addListener(PlayerListener(playerController, plugin))
        if (url != null) {
            playerController.replaceCurrentMediaItem(PlaybackPlatformApi.MediaItem.Builder().setUrl(url).build())
        }
        result?.success(playerController.id)
    }

    override fun replaceCurrentMediaItem(playerId: String, mediaItem: PlaybackPlatformApi.MediaItem, playbackPositionFromPrimary: Boolean?, result: PlaybackPlatformApi.Result<Void>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }
        if (playbackPositionFromPrimary == true) {
            mediaItem.playbackStartPositionMs = playbackService.getPrimaryController().player.currentPosition
        }
        if (playerId == "chromecast") {
            plugin.getCastController()?.replaceCurrentMediaItem(mediaItem)
            return
        }

        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id ${playerId} does not exist.")

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
        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id $playerId does not exist.")
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

    override fun play(playerId: String) {
        val playbackService = plugin.getPlaybackService() ?: return
        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id $playerId does not exist.")

        playerController.player.play()
    }

    override fun pause(playerId: String) {
        val playbackService = plugin.getPlaybackService() ?: return
        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id $playerId does not exist.")

        playerController.player.pause()
    }

    override fun stop(playerId: String, reset: Boolean) {
        val playbackService = plugin.getPlaybackService() ?: return
        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id $playerId does not exist.")

        playerController.player.stop()
        if (reset) {
            playerController.player.clearMediaItems()
        }
    }

    override fun getChromecastState(result: PlaybackPlatformApi.Result<PlaybackPlatformApi.ChromecastState>?) {
        result?.success(plugin.getCastController()?.getState());
    }
}