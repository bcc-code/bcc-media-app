package media.bcc.bccm_player

import com.google.android.gms.cast.framework.Session
import com.google.android.gms.cast.framework.SessionManagerListener

class CastController(val plugin: BccmPlayerPlugin): SessionManagerListener<Session> {
    override fun onSessionEnded(p0: Session, p1: Int) {
        plugin.
        TODO("Not yet implemented")
    }

    override fun onSessionEnding(p0: Session) {
        TODO("Not yet implemented")
    }

    override fun onSessionResumeFailed(p0: Session, p1: Int) {
        TODO("Not yet implemented")
    }

    override fun onSessionResumed(p0: Session, p1: Boolean) {
        TODO("Not yet implemented")
    }

    override fun onSessionResuming(p0: Session, p1: String) {
        TODO("Not yet implemented")
    }

    override fun onSessionStartFailed(p0: Session, p1: Int) {
        TODO("Not yet implemented")
    }

    override fun onSessionStarted(p0: Session, p1: String) {
        TODO("Not yet implemented")
    }

    override fun onSessionStarting(p0: Session) {
        TODO("Not yet implemented")
    }

    override fun onSessionSuspended(p0: Session, p1: Int) {
        TODO("Not yet implemented")
    }

}