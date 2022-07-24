package com.example.my_app

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import com.google.android.exoplayer2.ExoPlayer
import com.google.android.exoplayer2.MediaItem
import com.google.android.exoplayer2.ui.StyledPlayerView
import com.google.android.exoplayer2.util.MimeTypes
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


internal class NativeViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return BccmPlayer(context!!, creationParams?.get("url") as String?)
    }
}

internal class BccmPlayer(context: Context, var url: String?) : PlatformView {
    companion object {
        var player: ExoPlayer? = null
    }
    private val _v: View
    override fun getView(): View {
        return _v
    }

    override fun dispose() {}

    init {
        if (url == null) {
            url = "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8"
        }
        if (player == null || player!!.currentMediaItem?.localConfiguration?.uri.toString() != url) {
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
        _v = StyledPlayerView(context);
        _v.player = player
    }
}