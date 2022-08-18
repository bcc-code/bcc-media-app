package media.bcc.bccm_player

import android.content.Context
import androidx.media3.common.*
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.ui.PlayerView
import java.util.*

class BccmPlayerController(context: Context) {
    val id: String = UUID.randomUUID().toString()
    private val exoPlayer: ExoPlayer
    private val forwardingPlayer: ForwardingPlayer
    private var currentPlayerViewWrapper: BccmPlayerViewWrapper? = null
    var isLive: Boolean = false
        private set

    init {/*
        val df = DefaultRenderersFactory(context).also {
            it.experimentalSetSynchronizeCodecInteractionsWithQueueingEnabled(true);
            it.forceEnableMediaCodecAsynchronousQueueing();
        };*/
        exoPlayer = ExoPlayer.Builder(context)
                .setAudioAttributes(AudioAttributes.DEFAULT, /* handleAudioFocus= */ true)
                .build()

        forwardingPlayer = BccmForwardingPlayer(this)
    }

    fun getExoPlayer(): ExoPlayer {
        return exoPlayer;
    }

    fun getPlayer(): Player {
        return forwardingPlayer;
    }

    fun takeOwnership(pvWrapper: BccmPlayerViewWrapper) {
        val previousPvWrapper = currentPlayerViewWrapper;
        currentPlayerViewWrapper = pvWrapper;
        val playerView = pvWrapper.getPlayerView() ?: throw Error("pvWrapper.getPlayerView() was null");
        val currentPlayerView = previousPvWrapper?.getPlayerView();
        if (currentPlayerView != null) {
            PlayerView.switchTargetView(getPlayer(), currentPlayerView, playerView)
        } else {
            playerView.player = getPlayer()
        }
        //previousPvWrapper?.dispose()
        /*if (previousPvWrapper?.isFullscreenPlayer() == true) {
            previousPvWrapper.dispose()
        }*/

        pvWrapper.onDispose = {
            if (pvWrapper.isFullscreenPlayer()) {
                previousPvWrapper?.run {
                    //takeOwnership(previousPvWrapper)
                    this.setup()
                };
            } else {
                currentPlayerViewWrapper = null
            }
        }
    }

    fun playWithUrl(url: String, isLive: Boolean = false) {
        this.isLive = isLive;
        val mediaItem: MediaItem = MediaItem.Builder()
                .setUri(url)
                .setMimeType(MimeTypes.APPLICATION_M3U8)
                .build()
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
        exoPlayer.play()
    }

    fun release() {
        exoPlayer.release()
    }
}