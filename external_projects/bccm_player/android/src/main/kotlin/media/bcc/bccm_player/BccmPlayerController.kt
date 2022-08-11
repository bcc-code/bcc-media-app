package media.bcc.bccm_player

import android.content.Context
import androidx.media3.common.*
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.ui.PlayerView
import com.google.android.gms.common.api.Releasable
import java.util.*

class BccmPlayerController(context: Context) {
    val id: String = UUID.randomUUID().toString()
    private val exoPlayer: ExoPlayer
    private val forwardingPlayer: ForwardingPlayer
    private var currentPlayerViewWrapper: BccmPlayerViewWrapper? = null

    init {
        exoPlayer = ExoPlayer.Builder(context)
                .setAudioAttributes(AudioAttributes.DEFAULT, /* handleAudioFocus= */ true)
                .build()
        exoPlayer.prepare()

        forwardingPlayer = object : ForwardingPlayer(exoPlayer) {
            private var seekBackIncrement: Long = 15000

            private var seekForwardIncrement: Long = 15000

            override fun getSeekBackIncrement(): Long {
                return seekBackIncrement
            }

            override fun seekBack() {
                seekToOffset(-seekBackIncrement)
            }

            override fun getSeekForwardIncrement(): Long {
                return seekForwardIncrement
            }

            override fun seekForward() {
                seekToOffset(seekForwardIncrement)
            }

            private fun seekToOffset(offsetMs: Long) {
                var positionMs = currentPosition + offsetMs
                val durationMs = duration
                if (durationMs != C.TIME_UNSET) {
                    positionMs = java.lang.Long.min(positionMs, durationMs)
                }
                positionMs = java.lang.Long.max(positionMs, 0)
                seekTo(positionMs)
            }
        }
    }

    fun getExoPlayer(): Player {
        return forwardingPlayer;
    }

    fun takeOwnership(pvWrapper: BccmPlayerViewWrapper) {
        val previousPvWrapper = currentPlayerViewWrapper;
        currentPlayerViewWrapper = pvWrapper;
        val playerView = pvWrapper.getPlayerView() ?: throw Error("pvWrapper.getPlayerView() was null");
        val currentPlayerView = previousPvWrapper?.getPlayerView();
        if (currentPlayerView != null) {
            PlayerView.switchTargetView(getExoPlayer(), currentPlayerView, playerView)
        } else {
            playerView.player = getExoPlayer()
        }
        if (previousPvWrapper?.isFullscreenPlayer() == true) {
            previousPvWrapper.dispose()
        }

        if (pvWrapper.isFullscreenPlayer()) {
            pvWrapper.onDispose = {
                previousPvWrapper?.run { takeOwnership(previousPvWrapper) };
            }
        }
    }

    fun playWithUrl(url: String) {
        val mediaItem: MediaItem = MediaItem.Builder()
                .setUri(url)
                .setMimeType(MimeTypes.APPLICATION_M3U8)
                .build()
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.play()
    }

    fun release() {
        exoPlayer.release()
    }
}