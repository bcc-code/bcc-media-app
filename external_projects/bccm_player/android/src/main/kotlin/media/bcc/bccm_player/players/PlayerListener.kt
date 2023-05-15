package media.bcc.bccm_player.players

import android.util.Log
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import androidx.media3.common.Timeline
import com.npaw.youbora.lib6.Timer
import media.bcc.bccm_player.BccmPlayerPlugin
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi.PlayerStateUpdateEvent

class PlayerListener(private val playerController: PlayerController, val plugin: BccmPlayerPlugin) :
    Player.Listener {
    private val refreshStateTimer: Timer = Timer(object : Timer.TimerEventListener {
        override fun onTimerEvent(delta: Long) {
            Log.d(
                "bccm",
                "refreshStateTimer onTimerEvent(), hashCode:" + this@PlayerListener.hashCode()
            )
            onManualPlayerStateUpdate()
        }
    }, 15000)

    init {
        Log.d(
            "bccm",
            "refreshStateTimer start(), ${playerController}, hashCode:" + this@PlayerListener.hashCode()
        )
        refreshStateTimer.start()
    }

    fun stop() {
        Log.d(
            "bccm",
            "refreshStateTimer stop(), ${playerController}, hashCode:" + this@PlayerListener.hashCode()
        )
        refreshStateTimer.stop()
    }

    fun onManualPlayerStateUpdate() {
        val event = PlayerStateUpdateEvent.Builder()
            .setPlayerId(playerController.id)
            .setSnapshot(playerController.getPlayerStateSnapshot())
        plugin.playbackPigeon?.onPlayerStateUpdate(event.build()) {}
    }

    override fun onPlaybackStateChanged(playbackState: Int) {
        if (playbackState == Player.STATE_ENDED) {
            val event =
                PlaybackPlatformApi.PlaybackEndedEvent.Builder()
                    .setPlayerId(playerController.id)
            val mediaItem = playerController.player.currentMediaItem;
            if (mediaItem != null) {
                val bccmMediaItem = playerController.mapMediaItem(mediaItem)
                event.setMediaItem(bccmMediaItem)
            } else {
                event.setMediaItem(null)
            }
            plugin.playbackPigeon?.onPlaybackEnded(event.build()) {}
        }
    }

    override fun onIsPlayingChanged(isPlaying: Boolean) {
        val state =
            if (isPlaying) PlaybackPlatformApi.PlaybackState.PLAYING
            else PlaybackPlatformApi.PlaybackState.PAUSED;
        val event =
            PlaybackPlatformApi.PlaybackStateChangedEvent.Builder()
                .setPlayerId(playerController.id)
                .setPlaybackState(state)
        plugin.playbackPigeon?.onPlaybackStateChanged(event.build()) {}
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        val event =
            PlaybackPlatformApi.MediaItemTransitionEvent.Builder().setPlayerId(playerController.id)
        if (mediaItem != null) {
            val bccmMediaItem = playerController.mapMediaItem(mediaItem)
            event.setMediaItem(bccmMediaItem)
        } else {
            event.setMediaItem(null)
        }
        Log.d(
            "bccm",
            "onMediaItemTransition" + plugin.playbackPigeon.toString() + "event:" + event.build()
                .toString()
        );
        plugin.playbackPigeon?.onMediaItemTransition(event.build()) {}
    }

    override fun onMediaMetadataChanged(mediaMetadata: MediaMetadata) {
        onMediaItemTransition(
            playerController.player.currentMediaItem,
            Player.MEDIA_ITEM_TRANSITION_REASON_PLAYLIST_CHANGED
        )
    }

    override fun onTimelineChanged(timeline: Timeline, reason: Int) {
        onMediaItemTransition(
            playerController.player.currentMediaItem,
            Player.MEDIA_ITEM_TRANSITION_REASON_PLAYLIST_CHANGED
        )
    }

    override fun onPositionDiscontinuity(
        oldPosition: Player.PositionInfo, newPosition: Player.PositionInfo, reason: Int
    ) {
        val event = PlaybackPlatformApi.PositionDiscontinuityEvent.Builder()
            .setPlayerId(playerController.id)
        plugin.playbackPigeon?.onPositionDiscontinuity(
            event.setPlaybackPositionMs(newPosition.positionMs.toDouble()).build()
        ) {}
    }

}