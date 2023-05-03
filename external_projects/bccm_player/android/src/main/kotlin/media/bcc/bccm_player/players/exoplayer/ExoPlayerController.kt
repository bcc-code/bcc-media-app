package media.bcc.bccm_player.players.exoplayer

import android.content.Context
import android.util.Log
import android.view.WindowManager
import androidx.media3.common.AudioAttributes
import androidx.media3.common.C
import androidx.media3.common.C.VIDEO_SCALING_MODE_SCALE_TO_FIT
import androidx.media3.common.ForwardingPlayer
import androidx.media3.common.MediaItem
import androidx.media3.common.MediaMetadata
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
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import media.bcc.bccm_player.BccmPlayerPluginSingleton
import media.bcc.bccm_player.PictureInPictureModeChangedEvent
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi
import media.bcc.bccm_player.players.PlayerController
import media.bcc.bccm_player.players.chromecast.CastMediaItemConverter.Companion.PLAYER_DATA_IS_LIVE
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
    override var currentPlayerViewController: ExoPlayerView? = null
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
                        setRendererDisabled(true)
                        val activity = BccmPlayerPluginSingleton.activityState.value
                        Log.d("bccm", "FLAG_KEEP_SCREEN_ON cleared")
                        activity?.window?.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
                    }
                }
            } else {
                Log.d("bccm", "Enabling video, playerView attached")
                setRendererDisabled(false)
                val activity = BccmPlayerPluginSingleton.activityState.value
                Log.d("bccm", "FLAG_KEEP_SCREEN_ON added")
                activity?.window?.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            }
        }

    private val mainScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    private val youboraPlugin: Plugin

    init {
        player = BccmForwardingPlayer(this)

        val youboraOptions = Options()
        youboraOptions.isAutoDetectBackground = false
        youboraOptions.userObfuscateIp = true
        youboraOptions.isEnabled = false
        youboraOptions.isParseManifest = true
        setBasicYouboraOptions(youboraOptions, BccmPlayerPluginSingleton.npawConfigState.value)

        youboraPlugin = Plugin(youboraOptions, context)
        val adapter = Media3Adapter(exoPlayer)
        youboraPlugin.adapter = adapter
        player.addListener(this)

        handleUpdatedAppConfig(BccmPlayerPluginSingleton.appConfigState.value)
        mainScope.launch {
            BccmPlayerPluginSingleton.npawConfigState.collectLatest {
                setBasicYouboraOptions(
                    youboraPlugin.options,
                    it
                )
            }
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.appConfigState.collectLatest { handleUpdatedAppConfig(it) }
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

        textLanguageThatShouldBeSelected = appConfigState?.subtitleLanguage

        youboraPlugin.options.username = appConfigState?.analyticsId
        youboraPlugin.options.contentCustomDimension1 =
            if (appConfigState?.sessionId != null) appConfigState.sessionId.toString() else null
    }

    private fun setBasicYouboraOptions(options: Options, config: PlaybackPlatformApi.NpawConfig?) {
        options.isEnabled = config != null
        options.accountCode = config?.accountCode
        options.appReleaseVersion = config?.appReleaseVersion
        options.appName = config?.appName
    }

    fun getExoPlayer(): ExoPlayer {
        return exoPlayer
    }

    private fun setRendererDisabled(isDisabled: Boolean) {
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
        parametersBuilder.setRendererDisabled(indexOfVideoRenderer, isDisabled)
        trackSelector.setParameters(parametersBuilder)
        Log.d("bccm", if (isDisabled) "Disabled video" else "Enabled video")
    }

    fun takeOwnership(playerView: PlayerView, viewController: ExoPlayerView) {
        if (currentPlayerView != null) {
            PlayerView.switchTargetView(player, currentPlayerView, playerView)
        } else {
            playerView.player = player
        }
        currentPlayerView = playerView
        currentPlayerViewController = viewController
    }

    fun releasePlayerView(playerView: PlayerView) {
        if (currentPlayerView == playerView) {
            currentPlayerView = null
            currentPlayerViewController = null
        }
    }

    override fun release() {
        super.release()
        mainScope.cancel()
        pluginPlayerListener?.stop()
        exoPlayer.stop()
        exoPlayer.release()
    }

    override fun onTracksChanged(tracks: Tracks) {
        setDefaultTextTrack(tracks)

        for (t in tracks.groups) {
            if (!t.isSelected) continue

            if (t.type == C.TRACK_TYPE_TEXT) {
                youboraPlugin.options.contentSubtitles = t.mediaTrackGroup.getFormat(0).language
            } else if (t.type == C.TRACK_TYPE_AUDIO) {
                youboraPlugin.options.contentLanguage = t.mediaTrackGroup.getFormat(0).language
            }
        }
    }

    /**
     * ExoPlayers `setPreferredTextLanguage` makes it impossible to
     * disable the subtitle.
     *
     * Instead of `setPreferredLanguage` we force the text track to default languag (from settings)
     * once. This method handles this behavior.
     */
    private fun setDefaultTextTrack(tracks: Tracks) {
        if (textLanguageThatShouldBeSelected == null) {
            return
        }

        val track = tracks.groups.firstOrNull {
            it.type == C.TRACK_TYPE_TEXT
                    && it.mediaTrackGroup.length > 0
                    && it.mediaTrackGroup.getFormat(0).language == textLanguageThatShouldBeSelected
        }

        if (track != null && !tracks.groups.any { it.type == C.TRACK_TYPE_TEXT && it.isSelected }) {
            player.trackSelectionParameters = player.trackSelectionParameters
                .buildUpon()
                .clearOverridesOfType(C.TRACK_TYPE_TEXT)
                .setOverrideForType(TrackSelectionOverride(track.mediaTrackGroup, 0))
                .build()

            textLanguageThatShouldBeSelected = null
        }
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        mediaItem?.mediaMetadata?.let { onMediaMetadataChanged(it) }
    }

    override fun onMediaMetadataChanged(mediaMetadata: MediaMetadata) {
        val extras = mediaMetadata.extras?.let { extractExtrasFromAndroid(it) }
        youboraPlugin.options.contentIsLive = extras?.get("npaw.content.isLive")?.toBoolean()
            ?: extras?.get(PLAYER_DATA_IS_LIVE)?.toBoolean() ?: player.isCurrentMediaItemLive
        youboraPlugin.options.contentId = extras?.get("npaw.content.id")
            ?: mediaMetadata.extras?.getString("id")
        youboraPlugin.options.contentTitle = extras?.get("npaw.content.title")
            ?: mediaMetadata.title?.toString() ?: mediaMetadata.displayTitle?.toString()
        youboraPlugin.options.contentTvShow = extras?.get("npaw.content.tvShow")
        youboraPlugin.options.contentSeason = extras?.get("npaw.content.season")
        youboraPlugin.options.contentEpisodeTitle = extras?.get("npaw.content.episodeTitle")
    }

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