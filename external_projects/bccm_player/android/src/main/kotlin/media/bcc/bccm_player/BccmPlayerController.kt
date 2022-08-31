package media.bcc.bccm_player

import android.content.Context
import androidx.media3.common.*
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.ui.PlayerView
import com.google.android.gms.cast.framework.CastContext
import java.util.*

class BccmPlayerController(private val context: Context): PlayerManager.Listener {
    private var playerManager: PlayerManager? = null
    private var castContext: CastContext? = null
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
        try {
            castContext = CastContext.getSharedInstance(context);
        } catch (e: Exception) { }
        playerManager = PlayerManager(context, this, getPlayer(), castContext)
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

        playerManager?.setPlayerView(playerView);
        /*if (currentPlayerView != null) {
            PlayerView.switchTargetView(getPlayer(), currentPlayerView, playerView)
        } else {
            playerView.player = getPlayer()
        }

        pvWrapper.onDispose = {
            if (pvWrapper.isFullscreenPlayer()) {
                previousPvWrapper?.run {
                    //takeOwnership(previousPvWrapper)
                    this.setup()
                };
            } else {
                currentPlayerViewWrapper = null
            }
        }*/

    }

    fun playWithUrl(url: String, isLive: Boolean = false) {
        this.isLive = isLive;
        val mediaItem: MediaItem = MediaItem.Builder()
                .setUri(url)
                .setMimeType(MimeTypes.APPLICATION_M3U8)
                .build()

        playerManager?.addItem(mediaItem);
        /*exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
        exoPlayer.play()*/
    }

    fun release() {
        exoPlayer.release()
    }



    override fun onQueuePositionChanged(previousIndex: Int, newIndex: Int) {
        if (previousIndex != C.INDEX_UNSET) {

        }
        if (newIndex != C.INDEX_UNSET) {

        }
    }

    override fun onUnsupportedTrack(trackType: Int) {
        if (trackType == C.TRACK_TYPE_AUDIO) {

        } else if (trackType == C.TRACK_TYPE_VIDEO) {

        }
    }
}