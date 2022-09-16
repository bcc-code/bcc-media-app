package media.bcc.bccm_player

import android.content.Context
import android.util.Log
import androidx.media3.common.*
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.trackselection.DefaultTrackSelector
import com.google.android.gms.cast.framework.CastContext
import com.npaw.youbora.lib6.exoplayer2.Exoplayer2Adapter
import com.npaw.youbora.lib6.plugin.Options
import com.npaw.youbora.lib6.plugin.Plugin
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
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
            .build()
    override val player: ForwardingPlayer
    private var currentPlayerViewWrapper: BccmPlayerViewWrapper? = null
    var isLive: Boolean = false
        private set
    private val ioScope = CoroutineScope(Dispatchers.IO + SupervisorJob())
    private val youboraPlugin: Plugin
    private val flows = mutableListOf<Flow<Any>>()

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
        val adapter = Exoplayer2Adapter(exoPlayer);
        youboraPlugin.adapter = adapter;
        player.addListener(this)

        ioScope.launch {
            BccmPlayerPluginSingleton.userState.collect() {
                user ->
                youboraOptions.username = user?.id
                Log.d("bccm", "ExoPlayerController: Setting user in youbora")
            }
        }
        ioScope.launch {
            BccmPlayerPluginSingleton.npawConfigState.collectLatest { setBasicYouboraOptions(youboraPlugin.options, it) }
        }
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

    fun setRendererDisabled(isDisabled: Boolean) {
        var indexOfVideoRenderer = -1

        exoPlayer?.let {
            for (i in 0 until it.rendererCount) {
                if (it.getRendererType(i) == C.TRACK_TYPE_VIDEO) {
                    indexOfVideoRenderer = i
                    break
                }
            }
        } ?: return

        val parametersBuilder = trackSelector.buildUponParameters()
        parametersBuilder.setRendererDisabled(indexOfVideoRenderer, isDisabled)
        trackSelector.setParameters(parametersBuilder)
    }

    fun takeOwnership(pvWrapper: BccmPlayerViewWrapper) {
        val previousPvWrapper = currentPlayerViewWrapper;
        currentPlayerViewWrapper = pvWrapper;
        val playerView = pvWrapper.getPlayerView()
                ?: throw Error("pvWrapper.getPlayerView() was null");
        val currentPlayerView = previousPvWrapper?.getPlayerView();
        setRendererDisabled(false)


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

    fun releasePlayerView(pvWrapper: BccmPlayerViewWrapper) {
        if (currentPlayerViewWrapper == pvWrapper) {
            setRendererDisabled(true)
            currentPlayerViewWrapper = null;
        }
    }

    override fun release() {
        ioScope.cancel()
        exoPlayer.release()
    }

    override fun onPositionDiscontinuity(oldPosition: Player.PositionInfo, newPosition: Player.PositionInfo, reason: Int) {

    }

    override fun onIsPlayingChanged(isPlaying: Boolean) {

    }

    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        mediaItem?.mediaMetadata?.let { onMediaMetadataChanged(it) }
    }

    override fun onMediaMetadataChanged(mediaMetadata: MediaMetadata) {
        val extras = mediaMetadata.extras?.let { extractExtrasFromAndroid(it) }
        youboraPlugin.options.contentIsLive = extras?.get("npaw.content.isLive")?.toBoolean() ?: player.isCurrentMediaItemLive
        youboraPlugin.options.contentId = extras?.get("npaw.content.id") ?: mediaMetadata.extras?.getString("identifier")
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

    override fun onUnsupportedTrack(trackType: Int) {
        if (trackType == C.TRACK_TYPE_AUDIO) {

        } else if (trackType == C.TRACK_TYPE_VIDEO) {

        }
    }
}