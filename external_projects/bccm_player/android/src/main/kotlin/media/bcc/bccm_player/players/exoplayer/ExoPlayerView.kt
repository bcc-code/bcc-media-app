package media.bcc.bccm_player.players.exoplayer

import androidx.annotation.RequiresApi

interface ExoPlayerView {
    fun shouldPipAutomatically(): Boolean

    @RequiresApi(value = 26)
    fun enterPictureInPicture()
}