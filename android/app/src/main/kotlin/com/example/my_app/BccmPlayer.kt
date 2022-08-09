
package com.example.my_app

import android.content.Context
import androidx.media3.common.MediaItem
import androidx.media3.common.MimeTypes
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import io.flutter.plugin.platform.PlatformView
import java.util.*
/*
class BccmPlayer(url: String) {
    companion object {
        val players = mutableListOf<BccmPlayer>()
    }
    val id: String = UUID.randomUUID().toString()
    private val exoPlayer: ExoPlayer
    init {
        exoPlayer = ExoPlayer.Builder().build()
        val mediaItem: MediaItem = MediaItem.Builder()
                .setUri(url)
                .setMimeType(MimeTypes.APPLICATION_M3U8)
                .build()
        exoPlayer!!.setMediaItem(mediaItem)
        exoPlayer!!.prepare()
        exoPlayer!!.play()
    }
}*/

// Extend MediaSessionService
class PlaybackService : MediaSessionService() {
    // Create your Player and MediaSession in the onCreate lifecycle event
    private lateinit var player: Player
    private lateinit var mediaSession: MediaSession
    override fun onCreate() {
        super.onCreate()
        player = ExoPlayer.Builder(this).build()
        mediaSession = MediaSession.Builder(this, player).build()
    }
    // Return a MediaSession to link with the MediaController that is making
    // this request.
    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession? = mediaSession
}