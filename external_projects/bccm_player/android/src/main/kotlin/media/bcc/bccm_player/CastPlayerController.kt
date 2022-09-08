package media.bcc.bccm_player

import android.util.Log
import androidx.media3.cast.CastPlayer
import androidx.media3.cast.SessionAvailabilityListener
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import com.google.android.gms.cast.framework.CastContext
import com.google.android.gms.cast.framework.Session
import com.google.android.gms.cast.framework.SessionManagerListener
import media.bcc.player.ChromecastControllerPigeon
import media.bcc.player.PlaybackPlatformApi
import java.util.*

class CastPlayerController(
        private val castContext: CastContext,
        private val chromecastListenerPigeon: ChromecastControllerPigeon.ChromecastPigeon,
        private val plugin: BccmPlayerPlugin)
    : PlayerController(), SessionManagerListener<Session>, SessionAvailabilityListener {
    override val player = CastPlayer(castContext)

    override fun release() {
        player.release()
    }

    override val id: String = "chromecast"

    init {
        player.playWhenReady = true

        player.setSessionAvailabilityListener(this)
        player.addListener(PlayerListener(this, plugin))
    }

    fun getState(): PlaybackPlatformApi.ChromecastState {
        return PlaybackPlatformApi.ChromecastState.Builder().setConnectionState(PlaybackPlatformApi.CastConnectionState.values()[castContext.castState]).build()
    }

    // SessionManagerListener

    override fun onSessionEnded(p0: Session, p1: Int) {
        chromecastListenerPigeon.onSessionEnded {}
    }

    override fun onSessionEnding(p0: Session) {
        chromecastListenerPigeon.onSessionEnding {}
    }

    override fun onSessionResumeFailed(p0: Session, p1: Int) {
        chromecastListenerPigeon.onSessionResumeFailed {}
    }

    override fun onSessionResumed(p0: Session, p1: Boolean) {
        chromecastListenerPigeon.onSessionResumed {}
    }

    override fun onSessionResuming(p0: Session, p1: String) {
        chromecastListenerPigeon.onSessionResuming {}
    }

    override fun onSessionStartFailed(p0: Session, p1: Int) {
        chromecastListenerPigeon.onSessionStartFailed {}
    }

    override fun onSessionStarted(p0: Session, p1: String) {
        chromecastListenerPigeon.onSessionStarted {}
    }

    override fun onSessionStarting(p0: Session) {
        chromecastListenerPigeon.onSessionStarting {}
    }

    override fun onSessionSuspended(p0: Session, p1: Int) {
        chromecastListenerPigeon.onSessionSuspended {}
    }

    // SessionAvailabilityListener

    override fun onCastSessionAvailable() {
        chromecastListenerPigeon.onCastSessionAvailable {}
        Log.d("Bccm", "Session available. Transferring state from primaryPlayer to castPlayer");
        val primaryPlayer = plugin.getPlaybackService()?.getPrimaryController()?.player
                ?: throw Error("PlaybackService not active");
        transferState(primaryPlayer, player);
    }

    override fun onCastSessionUnavailable() {
        val event = ChromecastControllerPigeon.CastSessionUnavailableEvent.Builder();
        val currentPosition = player.currentPosition;
        if (currentPosition > 0) {
            event.setPlaybackPositionMs(currentPosition);
        }
        chromecastListenerPigeon.onCastSessionUnavailable(event.build()) {};
        /* Log.d("Bccm", "Session unavailable. Transferring state from castPlayer to primaryPlayer");
         val primaryPlayer = plugin.getPlaybackService()?.getPrimaryController()?.getPlayer() ?: throw Error("PlaybackService not active");
         transferState(castPlayer, primaryPlayer);*/
    }

    // Extra

    private fun transferState(previous: Player, next: Player) {

        // Copy state from primary player
        var playbackPositionMs = C.TIME_UNSET
        var currentItemIndex = C.INDEX_UNSET
        var playWhenReady = false

        val queue = mutableListOf<MediaItem>()
        for (x in 0 until previous.mediaItemCount) {
            queue.add(previous.getMediaItemAt(x));
        }

        if (previous.playbackState != Player.STATE_ENDED) {
            playbackPositionMs = previous.currentPosition
            playWhenReady = previous.playWhenReady
            currentItemIndex = previous.currentMediaItemIndex
            /*if (currentItemIndex != this.currentItemIndex) {
                playbackPositionMs = C.TIME_UNSET
                currentItemIndex = this.currentItemIndex
            }*/
        }
        previous.stop()
        previous.clearMediaItems()

        next.setMediaItems(queue, currentItemIndex, playbackPositionMs)
        next.playWhenReady = true
        next.prepare()
        next.play()
    }

}