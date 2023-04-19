package media.bcc.bccm_player

import android.content.Context
import android.os.Build
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.ProgressBar
import android.widget.TextView
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import androidx.media3.common.Player
import androidx.media3.exoplayer.util.DebugTextViewHelper
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import io.flutter.util.ViewUtils.getActivity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel


class PlayerPlatformViewFactory(private val playbackService: PlaybackService?) :
        PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        if (playbackService == null) {
            throw Error("PlaybackService is null, but you tried making a platformview.")
        }

        val creationParams = args as Map<String?, Any?>?
        return BccmInlinePlayerView(
                playbackService,
                context!!,
                creationParams?.get("player_id") as String,
                id
        )
    }
}

class BccmInlinePlayerView(
        private val playbackService: PlaybackService,
        private val context: Context,
        private var playerId: String,
        private val flutterViewId: Int
) : PlatformView, BccmPlayerViewController {
    private var playerController: ExoPlayerController? = null
    private val _v: LinearLayout = LinearLayout(context)
    private var _playerView: PlayerView? = null
    private val ioScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private var fullscreenListener: Job? = null
    private var setupDone = false

    init {
        setup()
    }

    override fun getView(): View {
        return _v
    }

    override fun dispose() {
        Log.d("bccm", "Disposing a playerview for playerId: $playerId")
        this._playerView?.let { playerController?.releasePlayerView(it) }
        playerController = null
        _playerView = null
        ioScope.cancel()
    }

    fun getPlayerView(): PlayerView? {
        return _playerView
    }

    private fun setup() {
        if (_playerView?.player != null) {
            return
        }
        _v.removeAllViews()
        LayoutInflater.from(context).inflate(R.layout.player_view, _v, true)
        playerController = playbackService.getController(playerId) as ExoPlayerController

        if (playerController == null) {
            throw Error("Player $playerId does not exist. Create it with PlaybackService.newPlayer()")
        }

        val playerView = _v.findViewById<PlayerView>(R.id.brunstad_player)
                .also { _playerView = it }

        playerView.setFullscreenButtonClickListener {
            goFullscreen()
            //_v.removeAllViews()
        }

        val busyIndicator = _v.findViewById<ProgressBar>(R.id.busyIndicator)
        playerController!!.player.addListener(object : Player.Listener {
            private lateinit var player: Player
            override fun onEvents(player: Player, events: Player.Events) {
                this.player = player
            }

            override fun onPlaybackStateChanged(playbackState: Int) {
                setLiveUIEnabled(playerController?.isLive == true)
                playerView.setShowNextButton(false)
                playerView.setShowPreviousButton(false)

                if (playbackState == Player.STATE_READY) {
                    busyIndicator?.visibility = View.GONE
                }
            }
        })

        val enableDebugView = false
        if (enableDebugView) {
            val debugTextView = _v.findViewById<TextView>(R.id.debug_text_view)
            val debugHelper = DebugTextViewHelper(playerController!!.getExoPlayer(), debugTextView)
            debugHelper.start()
            debugTextView.visibility = View.VISIBLE
        }

        playerController!!.takeOwnership(playerView, this)
        setLiveUIEnabled(playerController?.isLive == true)
        setupDone = true
    }

    fun setLiveUIEnabled(enabled: Boolean) {
        val playerView = _v.findViewById<PlayerView>(R.id.brunstad_player) ?: return
        if (enabled) {
            playerView.setShowFastForwardButton(false)
            playerView.setShowRewindButton(false)
            playerView.setShowMultiWindowTimeBar(false)
            playerView.findViewById<View?>(R.id.exo_progress)?.visibility = View.GONE
            playerView.findViewById<View?>(R.id.exo_time)?.visibility = View.GONE
            _v.findViewById<View?>(R.id.live_indicator)?.visibility = View.VISIBLE
        } else {
            playerView.setShowFastForwardButton(true)
            playerView.setShowRewindButton(true)
            playerView.setShowMultiWindowTimeBar(true)
            playerView.findViewById<View?>(R.id.exo_progress)?.visibility = View.VISIBLE
            playerView.findViewById<View?>(R.id.exo_time)?.visibility = View.VISIBLE
            _v.findViewById<View?>(R.id.live_indicator)?.visibility = View.GONE
        }
    }

    private fun goFullscreen(startInPip: Boolean = false) {
        val activity = getActivity(context) ?: return
        val rootLayout: FrameLayout =
                activity.window.decorView.findViewById<View>(android.R.id.content) as FrameLayout

        playerController?.let { playerController ->
            val fullScreenPlayer = FullscreenPlayerView(activity, playerController, !startInPip)
            rootLayout.addView(fullScreenPlayer)
            fullScreenPlayer.onExitListener = {
                setup()
                rootLayout.removeView(fullScreenPlayer)
            }

            if (startInPip && Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                fullScreenPlayer.enterPictureInPicture()
            }
        }
        resetPlayerView()
    }


    private fun resetPlayerView() {
        _playerView = null
        playerController = null
        _v.removeAllViews()
        setupDone = false
    }

    override fun shouldPipAutomatically(): Boolean {
        return playerController?.player?.isPlaying ?: false
    }

    override fun enterPictureInPicture() {
        goFullscreen(true)
    }
}