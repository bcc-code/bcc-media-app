package com.example.my_app

import android.R
import android.content.pm.ActivityInfo
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.FrameLayout
import androidx.annotation.NonNull
import com.google.android.exoplayer2.ExoPlayer
import com.google.android.exoplayer2.MediaItem
import com.google.android.exoplayer2.ui.StyledPlayerView
import com.google.android.exoplayer2.util.MimeTypes
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val _channel = "app.bcc.media/player"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
                .platformViewsController
                .registry
                .registerViewFactory("bccm-player", NativeViewFactory())
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, _channel).setMethodCallHandler {
            call, result ->
            if (call.method == "open") {

                requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                val args = call.arguments as HashMap<String, String>
                val player: ExoPlayer = io.flutter.plugins.videoplayer.VideoPlayerPlugin.videoPlayers[0].exoPlayer
                if (player == null) {
                    ExoPlayer.Builder(context).build()
                    val url = args["url"]!!;
                    val mediaItem: MediaItem = MediaItem.Builder()
                            .setUri(url)
                            .setMimeType(MimeTypes.APPLICATION_M3U8)
                            .build()
                    player.setMediaItem(mediaItem)
                    player.prepare()
                    player.play()
                }

                val rootLayout: FrameLayout = this.window.decorView.findViewById<View>(R.id.content) as FrameLayout
                var playerView = StyledPlayerView(context)
                playerView.player = player
                rootLayout.addView(playerView)
                val exitBtn = Button(this)
                exitBtn.text = "Exit"

                exitBtn.layoutParams = ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
                exitBtn.setOnClickListener {
                    requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
                    rootLayout.removeView(playerView)
                }
                playerView.addView(exitBtn)
            } else {
                result.notImplemented()
            }
        }
    }
}
