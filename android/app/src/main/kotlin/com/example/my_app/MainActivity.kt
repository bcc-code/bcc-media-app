package com.example.my_app

import android.R
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.content.pm.ActivityInfo
import android.os.IBinder
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.FrameLayout
import androidx.annotation.NonNull
import androidx.media3.session.IMediaSessionService
import androidx.media3.session.MediaController
import androidx.media3.session.MediaSessionService
import androidx.media3.session.SessionToken
import com.google.common.util.concurrent.MoreExecutors
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val _channel = "app.bcc.media/player"

    lateinit var playbackService: PlaybackService
    private var mBound: Boolean = false

    private val connection = object : ServiceConnection {
        override fun onServiceConnected(className: ComponentName, binder: IBinder) {
            // We've bound to LocalService, cast the IBinder and get LocalService instance
            playbackService = (binder as PlaybackService.LocalBinder).getService()
            mBound = true
        }
        override fun onServiceDisconnected(arg0: ComponentName) {
            mBound = false
        }
    }


    override fun onStart() {
        super.onStart()
        // Bind to LocalService
        Intent(this, PlaybackService::class.java).also { intent ->
            bindService(intent, connection, Context.BIND_AUTO_CREATE)
        }

        val sessionToken = SessionToken(this, ComponentName(this, PlaybackService::class.java))
        val controllerFuture = MediaController.Builder(this, sessionToken).buildAsync()
        controllerFuture.addListener(
                { },
                MoreExecutors.directExecutor()
        )
    }

    override fun onStop() {
        super.onStop()
        unbindService(connection)
        mBound = false
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
                .platformViewsController
                .registry
                .registerViewFactory("bccm-player", NativeViewFactory(this))

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, _channel).setMethodCallHandler {
            call, result ->
            when (call.method) {
                "new_player" -> {
                    val args = call.arguments as HashMap<*, *>
                    val url = args["url"] as String;

                    val playerController = playbackService.newPlayer()
                    playerController.playWithUrl(url)
                    result.success(playerController.id)
                }
                "set_primary" -> {
                    val args = call.arguments as HashMap<*, *>
                    val playerId = args["player_id"] as String;

                    playbackService.setPrimary(playerId)
                    result.success(true)
                }
                "open" -> {

                    requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                    val args = call.arguments as HashMap<String, String>
                    val url = args["url"]!!;

                    val rootLayout: FrameLayout = this.window.decorView.findViewById<View>(R.id.content) as FrameLayout
                    val bccmPlayerView = BccmPlayerView(this, context, url)
                    rootLayout.addView(bccmPlayerView.view)

                    val exitBtn = Button(this)
                    exitBtn.text = "Exit"
                    exitBtn.layoutParams = ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
                    exitBtn.setOnClickListener {
                        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, _channel).invokeMethod("closingFullscreen", null);
                        requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
                        rootLayout.removeView(bccmPlayerView.view)
                    }
                    rootLayout.addView(exitBtn)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
