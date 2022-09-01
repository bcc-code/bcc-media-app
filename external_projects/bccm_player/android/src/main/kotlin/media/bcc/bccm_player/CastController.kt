package media.bcc.bccm_player

import androidx.media3.cast.CastPlayer
import com.google.android.gms.cast.framework.CastContext
import com.google.android.gms.cast.framework.Session
import com.google.android.gms.cast.framework.SessionManagerListener
import media.bcc.player.ChromecastControllerPigeon

class CastController(castContext: CastContext, private val pigeon: ChromecastControllerPigeon.ChromecastPigeon): SessionManagerListener<Session> {
    val castPlayer = CastPlayer(castContext)

    override fun onSessionEnded(p0: Session, p1: Int) {
        pigeon.onSessionEnded {}
    }

    override fun onSessionEnding(p0: Session) {
        pigeon.onSessionEnding {}
    }

    override fun onSessionResumeFailed(p0: Session, p1: Int) {
        pigeon.onSessionResumeFailed {}
    }

    override fun onSessionResumed(p0: Session, p1: Boolean) {
        pigeon.onSessionResumed {}
    }

    override fun onSessionResuming(p0: Session, p1: String) {
        pigeon.onSessionResuming {}
    }

    override fun onSessionStartFailed(p0: Session, p1: Int) {
        pigeon.onSessionStartFailed {}
    }

    override fun onSessionStarted(p0: Session, p1: String) {
        pigeon.onSessionStarted {}
    }

    override fun onSessionStarting(p0: Session) {
        pigeon.onSessionStarting {}
    }

    override fun onSessionSuspended(p0: Session, p1: Int) {
        pigeon.onSessionSuspended {}
    }

}