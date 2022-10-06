package media.bcc.bccm_player

import android.content.Intent
import android.util.Log
import androidx.core.content.ContextCompat.startActivity
import com.google.android.gms.cast.framework.media.widget.ExpandedControllerActivity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import media.bcc.player.PlaybackPlatformApi


class PlaybackApiImpl(private val plugin: BccmPlayerPlugin) : PlaybackPlatformApi.PlaybackPlatformPigeon {
    private val mainScope = CoroutineScope(Dispatchers.Main + Job())

    override fun setUser(user: PlaybackPlatformApi.User?) {
        mainScope.launch {
            BccmPlayerPluginSingleton.userState.update { User(user?.id) }
        }
    }

    override fun setNpawConfig(config: PlaybackPlatformApi.NpawConfig?) {
        Log.d("bccm", "PlaybackPigeon: Setting npawConfig");
        mainScope.launch {
            BccmPlayerPluginSingleton.npawConfigState.update { config }
        }
    }

    override fun setAppConfig(config: PlaybackPlatformApi.AppConfig?) {
        Log.d("bccm", "PlaybackPigeon: Setting appConfig");
        mainScope.launch {
            BccmPlayerPluginSingleton.appConfigState.update { config }
        }
    }

    override fun newPlayer(url: String?, result: PlaybackPlatformApi.Result<String>?) {
        Log.d("bccm", "PlaybackPigeon: newPlayer()")
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }
        val playerController = playbackService.newPlayer(plugin)
        playerController.player.addListener(PlayerListener(playerController, plugin))
        if (url != null) {
            playerController.replaceCurrentMediaItem(PlaybackPlatformApi.MediaItem.Builder().setUrl(url).build(), false)
        }
        result?.success(playerController.id)
    }

    override fun replaceCurrentMediaItem(playerId: String, mediaItem: PlaybackPlatformApi.MediaItem, playbackPositionFromPrimary: Boolean?, autoplay: Boolean?, result: PlaybackPlatformApi.Result<Void>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }
        if (playbackPositionFromPrimary == true) {
            mediaItem.playbackStartPositionMs = playbackService.getPrimaryController()?.player?.currentPosition
        }

        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id ${playerId} does not exist.")

        playerController.replaceCurrentMediaItem(mediaItem, autoplay)
        result?.success(null);
    }

    override fun queueMediaItem(playerId: String, mediaItem: PlaybackPlatformApi.MediaItem, result: PlaybackPlatformApi.Result<Void>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }
        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id $playerId does not exist.")
        playerController.queueMediaItem(mediaItem)
        result?.success(null);
    }

    override fun setPrimary(id: String, result: PlaybackPlatformApi.Result<Void>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return
        }

        playbackService.setPrimary(id)
        result?.success(null)
    }

    override fun play(playerId: String) {
        val playbackService = plugin.getPlaybackService() ?: return
        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id $playerId does not exist.")

        playerController.player.play()
    }

    override fun pause(playerId: String) {
        val playbackService = plugin.getPlaybackService() ?: return
        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id $playerId does not exist.")

        playerController.player.pause()
    }

    override fun stop(playerId: String, reset: Boolean) {
        val playbackService = plugin.getPlaybackService() ?: return
        val playerController = playbackService.getController(playerId)
                ?: throw Error("Player with id $playerId does not exist.")

        playerController.player.stop()
        if (reset) {
            playerController.player.clearMediaItems()
        }
    }

    override fun getChromecastState(result: PlaybackPlatformApi.Result<PlaybackPlatformApi.ChromecastState>?) {
        val playbackService = plugin.getPlaybackService()
        if (playbackService == null) {
            result?.error(Error())
            return;
        }
        val cc = playbackService.getController("chromecast")
        if (cc == null || cc !is CastPlayerController) {
            return;
        }
        result?.success(cc.getState())
    }

    override fun openExpandedCastController() {
        val intent = Intent(BccmPlayerPluginSingleton.activityState.value, ExpandedControllerActivity::class.java)
        BccmPlayerPluginSingleton.activityState.value?.startActivity(intent)
    }

    override fun openCastDialog() {

    }
}