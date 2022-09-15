package media.bcc.bccm_player

import android.content.Context
import androidx.media3.common.AudioAttributes
import androidx.media3.common.C
import androidx.media3.common.ForwardingPlayer
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import com.google.android.gms.cast.framework.CastContext
import com.npaw.youbora.lib6.exoplayer2.Exoplayer2Adapter
import com.npaw.youbora.lib6.plugin.Options
import com.npaw.youbora.lib6.plugin.Plugin
import java.util.*

class ExoPlayerController(private val context: Context) : PlayerController(), PlayerManager.Listener {
    private var playerManager: PlayerManager? = null
    private var castContext: CastContext? = null
    override val id: String = UUID.randomUUID().toString()
    private val exoPlayer: ExoPlayer = ExoPlayer.Builder(context)
            .setAudioAttributes(AudioAttributes.DEFAULT, true)
            .build()
    override val player: ForwardingPlayer
    private var currentPlayerViewWrapper: BccmPlayerViewWrapper? = null
    var isLive: Boolean = false
        private set

    init {/*
        val df = DefaultRenderersFactory(context).also {
            it.experimentalSetSynchronizeCodecInteractionsWithQueueingEnabled(true);
            it.forceEnableMediaCodecAsynchronousQueueing();
        };*/

        player = BccmForwardingPlayer(this)
        try {
            castContext = CastContext.getSharedInstance(context);
        } catch (e: Exception) {
        }

        val youboraOptions = Options()
        youboraOptions.accountCode = ""
        val youboraPlugin = Plugin(youboraOptions, context)
        val adapter = Exoplayer2Adapter(exoPlayer);
        // Here you would set the BandwidthMeter & CustomEventLogger
        youboraPlugin.adapter = adapter;

        //playerManager = PlayerManager(context, this, getPlayer(), castContext)
    }

    fun getExoPlayer(): ExoPlayer {
        return exoPlayer;
    }

    fun takeOwnership(pvWrapper: BccmPlayerViewWrapper) {
        val previousPvWrapper = currentPlayerViewWrapper;
        currentPlayerViewWrapper = pvWrapper;
        val playerView = pvWrapper.getPlayerView()
                ?: throw Error("pvWrapper.getPlayerView() was null");
        val currentPlayerView = previousPvWrapper?.getPlayerView();


        playerView.player = player

        //playerManager?.setPlayerView(playerView);
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

    override fun release() {
        exoPlayer.release()
    }

    override fun onPositionDiscontinuity(oldPosition: Player.PositionInfo, newPosition: Player.PositionInfo, reason: Int) {

    }

    override fun onIsPlayingChanged(isPlaying: Boolean) {

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