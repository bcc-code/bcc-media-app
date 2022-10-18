package media.bcc.bccm_player

import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.widget.*
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import androidx.media3.common.Player
import androidx.media3.exoplayer.util.DebugTextViewHelper
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import io.flutter.util.ViewUtils.getActivity
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.flow.filterIsInstance


class PlayerPlatformViewFactory(private val playbackService: PlaybackService?) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        if (playbackService == null) {
            throw Error("PlaybackService is null, but you tried making a platformview.")
        }

        val creationParams = args as Map<String?, Any?>?
        return BccmPlayerViewWrapper(playbackService, context!!, creationParams?.get("player_id") as String, id)
    }
}

class BccmPlayerViewWrapper(
        private val playbackService: PlaybackService,
        private val context: Context,
        private var playerId: String,
        private val flutterViewId: Int) : PlatformView {
    private var playerController: ExoPlayerController? = null
    private val _v: LinearLayout = LinearLayout(context)
    private var _playerView: PlayerView? = null
    private val ioScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private val mainScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    private var fullscreenListener: Job? = null
    private var setupDone = false;

    init {
        setup()

        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.filterIsInstance<SetPlayerViewVisibilityEvent>().filter { it.viewId == flutterViewId.toLong() }.collect {
                event ->
                Log.d("bccm", "TestEvent, playerView?.visibility: ${_playerView?.visibility}")
                _playerView?.visibility = if(event.visible) View.VISIBLE else View.GONE
            }
        }
    }

    override fun getView(): View {
        return _v
    }

    override fun dispose() {
        Log.d("bccm", "Disposing a playerview for playerId: $playerId")
        this._playerView?.let {playerController?.releasePlayerView(it)}
        playerController = null
        _playerView = null
        ioScope.cancel()
        mainScope.cancel()
    }

    fun getPlayerView(): PlayerView? {
        return _playerView
    }

    private fun setup() {
        if (_playerView?.player != null) {
            return;
        }
        _v.setBackgroundColor(Color.RED)
        _v.removeAllViews()
        LayoutInflater.from(context).inflate(R.layout.btvplayer_view, _v, true)
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

        val enableDebugView = false;
        if (enableDebugView) {
            val debugTextView = _v.findViewById<TextView>(R.id.debug_text_view)
            val debugHelper = DebugTextViewHelper(playerController!!.getExoPlayer(), debugTextView)
            debugHelper.start()
            debugTextView.visibility = View.VISIBLE
        }

        playerController!!.takeOwnership(playerView)
        setLiveUIEnabled(playerController?.isLive == true)
        setupDone = true;
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

    private fun goFullscreenUsingActivity(startInPictureInPicture: Boolean) {
        val activity = getActivity(context) ?: return
        val newIntent = Intent(activity, FullscreenPlayerActivity::class.java)
        newIntent.putExtra("options", FullscreenPlayerActivity.Options(playerId, startInPictureInPicture))
        activity.startActivity(newIntent)
        activity.overridePendingTransition(R.anim.dev2, R.anim.dev2)
        addFullscreenListener()
        resetPlayerView();
    }

    private fun goFullscreen() {
        val activity = getActivity(context) ?: return
        val rootLayout: FrameLayout = activity.window.decorView.findViewById<View>(android.R.id.content) as FrameLayout
        //activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
        playerController?.let { playerController ->
            val fullScreenPlayer = FullscreenPlayerView(activity, playerController)
            rootLayout.addView(fullScreenPlayer)
            fullScreenPlayer.setFullscreenButtonClickListener {
                setup()
                fullScreenPlayer.release();
                rootLayout.removeView(fullScreenPlayer)
            }
        }

        addFullscreenListener()
        resetPlayerView();
    }

    private fun addFullscreenListener() {
        if (fullscreenListener != null) {
            return;
        }
        val activity = getActivity(context) ?: return
        fullscreenListener = ioScope.launch {
            BccmPlayerPluginSingleton.eventBus.filter { event -> event is FullscreenPlayerResult && event.playerId == playerId}.collect {
                event ->
                Log.d("bccm", "FullscreenPlayerResult");
                activity.runOnUiThread {
                    // Stuff that updates the UI
                    Log.d("bccm", "FullscreenPlayerResult ui thread");
                    setup()
                }
            }
        }
    }


    private fun resetPlayerView() {
        _playerView = null
        playerController = null
        _v.removeAllViews()
        val textView = TextView(context);
        textView.text = "Loading..."
        _v.addView(textView)
        setupDone = false
    }
}