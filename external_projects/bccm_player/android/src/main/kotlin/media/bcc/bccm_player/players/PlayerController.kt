package media.bcc.bccm_player.players

import android.media.session.PlaybackState
import android.net.Uri
import android.os.Bundle
import androidx.annotation.CallSuper
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import androidx.media3.common.TrackSelectionOverride
import androidx.media3.common.Tracks
import media.bcc.bccm_player.BccmPlayerPlugin
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter.Companion.BCCM_EXTRAS
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter.Companion.PLAYER_DATA_IS_LIVE
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter.Companion.PLAYER_DATA_MIME_TYPE
import media.bcc.bccm_player.players.exoplayer.BccmPlayerViewController


abstract class PlayerController : Player.Listener {
    abstract val id: String
    abstract val player: Player
    abstract var currentPlayerViewController: BccmPlayerViewController?
    open var plugin: BccmPlayerPlugin? = null
    var pluginPlayerListener: PlayerListener? = null
    var isLive: Boolean = false

    fun attachPlugin(newPlugin: BccmPlayerPlugin) {
        if (this.plugin != null) detachPlugin()
        this.plugin = newPlugin;
        PlayerListener(this, newPlugin).also {
            pluginPlayerListener = it
            player.addListener(it)
        }
    }

    @Suppress("MemberVisibilityCanBePrivate")
    fun detachPlugin() {
        // We can end up here, e.g. when doing hot reload with flutter
        pluginPlayerListener?.also {
            it.stop()
            player.removeListener(it)
        }
        this.plugin = null;
    }

    @CallSuper
    open fun release() {
        detachPlugin();
    }

    fun play() {
        player.play()
    }

    fun pause() {
        player.pause()
    }

    abstract fun stop(reset: Boolean)

    fun replaceCurrentMediaItem(mediaItem: PlaybackPlatformApi.MediaItem, autoplay: Boolean?) {
        this.isLive = mediaItem.isLive ?: false
        val androidMi = mapMediaItem(mediaItem)
        var playbackStartPositionMs: Double? = null
        if (!this.isLive && mediaItem.playbackStartPositionMs != null) {
            playbackStartPositionMs = mediaItem.playbackStartPositionMs
        }
        player.setMediaItem(androidMi, playbackStartPositionMs?.toLong() ?: 0)
        player.playWhenReady = autoplay == true
        player.prepare()
    }

    fun queueMediaItem(mediaItem: PlaybackPlatformApi.MediaItem) {
        val androidMi = mapMediaItem(mediaItem)
        player.addMediaItem(androidMi)
    }

    fun extractExtrasFromAndroid(source: Bundle): Map<String, String> {
        val extraMeta = mutableMapOf<String, String>()
        for (sourceKey in source.keySet()) {
            val value = source[sourceKey]
            if (!sourceKey.contains("media.bcc.extras.") || value !is String) continue
            val newKey =
                sourceKey.substring(sourceKey.indexOf("media.bcc.extras.") + "media.bcc.extras.".length)
            source[sourceKey]?.toString()?.let {
                extraMeta[newKey] = it
            }
        }
        return extraMeta
    }

    fun mapMediaItem(mediaItem: PlaybackPlatformApi.MediaItem): MediaItem {
        val metaBuilder = MediaMetadata.Builder()
        val extraMeta = Bundle()

        if (mediaItem.metadata?.artworkUri != null) {
            metaBuilder.setArtworkUri(Uri.parse(mediaItem.metadata?.artworkUri))
        }
        if (mediaItem.isLive == true) {
            extraMeta.putString(PLAYER_DATA_IS_LIVE, "true")
        }
        val sourceExtra = mediaItem.metadata?.extras
        if (sourceExtra != null) {
            for (extra in sourceExtra) {
                (extra.value as? String?).let {
                    extraMeta.putString(BCCM_EXTRAS + "." + extra.key, it)
                }
            }
        }

        metaBuilder.setTitle(mediaItem.metadata?.title).setArtist(mediaItem.metadata?.artist)
            .setExtras(extraMeta).build()

        val miBuilder =
            MediaItem.Builder().setUri(mediaItem.url).setMediaMetadata(metaBuilder.build())
        miBuilder.setMimeType(mediaItem.mimeType ?: "application/x-mpegURL")
        return miBuilder.build()
    }

    fun mapMediaItem(mediaItem: MediaItem): PlaybackPlatformApi.MediaItem {
        val metaBuilder = PlaybackPlatformApi.MediaMetadata.Builder()
        if (mediaItem.mediaMetadata.artworkUri != null) {
            metaBuilder.setArtworkUri(mediaItem.mediaMetadata.artworkUri?.toString())
        }
        metaBuilder.setTitle(mediaItem.mediaMetadata.title?.toString())
        metaBuilder.setArtist(mediaItem.mediaMetadata.artist?.toString())
        var extraMeta: Map<String, String> = mutableMapOf()
        val sourceExtras = mediaItem.mediaMetadata.extras
        if (sourceExtras != null) {
            extraMeta = extractExtrasFromAndroid(sourceExtras)
        }
        if (player.currentMediaItem == mediaItem) {
            metaBuilder.setDurationMs(player.duration.toDouble());
        }
        metaBuilder.setExtras(extraMeta)
        val miBuilder = PlaybackPlatformApi.MediaItem.Builder()
            .setUrl(mediaItem.localConfiguration?.uri?.toString())
            .setIsLive(extraMeta[PLAYER_DATA_IS_LIVE] == "true").setMetadata(metaBuilder.build())
        if (extraMeta[PLAYER_DATA_MIME_TYPE] != null) {
            miBuilder.setMimeType(extraMeta[PLAYER_DATA_MIME_TYPE])
        } else if (mediaItem.localConfiguration?.mimeType != null) {
            miBuilder.setMimeType(mediaItem.localConfiguration?.mimeType)
        }

        return miBuilder.build()
    }

    fun getPlaybackState(): PlaybackPlatformApi.PlaybackState {
        return if (player.isPlaying || player.playWhenReady) PlaybackPlatformApi.PlaybackState.PLAYING else PlaybackPlatformApi.PlaybackState.PAUSED;
    }

    fun getPlayerStateSnapshot(): PlaybackPlatformApi.PlayerStateSnapshot {
        return PlaybackPlatformApi.PlayerStateSnapshot.Builder()
            .setPlayerId(id)
            .setCurrentMediaItem(getCurrentMediaItem())
            .setPlaybackPositionMs(player.currentPosition.toDouble())
            .setPlaybackState(getPlaybackState())
            .setIsBuffering(player.playbackState == Player.STATE_BUFFERING)
            .setIsFullscreen(currentPlayerViewController?.isFullscreen == true)
            .build()
    }

    fun getTracksSnapshot(): PlaybackPlatformApi.PlayerTracksSnapshot {
        // get tracks from player
        val currentTracks = player.currentTracks;
        val currentAudioTrack =
            currentTracks.groups.firstOrNull { it.isSelected && it.type == C.TRACK_TYPE_AUDIO }
                ?.getTrackFormat(0)
        val currentTextTrack =
            currentTracks.groups.firstOrNull { it.isSelected && it.type == C.TRACK_TYPE_TEXT }
                ?.getTrackFormat(0)

        val audioTracks = mutableListOf<PlaybackPlatformApi.Track>()
        val textTracks = mutableListOf<PlaybackPlatformApi.Track>()
        for (trackGroup in currentTracks.groups) {
            if (trackGroup.type == C.TRACK_TYPE_AUDIO) {
                val track = trackGroup.getTrackFormat(0)
                val id = track.id ?: track.language ?: continue;
                audioTracks.add(
                    PlaybackPlatformApi.Track.Builder()
                        .setId(id)
                        .setLanguage(track.language)
                        .setLabel(track.label)
                        .setIsSelected(track == currentAudioTrack)
                        .build()
                )
            } else if (trackGroup.type == C.TRACK_TYPE_TEXT) {
                val track = trackGroup.getTrackFormat(0)
                val id = track.id ?: track.language ?: continue;
                textTracks.add(
                    PlaybackPlatformApi.Track.Builder()
                        .setId(id)
                        .setLanguage(track.language)
                        .setLabel(track.label)
                        .setIsSelected(track == currentTextTrack)
                        .build()
                )
            }
        }
        return PlaybackPlatformApi.PlayerTracksSnapshot.Builder()
            .setPlayerId(id)
            .setAudioTracks(audioTracks)
            .setTextTracks(textTracks)
            .build()
    }

    fun setSelectedTrack(type: @C.TrackType Int, trackId: String, tracksOverride: Tracks? = null) {
        val tracks = tracksOverride ?: player.currentTracks
        val trackGroup = tracks.groups.firstOrNull {
            it.type == type
                    && it.mediaTrackGroup.length > 0
                    && it.mediaTrackGroup.getFormat(0).id == trackId
        }
        if (trackGroup != null) {
            player.trackSelectionParameters = player.trackSelectionParameters
                .buildUpon()
                .clearOverridesOfType(type)
                .setOverrideForType(TrackSelectionOverride(trackGroup.mediaTrackGroup, 0))
                .build()
        }
    }

    /**
     * Sets the language of the subtitles. Returns false if there is the language
     * is not available for the current media item.
     */
    fun setSelectedTrackByLanguage(
        type: @C.TrackType Int,
        language: String,
        tracksOverride: Tracks? = null,
    ): Boolean {
        val tracks = tracksOverride ?: player.currentTracks
        val trackGroup = tracks.groups.firstOrNull {
            it.type == type
                    && it.mediaTrackGroup.length > 0
                    && it.mediaTrackGroup.getFormat(0).language == language
        }

        return if (trackGroup != null) {
            player.trackSelectionParameters = player.trackSelectionParameters
                .buildUpon()
                .clearOverridesOfType(type)
                .setOverrideForType(TrackSelectionOverride(trackGroup.mediaTrackGroup, 0))
                .build()
            true
        } else {
            false
        }
    }

    private fun getCurrentMediaItem(): PlaybackPlatformApi.MediaItem? {
        val current = player.currentMediaItem;
        if (current != null) {
            return mapMediaItem(current)
        }
        return null
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        mediaItem?.let {
            val bccmMediaItem = mapMediaItem(mediaItem)
            isLive = bccmMediaItem.isLive ?: false
        }
    }
}