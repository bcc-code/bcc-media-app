package media.bcc.bccm_player.players.chromecast

import android.os.Bundle
import android.util.Log
import androidx.media3.cast.CastPlayer
import androidx.media3.cast.SessionAvailabilityListener
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import com.google.android.gms.cast.framework.CastContext
import com.google.android.gms.cast.framework.Session
import com.google.android.gms.cast.framework.SessionManagerListener
import media.bcc.bccm_player.PlaybackService
import media.bcc.bccm_player.pigeon.ChromecastControllerPigeon
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi
import media.bcc.bccm_player.players.PlayerController
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter.Companion.PLAYER_DATA_LAST_KNOWN_AUDIO_LANGUAGE
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter.Companion.PLAYER_DATA_LAST_KNOWN_SUBTITLE_LANGUAGE
import media.bcc.bccm_player.players.exoplayer.BccmPlayerViewController


class CastPlayerController(
    private val castContext: CastContext,
    private val playbackService: PlaybackService
) : PlayerController(), SessionManagerListener<Session>, SessionAvailabilityListener {
    override val player = CastPlayer(castContext, CastMediaItemConverter())
    override var currentPlayerViewController: BccmPlayerViewController? = null

    override val id: String = "chromecast"

    init {
        player.playWhenReady = true
        player.setSessionAvailabilityListener(this)
        castContext.sessionManager.addSessionManagerListener(this)
    }

    override fun release() {
        player.setSessionAvailabilityListener(null)
        castContext.sessionManager.removeSessionManagerListener(this)
        //player.release() - this causes the player to stop
        super.release()
    }

    override fun stop(reset: Boolean) {
        if (reset) {
            player.clearMediaItems()
        } else {
            player.pause()
        }
    }

    fun getState(): PlaybackPlatformApi.ChromecastState {
        val builder = PlaybackPlatformApi.ChromecastState.Builder()
        Log.d("bccm", "getState, player currentMediaItem: " + player.currentMediaItem)
        player.currentMediaItem?.let {
            builder.setMediaItem(mapMediaItem(it))
        }
        builder.setConnectionState(PlaybackPlatformApi.CastConnectionState.values()[castContext.castState])
        return builder.build()
    }


    // SessionManagerListener

    override fun onSessionEnded(p0: Session, p1: Int) {
        Log.d("bccm", "CastPlayerController::onSessionEnded")
        plugin?.chromecastPigeon?.onSessionEnded {}
    }

    override fun onSessionEnding(p0: Session) {
        Log.d("bccm", "CastPlayerController::onSessionEnding")
        plugin?.chromecastPigeon?.onSessionEnding {}
    }

    override fun onSessionResumeFailed(p0: Session, p1: Int) {
        Log.d("bccm", "CastPlayerController::onSessionResumeFailed")
        plugin?.chromecastPigeon?.onSessionResumeFailed {}
    }

    override fun onSessionResumed(p0: Session, p1: Boolean) {
        Log.d("bccm", "CastPlayerController::onSessionResumed, setting as primary")
        plugin?.chromecastPigeon?.onSessionResumed {}
        playbackService.setPrimary(this.id);
    }

    override fun onSessionResuming(p0: Session, p1: String) {
        Log.d("bccm", "CastPlayerController::onSessionResuming")
        plugin?.chromecastPigeon?.onSessionResuming {}
    }

    override fun onSessionStartFailed(p0: Session, p1: Int) {
        Log.d("bccm", "CastPlayerController::onSessionStartFailed")
        plugin?.chromecastPigeon?.onSessionStartFailed {}
    }

    override fun onSessionStarted(p0: Session, p1: String) {
        Log.d("bccm", "CastPlayerController::onSessionStarted")
        plugin?.chromecastPigeon?.onSessionStarted {}
    }

    override fun onSessionStarting(p0: Session) {
        Log.d("bccm", "CastPlayerController::onSessionStarting")
        plugin?.chromecastPigeon?.onSessionStarting {}
    }

    override fun onSessionSuspended(p0: Session, p1: Int) {
        Log.d("bccm", "CastPlayerController::onSessionSuspended")
        plugin?.chromecastPigeon?.onSessionSuspended {}
    }

    // SessionAvailabilityListener

    override fun onCastSessionAvailable() {
        plugin?.chromecastPigeon?.onCastSessionAvailable {}
        Log.d("bccm", "Session available. Transferring state from primaryPlayer to castPlayer")
        val primaryPlayer =
            playbackService.getPrimaryController()?.player ?: return

        Log.d("bccm", "oncastsessionavailable + " + player.mediaMetadata.extras?.getString("id"))
        if (primaryPlayer.isPlaying) {
            transferState(primaryPlayer, player)
        } else {
            primaryPlayer.stop()
        }
        playbackService.setPrimary(this.id);
    }

    override fun onCastSessionUnavailable() {
        val event = ChromecastControllerPigeon.CastSessionUnavailableEvent.Builder()
        val currentPosition = player.currentPosition
        if (currentPosition > 0) {
            event.setPlaybackPositionMs(currentPosition)
        }
        playbackService.unclaimIfPrimary(this)
        plugin?.chromecastPigeon?.onCastSessionUnavailable(event.build()) {}
    };
}

// Extra

private fun transferState(previous: Player, next: Player) {
    val currentTracks = previous.currentTracks
    Log.d("bccm", currentTracks.toString())
    val audioTrack =
        currentTracks.groups.firstOrNull { it.isSelected && it.type == C.TRACK_TYPE_AUDIO }
            ?.getTrackFormat(0)?.language
    val subtitleTrack =
        currentTracks.groups.firstOrNull { it.isSelected && it.type == C.TRACK_TYPE_TEXT }
            ?.getTrackFormat(0)?.language
    Log.d("bccm", "audioTrack when transferring to cast: $audioTrack")
    Log.d("bccm", "subtitleTrack when transferring to cast: $subtitleTrack")

    // Copy state from primary player
    var playbackPositionMs = C.TIME_UNSET
    var currentItemIndex = C.INDEX_UNSET

    val queue = mutableListOf<MediaItem>()
    for (x in 0 until previous.mediaItemCount) {
        val mediaItem = previous.getMediaItemAt(x)
        val metaBuilder = mediaItem.mediaMetadata.buildUpon()
        val extras = mediaItem.mediaMetadata.extras ?: Bundle()
        extras.putString(PLAYER_DATA_LAST_KNOWN_AUDIO_LANGUAGE, audioTrack)
        extras.putString(PLAYER_DATA_LAST_KNOWN_SUBTITLE_LANGUAGE, subtitleTrack)
        metaBuilder.setExtras(extras)
        val newMediaItem = mediaItem
            .buildUpon()
            .setMediaMetadata(metaBuilder.build())
            .build()
        queue.add(newMediaItem)
    }

    if (previous.playbackState != Player.STATE_ENDED) {
        if (!previous.isCurrentMediaItemDynamic)
            playbackPositionMs = previous.currentPosition
        currentItemIndex = previous.currentMediaItemIndex
    }
    previous.stop()
    previous.clearMediaItems()
    next.setMediaItems(queue, currentItemIndex, playbackPositionMs)
    next.playWhenReady = true
    next.prepare()
    next.play()
}