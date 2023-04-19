package media.bcc.bccm_player.views

import android.app.Activity
import android.app.PictureInPictureParams
import android.content.pm.ActivityInfo
import android.os.Build
import android.util.Log
import android.util.Rational
import android.view.LayoutInflater
import android.view.View
import android.widget.ImageButton
import android.widget.LinearLayout
import androidx.annotation.RequiresApi
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsCompat
import androidx.core.view.WindowInsetsControllerCompat
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.ui.PlayerView
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.filterIsInstance
import media.bcc.bccm_player.BccmPlayerPluginSingleton
import media.bcc.bccm_player.players.exoplayer.ExoPlayerController
import media.bcc.bccm_player.OnActivityStop
import media.bcc.bccm_player.PictureInPictureModeChangedEvent2
import media.bcc.bccm_player.R
import media.bcc.bccm_player.players.exoplayer.ExoPlayerView
import media.bcc.bccm_player.utils.SwipeTouchListener

class FullscreenPlayerView(
    val activity: Activity,
    val playerController: ExoPlayerController,
    private val forceLandscape: Boolean = true
) : LinearLayout(activity), ExoPlayerView {
    var playerView: PlayerView?
    val mainScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    var isInPip: Boolean = false
    val orientationBeforeGoingFullscreen = activity.requestedOrientation
    var onExitListener: (() -> Unit)? = null

    init {
        makeActivityFullscreen(forceLandscape)
        LayoutInflater.from(context).inflate(R.layout.player_fullscreen_view, this, true)
        playerView = this.findViewById<PlayerView>(R.id.brunstad_player)
        playerView?.let {
            playerController.takeOwnership(it, this)
        }

        playerView?.videoSurfaceView?.setOnTouchListener(
            SwipeTouchListener(
                activity.window.decorView.height * 0.3,
                object : SwipeTouchListener.Listener {
                    override fun onTopToBottomSwipe() {
                        exit()
                    }
                })
        )

        playerView?.setFullscreenButtonClickListener {
            exit()
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val pipButton = findViewById<ImageButton>(R.id.pip_button)
            pipButton.visibility = View.VISIBLE
            pipButton.setOnClickListener {
                enterPictureInPicture()
            }
        }

        // Live ui
        setLiveUIEnabled(playerController.isLive)
        playerController.player.addListener(object : Player.Listener {
            private lateinit var player: Player
            override fun onEvents(player: Player, events: Player.Events) {
                this.player = player
            }

            override fun onIsPlayingChanged(isPlaying: Boolean) {
                Log.d("bccm", "fullscreenplayer playerView?.keepScreenOn = $isPlaying")
                playerView?.keepScreenOn = isPlaying
            }

            override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
                setLiveUIEnabled(playerController.isLive)
            }

            override fun onPlaybackStateChanged(playbackState: Int) {
                setLiveUIEnabled(playerController.isLive)
                val playerView = this@FullscreenPlayerView.playerView
                playerView?.setShowNextButton(false)
                playerView?.setShowPreviousButton(false)
            }
        })

        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.filterIsInstance<PictureInPictureModeChangedEvent2>()
                .collect { event ->
                    isInPip = event.isInPictureInPictureMode
                    Log.d("bccm", "PictureInPictureModeChangedEvent2, isInPiP: $isInPip")
                    if (!event.isInPictureInPictureMode) {
                        delay(500)
                        makeActivityFullscreen(true)
                    }
                }
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.filterIsInstance<OnActivityStop>().collect { event ->
                Log.d("bccm", "OnActivityStop and isInPiP: $isInPip")
                playerController.player.stop()
            }
        }
    }

    override fun shouldPipAutomatically(): Boolean {
        return true
    }

    private fun makeActivityFullscreen(forceLandscape: Boolean) {
        if (forceLandscape) {
            activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_USER_LANDSCAPE
        }
        WindowCompat.setDecorFitsSystemWindows(activity.window, false)
        WindowInsetsControllerCompat(activity.window, this@FullscreenPlayerView).let { controller ->
            controller.hide(WindowInsetsCompat.Type.systemBars())
            controller.systemBarsBehavior =
                WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
        }
    }

    fun exit() {
        activity.requestedOrientation = orientationBeforeGoingFullscreen
        WindowCompat.setDecorFitsSystemWindows(activity.window, true)
        WindowInsetsControllerCompat(
            activity.window,
            this
        ).show(WindowInsetsCompat.Type.systemBars())
        onExitListener?.let { listener -> listener() }
        release()
    }

    fun setLiveUIEnabled(enabled: Boolean) {
        val playerView = playerView ?: return
        if (enabled) {
            playerView.setShowFastForwardButton(false)
            playerView.setShowRewindButton(false)
            playerView.setShowMultiWindowTimeBar(false)
            playerView.findViewById<View?>(R.id.exo_progress)?.visibility = View.GONE
            playerView.findViewById<View?>(R.id.exo_time)?.visibility = View.GONE
            findViewById<View?>(R.id.live_indicator)?.visibility = View.VISIBLE
        } else {
            playerView.setShowFastForwardButton(true)
            playerView.setShowRewindButton(true)
            playerView.setShowMultiWindowTimeBar(true)
            playerView.findViewById<View?>(R.id.exo_progress)?.visibility = View.VISIBLE
            playerView.findViewById<View?>(R.id.exo_time)?.visibility = View.VISIBLE
            findViewById<View?>(R.id.live_indicator)?.visibility = View.GONE
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    override fun enterPictureInPicture() {
        Log.d("Bccm", "enterPictureInPicture fullscreenplayerView")

        val aspectRatio = playerController.player.let {
            if (it.videoSize.width == 0 || it.videoSize.height == 0) null
            else Rational(it.videoSize.width, it.videoSize.height)
        } ?: Rational(16, 9)

        activity.enterPictureInPictureMode(
            PictureInPictureParams.Builder()
                .setAspectRatio(aspectRatio)
                .build()
        )
        playerView?.hideController()
    }

    private fun release() {
        playerView?.let {
            playerController.releasePlayerView(it)
        }
        mainScope.cancel()
        playerView = null
    }
}