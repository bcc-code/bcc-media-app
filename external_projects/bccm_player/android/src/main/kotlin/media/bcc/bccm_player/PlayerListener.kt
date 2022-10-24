package media.bcc.bccm_player

import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import androidx.media3.common.Timeline
import media.bcc.player.PlaybackPlatformApi

class PlayerListener(private val playerController: PlayerController, val plugin: BccmPlayerPlugin) : Player.Listener {
    override fun onIsPlayingChanged(isPlaying: Boolean) {
        val event = PlaybackPlatformApi.IsPlayingChangedEvent.Builder()
                .setPlayerId(playerController.id)
                .setIsPlaying(isPlaying);
        plugin.playbackPigeon?.onIsPlayingChanged(event.build()) {};
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        val event = PlaybackPlatformApi.MediaItemTransitionEvent.Builder().setPlayerId(playerController.id);
        if (mediaItem != null) {
            val bccmMediaItem = playerController.mapMediaItem(mediaItem);
            event.setMediaItem(bccmMediaItem);
        } else {
            event.setMediaItem(null)
        }
        plugin.playbackPigeon?.onMediaItemTransition(event.build()) {};
    }

    override fun onMediaMetadataChanged(mediaMetadata: MediaMetadata) {
        onMediaItemTransition(playerController.player.currentMediaItem, Player.MEDIA_ITEM_TRANSITION_REASON_PLAYLIST_CHANGED);
    }

    override fun onTimelineChanged(timeline: Timeline, reason: Int) {
        onMediaItemTransition(playerController.player.currentMediaItem, Player.MEDIA_ITEM_TRANSITION_REASON_PLAYLIST_CHANGED);
    }

}