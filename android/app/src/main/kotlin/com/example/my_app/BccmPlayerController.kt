package com.example.my_app

import android.content.Context
import androidx.media3.common.AudioAttributes
import androidx.media3.common.MediaItem
import androidx.media3.common.MimeTypes
import androidx.media3.exoplayer.ExoPlayer
import com.google.android.gms.common.api.Releasable
import java.util.*

class BccmPlayerController(context: Context) : Releasable {
    val id: String = UUID.randomUUID().toString()
    val exoPlayer: ExoPlayer

    init {
        exoPlayer = ExoPlayer.Builder(context)
                .setAudioAttributes(AudioAttributes.DEFAULT, /* handleAudioFocus= */ true)
                .build()
        exoPlayer.prepare()
    }

    fun playWithUrl(url: String) {
        val mediaItem: MediaItem = MediaItem.Builder()
                .setUri(url)
                .setMimeType(MimeTypes.APPLICATION_M3U8)
                .build()
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.play()
    }

    override fun release() {
        exoPlayer.release()
    }
}