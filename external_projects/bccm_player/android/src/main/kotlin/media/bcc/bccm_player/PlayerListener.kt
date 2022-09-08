package media.bcc.bccm_player

import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import media.bcc.player.PlaybackListenerPigeonImpl

class PlayerListener(val plugin: BccmPlayerPlugin) : Player.Listener {
    override fun onIsPlayingChanged(isPlaying: Boolean) {
        val event = PlaybackListenerPigeonImpl.IsPlayingChangedEvent.Builder()
                .setPlayerId("chromecast")
                .setIsPlaying(isPlaying);
        plugin.playbackPigeon?.onIsPlayingChanged(event.build()) {};
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        plugin.playbackPigeon?.onMediaItemTransition
    }
}