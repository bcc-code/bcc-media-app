package media.bcc.bccm_player

import android.app.Activity
import android.content.Context
import android.content.pm.ActivityInfo
import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout
import android.widget.ProgressBar
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import androidx.media3.common.*
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


class PlayerPlatformViewFactory(private val activity: Activity, private val playbackService: PlaybackService?) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        if (playbackService == null) {
            throw Error("PlaybackService is null, but you tried making a platformview.");
        }

        val creationParams = args as Map<String?, Any?>?
        return BccmPlayerViewWrapper(activity, playbackService, context!!, creationParams?.get("player_id") as String)
    }
}

class BccmPlayerViewWrapper(
        private val activity: Activity,
        private val playbackService: PlaybackService,
        private val context: Context,
        private var playerId: String,
        private val fullscreen: Boolean = false) : PlatformView {
    private var playerController: BccmPlayerController? = null
    private val _v: View = LayoutInflater.from(context).inflate(R.layout.btvplayer_view, null)
    private var _playerView: PlayerView? = null
    internal var onDispose: () -> Unit = {}

    init {
        setupPlayerView()
    }

    override fun getView(): View {
        return _v
    }

    override fun dispose() {
        onDispose()
        playerController = null
    }

    fun isFullscreenPlayer(): Boolean {
        return fullscreen
    }

    fun getPlayerView(): PlayerView? {
        return _playerView;
    }

    private fun setupPlayerView() {
        playerController = playbackService.playerControllers.find {
            it.id == playerId
        }

        if (playerController == null) {
            throw Error("Player $playerId does not exist. Create it with PlaybackService.newPlayer()")
        }

        val playerView = _v.findViewById<PlayerView>(R.id.brunstad_player)
                .also { _playerView = it };
        val rootLayout: FrameLayout = activity.window.decorView.findViewById<View>(android.R.id.content) as FrameLayout

        playerView.setFullscreenButtonClickListener {
            if (!fullscreen) {
                activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                val fullScreenPlayer = BccmPlayerViewWrapper(activity, playbackService, context, playerId, true)
                rootLayout.addView(fullScreenPlayer.view)
            } else {
                activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED
                rootLayout.removeView(view)
                dispose()
            }
        }

        val busyIndicator = _v.findViewById<ProgressBar>(R.id.busyIndicator);
        playerController!!.getExoPlayer().addListener(object : Player.Listener {
            override fun onPlaybackStateChanged(playbackState: Int) {
                /*if(player!!.isCurrentMediaItemLive) {
                    playerView.findViewById<LinearLayout>(R.id.progress).visibility = View.GONE;
                    playerView.findViewById<LinearLayout>(R.id.forward_panel).visibility = View.GONE;
                    playerView.findViewById<LinearLayout>(R.id.rewind_panel).visibility = View.GONE;
                    playerView.findViewById<LinearLayout>(R.id.live_indicator).visibility = View.VISIBLE;
                } else {
                    playerView.findViewById<LinearLayout>(R.id.progress).visibility = View.VISIBLE;
                    playerView.findViewById<LinearLayout>(R.id.forward_panel).visibility = View.VISIBLE;
                    playerView.findViewById<LinearLayout>(R.id.rewind_panel).visibility = View.VISIBLE;
                    playerView.findViewById<LinearLayout>(R.id.live_indicator).visibility = View.GONE;
                }*/

                if (playbackState == Player.STATE_READY) {
                    busyIndicator?.visibility = View.GONE;
                }
            }
        })

        playerController!!.takeOwnership(this)
    }
}