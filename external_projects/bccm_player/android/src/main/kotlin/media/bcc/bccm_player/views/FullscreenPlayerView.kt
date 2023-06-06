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
import androidx.lifecycle.Lifecycle
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.ui.PlayerView
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.filterIsInstance
import media.bcc.bccm_player.BccmPlayerPluginSingleton
import media.bcc.bccm_player.PictureInPictureModeChangedEvent2
import media.bcc.bccm_player.R
import media.bcc.bccm_player.players.exoplayer.BccmPlayerViewController
import media.bcc.bccm_player.players.exoplayer.ExoPlayerController
import media.bcc.bccm_player.utils.SwipeTouchListener

class FullscreenPlayerView(
    val activity: Activity,
    val playerController: ExoPlayerController,
    forceLandscape: Boolean = true
) : LinearLayout(activity), BccmPlayerViewController {
    var playerView: PlayerView?
    val mainScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    var isInPip: Boolean = false
    val orientationBeforeGoingFullscreen = activity.requestedOrientation
    var onExitListener: (() -> Unit)? = null
    override val isFullscreen = true
    override val shouldPipAutomatically = true

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
            playerController.player.pause()
            exit()
        }

        val exitButton = findViewById<ImageButton>(R.id.bccm_exit)
        exitButton.setOnClickListener {
            playerController.player.pause()
            exit()
        }
        exitButton.visibility = View.VISIBLE

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

                    if (event.lifecycleState == Lifecycle.State.CREATED) {
                        playerController.player.stop()
                    }
                }
        }
    }

    override fun onOwnershipLost() {
        exit()
    }

    override fun exitFullscreen() {
        exit()
    }

    private fun makeActivityFullscreen(forceLandscape: Boolean) {
        if (forceLandscape) {
            activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_USER_LANDSCAPE
        }
        WindowCompat.setDecorFitsSystemWindows(activity.window, false)
        /* Using deprecated API because the newer API causes a bug on certain devices in fullscreen mode.
           i.e Navigation bar / Gesture pill & status bar shows up on first interaction with screen but does not go away after few seconds.
           Using same code used by flutter when `SystemUiMode.immersiveSticky` is used: https://github.com/flutter/engine/blob/main/shell/platform/android/io/flutter/plugin/platform/PlatformPlugin.java#L287
        */
        activity.window.decorView.setSystemUiVisibility(
            SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                    or SYSTEM_UI_FLAG_LAYOUT_STABLE
                    or SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                    or SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    or SYSTEM_UI_FLAG_HIDE_NAVIGATION
                    or SYSTEM_UI_FLAG_FULLSCREEN
        );
    }

    fun exit() {
        activity.requestedOrientation = orientationBeforeGoingFullscreen;
        WindowCompat.setDecorFitsSystemWindows(activity.window, true)
        /* Using same code used by flutter when `SystemUiMode.edgeToEdge` is used: https://github.com/flutter/engine/blob/main/shell/platform/android/io/flutter/plugin/platform/PlatformPlugin.java#L302 */
        activity.window.decorView.setSystemUiVisibility(
            SYSTEM_UI_FLAG_LAYOUT_STABLE
                    or SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                    or SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
        );
        onExitListener?.let { listener -> listener() }
        release();
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