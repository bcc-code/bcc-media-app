
package com.example.my_app

import android.content.Context
import android.content.Intent
import android.os.Binder
import android.os.IBinder
import androidx.media3.common.MediaItem
import androidx.media3.common.MimeTypes
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService
import io.flutter.plugin.platform.PlatformView
import java.util.*

class BccmPlayerController(context: Context) {
    val id: String = UUID.randomUUID().toString()
    val exoPlayer: ExoPlayer

    init {
        exoPlayer = ExoPlayer.Builder(context).build()
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
}

class PlaybackService : MediaSessionService() {
    val playerControllers = mutableListOf<BccmPlayerController>()
    private lateinit var primaryPlayerController: BccmPlayerController
    private lateinit var mediaSession: MediaSession

    private var binder: LocalBinder = LocalBinder();

    override fun onBind(intent: Intent?): IBinder {
        super.onBind(intent)
        return binder;
    }

    // Create your Player and MediaSession in the onCreate lifecycle event
    override fun onCreate() {
        super.onCreate()
        primaryPlayerController = newPlayer()
        mediaSession = MediaSession.Builder(this, primaryPlayerController.exoPlayer).build()
    }

    fun newPlayer(): BccmPlayerController {
        val pc = BccmPlayerController(this)
        playerControllers.add(pc)
        return pc
    }

    inner class LocalBinder : Binder() {
        fun getService(): PlaybackService {
            return this@PlaybackService
        }
    }

    // Return a MediaSession to link with the MediaController that is making
    // this request.
    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession? = mediaSession

    override fun onDestroy() {
        super.onDestroy()
        mediaSession.run {
            player.release()
            release()
        }
    }
}