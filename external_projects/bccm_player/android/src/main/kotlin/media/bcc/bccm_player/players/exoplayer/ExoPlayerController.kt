package media.bcc.bccm_player.players.exoplayer

import android.content.Context
import android.util.Log
import android.view.WindowManager
import androidx.media3.common.AudioAttributes
import androidx.media3.common.C
import androidx.media3.common.C.VIDEO_SCALING_MODE_SCALE_TO_FIT
import androidx.media3.common.ForwardingPlayer
import androidx.media3.common.MediaItem
import androidx.media3.common.TrackGroup
import androidx.media3.common.TrackSelectionOverride
import androidx.media3.common.Tracks
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.trackselection.DefaultTrackSelector
import androidx.media3.ui.PlayerView
import com.npaw.youbora.lib6.media3.Media3Adapter
import com.npaw.youbora.lib6.plugin.Options
import com.npaw.youbora.lib6.plugin.Plugin
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import media.bcc.bccm_player.BccmPlayerPluginSingleton
import media.bcc.bccm_player.PictureInPictureModeChangedEvent
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi.NpawConfig
import media.bcc.bccm_player.players.PlayerController
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter
import java.util.UUID


class ExoPlayerController(private val context: Context) :
    PlayerController() {
    override val id: String = UUID.randomUUID().toString()
    private val trackSelector: DefaultTrackSelector = DefaultTrackSelector(context)
    private val exoPlayer: ExoPlayer = ExoPlayer.Builder(context)
        .setTrackSelector(trackSelector)
        .setAudioAttributes(AudioAttributes.DEFAULT, true)
        .setVideoScalingMode(VIDEO_SCALING_MODE_SCALE_TO_FIT)
        .build()
    override val player: ForwardingPlayer
    override var currentPlayerViewController: BccmPlayerViewController? = null
    private var textLanguageThatShouldBeSelected: String? = null

    private var _currentPlayerView: PlayerView? = null
    private var currentPlayerView: PlayerView?
        get() = _currentPlayerView
        set(value) {
            _currentPlayerView = value
            if (value == null) {
                mainScope.launch {
                    delay(6000)
                    if (_currentPlayerView == null) {
                        setForceLowestVideoBitrate(true)
                        val activity = BccmPlayerPluginSingleton.activityState.value
                        Log.d("bccm", "FLAG_KEEP_SCREEN_ON cleared")
                        activity?.window?.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
                    }
                }
            } else {
                Log.d("bccm", "Enabling video, playerView attached")
                setForceLowestVideoBitrate(false)
                val activity = BccmPlayerPluginSingleton.activityState.value
                Log.d("bccm", "FLAG_KEEP_SCREEN_ON added")
                activity?.window?.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            }
        }

    private val mainScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    private var youboraPlugin: Plugin? = null

    init {
        player = BccmForwardingPlayer(this)
        player.addListener(this)

        handleUpdatedAppConfig(BccmPlayerPluginSingleton.appConfigState.value)
        BccmPlayerPluginSingleton.npawConfigState.value?.let {
            handleUpdatedNpawConfig(it)
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.npawConfigState.collect {
                handleUpdatedNpawConfig(it)
            }
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.appConfigState.collect { handleUpdatedAppConfig(it) }
        }
    }

    override fun stop(reset: Boolean) {
        player.stop()
        if (reset) {
            player.clearMediaItems()
        }
    }

    private fun handleUpdatedAppConfig(appConfigState: PlaybackPlatformApi.AppConfig?) {
        Log.d(
            "bccm",
            "setting preferred audio and sub lang to: ${appConfigState?.audioLanguage}, ${appConfigState?.subtitleLanguage}"
        )

        player.trackSelectionParameters = trackSelector.parameters.buildUpon()
            .setPreferredAudioLanguage(appConfigState?.audioLanguage)
            .build()

        textLanguageThatShouldBeSelected = appConfigState?.subtitleLanguage
        updateYouboraOptions()
    }

    private fun handleUpdatedNpawConfig(npawConfig: NpawConfig?) {
        if (npawConfig == null) {
            youboraPlugin?.disable()
            return
        }
        if (youboraPlugin != null) {
            youboraPlugin?.enable()
            return
        }
        initYoubora(npawConfig)
    }

    private fun initYoubora(config: NpawConfig) {
        Log.d("bccm", "ExoPlayerController: Initializing youbora")
        val options = Options()
        options.isAutoDetectBackground = false
        options.userObfuscateIp = true
        options.isParseManifest = true
        options.isEnabled = true
        options.accountCode = config.accountCode
        options.appReleaseVersion = config.appReleaseVersion
        options.appName = config.appName
        options.deviceIsAnonymous = config.deviceIsAnonymous ?: false
        youboraPlugin = Plugin(options, context).also {
            it.adapter = Media3Adapter(exoPlayer)
        }
        updateYouboraOptions()
    }

    fun updateYouboraOptions() {
        val youboraPlugin = youboraPlugin ?: return
        Log.d(
            "bccm",
            "ExoPlayerController: Updating youbora options: ${player.mediaMetadata.title}"
        )

        // App config based options
        val appConfig = BccmPlayerPluginSingleton.appConfigState.value
        youboraPlugin.options.username = appConfig?.analyticsId
        youboraPlugin.options.contentCustomDimension1 =
            if (appConfig?.sessionId != null) appConfig.sessionId.toString() else null

        // Metadata options
        val mediaMetadata = player.mediaMetadata
        val extras = mediaMetadata.extras?.let { extractExtrasFromAndroid(it) }
        youboraPlugin.options.contentIsLive = extras?.get("npaw.content.isLive")?.toBoolean()
            ?: extras?.get(CastMediaItemConverter.PLAYER_DATA_IS_LIVE)?.toBoolean()
                    ?: player.isCurrentMediaItemLive
        youboraPlugin.options.contentId = extras?.get("npaw.content.id")
            ?: mediaMetadata.extras?.getString("id")
        youboraPlugin.options.contentTitle = extras?.get("npaw.content.title")
            ?: mediaMetadata.title?.toString() ?: mediaMetadata.displayTitle?.toString()
        youboraPlugin.options.contentTvShow = extras?.get("npaw.content.tvShow")
        youboraPlugin.options.contentSeason = extras?.get("npaw.content.season")
        youboraPlugin.options.contentEpisodeTitle = extras?.get("npaw.content.episodeTitle")
        youboraPlugin.options.contentTransactionCode

        for (t in player.currentTracks.groups) {
            if (!t.isSelected) continue

            if (t.type == C.TRACK_TYPE_TEXT) {
                youboraPlugin.options?.contentSubtitles = t.mediaTrackGroup.getFormat(0).language
            } else if (t.type == C.TRACK_TYPE_AUDIO) {
                youboraPlugin.options?.contentLanguage = t.mediaTrackGroup.getFormat(0).language
            }
        }
    }

    fun getExoPlayer(): ExoPlayer {
        return exoPlayer
    }

    /**
     * This function forces the lowest video bitrate to be used.
     *
     * This was originally a "setRendererDisabled" function.
     * Expected it to stop loading video segments if you disable the renderer,
     * but it doesn't. This is still an open issue: https://github.com/google/ExoPlayer/issues/9282
     */
    private fun setForceLowestVideoBitrate(enabled: Boolean) {
        var indexOfVideoRenderer = -1

        exoPlayer.let {
            for (i in 0 until it.rendererCount) {
                it.getRenderer(i).state
                if (it.getRendererType(i) == C.TRACK_TYPE_VIDEO) {
                    indexOfVideoRenderer = i
                    break
                }
            }
        }

        val parametersBuilder = trackSelector.buildUponParameters()
        parametersBuilder.clearOverridesOfType(C.TRACK_TYPE_VIDEO)

        if (enabled) {
            // Force lowest quality
            val mappedTrackInfo = trackSelector.currentMappedTrackInfo
            val trackGroup = mappedTrackInfo?.getTrackGroups(indexOfVideoRenderer)?.get(0) ?: return
            parametersBuilder.setOverrideForType(
                TrackSelectionOverride(trackGroup, getLowestBitrateTrackIndex(trackGroup))
            )
        }

        trackSelector.setParameters(parametersBuilder)
        Log.d(
            "bccm",
            if (enabled) "Forcing lowest bitrate" else "No longer forcing lowest bitrate"
        )
    }

    private fun getLowestBitrateTrackIndex(trackGroup: TrackGroup): Int {
        var lowestQuality = 0
        var lowestQualityBitrate = Int.MAX_VALUE
        for (trackIndex in 0 until trackGroup.length) {
            val format = trackGroup.getFormat(trackIndex)
            if (format.bitrate < lowestQualityBitrate) {
                lowestQuality = trackIndex
                lowestQualityBitrate = format.bitrate
            }
        }
        return lowestQuality
    }

    fun takeOwnership(playerView: PlayerView, viewController: BccmPlayerViewController) {
        if (currentPlayerView != null && currentPlayerView != playerView) {
            PlayerView.switchTargetView(player, currentPlayerView, playerView)
            currentPlayerViewController?.onOwnershipLost();
        } else {
            playerView.player = player
        }
        currentPlayerView = playerView
        currentPlayerViewController = viewController
        pluginPlayerListener?.onManualPlayerStateUpdate()
    }

    fun releasePlayerView(playerView: PlayerView) {
        if (currentPlayerView == playerView) {
            currentPlayerView = null
            currentPlayerViewController = null
        }
        pluginPlayerListener?.onManualPlayerStateUpdate()
    }

    override fun release() {
        super.release()
        mainScope.cancel()
        pluginPlayerListener?.stop()
        exoPlayer.stop()
        exoPlayer.release()
    }

    override fun onTracksChanged(tracks: Tracks) {
        // We use this callback to set the default language for the subtitles.
        // we only set the default text language once when there is no track selected already and
        // the language is available for the current track.
        val textLanguage = textLanguageThatShouldBeSelected
        if (textLanguage != null && !tracks.groups.any { it.type == C.TRACK_TYPE_TEXT && it.isSelected }) {
            if (setSelectedTrackByLanguage(C.TRACK_TYPE_TEXT, textLanguage, tracks)) {
                textLanguageThatShouldBeSelected = null
            }
        }
        updateYouboraOptions()
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        mediaItem?.mediaMetadata?.let { onMediaMetadataChanged(it) }
    }

    /*override fun onMediaMetadataChanged(mediaMetadata: MediaMetadata) {
        updateYouboraOptions()
    }*/

    val emitter = object : Emitter {
        override fun onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean) {
            mainScope.launch {
                BccmPlayerPluginSingleton.eventBus.emit(
                    PictureInPictureModeChangedEvent(
                        id,
                        isInPictureInPictureMode
                    )
                )
            }
        }
    }

    interface Emitter {
        fun onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean)
    }
}