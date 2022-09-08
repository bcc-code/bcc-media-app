package media.bcc.bccm_player

import android.net.Uri
import android.os.Bundle
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.Player
import media.bcc.player.PlaybackPlatformApi


abstract class PlayerController() : Player.Listener {
    abstract val id: String;
    abstract val player: Player;

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
        
        val miBuilder = PlaybackPlatformApi.MediaItem.Builder()
                .setUrl(mediaItem.localConfiguration?.uri.toString())
                .setMetadata(metaBuilder.build())
        if (mediaItem.localConfiguration?.mimeType != null) {
            miBuilder.setMimeType(mediaItem.localConfiguration?.mimeType);
        }
        return miBuilder.build()
    }
}