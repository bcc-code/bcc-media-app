package media.bcc.bccm_player.players

import android.net.Uri
import android.os.Bundle
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import media.bcc.bccm_player.PlaybackPlatformApi
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter.Companion.BCCM_EXTRAS
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter.Companion.PLAYER_DATA_IS_LIVE
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter.Companion.PLAYER_DATA_MIME_TYPE
import media.bcc.bccm_player.players.exoplayer.ExoPlayerView


abstract class PlayerController : Player.Listener {
    abstract val id: String
    abstract val player: Player
    abstract var currentPlayerViewController: ExoPlayerView?
    var isLive: Boolean = false

    abstract fun release()

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
        val episodeId = mediaItem.metadata?.episodeId
        if (episodeId != null) {
            extraMeta.putString("episode_id", episodeId)
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

        metaBuilder.setTitle(mediaItem.metadata?.title)
            .setArtist(mediaItem.metadata?.artist)
            .setExtras(extraMeta)
            .build()

        val miBuilder = MediaItem.Builder()
            .setUri(mediaItem.url)
            .setMediaMetadata(metaBuilder.build())
        miBuilder.setMimeType(mediaItem.mimeType ?: "application/x-mpegURL")
        return miBuilder.build()
    }

    fun mapMediaItem(mediaItem: MediaItem): PlaybackPlatformApi.MediaItem {

        val metaBuilder = PlaybackPlatformApi.MediaMetadata.Builder()
        if (mediaItem.mediaMetadata.artworkUri != null) {
            metaBuilder.setArtworkUri(mediaItem.mediaMetadata.artworkUri?.toString())
        }
        val episodeId = mediaItem.mediaMetadata.extras?.getString("episode_id")
        if (episodeId != null) {
            metaBuilder.setEpisodeId(episodeId)
        }
        metaBuilder.setTitle(mediaItem.mediaMetadata.title?.toString())
        metaBuilder.setArtist(mediaItem.mediaMetadata.artist?.toString())
        var extraMeta: Map<String, String> = mutableMapOf()
        val sourceExtras = mediaItem.mediaMetadata.extras
        if (sourceExtras != null) {
            extraMeta = extractExtrasFromAndroid(sourceExtras)
        }
        metaBuilder.setExtras(extraMeta)
        val miBuilder = PlaybackPlatformApi.MediaItem.Builder()
            .setUrl(mediaItem.localConfiguration?.uri?.toString())
            .setIsLive(extraMeta[PLAYER_DATA_IS_LIVE] == "true")
            .setMetadata(metaBuilder.build())
        if (extraMeta[PLAYER_DATA_MIME_TYPE] != null) {
            miBuilder.setMimeType(extraMeta[PLAYER_DATA_MIME_TYPE])
        } else if (mediaItem.localConfiguration?.mimeType != null) {
            miBuilder.setMimeType(mediaItem.localConfiguration?.mimeType)
        }
        return miBuilder.build()
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        mediaItem?.let {
            val bccmMediaItem = mapMediaItem(mediaItem)
            isLive = bccmMediaItem.isLive ?: false
        }
    }
}