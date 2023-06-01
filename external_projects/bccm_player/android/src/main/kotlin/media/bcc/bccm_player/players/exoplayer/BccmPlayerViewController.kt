package media.bcc.bccm_player.players.exoplayer

import androidx.annotation.RequiresApi

interface BccmPlayerViewController {
    val isFullscreen: Boolean
    val shouldPipAutomatically: Boolean
    fun onOwnershipLost() {}
    fun exitFullscreen() {}
    fun enterFullscreen() {}

    @RequiresApi(value = 26)
    fun enterPictureInPicture()
}