package media.bcc.bccm_player

import android.content.Context
import android.util.Log
import androidx.media3.common.*
import androidx.media3.common.C.VIDEO_SCALING_MODE_SCALE_TO_FIT
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.trackselection.DefaultTrackSelector
import androidx.media3.ui.PlayerView
import com.google.android.gms.cast.framework.CastContext
import com.npaw.youbora.lib6.Timer
import com.npaw.youbora.lib6.media3.Media3Adapter
import com.npaw.youbora.lib6.plugin.Options
import com.npaw.youbora.lib6.plugin.Plugin
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import media.bcc.bccm_player.CastMediaItemConverter.Companion.PLAYER_DATA_IS_LIVE
import media.bcc.player.PlaybackPlatformApi
import java.util.*


class ExoPlayerController(private val context: Context) : PlayerController(), PlayerManager.Listener {
    private var playerManager: PlayerManager? = null
    private var castContext: CastContext? = null
    override val id: String = UUID.randomUUID().toString()
    private val trackSelector: DefaultTrackSelector = DefaultTrackSelector(context)
    private val exoPlayer: ExoPlayer = ExoPlayer.Builder(context)
            .setTrackSelector(trackSelector)
            .setAudioAttributes(AudioAttributes.DEFAULT, true)
            .setVideoScalingMode(VIDEO_SCALING_MODE_SCALE_TO_FIT)
            .build()
    override val player: ForwardingPlayer
    private var currentPlayerViewWrapper: BccmPlayerViewWrapper? = null

    private var _currentPlayerView: PlayerView? = null
    private var currentPlayerView: PlayerView?
        get() = _currentPlayerView
        set(value) {
            _currentPlayerView = value
            if (value == null) {
                mainScope.launch {
                    delay(6000)
                    if (_currentPlayerView == null) {
                        setRendererDisabled(true);
                    }
                }
            } else {
                Log.d("bccm", "Enabling video, playerView attached")
                setRendererDisabled(false);
            }
        }

    private val mainScope = CoroutineScope(Dispatchers.Main + SupervisorJob())
    private val youboraPlugin: Plugin

    init {/*
        val df = DefaultRenderersFactory(context).also {
            it.experimentalSetSynchronizeCodecInteractionsWithQueueingEnabled(true);
            it.forceEnableMediaCodecAsynchronousQueueing();
        };*/

        player = BccmForwardingPlayer(this)
        try {
            castContext = CastContext.getSharedInstance(context);
        } catch (e: Exception) {
        }

        val youboraOptions = Options()
        setBasicYouboraOptions(youboraOptions, BccmPlayerPluginSingleton.npawConfigState.value)
        youboraOptions.isAutoDetectBackground = false
        youboraOptions.userObfuscateIp = true
        youboraOptions.isEnabled = false
        youboraOptions.isParseManifest = true
        // app.https missing?

        youboraPlugin = Plugin(youboraOptions, context)
        val adapter = Media3Adapter(exoPlayer);
        youboraPlugin.adapter = adapter;
        player.addListener(this)

        val appConfigState = handleUpdatedAppConfig(BccmPlayerPluginSingleton.appConfigState.value);

        mainScope.launch {
            BccmPlayerPluginSingleton.userState.collect() {
                user ->
                youboraOptions.username = user?.id
                Log.d("bccm", "ExoPlayerController: Setting user in youbora")
            }
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.npawConfigState.collectLatest { setBasicYouboraOptions(youboraPlugin.options, it) }
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.appConfigState.collectLatest { handleUpdatedAppConfig(it) }
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.filter { event -> event is AttachedToActivityEvent}.collect {
                event -> BccmPlayerPluginSingleton.activityState.update { (event as AttachedToActivityEvent).activity }
            }
        }
    }

    override fun stop(reset: Boolean) {
        player.stop()
        if (reset) {
            player.clearMediaItems()
        }
    }

    private fun handleUpdatedAppConfig(appConfigState: PlaybackPlatformApi.AppConfig?) {
        Log.d("bccm", "setting preferred audio and sub lang to: ${appConfigState?.audioLanguage}, ${appConfigState?.subtitleLanguage}")
        player.trackSelectionParameters = trackSelector.parameters.buildUpon()
                .setPreferredAudioLanguage(appConfigState?.audioLanguage)
                .setPreferredTextLanguage(appConfigState?.subtitleLanguage).build()
    }

    private fun setBasicYouboraOptions(options: Options, config: PlaybackPlatformApi.NpawConfig?) {
        options.isEnabled = config != null
        options.accountCode = config?.accountCode
        options.appReleaseVersion = config?.appReleaseVersion
        options.appName = config?.appName
    }

    fun getExoPlayer(): ExoPlayer {
        return exoPlayer;
    }

    private fun setRendererDisabled(isDisabled: Boolean) {
        var indexOfVideoRenderer = -1

        exoPlayer?.let {
            for (i in 0 until it.rendererCount) {
                it.getRenderer(i).state
                if (it.getRendererType(i) == C.TRACK_TYPE_VIDEO) {
                    indexOfVideoRenderer = i
                    break
                }
            }
        } ?: return

        val parametersBuilder = trackSelector.buildUponParameters()
        parametersBuilder.setRendererDisabled(indexOfVideoRenderer, isDisabled)
        trackSelector.setParameters(parametersBuilder)
        Log.d("bccm", if (isDisabled) "Disabled video" else "Enabled video")
    }

    fun takeOwnership(playerView: PlayerView) {
        if (currentPlayerView != null) {
            PlayerView.switchTargetView(player, currentPlayerView, playerView)
        } else {
            playerView.player = player
        }
        currentPlayerView = playerView;
        //setRendererDisabled(false)
    }

    fun takeOwnership(pvWrapper: BccmPlayerViewWrapper) {
        val previousPvWrapper = currentPlayerViewWrapper;
        currentPlayerViewWrapper = pvWrapper;
        val playerView = pvWrapper.getPlayerView()
                ?: throw Error("pvWrapper.getPlayerView() was null");
        val currentPlayerView = previousPvWrapper?.getPlayerView();
        //setRendererDisabled(false)


        playerView.player = player

        //playerManager?.setPlayerView(playerView);
        /*if (currentPlayerView != null) {
            PlayerView.switchTargetView(getPlayer(), currentPlayerView, playerView)
        } else {
            playerView.player = getPlayer()
        }

        pvWrapper.onDispose = {
            if (pvWrapper.isFullscreenPlayer()) {
                previousPvWrapper?.run {
                    //takeOwnership(previousPvWrapper)
                    this.setup()
                };
            } else {
                currentPlayerViewWrapper = null
            }
        }*/

    }

    fun releasePlayerView(playerView: PlayerView) {
        if (currentPlayerView == playerView) {
            //setRendererDisabled(true)
            currentPlayerView = null;
        }
    }

    override fun release() {
        mainScope.cancel()
        exoPlayer.release()
    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        mediaItem?.mediaMetadata?.let { onMediaMetadataChanged(it) }
    }

    override fun onMediaMetadataChanged(mediaMetadata: MediaMetadata) {
        val extras = mediaMetadata.extras?.let { extractExtrasFromAndroid(it) }
        youboraPlugin.options.contentIsLive = extras?.get("npaw.content.isLive")?.toBoolean() ?: extras?.get(PLAYER_DATA_IS_LIVE)?.toBoolean() ?: player.isCurrentMediaItemLive
        youboraPlugin.options.contentId = extras?.get("npaw.content.id") ?: mediaMetadata.extras?.getString("id")
        youboraPlugin.options.contentTitle = extras?.get("npaw.content.title") ?: mediaMetadata.title?.toString() ?: mediaMetadata.displayTitle?.toString()
        youboraPlugin.options.contentTvShow = extras?.get("npaw.content.tvShow")
        youboraPlugin.options.contentSeason = extras?.get("npaw.content.season");
        youboraPlugin.options.contentEpisodeTitle = extras?.get("npaw.content.episodeTitle")
    }

    override fun onQueuePositionChanged(previousIndex: Int, newIndex: Int) {
        if (previousIndex != C.INDEX_UNSET) {

        }
        if (newIndex != C.INDEX_UNSET) {

        }
    }

    override fun onPlaybackStateChanged(playbackState: Int) {
        super.onPlaybackStateChanged(playbackState)
    }

    override fun onUnsupportedTrack(trackType: Int) {
        if (trackType == C.TRACK_TYPE_AUDIO) {

        } else if (trackType == C.TRACK_TYPE_VIDEO) {

        }
    }

    val emitter = object : Emitter {
        override fun onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean) {
            mainScope.launch {
                BccmPlayerPluginSingleton.eventBus.emit(PictureInPictureModeChangedEvent(id, isInPictureInPictureMode))
            }
        }
    }

    interface Emitter {
        fun onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean);
    }
}