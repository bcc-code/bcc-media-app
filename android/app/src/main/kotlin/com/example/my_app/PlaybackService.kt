
package com.example.my_app

import android.content.Intent
import android.os.Binder
import android.os.IBinder
import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService

class PlaybackService : MediaSessionService() {
    val playerControllers = mutableListOf<BccmPlayerController>()
    private lateinit var primaryPlayerController: BccmPlayerController
    private lateinit var mediaSession: MediaSession

    private var binder: LocalBinder = LocalBinder();

    override fun onBind(intent: Intent?): IBinder? {
        if (intent?.action == null) {
            return this.binder
        }
        return super.onBind(intent)
        //return binder;
    }

    // Create your Player and MediaSession in the onCreate lifecycle event
    override fun onCreate() {
        super.onCreate()
        primaryPlayerController = newPlayer()
        mediaSession = MediaSession.Builder(this, primaryPlayerController.exoPlayer).build()
        //playPrimary("https://vod2.stream.brunstad.tv/out/v1/5e29b8ba368f48bba5903b1752d5d71c/ab9e7540a3e34bee86ec6af8c7cdc342/1467e3c2761c4947ae7dc7a6c162747f/index.m3u8?EncodedPolicy=Policy%3deyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6Imh0dHBzOi8vdm9kMi5zdHJlYW0uYnJ1bnN0YWQudHYvb3V0L3YxLzVlMjliOGJhMzY4ZjQ4YmJhNTkwM2IxNzUyZDVkNzFjL2FiOWU3NTQwYTNlMzRiZWU4NmVjNmFmOGM3Y2RjMzQyLyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2NjAxMzg4NTJ9fX1dfQ__%26Signature%3dBM-JFKNm8XZt0CgRtFtYAzuZoBhBaykiGNIPlmK09kbPO72F4tRaLK4%7eILvAmN4wIzN2eTadlY-WOTxcmqphYqQrv3aXXAUgbiuhVF8gtraHmrEehX7ykK%7eB%7eaLnrZ2TY0C1TlAhhFOF45cnRssob%7e4YqewLDTDDkMBgAzgwL%7euLvUNTi9ZgVTN2zc2DrGq8FmHp15y43mUb9YvbbN3lBqa23cZYmlLaIAT5X%7e2wuiKdBu2Jesk1%7e5skukAKooPVqZh9JCwXUzSQgU7opKAzL%7eH4Olac-pKrvk2-eqplT8X1RJ6J9SRdH5Zwa29v52DF9bMIOUB3TgP7BUiO6mOJYA__%26Key-Pair-Id%3dK2ONPB9SDZ4ZMH")
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        super.onStartCommand(intent, flags, startId)
        return START_NOT_STICKY;
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
    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession = mediaSession

    override fun onDestroy() {
        playerControllers.forEach {
            it.release()
        }
        mediaSession.release()
        super.onDestroy()
    }

    fun setPrimary(playerId: String) {
        val pc = playerControllers.find {
            it.id == playerId
        }
        if (pc?.exoPlayer != null) {
            mediaSession.player = pc.exoPlayer
        }
    }
}