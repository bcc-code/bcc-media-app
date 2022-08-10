package media.bcc.bccm_player

import android.content.Context
import android.content.pm.ActivityInfo
import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout
import android.widget.ProgressBar
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import androidx.media3.exoplayer.*
import androidx.media3.common.*
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import java.lang.Long.max
import java.lang.Long.min


class PlayerPlatformViewFactory(private val activity: MainActivity) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return BccmPlayerView(activity, context!!, creationParams?.get("player_id") as String)
    }
}

class BccmPlayerView(private val activity: MainActivity, context: Context, var playerId: String, val fullscreen: Boolean = false, var originalView: PlayerView? = null) : PlatformView {
    companion object {
        var player: ExoPlayer? = null
    }
    private val _v: View
    override fun getView(): View {
        return _v
    }

    override fun dispose() {
    }

    init {
        player = activity.playbackService.playerControllers.find {
            it.id == playerId
        }!!.exoPlayer

        _v = LayoutInflater.from(context).inflate(R.layout.btvplayer_view, null);
        val playerView = _v.findViewById<PlayerView>(R.id.brunstad_player);
        val rootLayout: FrameLayout = activity.window.decorView.findViewById<View>(android.R.id.content) as FrameLayout

        playerView.setFullscreenButtonClickListener {
            if (!fullscreen) {
                activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                val fullScreenPlayer = BccmPlayerView(activity, context, playerId, true, playerView)
                rootLayout.addView(fullScreenPlayer.view)
                PlayerView.switchTargetView(player!!, playerView, fullScreenPlayer.view.findViewById(R.id.brunstad_player))
            } else {
                activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
                rootLayout.removeView(view)
                PlayerView.switchTargetView(player!!, playerView, originalView)
                dispose()
            }
        }

        val busyIndicator = _v.findViewById<ProgressBar>(R.id.busyIndicator);
        player!!.addListener(object : Player.Listener {
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
/*

        val settingsButton = playerView.findViewById<ImageButton>(R.id.exo_settings);
        settingsButton.setOnClickListener {

        }
*/


        val forwardingPlayer: ForwardingPlayer = object : ForwardingPlayer(player!!) {


            private var seekBackIncrement: Long = 15000

            private var seekForwardIncrement: Long = 15000

            override fun getSeekBackIncrement(): Long {
                return seekBackIncrement
            }

            override fun seekBack() {
                seekToOffset(-seekBackIncrement)
            }

            override fun getSeekForwardIncrement(): Long {
                return seekForwardIncrement
            }

            override fun seekForward() {
                seekToOffset(seekForwardIncrement)
            }

            private fun seekToOffset(offsetMs: Long) {
                var positionMs = currentPosition + offsetMs
                val durationMs = duration
                if (durationMs != C.TIME_UNSET) {
                    positionMs = min(positionMs, durationMs)
                }
                positionMs = max(positionMs, 0)
                seekTo(positionMs)
            }
        }
        playerView.player = forwardingPlayer
    }
}