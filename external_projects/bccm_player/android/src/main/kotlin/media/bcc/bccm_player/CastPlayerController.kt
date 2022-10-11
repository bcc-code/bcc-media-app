package media.bcc.bccm_player

import android.util.Log
import androidx.media3.cast.CastPlayer
import androidx.media3.cast.DefaultMediaItemConverter
import androidx.media3.cast.MediaItemConverter
import androidx.media3.cast.SessionAvailabilityListener
import androidx.media3.common.*
import androidx.media3.common.util.Assertions
import com.google.android.gms.cast.MediaInfo
import com.google.android.gms.cast.MediaQueueItem
import com.google.android.gms.cast.framework.CastContext
import com.google.android.gms.cast.framework.Session
import com.google.android.gms.cast.framework.SessionManagerListener
import com.google.android.gms.common.images.WebImage
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import media.bcc.player.ChromecastControllerPigeon
import media.bcc.player.PlaybackPlatformApi
import org.json.JSONObject


class CastPlayerController(
        private val castContext: CastContext,
        private val chromecastListenerPigeon: ChromecastControllerPigeon.ChromecastPigeon,
        private val plugin: BccmPlayerPlugin)
    : PlayerController(), SessionManagerListener<Session>, SessionAvailabilityListener {
    override val player = CastPlayer(castContext, CustomConverter())
    private val mainScope = CoroutineScope(Dispatchers.Main + SupervisorJob())

    data class CastCustomData(val audioTracks: List<String>, val subtitlesTracks: List<String>)

    class CustomConverter : MediaItemConverter {
        override fun toMediaItem(item: MediaQueueItem): MediaItem {
            // This should give the same as when you build your media item to be passed to ExoPlayer.
            return MediaItem.Builder()
                    .setUri(item.media?.contentId ?: item.media?.contentUrl)
                    .build()
        }

        override fun toMediaQueueItem(mediaItem: MediaItem): MediaQueueItem {
            Assertions.checkNotNull(mediaItem.localConfiguration)
            requireNotNull(mediaItem.localConfiguration!!.mimeType) { "The item must specify its mimeType" }
            val metadata = com.google.android.gms.cast.MediaMetadata(
                    if (MimeTypes.isAudio(mediaItem.localConfiguration!!.mimeType)) com.google.android.gms.cast.MediaMetadata.MEDIA_TYPE_MUSIC_TRACK else com.google.android.gms.cast.MediaMetadata.MEDIA_TYPE_MOVIE)
            if (mediaItem.mediaMetadata.title != null) {
                metadata.putString(com.google.android.gms.cast.MediaMetadata.KEY_TITLE, mediaItem.mediaMetadata.title.toString())
            }
            if (mediaItem.mediaMetadata.subtitle != null) {
                metadata.putString(com.google.android.gms.cast.MediaMetadata.KEY_SUBTITLE, mediaItem.mediaMetadata.subtitle.toString())
            }
            if (mediaItem.mediaMetadata.artist != null) {
                metadata.putString(com.google.android.gms.cast.MediaMetadata.KEY_ARTIST, mediaItem.mediaMetadata.artist.toString())
            }
            if (mediaItem.mediaMetadata.albumArtist != null) {
                metadata.putString(
                        com.google.android.gms.cast.MediaMetadata.KEY_ALBUM_ARTIST, mediaItem.mediaMetadata.albumArtist.toString())
            }
            if (mediaItem.mediaMetadata.albumTitle != null) {
                metadata.putString(
                        com.google.android.gms.cast.MediaMetadata.KEY_ALBUM_TITLE, mediaItem.mediaMetadata.albumTitle.toString())
            }
            if (mediaItem.mediaMetadata.artworkUri != null) {
                metadata.addImage(WebImage(mediaItem.mediaMetadata.artworkUri!!))
            }
            if (mediaItem.mediaMetadata.composer != null) {
                metadata.putString(com.google.android.gms.cast.MediaMetadata.KEY_COMPOSER, mediaItem.mediaMetadata.composer.toString())
            }
            if (mediaItem.mediaMetadata.discNumber != null) {
                metadata.putInt(com.google.android.gms.cast.MediaMetadata.KEY_DISC_NUMBER, mediaItem.mediaMetadata.discNumber!!)
            }
            if (mediaItem.mediaMetadata.trackNumber != null) {
                metadata.putInt(com.google.android.gms.cast.MediaMetadata.KEY_TRACK_NUMBER, mediaItem.mediaMetadata.trackNumber!!)
            }
            val contentUrl = mediaItem.localConfiguration!!.uri.toString()
            val contentId = if (mediaItem.mediaId == MediaItem.DEFAULT_MEDIA_ID) contentUrl else mediaItem.mediaId

            val appConfig = BccmPlayerPluginSingleton.appConfigState.value
            val audioTracks = mutableListOf<String>()
            val subtitlesTracks = mutableListOf<String>()
            appConfig?.audioLanguage?.let {
                audioTracks.add(it)
            }
            appConfig?.subtitleLanguage?.let {
                subtitlesTracks.add(it)
            }
            val customData = mapOf(
                    "audioTracks" to audioTracks,
                    "subtitlesTracks" to subtitlesTracks)

            Log.d("bccm", "this is the customdata: $customData")

            val mediaInfo = MediaInfo.Builder(contentId)
                    .setStreamType(MediaInfo.STREAM_TYPE_BUFFERED)
                    .setContentType(mediaItem.localConfiguration!!.mimeType!!)
                    .setContentUrl(contentUrl)
                    .setCustomData(JSONObject(customData))
                    .setMetadata(metadata)
                    .build()
            return MediaQueueItem.Builder(mediaInfo).build()
        }
    }


    override fun release() {
        player.release()
    }

    override val id: String = "chromecast"

    init {
        player.playWhenReady = true

        player.setSessionAvailabilityListener(this)
        player.addListener(PlayerListener(this, plugin))
        mainScope.launch {
            BccmPlayerPluginSingleton.appConfigState.collectLatest { handleUpdatedAppConfig(it) }
        }
    }

    fun getState(): PlaybackPlatformApi.ChromecastState {
        return PlaybackPlatformApi.ChromecastState.Builder().setConnectionState(PlaybackPlatformApi.CastConnectionState.values()[castContext.castState]).build()
    }

    private fun handleUpdatedAppConfig(appConfigState: PlaybackPlatformApi.AppConfig?) {
        Log.d("bccm", "setting preferred audio and sub lang to: ${appConfigState?.audioLanguage}, ${appConfigState?.subtitleLanguage}")

       /* player.trackSelectionParameters = trackSelector.parameters.buildUpon()
                .setPreferredAudioLanguage(appConfigState?.audioLanguage)
                .setPreferredTextLanguage(appConfigState?.subtitleLanguage).build()
*/

/*
        castContext.sessionManager.currentCastSession.remoteMediaClient.s*/
    }

    // SessionManagerListener

    override fun onSessionEnded(p0: Session, p1: Int) {
        chromecastListenerPigeon.onSessionEnded {}
    }

    override fun onSessionEnding(p0: Session) {
        chromecastListenerPigeon.onSessionEnding {}
    }

    override fun onSessionResumeFailed(p0: Session, p1: Int) {
        chromecastListenerPigeon.onSessionResumeFailed {}
    }

    override fun onSessionResumed(p0: Session, p1: Boolean) {
        chromecastListenerPigeon.onSessionResumed {}
    }

    override fun onSessionResuming(p0: Session, p1: String) {
        chromecastListenerPigeon.onSessionResuming {}
    }

    override fun onSessionStartFailed(p0: Session, p1: Int) {
        chromecastListenerPigeon.onSessionStartFailed {}
    }

    override fun onSessionStarted(p0: Session, p1: String) {
        chromecastListenerPigeon.onSessionStarted {}
    }

    override fun onSessionStarting(p0: Session) {
        chromecastListenerPigeon.onSessionStarting {}
    }

    override fun onSessionSuspended(p0: Session, p1: Int) {
        chromecastListenerPigeon.onSessionSuspended {}
    }

    // SessionAvailabilityListener

    override fun onCastSessionAvailable() {
        chromecastListenerPigeon.onCastSessionAvailable {}
        Log.d("Bccm", "Session available. Transferring state from primaryPlayer to castPlayer");
        val primaryPlayer =
                plugin.getPlaybackService()?.getPrimaryController()?.player ?: return
        transferState(primaryPlayer, player);
    }

    override fun onCastSessionUnavailable() {
        val event = ChromecastControllerPigeon.CastSessionUnavailableEvent.Builder();
        val currentPosition = player.currentPosition;
        if (currentPosition > 0) {
            event.setPlaybackPositionMs(currentPosition);
        }
        chromecastListenerPigeon.onCastSessionUnavailable(event.build()) {};
/*
        Log.d("Bccm", "Session unavailable. Transferring state from castPlayer to primaryPlayer");
         val primaryPlayer = plugin.getPlaybackService()?.getPrimaryController()?.player ?: throw Error("PlaybackService not active");
         transferState(primaryPlayer, castPlayer);*/
    }

    // Extra

    private fun transferState(previous: Player, next: Player) {

        // Copy state from primary player
        var playbackPositionMs = C.TIME_UNSET
        var currentItemIndex = C.INDEX_UNSET
        var playWhenReady = false

        val queue = mutableListOf<MediaItem>()
        for (x in 0 until previous.mediaItemCount) {
            queue.add(previous.getMediaItemAt(x));
        }

        if (previous.playbackState != Player.STATE_ENDED) {
            playbackPositionMs = previous.currentPosition
            playWhenReady = previous.playWhenReady
            currentItemIndex = previous.currentMediaItemIndex
            /*if (currentItemIndex != this.currentItemIndex) {
                playbackPositionMs = C.TIME_UNSET
                currentItemIndex = this.currentItemIndex
            }*/
        }
        previous.stop()
        previous.clearMediaItems()

        next.setMediaItems(queue, currentItemIndex, playbackPositionMs)
        next.playWhenReady = true
        next.prepare()
        next.play()
    }

}