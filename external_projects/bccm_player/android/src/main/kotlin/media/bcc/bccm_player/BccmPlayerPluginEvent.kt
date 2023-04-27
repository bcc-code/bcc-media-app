package media.bcc.bccm_player

import android.app.Activity
import androidx.lifecycle.Lifecycle

interface BccmPlayerPluginEvent

class AttachedToActivityEvent(val activity: Activity) : BccmPlayerPluginEvent
class DetachedFromActivityEvent : BccmPlayerPluginEvent
class OnActivityStop : BccmPlayerPluginEvent
class SetPlayerViewVisibilityEvent(val viewId: Long, val visible: Boolean) :
    BccmPlayerPluginEvent

class PictureInPictureModeChangedEvent2(val isInPictureInPictureMode: Boolean, val lifecycleState: Lifecycle.State) :
    BccmPlayerPluginEvent

class PictureInPictureModeChangedEvent(
    val playerId: String,
    val isInPictureInPictureMode: Boolean
) : BccmPlayerPluginEvent
