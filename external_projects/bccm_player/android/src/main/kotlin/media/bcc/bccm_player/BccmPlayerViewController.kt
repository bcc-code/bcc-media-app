package media.bcc.bccm_player

import androidx.annotation.RequiresApi

interface BccmPlayerViewController {
    fun shouldPipAutomatically(): Boolean;
    @RequiresApi(value = 26)
    fun enterPictureInPicture()
}