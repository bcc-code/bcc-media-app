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
            playerController.playWithUrl(url)
        }
        result?.success(playerController.id)
    }
    
    override fun newPlayer(url: String?, result: PlaybackPlatformApi.Result<String>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }
        val playerController = playbackService.newPlayer()
        if (url != null) {
            playerController.playWithUrl(url)
        }
        result?.success(playerController.id)
    }

    override fun setUrl(setUrlArgs: PlaybackPlatformApi.SetUrlArgs, result: PlaybackPlatformApi.Result<Void>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }

        val playerController = playbackService.getController(setUrlArgs.playerId) ?: throw Error("Player with id ${setUrlArgs.playerId} does not exist.")

        playerController.playWithUrl(setUrlArgs.url, setUrlArgs.isLive ?: false)
    }

    override fun addMediaItem(playerId: String, mediaItem: PlaybackPlatformApi.MediaItem, result: PlaybackPlatformApi.Result<Void>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }
        val playerController = playbackService.getController(playerId) ?: throw Error("Player with id $playerId does not exist.")
        playerController.playWithMediaItem(mediaItem)
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
}