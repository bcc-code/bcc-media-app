package com.example.my_app

import android.content.Context
import android.graphics.Color
import android.view.SurfaceView
import android.view.TextureView
import android.view.View
import android.widget.Button
import android.widget.FrameLayout
import android.widget.TextView
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import com.google.android.exoplayer2.ExoPlayer
import com.google.android.exoplayer2.MediaItem
import com.google.android.exoplayer2.ui.PlayerView
import com.google.android.exoplayer2.ui.StyledPlayerView
import com.google.android.exoplayer2.util.MimeTypes
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


internal class TestViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return TestView(context!!, creationParams?.get("text") as String?)
    }
}

internal class TestView(context: Context, var text: String?) : PlatformView {
    private val frameLayout: FrameLayout

    override fun getView(): View {
        return frameLayout
    }

    override fun dispose() {}

    init {
        if (text == null) {
            text = "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8"
        }
        var player = ExoPlayer.Builder(context).build()
        val mediaItem: MediaItem = MediaItem.Builder()
                .setUri(text)
                .setMimeType(MimeTypes.APPLICATION_M3U8)
                .build()
        player!!.setMediaItem(mediaItem)
        player!!.prepare()
        player!!.play()
        var v = SurfaceView(context);
        player.setVideoSurfaceView(v)

        frameLayout = FrameLayout(context)
        var textView = TextView(context)
        textView.textSize = 72f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.text = text
        frameLayout.addView(textView)
        var button = Button(context)
        button.text = "Open video"
        button.textSize = 72f
        frameLayout.addView(v)
    }
}