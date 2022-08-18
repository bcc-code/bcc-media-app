package media.bcc.bccm_player

import media.bcc.player.PlaybackPlatformApi


class PlaybackApiImpl(private val plugin: BccmPlayerPlugin) : PlaybackPlatformApi.PlaybackPlatformPigeon {
    override fun newPlayer(url: String?, result: PlaybackPlatformApi.Result<String>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return;
        }
        val playerController = playbackService.newPlayer()
        if (url != null) {
            playerController.playWithUrl(url)
        }
        result?.success(playerController.id)
    }
}