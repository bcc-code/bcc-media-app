package media.bcc.bccm_player

import android.app.Activity
import android.app.PictureInPictureParams
import android.content.Context
import android.os.Build
import android.util.Log
import android.util.Rational
import android.view.LayoutInflater
import android.view.View
import android.view.WindowManager
import android.widget.ImageButton
import android.widget.LinearLayout
import android.widget.ProgressBar
import androidx.annotation.RequiresApi
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsCompat
import androidx.core.view.WindowInsetsControllerCompat
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.ui.PlayerView
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.flow.filterIsInstance
import media.bcc.player.PlaybackPlatformApi


class FullscreenPlayerView(context: Context, val playerController: ExoPlayerController) : LinearLayout(context) {
    var playerView: PlayerView?
    val mainScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    var isInPip: Boolean = false;
    init {
        makeActivityFullscreen()
        LayoutInflater.from(context).inflate(R.layout.btvplayer_view, this, true)
        playerView = this.findViewById<PlayerView>(R.id.brunstad_player)
        playerView?.let {
            playerController.takeOwnership(it)
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

            override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
                setLiveUIEnabled(playerController.isLive)
            }

            override fun onPlaybackStateChanged(playbackState: Int) {
                setLiveUIEnabled(playerController.isLive)
                val playerView = this@FullscreenPlayerView.playerView;
                playerView?.setShowNextButton(false)
                playerView?.setShowPreviousButton(false)
            }
        })

        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.filterIsInstance<PictureInPictureModeChangedEvent2>().collect {
                event ->
                isInPip = event.isInPictureInPictureMode
                Log.d("bccm", "PictureInPictureModeChangedEvent2, isInPiP: $isInPip")
                if (!event.isInPictureInPictureMode) {
                    delay(500)
                    makeActivityFullscreen()
                }
            }
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.filterIsInstance<OnActivityStop>().collect {
                event ->
                Log.d("bccm", "OnActivityStop and isInPiP: $isInPip")
                playerController.player.stop()
            }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            mainScope.launch {
                BccmPlayerPluginSingleton.eventBus.filterIsInstance<UserLeaveHintEvent>().collect {
                    event ->
                    Log.d("bccm", "UserLeaveHintEvent and isInPiP: $isInPip")
                        enterPictureInPicture()
                }
            }
        }
    }
/*
    fun makeActivityFullscreen() {
        val activity = context as? Activity
        var flags = SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or SYSTEM_UI_FLAG_FULLSCREEN
        flags = flags or (SYSTEM_UI_FLAG_LAYOUT_STABLE or SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
                SYSTEM_UI_FLAG_HIDE_NAVIGATION or SYSTEM_UI_FLAG_IMMERSIVE_STICKY)
        activity?.window?.decorView?.systemUiVisibility = flags
    }

    fun exitFullscreen() {
        val activity = context as? Activity
        activity?.window?.decorView?.systemUiVisibility = SYSTEM_UI_FLAG_VISIBLE
    }*/
    private fun makeActivityFullscreen() {
        if (context !is Activity) return;
        val activity = context as Activity
        WindowCompat.setDecorFitsSystemWindows(activity.window, false)
        WindowInsetsControllerCompat(activity.window, this@FullscreenPlayerView).let { controller ->
            controller.hide(WindowInsetsCompat.Type.systemBars())
            controller.systemBarsBehavior = WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
        }
    }

    private fun exitFullscreen() {
        if (context !is Activity) return;
        val activity = context as Activity
        WindowCompat.setDecorFitsSystemWindows(activity.window, true)
        WindowInsetsControllerCompat(activity.window, this).show(WindowInsetsCompat.Type.systemBars())
    }

    fun setFullscreenButtonClickListener(listener: () -> Unit) {
        playerView?.setFullscreenButtonClickListener {
            listener()
            exitFullscreen()
        }
    }

    fun setLiveUIEnabled(enabled: Boolean) {
        val playerView = playerView ?: return;
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
    fun enterPictureInPicture() {
        if (context !is Activity) return;
        val activity = context as Activity
        Log.d("Bccm", "enterPictureInPicture fullscreenplayerView")

        val aspectRatio = playerController.player.let {
            if (it.videoSize.width == 0 || it.videoSize.height == 0) null
            else Rational(it.videoSize.width, it.videoSize.height)
        } ?: Rational(16, 9)

        activity.enterPictureInPictureMode(PictureInPictureParams.Builder()
                .setAspectRatio(aspectRatio)
                .build())
        playerView?.hideController()
    }

    fun release() {
        playerView?.let {
            playerController.releasePlayerView(it)
        }
        mainScope.cancel()
        playerView = null
    }
}

// ...

// ...
/*
class FullscreenPlayerView() : DialogFragment() {
    var playerView: PlayerView? = null
    private val ioScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private val options: Options? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setStyle(DialogFragment.STYLE_NORMAL,
                android.R.style.Theme_Black);
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.btvplayer_view, container)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        playerView = view.findViewById<PlayerView>(R.id.brunstad_player)
        playerView?.let {
            playerController?.takeOwnership(it)
        }
        playerView?.setFullscreenButtonClickListener {
            //onDone()
            ioScope.launch {
                if (options?.playerId == null) {
                    return@launch;
                }
                BccmPlayerPluginSingleton.eventBus.emit(FullscreenPlayerResult(options!!.playerId!!))
            }
            dismiss()
        };
    }

    override fun onDestroyView() {
        playerView?.let {
            playerController?.releasePlayerView(it)
        }
        super.onDestroyView()
    }


    companion object {

        @Parcelize
        data class Options(
                */
/** **Note:** Primary if null **//*
 val playerId: String?,
                val startInPictureInPicture: Boolean = false
        ) : Parcelable

        fun newInstance(playerController: ExoPlayerController, options: Options): FullscreenPlayerView {
            val frag = FullscreenPlayerView()
            frag.playerController = playerController
            val args = Bundle()
            args.putParcelable("options", options)
            frag.arguments = args
            return frag
        }
    }
}*/
