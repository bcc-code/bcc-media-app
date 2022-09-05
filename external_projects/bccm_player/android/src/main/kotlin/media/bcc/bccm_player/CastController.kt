package media.bcc.bccm_player

import android.net.Uri
import androidx.media3.cast.CastPlayer
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import com.google.android.gms.cast.framework.CastContext
import com.google.android.gms.cast.framework.CastState
import com.google.android.gms.cast.framework.Session
import com.google.android.gms.cast.framework.SessionManagerListener
import media.bcc.player.ChromecastControllerPigeon
import media.bcc.player.PlaybackPlatformApi

class CastController(private val castContext: CastContext, private val pigeon: ChromecastControllerPigeon.ChromecastPigeon, private val plugin: BccmPlayerPlugin): SessionManagerListener<Session> {
    val castPlayer = CastPlayer(castContext)

    init {
        castPlayer.playWhenReady = true
    }

    fun addMediaItem(mediaItem: PlaybackPlatformApi.MediaItem) {
        val metaBuilder = MediaMetadata.Builder();
        if (mediaItem.metadata?.artworkUri != null) {
            metaBuilder.setArtworkUri(Uri.parse(mediaItem.metadata?.artworkUri))
        }
        metaBuilder.setTitle(mediaItem.metadata?.title)
            .setArtist(mediaItem.metadata?.artist)
            .build()
        val miBuilder = MediaItem.Builder()
                .setUri(mediaItem.url)
                .setMediaMetadata(metaBuilder.build());
        if (mediaItem.mimeType != null) {
            miBuilder.setMimeType(mediaItem.mimeType);
        }
        castPlayer.addMediaItem(miBuilder.build());
        castPlayer.play()
    }

    fun getState(): PlaybackPlatformApi.ChromecastState {
        val connected = castContext.castState == CastState.CONNECTED;
        return PlaybackPlatformApi.ChromecastState.Builder().setConnectionState(PlaybackPlatformApi.CastConnectionState.values()[castContext.castState]).build()
    }

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
        // Copy state from primary player
        val primaryPlayer = plugin.getPlaybackService()?.getPrimaryController()?.getPlayer() ?: throw Error("PlaybackService not active");

        var playbackPositionMs = C.TIME_UNSET
        var currentItemIndex = C.INDEX_UNSET
        var playWhenReady = false

        val queue = mutableListOf<MediaItem>()
        for (x in 0..primaryPlayer.mediaItemCount) {
            queue.add(primaryPlayer.getMediaItemAt(x));
        }

        if (primaryPlayer.playbackState != Player.STATE_ENDED) {
            playbackPositionMs = primaryPlayer.currentPosition
            playWhenReady = primaryPlayer.playWhenReady
            currentItemIndex = primaryPlayer.currentMediaItemIndex
            /*if (currentItemIndex != this.currentItemIndex) {
                playbackPositionMs = C.TIME_UNSET
                currentItemIndex = this.currentItemIndex
            }*/
        }
        primaryPlayer.stop()
        primaryPlayer.clearMediaItems()

        castPlayer.setMediaItems(queue, currentItemIndex, playbackPositionMs)
        castPlayer.playWhenReady = playWhenReady
        castPlayer.prepare()

        // Set castplayer as primary??
    }

    override fun onSessionStarting(p0: Session) {
        pigeon.onSessionStarting {}
    }

    override fun onSessionSuspended(p0: Session, p1: Int) {
        pigeon.onSessionSuspended {}
    }

}