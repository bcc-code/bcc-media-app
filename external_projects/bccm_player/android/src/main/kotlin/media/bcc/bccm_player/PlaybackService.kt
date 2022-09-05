
package media.bcc.bccm_player

import android.content.Intent
import android.os.Binder
import android.os.IBinder
import androidx.media3.cast.CastPlayer
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService

class PlaybackService : MediaSessionService() {
    private val playerControllers = mutableListOf<BccmPlayerController>()
    private val castPlayer: CastPlayer? = null
    private lateinit var primaryPlayerController: BccmPlayerController
    private lateinit var mediaSession: MediaSession

    private var binder: LocalBinder = LocalBinder();

    fun newPlayer(): BccmPlayerController {
        val pc = BccmPlayerController(this)
        playerControllers.add(pc)
        return pc
    }

    fun setPrimary(playerId: String) {
        val pc = playerControllers.find {
            it.id == playerId
        }
        if (pc?.getPlayer() != null) {
            primaryPlayerController = pc
            mediaSession.player = pc.getPlayer()
        }
    }

    fun getController(playerId: String): BccmPlayerController? {
        return playerControllers.find { it.id == playerId }
    }
    fun getPrimaryController(): BccmPlayerController {
        return primaryPlayerController
    }

    // Create your Player and MediaSession in the onCreate lifecycle event
    override fun onCreate() {
        super.onCreate()
        primaryPlayerController = newPlayer()
        mediaSession = MediaSession.Builder(this, primaryPlayerController.getPlayer()).build()
    }

    // Return a MediaSession to link with the MediaController that is making
    // this request.
    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession = mediaSession

    override fun onDestroy() {
        playerControllers.forEach {
            it.release()
        }
        mediaSession.release()
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? {
        if (intent?.action == null) {
            return this.binder
        }
        return super.onBind(intent)
        //return binder;
    }

    inner class LocalBinder : Binder() {
        fun getService(): PlaybackService {
            return this@PlaybackService
        }
    }
}