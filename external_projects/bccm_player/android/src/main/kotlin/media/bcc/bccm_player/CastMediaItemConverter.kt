package media.bcc.bccm_player

import android.os.Bundle
import android.util.Log
import androidx.media3.cast.MediaItemConverter
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
import androidx.media3.common.MimeTypes
import androidx.media3.common.util.Assertions
import androidx.media3.common.util.UnstableApi
import com.google.android.gms.cast.MediaInfo
import com.google.android.gms.cast.MediaQueueItem
import com.google.android.gms.common.images.WebImage
import com.npaw.youbora.lib6.extensions.toMap
import org.json.JSONException
import org.json.JSONObject

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */ /** Default [MediaItemConverter] implementation.  */

internal class PlayerData {
    var isLive: Boolean? = null
    var mimeType: String? = null
}
@UnstableApi
class CastMediaItemConverter : MediaItemConverter {
    override fun toMediaItem(mediaQueueItem: MediaQueueItem): MediaItem {
        val mediaInfo = mediaQueueItem.media
        Assertions.checkNotNull(mediaInfo)
        val metadataBuilder = MediaMetadata.Builder()
        val metadata = mediaInfo!!.metadata
        if (metadata != null) {
            if (metadata.containsKey(com.google.android.gms.cast.MediaMetadata.KEY_TITLE)) {
                metadataBuilder.setTitle(metadata.getString(com.google.android.gms.cast.MediaMetadata.KEY_TITLE))
            }
            if (metadata.containsKey(com.google.android.gms.cast.MediaMetadata.KEY_SUBTITLE)) {
                metadataBuilder.setSubtitle(metadata.getString(com.google.android.gms.cast.MediaMetadata.KEY_SUBTITLE))
            }
            if (metadata.containsKey(com.google.android.gms.cast.MediaMetadata.KEY_ARTIST)) {
                metadataBuilder.setArtist(metadata.getString(com.google.android.gms.cast.MediaMetadata.KEY_ARTIST))
            }
            if (metadata.containsKey(com.google.android.gms.cast.MediaMetadata.KEY_ALBUM_ARTIST)) {
                metadataBuilder.setAlbumArtist(metadata.getString(com.google.android.gms.cast.MediaMetadata.KEY_ALBUM_ARTIST))
            }
            if (metadata.containsKey(com.google.android.gms.cast.MediaMetadata.KEY_ALBUM_TITLE)) {
                metadataBuilder.setArtist(metadata.getString(com.google.android.gms.cast.MediaMetadata.KEY_ALBUM_TITLE))
            }
            if (metadata.images.isNotEmpty()) {
                metadataBuilder.setArtworkUri(metadata.images[0].url)
            }
            if (metadata.containsKey(com.google.android.gms.cast.MediaMetadata.KEY_COMPOSER)) {
                metadataBuilder.setComposer(metadata.getString(com.google.android.gms.cast.MediaMetadata.KEY_COMPOSER))
            }
            if (metadata.containsKey(com.google.android.gms.cast.MediaMetadata.KEY_DISC_NUMBER)) {
                metadataBuilder.setDiscNumber(metadata.getInt(com.google.android.gms.cast.MediaMetadata.KEY_DISC_NUMBER))
            }
            if (metadata.containsKey(com.google.android.gms.cast.MediaMetadata.KEY_TRACK_NUMBER)) {
                metadataBuilder.setTrackNumber(metadata.getInt(com.google.android.gms.cast.MediaMetadata.KEY_TRACK_NUMBER))
            }
            if (metadata.containsKey(BCCM_EXTRAS)) {
                val rawJson = metadata.getString(BCCM_EXTRAS)
                Utils.jsonStringToBundle(rawJson)?.let {
                    metadataBuilder.setExtras(it)
                }
            }
        }

        var extrasBundle = Bundle()
        mediaQueueItem.media?.customData?.getJSONObject(MEDIA_METADATA_EXTRAS)?.let { json ->
            jsonToBundle(json)?.let { bundle ->
                extrasBundle = bundle
            }
        }
        val playerData = extractPlayerData(metadata)
        playerData?.isLive?.let { isLive ->
            extrasBundle.putString(PLAYER_DATA_IS_LIVE, if(isLive) "true" else "false")
        }
        playerData?.mimeType?.let { mimeType ->
            extrasBundle.putString(PLAYER_DATA_MIME_TYPE, mimeType)
        }

        metadataBuilder.setExtras(extrasBundle)

        val mediaItemBuilder = MediaItem.Builder()
        playerData?.mimeType?.let {
            mediaItemBuilder.setMimeType(it)
        }
        return mediaItemBuilder
                .setMediaMetadata(metadataBuilder.build())
                .setUri(mediaQueueItem.media?.contentId ?: mediaQueueItem.media!!.contentUrl)
                .build()
    }

    private fun extractPlayerData(metadata: com.google.android.gms.cast.MediaMetadata?): PlayerData? {
        if (metadata == null) return null
        var playerData: PlayerData? = null
        // Example: media.bcc.player.is_live
        for (key in metadata.keySet().filter { it.contains(BCCM_PLAYER_DATA) }) {
            if (playerData == null) playerData = PlayerData()
            if (key == PLAYER_DATA_IS_LIVE) {
                playerData.isLive = metadata.getString(key) == "true"
            }
            if (key == PLAYER_DATA_MIME_TYPE) {
                playerData.mimeType = metadata.getString(key)
            }
        }
        return playerData
    }

    private fun extractPlayerData(extras: Bundle?): PlayerData? {
        if (extras == null) return null
        var playerData: PlayerData? = null
        // Example: media.bcc.player.is_live
        for (key in extras.keySet().filter { it.contains(BCCM_PLAYER_DATA) }) {
            if (playerData == null) playerData = PlayerData()
            if (key == PLAYER_DATA_IS_LIVE) {
                playerData.isLive = extras.getString(key) == "true"
            }
            if (key == PLAYER_DATA_MIME_TYPE) {
                playerData.mimeType = extras.getString(key)
            }
        }
        return playerData
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

        val playerData = extractPlayerData(mediaItem.mediaMetadata.extras)
        playerData?.isLive?.let { isLive ->
            metadata.putString(PLAYER_DATA_IS_LIVE, if(isLive) "true" else "false")
        }
        playerData?.mimeType?.let { mimeType ->
            metadata.putString(PLAYER_DATA_MIME_TYPE, mimeType)
        }

        val customData = getCustomData(mediaItem)
        val audioTracks = mutableListOf<String>()
        val subtitlesTracks = mutableListOf<String>()
        val appConfig = BccmPlayerPluginSingleton.appConfigState.value
        appConfig?.audioLanguage?.let {
            audioTracks.add(it)
        }
        appConfig?.subtitleLanguage?.let {
            subtitlesTracks.add(it)
        }
        customData.put("audioTracks", audioTracks)
        customData.put("subtitlesTracks", subtitlesTracks)
        val normalExtras = mediaItem.mediaMetadata.extras?.toMap()?.filter{ !it.key.contains(BCCM_PLAYER_DATA) };
        normalExtras?.let {
            customData.put(MEDIA_METADATA_EXTRAS, mapToJson(it))
        }

        Log.d("bccm", "this is the customdata: $customData")


        val contentUrl = mediaItem.localConfiguration?.uri.toString()
        val contentId = if (mediaItem.mediaId == MediaItem.DEFAULT_MEDIA_ID) contentUrl else mediaItem.mediaId
        val mediaInfo = MediaInfo.Builder(contentId)
                .setStreamType(if(playerData?.isLive == true) MediaInfo.STREAM_TYPE_LIVE else MediaInfo.STREAM_TYPE_BUFFERED)
                .setContentType(playerData?.mimeType ?: mediaItem.localConfiguration?.mimeType ?: "application/x-mpegURL")
                .setContentUrl(contentUrl)
                .setMetadata(metadata)
                .setCustomData(customData)
                .build()
        return MediaQueueItem.Builder(mediaInfo).build()
    }

    companion object {
        const val KEY_MEDIA_ITEM = "mediaItem"
        const val KEY_PLAYER_CONFIG = "exoPlayerConfig"
        const val KEY_MEDIA_ID = "mediaId"
        const val KEY_URI = "uri"
        const val KEY_TITLE = "title"
        const val KEY_MIME_TYPE = "mimeType"
        const val KEY_DRM_CONFIGURATION = "drmConfiguration"
        const val KEY_UUID = "uuid"
        const val KEY_LICENSE_URI = "licenseUri"
        const val KEY_REQUEST_HEADERS = "requestHeaders"
        const val MEDIA_METADATA_EXTRAS = "media_metadata_extras"
        const val BCCM_PLAYER_DATA = "media.bcc.player"
        const val BCCM_EXTRAS = "media.bcc.extras"
        const val PLAYER_DATA_IS_LIVE = "$BCCM_PLAYER_DATA.is_live"
        const val PLAYER_DATA_MIME_TYPE = "$BCCM_PLAYER_DATA.mime_type"

        @Throws(JSONException::class)
        fun jsonToBundle(jsonObject: JSONObject): Bundle? {
            val bundle = Bundle()
            val iter: Iterator<*> = jsonObject.keys()
            while (iter.hasNext()) {
                val key = iter.next() as String
                val value = jsonObject.getString(key)
                bundle.putString(key, value)
            }
            return bundle
        }

        // Serialization.
        private fun getCustomData(mediaItem: MediaItem): JSONObject {
            val json = JSONObject()
            try {
                json.put(KEY_MEDIA_ITEM, getMediaItemJson(mediaItem))
                val playerConfigJson: JSONObject? = getPlayerConfigJson(mediaItem)
                if (playerConfigJson != null) {
                    json.put(KEY_PLAYER_CONFIG, playerConfigJson)
                }
            } catch (e: JSONException) {
                throw RuntimeException(e)
            }
            return json
        }

        @Throws(JSONException::class)
        fun getMediaItemJson(mediaItem: MediaItem): JSONObject {
            Assertions.checkNotNull(mediaItem.localConfiguration)
            val json = JSONObject()
            json.put(KEY_MEDIA_ID, mediaItem.mediaId)
            json.put(KEY_TITLE, mediaItem.mediaMetadata.title)
            json.put(KEY_URI, mediaItem.localConfiguration!!.uri.toString())
            json.put(KEY_MIME_TYPE, mediaItem.localConfiguration!!.mimeType)
            if (mediaItem.localConfiguration?.drmConfiguration != null) {
                json.put(
                        KEY_DRM_CONFIGURATION,
                        getDrmConfigurationJson(mediaItem.localConfiguration!!.drmConfiguration!!))
            }
            return json
        }

        private fun mapToJson(map: Map<String, Any>): JSONObject {
            val json = JSONObject();
            for (kv in map) {
                try {
                    json.put(kv.key, JSONObject.wrap(kv.value))
                } catch (e: JSONException) {
                    //Handle exception here
                }
            }
            return json
        }

        @Throws(JSONException::class)
        private fun getDrmConfigurationJson(drmConfiguration: MediaItem.DrmConfiguration): JSONObject {
            val json = JSONObject()
            json.put(KEY_UUID, drmConfiguration.scheme)
            json.put(KEY_LICENSE_URI, drmConfiguration.licenseUri)
            json.put(KEY_REQUEST_HEADERS, JSONObject(drmConfiguration.licenseRequestHeaders.toMap()))
            return json
        }

        @Throws(JSONException::class)
        private fun getPlayerConfigJson(mediaItem: MediaItem): JSONObject? {
            if (mediaItem.localConfiguration == null
                    || mediaItem.localConfiguration!!.drmConfiguration == null) {
                return null
            }
            val drmConfiguration = mediaItem.localConfiguration!!.drmConfiguration
            val drmScheme: String = if (C.WIDEVINE_UUID == drmConfiguration!!.scheme) {
                "widevine"
            } else if (C.PLAYREADY_UUID == drmConfiguration.scheme) {
                "playready"
            } else {
                return null
            }
            val playerConfigJson = JSONObject()
            playerConfigJson.put("withCredentials", false)
            playerConfigJson.put("protectionSystem", drmScheme)
            if (drmConfiguration.licenseUri != null) {
                playerConfigJson.put("licenseUrl", drmConfiguration.licenseUri)
            }
            if (!drmConfiguration.licenseRequestHeaders.isEmpty()) {
                playerConfigJson.put("headers", JSONObject(drmConfiguration.licenseRequestHeaders.toMap()))
            }
            return playerConfigJson
        }
    }
}