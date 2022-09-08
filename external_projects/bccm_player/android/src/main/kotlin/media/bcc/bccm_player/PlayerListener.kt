package media.bcc.bccm_player

import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import media.bcc.player.PlaybackPlatformApi

class PlayerListener(val playerController: PlayerController, val plugin: BccmPlayerPlugin) : Player.Listener {
    override fun onIsPlayingChanged(isPlaying: Boolean) {
        val event = PlaybackPlatformApi.IsPlayingChangedEvent.Builder()
                .setPlayerId("chromecast")
                .setIsPlaying(isPlaying);
        plugin.playbackPigeon?.onIsPlayingChanged(event.build()) {};
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        val event = PlaybackPlatformApi.MediaItemTransitionEvent.Builder().setPlayerId(playerController.id);
        if (mediaItem != null) {
            event.setMediaItem(playerController.mapMediaItem(mediaItem));
        } else {
            event.setMediaItem(null)
        }
        plugin.playbackPigeon?.onMediaItemTransition(event.build()) {};
    }
}