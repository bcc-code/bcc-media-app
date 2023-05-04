package media.bcc.bccm_player

import android.content.Intent
import android.os.Binder
import android.os.IBinder
import android.util.Log
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import com.google.android.gms.cast.framework.CastContext
import com.google.android.gms.cast.framework.CastState
import media.bcc.bccm_player.players.PlayerController
import media.bcc.bccm_player.players.chromecast.CastPlayerController
import media.bcc.bccm_player.players.exoplayer.ExoPlayerController

class PlaybackService : MediaSessionService() {
    private var plugin: BccmPlayerPlugin? = null
    private val playerControllers = mutableListOf<PlayerController>()
    private var castPlayerController: CastPlayerController? = null
    private var primaryPlayerController: PlayerController? = null
    private lateinit var mediaSession: MediaSession
    private var binder: LocalBinder = LocalBinder()
    private var previousPrimaryPlayerId: String? = null

    fun attachPlugin(plugin: BccmPlayerPlugin) {
        Log.d("bccm", "PlaybackService(${this.hashCode()})::attachPlugin called")
        this.plugin = plugin
        this.playerControllers.forEach {
            it.attachPlugin(plugin)
        }
    }

    fun isAttached(plugin: BccmPlayerPlugin): Boolean {
        return plugin == this.plugin
    }

    fun stopIfAttached(plugin: BccmPlayerPlugin) {
        if (plugin != this.plugin) return
        Log.d("bccm", "PlaybackService(${this.hashCode()})::stopIfAttached called")
        playerControllers.forEach {
            it.release()
        }
        playerControllers.clear()
        this.plugin = null
        mediaSession.release()
        stopSelf()
    }

    fun newPlayer(): PlayerController {
        Log.d("bccm", "PlaybackService(${this.hashCode()})::newPlayer called")
        val pc = ExoPlayerController(this)
        playerControllers.add(pc)
        return pc
    }

    fun setPrimary(playerId: String) {
        if (playerId == primaryPlayerController?.id) return
        Log.d("bccm", "PlaybackService(${this.hashCode()})::setPrimary($playerId) called")
        val pc = playerControllers.find {
            it.id == playerId
        }
        if (pc?.player != null) {
            previousPrimaryPlayerId = primaryPlayerController?.id
            primaryPlayerController = pc
            mediaSession.player = pc.player
            if (plugin != null) {
                plugin!!.playbackPigeon?.onPrimaryPlayerChanged(playerId) {}
                plugin!!.playbackPigeon?.onPlayerStateUpdate(primaryPlayerController!!.getPlayerStateSnapshot()) {}
                pc.attachPlugin(plugin!!)
            }
        }
    }

    fun unclaimIfPrimary(playerController: PlayerController) {
        if (primaryPlayerController != playerController) return
        if (previousPrimaryPlayerId != null && playerControllers.any { it.id == previousPrimaryPlayerId }) {
            setPrimary(previousPrimaryPlayerId!!)
            return
        }
        Log.d(
            "bccm",
            "PlaybackService(${this.hashCode()})::unclaimIfPrimary(${playerController.hashCode()}"
        )
        setPrimary(playerControllers.find { it is ExoPlayerController }!!.id)
    }


    fun getController(playerId: String): PlayerController? {
        return playerControllers.find { it.id == playerId }
    }

    fun getPrimaryController(): PlayerController? {
        return primaryPlayerController
    }

    fun getChromecastController(): CastPlayerController? {
        return castPlayerController;
    }

    // Create your Player and MediaSession in the onCreate lifecycle event
    override fun onCreate() {
        Log.d("bccm", "PlaybackService(${this.hashCode()})::onCreate called")
        super.onCreate()
        newPlayer().let {
            mediaSession = MediaSession.Builder(this, it.player).build()
            setPrimary(it.id)
        }

        try {
            val castContext =
                CastContext.getSharedInstance(applicationContext)
            castPlayerController = CastPlayerController(castContext, this).also {
                playerControllers.add(it)
            }
            if (castContext.castState == CastState.CONNECTED) {
                setPrimary(castPlayerController!!.id)
            }
        } catch (e: Exception) {
            //TODO: log exception
            Log.e("bccm", "cast init failed: $e ${e.cause}")
        }
    }

    // Return a MediaSession to link with the MediaController that is making
    // this request.
    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession =
        mediaSession

    override fun onDestroy() {
        Log.d("bccm", "PlaybackService(${this.hashCode()})::onDestroy called")
        playerControllers.forEach {
            it.release()
        }
        playerControllers.clear()
        mediaSession.release()
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? {
        Log.d("bccm", "PlaybackService(${this.hashCode()})::onBind called")
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