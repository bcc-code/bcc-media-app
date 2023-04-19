package media.bcc.bccm_player

import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import androidx.media3.common.Timeline
import com.npaw.youbora.lib6.Timer

class PlayerListener(private val playerController: PlayerController, val plugin: BccmPlayerPlugin) : Player.Listener {
    private val refreshStateTimer: Timer = Timer(object : Timer.TimerEventListener {
        override fun onTimerEvent(delta: Long) {
            val event = PlaybackPlatformApi.PlayerState.Builder().setPlayerId(playerController.id).setPlaybackPositionMs(playerController.player.currentPosition.toDouble()).setIsPlaying(playerController.player.isPlaying)
            plugin.playbackPigeon?.onPlayerStateUpdate(event.build()) {}
        }
    }, 15000)

    init {
        refreshStateTimer.start()
    }

    override fun onIsPlayingChanged(isPlaying: Boolean) {
        val event = PlaybackPlatformApi.IsPlayingChangedEvent.Builder().setPlayerId(playerController.id).setIsPlaying(isPlaying)
        plugin.playbackPigeon?.onIsPlayingChanged(event.build()) {}
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        val event = PlaybackPlatformApi.MediaItemTransitionEvent.Builder().setPlayerId(playerController.id)
        if (mediaItem != null) {
            val bccmMediaItem = playerController.mapMediaItem(mediaItem)
            event.setMediaItem(bccmMediaItem)
        } else {
            event.setMediaItem(null)
        }
        plugin.playbackPigeon?.onMediaItemTransition(event.build()) {}
    }

    override fun onMediaMetadataChanged(mediaMetadata: MediaMetadata) {
        onMediaItemTransition(playerController.player.currentMediaItem, Player.MEDIA_ITEM_TRANSITION_REASON_PLAYLIST_CHANGED)
    }

    override fun onTimelineChanged(timeline: Timeline, reason: Int) {
        onMediaItemTransition(playerController.player.currentMediaItem, Player.MEDIA_ITEM_TRANSITION_REASON_PLAYLIST_CHANGED)
    }

    override fun onPositionDiscontinuity(oldPosition: Player.PositionInfo, newPosition: Player.PositionInfo, reason: Int) {
        val event = PlaybackPlatformApi.PositionDiscontinuityEvent.Builder().setPlayerId(playerController.id)
        plugin.playbackPigeon?.onPositionDiscontinuity(event.setPlaybackPositionMs(newPosition.positionMs.toDouble()).build()) {}
    }

}