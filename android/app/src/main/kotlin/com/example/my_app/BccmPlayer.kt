package com.example.my_app

import android.content.Context
import android.view.View
import com.google.android.exoplayer2.ExoPlayer
import com.google.android.exoplayer2.MediaItem
import com.google.android.exoplayer2.ui.StyledPlayerView
import com.google.android.exoplayer2.util.MimeTypes
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


class BccmPlayerFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        if (context == null) {
            throw Error("Context cant be null");
        }
        return BccmPlayer(context, viewId, creationParams)
    }
}

internal class BccmPlayer(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val _playerView: StyledPlayerView

    override fun getView(): View {
        return _playerView
    }

    override fun dispose() {}

    init {
        val player: ExoPlayer = ExoPlayer.Builder(context).build()
        _playerView = StyledPlayerView(context);
        _playerView.player = player
        val mediaItem: MediaItem = MediaItem.Builder()
                .setUri("https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8")
                .setMimeType(MimeTypes.APPLICATION_M3U8)
                .build()
        player.setMediaItem(mediaItem)
        player.prepare()
    }
}