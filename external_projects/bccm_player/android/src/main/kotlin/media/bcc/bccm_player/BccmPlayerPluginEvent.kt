package media.bcc.bccm_player

import android.app.Activity

interface BccmPlayerPluginEvent

class AttachedToActivityEvent(val activity: Activity) : BccmPlayerPluginEvent
class DetachedFromActivityEvent : BccmPlayerPluginEvent
class OnActivityStop : BccmPlayerPluginEvent
class SetPlayerViewVisibilityEvent(val viewId: Long, val visible: Boolean) :
    BccmPlayerPluginEvent

class PictureInPictureModeChangedEvent2(val isInPictureInPictureMode: Boolean) :
    BccmPlayerPluginEvent

class PictureInPictureModeChangedEvent(
    val playerId: String,
    val isInPictureInPictureMode: Boolean
) : BccmPlayerPluginEvent
