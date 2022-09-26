package media.bcc.bccm_player

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.widget.*
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import androidx.media3.common.ForwardingPlayer
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.util.DebugTextViewHelper
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.filter


class PlayerPlatformViewFactory(private val activity: Activity, private val playbackService: PlaybackService?) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        if (playbackService == null) {
            throw Error("PlaybackService is null, but you tried making a platformview.")
        }

        val creationParams = args as Map<String?, Any?>?
        return BccmPlayerViewWrapper(activity, playbackService, context!!, creationParams?.get("player_id") as String, id)
    }
}

class BccmPlayerViewWrapper(
        private val activity: Activity,
        private val playbackService: PlaybackService,
        private val context: Context,
        private var playerId: String,
        private val flutterViewId: Int) : PlatformView {
    private var playerController: ExoPlayerController? = null
    private val _v: LinearLayout = LinearLayout(context)
    private var _playerView: PlayerView? = null
    private val ioScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private var fullscreenListener: Job? = null
    private var setupDone = false;

    init {
        setup()
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
    }

    fun getPlayerView(): PlayerView? {
        return _playerView
    }

    private fun setup() {
        if (_playerView?.player != null) {
            return;
        }
        _v.removeAllViews()
        LayoutInflater.from(context).inflate(R.layout.btvplayer_view, _v, true)
        playerController = playbackService.getController(playerId) as ExoPlayerController

        if (playerController == null) {
            throw Error("Player $playerId does not exist. Create it with PlaybackService.newPlayer()")
        }

        val playerView = _v.findViewById<PlayerView>(R.id.brunstad_player)
                .also { _playerView = it }

        playerView.setFullscreenButtonClickListener {
            goFullscreen(false)
            //_v.removeAllViews()
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val pipButton = _v.findViewById<ImageButton>(R.id.pip_button)
            pipButton.visibility = View.VISIBLE
            pipButton.setOnClickListener {
                goFullscreen(true)
            }
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

        val debugTextView = _v.findViewById<TextView>(R.id.debug_text_view)
        val debugHelper = DebugTextViewHelper((playerController!!.player as ForwardingPlayer).wrappedPlayer as ExoPlayer, debugTextView)
        debugHelper.start()
        debugTextView.visibility = View.VISIBLE

        playerController!!.takeOwnership(playerView)
        setLiveUIEnabled(playerController?.isLive == true)
        setupDone = true;
    }

    fun setLiveUIEnabled(enabled: Boolean) {
        val playerView = _v.findViewById<PlayerView>(R.id.brunstad_player) ?: return
        if (playerController?.isLive == true) {
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

    private fun goFullscreen(startInPictureInPicture: Boolean) {
        val newIntent = Intent(activity, FullscreenPlayer::class.java)
        newIntent.putExtra("options", FullscreenPlayer.Options(playerId, startInPictureInPicture))
        activity.startActivityForResult(newIntent, 1)
        activity.overridePendingTransition(R.anim.dev2, R.anim.dev2)
        addFullscreenListener()
        resetPlayerView();
    }

    private fun addFullscreenListener() {
        if (fullscreenListener != null) {
            return;
        }
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