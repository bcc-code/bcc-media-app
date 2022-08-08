package com.example.my_app

import android.content.Context
import android.content.pm.ActivityInfo
import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout
import android.widget.ImageButton
import android.widget.LinearLayout
import android.widget.ProgressBar
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import androidx.core.content.ContextCompat
import com.google.android.exoplayer2.ExoPlayer
import com.google.android.exoplayer2.MediaItem
import com.google.android.exoplayer2.Player
import com.google.android.exoplayer2.Player.Listener
import com.google.android.exoplayer2.ui.DefaultTimeBar
import com.google.android.exoplayer2.ui.StyledPlayerView
import com.google.android.exoplayer2.util.MimeTypes
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


internal class NativeViewFactory(private val activity: MainActivity) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return BccmPlayer(activity, context!!, creationParams?.get("url") as String?)
    }
}

internal class BccmPlayer(private val activity: MainActivity, context: Context, var url: String?, val fullscreen: Boolean = false, var originalView: StyledPlayerView? = null) : PlatformView {
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
        if (url == null) {
            url = "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8"
        }

        val playerIsReusable = player != null && player!!.currentMediaItem?.localConfiguration?.uri.toString() == url;

        if (!playerIsReusable) {
            player?.release()
            player = ExoPlayer.Builder(context).build()
            val mediaItem: MediaItem = MediaItem.Builder()
                    .setUri(url)
                    .setMimeType(MimeTypes.APPLICATION_M3U8)
                    .build()
            player!!.setMediaItem(mediaItem)
            player!!.prepare()
            player!!.play()
        }
        //_v = StyledPlayerView(context);
        _v = LayoutInflater.from(context).inflate(R.layout.btvplayer_view, null);
        val playerView = _v.findViewById<StyledPlayerView>(R.id.brunstad_player);
        val fullscreenButton = playerView.findViewById<ImageButton>(R.id.fullscreen_button);
        if (fullscreen) {
            fullscreenButton.setImageDrawable(ContextCompat.getDrawable(context, R.drawable.icon_fullscreen_off))
        }

        val rootLayout: FrameLayout = activity.window.decorView.findViewById<View>(android.R.id.content) as FrameLayout
        fullscreenButton.setOnClickListener {
            if (!fullscreen) {
                activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                val fullScreenPlayer = BccmPlayer(activity, context, url, true, playerView)
                rootLayout.addView(fullScreenPlayer.view)
                StyledPlayerView.switchTargetView(player!!, playerView, fullScreenPlayer.view.findViewById(R.id.brunstad_player))
            } else {
                activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
                rootLayout.removeView(view)
                StyledPlayerView.switchTargetView(player!!, playerView, originalView)
                dispose()
            }
        }

        val busyIndicator = _v.findViewById<ProgressBar>(R.id.busyIndicator);
        player!!.addListener(object : Listener {
            override fun onPlaybackStateChanged(playbackState: Int) {
                if(player!!.isCurrentMediaItemLive) {
                    playerView.findViewById<LinearLayout>(R.id.progress).visibility = View.GONE;
                    playerView.findViewById<LinearLayout>(R.id.forward_panel).visibility = View.GONE;
                    playerView.findViewById<LinearLayout>(R.id.rewind_panel).visibility = View.GONE;
                    playerView.findViewById<LinearLayout>(R.id.live_indicator).visibility = View.VISIBLE;
                } else {
                    playerView.findViewById<LinearLayout>(R.id.progress).visibility = View.VISIBLE;
                    playerView.findViewById<LinearLayout>(R.id.forward_panel).visibility = View.VISIBLE;
                    playerView.findViewById<LinearLayout>(R.id.rewind_panel).visibility = View.VISIBLE;
                    playerView.findViewById<LinearLayout>(R.id.live_indicator).visibility = View.GONE;
                }

                if (playbackState == Player.STATE_READY) {
                    busyIndicator?.visibility = View.GONE;
                }
            }
        })

        val settingsButton = playerView.findViewById<ImageButton>(R.id.exo_settings);
        settingsButton.setOnClickListener {

        }


        playerView.player = player
    }
}