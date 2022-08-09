package com.example.my_app

import android.R
import android.content.pm.ActivityInfo
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.FrameLayout
import androidx.annotation.NonNull
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
                .registerViewFactory("bccm-player", NativeViewFactory(this))

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, _channel).setMethodCallHandler {
            call, result ->
            if (call.method == "new_player") {
                val args = call.arguments as HashMap<String, String>
                val url = args["url"]!!;/*
                val player = BccmPlayer(url);
                players["a"] = player;*/
            }
            if (call.method == "open") {

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
            } else {
                result.notImplemented()
            }
        }
    }
}
