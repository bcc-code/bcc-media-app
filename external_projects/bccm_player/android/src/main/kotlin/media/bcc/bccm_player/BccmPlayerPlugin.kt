package media.bcc.bccm_player

import android.app.Activity
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.Build
import android.os.IBinder
import android.util.Log
import androidx.media3.session.MediaController
import androidx.media3.session.SessionToken
import com.google.android.gms.cast.framework.CastContext
import com.google.common.util.concurrent.ListenableFuture
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter
import io.flutter.plugin.common.PluginRegistry
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import media.bcc.bccm_player.pigeon.ChromecastControllerPigeon
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi
import media.bcc.bccm_player.pigeon.PlaybackPlatformApi.PlaybackPlatformPigeon
import media.bcc.bccm_player.views.FlutterCastButton
import media.bcc.bccm_player.views.FlutterCastPlayerView
import media.bcc.bccm_player.views.FlutterExoPlayerView

class BccmPlayerPlugin : FlutterPlugin, ActivityAware, PluginRegistry.UserLeaveHintListener {
    companion object {
        private var mBound = false
        private var playbackServiceCompleter = CompletableDeferred<PlaybackService>()
        private val playbackServiceConnection = object : ServiceConnection {
            override fun onServiceConnected(className: ComponentName, binder: IBinder) {
                val boundPlaybackService = (binder as PlaybackService.LocalBinder).getService()
                playbackService = boundPlaybackService;
                playbackServiceCompleter.complete(boundPlaybackService)
            }

            override fun onServiceDisconnected(arg0: ComponentName) {
                playbackService = null
            }
        }
        private var playbackService: PlaybackService? = null
    }

    private var pluginBinding: FlutterPlugin.FlutterPluginBinding? = null
    private lateinit var controllerFuture: ListenableFuture<MediaController>
    private var activity: Activity? = null
    private var activityBinding: ActivityPluginBinding? = null
    private val mainScope = CoroutineScope(Dispatchers.Main)
    var playbackPigeon: PlaybackPlatformApi.PlaybackListenerPigeon? = null
        private set
    var chromecastPigeon: ChromecastControllerPigeon.ChromecastPigeon? = null
        private set

    /***
     * Should be called only by the main flutter isolate. Complete quickly, because this is awaited.
     */
    fun attach() {
        if (playbackService != null) {
            playbackService!!.attachPlugin(this@BccmPlayerPlugin);
        } else {
            Log.d("bccm", "playbackService was null when attach() was run. That's ok.")
            mainScope.launch {
                playbackServiceCompleter.await().attachPlugin(this@BccmPlayerPlugin);
            }
        }
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        // Warning: There can be multiple engines, one per dart isolate, e.g. for background isolates.
        // So we are also doing some steps via PlaybackApiImpl.attach -> attach()
        // which we should only call via the primary flutter dart engine.

        CastContext.getSharedInstance(flutterPluginBinding.applicationContext)

        pluginBinding = flutterPluginBinding
        playbackPigeon =
            PlaybackPlatformApi.PlaybackListenerPigeon(flutterPluginBinding.binaryMessenger)
        chromecastPigeon =
            ChromecastControllerPigeon.ChromecastPigeon(flutterPluginBinding.binaryMessenger)

        if (!mBound) {
            Intent(pluginBinding?.applicationContext, PlaybackService::class.java).also { intent ->
                mBound = pluginBinding?.applicationContext?.bindService(
                    intent, playbackServiceConnection, Context.BIND_AUTO_CREATE
                ) ?: false
            }
        }

        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "bccm-player",
            FlutterExoPlayerView.Factory(this)
        )
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "bccm-cast-player",
            FlutterCastPlayerView.Factory(this)
        )
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "bccm_player/cast_button",
            FlutterCastButton.Factory()
        )
    }


    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Log.d("bccm", "detaching. mBound: $mBound")
        if (mBound && playbackService?.isAttached(this) == true) {
            pluginBinding!!.applicationContext.unbindService(playbackServiceConnection)
            mBound = false
        }

        playbackService?.stopIfAttached(this)
        pluginBinding = null
        mainScope.cancel()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        activityBinding = binding
        activityBinding?.addOnUserLeaveHintListener(this)

        PlaybackPlatformPigeon.setup(pluginBinding!!.binaryMessenger, PlaybackApiImpl(this))

        val sessionToken = SessionToken(
            binding.activity, ComponentName(binding.activity, PlaybackService::class.java)
        )
        controllerFuture = MediaController.Builder(binding.activity, sessionToken).buildAsync()
        mainScope.launch {
            Log.d("bccm", "OnAttachedToActivity")
            BccmPlayerPluginSingleton.activityState.update { binding.activity }
            BccmPlayerPluginSingleton.eventBus.emit(AttachedToActivityEvent(binding.activity))
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.filter { event -> event is PictureInPictureModeChangedEvent }
                .collect { event ->
                    val pipEvent = event as PictureInPictureModeChangedEvent
                    val builder = PlaybackPlatformApi.PictureInPictureModeChangedEvent.Builder()
                    builder.setPlayerId(pipEvent.playerId)
                    builder.setIsInPipMode(pipEvent.isInPictureInPictureMode)
                    playbackPigeon?.onPictureInPictureModeChanged(builder.build()) {}
                }
        }
    }

    fun onStop() {
        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.emit(OnActivityStop())
        }
    }

    fun onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean) {
        val activityBinding = activityBinding ?: return
        val lifecycleState =
            FlutterLifecycleAdapter.getActivityLifecycle(activityBinding).currentState

        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.emit(
                PictureInPictureModeChangedEvent2(isInPictureInPictureMode, lifecycleState)
            )
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        activityBinding?.removeOnUserLeaveHintListener(this)
        mainScope.launch {
            Log.d("bccm", "OnDetachedFromActivity")
            BccmPlayerPluginSingleton.eventBus.emit(DetachedFromActivityEvent())
        }
        MediaController.releaseFuture(controllerFuture)
    }

    fun getPlaybackService(): PlaybackService? {
        return playbackService
    }

    override fun onUserLeaveHint() {
        val currentPlayerViewController =
            playbackService?.getPrimaryController()?.currentPlayerViewController
        if (currentPlayerViewController?.shouldPipAutomatically() == true && Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            currentPlayerViewController.enterPictureInPicture()
        }
    }
}
