package media.bcc.bccm_player

import android.net.Uri
import android.os.Bundle
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import com.npaw.youbora.lib6.exoplayer2.Exoplayer2Adapter
import media.bcc.player.PlaybackPlatformApi


abstract class PlayerController() : Player.Listener {
    abstract val id: String;
    abstract val player: Player;
    var isLive: Boolean = false

    abstract fun release();

    fun replaceCurrentMediaItem(mediaItem: PlaybackPlatformApi.MediaItem) {
        this.isLive = mediaItem.isLive ?: false;
        val androidMi = mapMediaItem(mediaItem);
        player.setMediaItem(androidMi, mediaItem.playbackStartPositionMs ?: 0)
        player.prepare()
        player.play()
    }

    fun queueMediaItem(mediaItem: PlaybackPlatformApi.MediaItem) {
        val androidMi = mapMediaItem(mediaItem);
        player.addMediaItem(androidMi)
    }

    fun extractExtrasFromAndroid(source: Bundle) : Map<String, String> {
        val extraMeta = mutableMapOf<String, String>()
        for (sourceKey in source.keySet()) {
            val value = source[sourceKey]
            if (!sourceKey.contains("media.bcc.extras.") || value !is String) continue
            val newKey = sourceKey.substring(sourceKey.indexOf("media.bcc.extras.") + "media.bcc.extras.".length)
            extraMeta[newKey] = source[sourceKey].toString();
        }
        return extraMeta;
    }

    fun mapMediaItem(mediaItem: PlaybackPlatformApi.MediaItem): MediaItem {
        val metaBuilder = MediaMetadata.Builder();
        val extraMeta = Bundle();

        if (mediaItem.metadata?.artworkUri != null) {
            metaBuilder.setArtworkUri(Uri.parse(mediaItem.metadata?.artworkUri))
        }
        val episodeId = mediaItem.metadata?.episodeId;
        if (episodeId != null) {
            extraMeta.putString("episode_id", episodeId);
        }
        val sourceExtra = mediaItem.metadata?.extras;
        if (sourceExtra != null) {
            for (extra in sourceExtra) {
                extraMeta.putString("media.bcc.extras." + extra.key, extra.value);
            }
        }


        metaBuilder.setTitle(mediaItem.metadata?.title)
                .setArtist(mediaItem.metadata?.artist)
                .setExtras(extraMeta)
                .build()

        val miBuilder = MediaItem.Builder()
                .setUri(mediaItem.url)
                .setMediaMetadata(metaBuilder.build());
        if (mediaItem.mimeType != null) {
            miBuilder.setMimeType(mediaItem.mimeType);
        }
        return miBuilder.build()
    }

    fun mapMediaItem(mediaItem: MediaItem): PlaybackPlatformApi.MediaItem {
        val metaBuilder = PlaybackPlatformApi.MediaMetadata.Builder();
        if (mediaItem.mediaMetadata.artworkUri != null) {
            metaBuilder.setArtworkUri(mediaItem.mediaMetadata.artworkUri.toString())
        }
        val episodeId = mediaItem.mediaMetadata.extras?.getString("episode_id");
        if (episodeId != null) {
            metaBuilder.setEpisodeId(episodeId);
        }
        metaBuilder.setTitle(mediaItem.mediaMetadata.title.toString());
        metaBuilder.setArtist(mediaItem.mediaMetadata.artist.toString());
        var extraMeta: Map<String, String> = mutableMapOf()
        val sourceExtras = mediaItem.mediaMetadata.extras;
        if (sourceExtras != null) {
            extraMeta = extractExtrasFromAndroid(sourceExtras)
        }
        metaBuilder.setExtras(extraMeta)

        val miBuilder = PlaybackPlatformApi.MediaItem.Builder()
                .setUrl(mediaItem.localConfiguration?.uri.toString())
                .setIsLive(extraMeta["isLive"] == "true")
                .setMetadata(metaBuilder.build())
        if (mediaItem.localConfiguration?.mimeType != null) {
            miBuilder.setMimeType(mediaItem.localConfiguration?.mimeType);
        }
        return miBuilder.build()
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        mediaItem?.let {
            val bccmMediaItem = mapMediaItem(mediaItem);
            isLive = bccmMediaItem.isLive ?: false
        }
    }
}