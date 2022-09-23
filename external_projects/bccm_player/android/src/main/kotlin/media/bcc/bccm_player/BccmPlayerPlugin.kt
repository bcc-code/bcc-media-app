package media.bcc.bccm_player

import android.app.Activity
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.content.pm.ActivityInfo
import android.os.IBinder
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.FrameLayout
import androidx.annotation.NonNull
import androidx.media3.session.MediaController
import androidx.media3.session.SessionToken
import com.google.android.gms.cast.framework.CastContext
import com.google.common.util.concurrent.ListenableFuture
import com.google.common.util.concurrent.MoreExecutors
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import media.bcc.player.ChromecastControllerPigeon
import media.bcc.player.PlaybackPlatformApi
import media.bcc.player.PlaybackPlatformApi.PlaybackPlatformPigeon


interface BccmPlayerPluginEvent {

}

class AttachedToActivityEvent(val activity: Activity) : BccmPlayerPluginEvent {}
class DetachedFromActivityEvent() : BccmPlayerPluginEvent {}
class PictureInPictureModeChangedEvent(val playerId: String, val isInPictureInPictureMode: Boolean) : BccmPlayerPluginEvent {}
class User(val id: String?);

object BccmPlayerPluginSingleton {

    val activityState = MutableStateFlow<Activity?>(null);
    val npawConfigState = MutableStateFlow<PlaybackPlatformApi.NpawConfig?>(null);
    val userState = MutableStateFlow<User?>(null);
    val eventBus = MutableSharedFlow<BccmPlayerPluginEvent>();
    private val mainScope = CoroutineScope(Dispatchers.Main + Job())

    init {
        Log.d("bccm","bccmdebug: created BccmPlayerPluginSingleton")
        mainScope.launch { keepTrackOfActivity() }
    }

    private suspend fun keepTrackOfActivity() {
        eventBus.filter { event -> event is AttachedToActivityEvent}.collect {
            event -> activityState.update { (event as AttachedToActivityEvent).activity }
        }
    }
}

/** BccmPlayerPlugin */
class BccmPlayerPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var pluginBinding: FlutterPlugin.FlutterPluginBinding? = null
    private lateinit var controllerFuture: ListenableFuture<MediaController>
    private var playbackService: PlaybackService? = null
    private var playbackServiceFuture: ListenableFuture<PlaybackService>? = null
    private var mBound: Boolean = false
    private var activity: Activity? = null
    private var activityBinding: ActivityPluginBinding? = null
    private var castController: CastPlayerController? = null
    private val mainScope = CoroutineScope(Dispatchers.Main)
    var playbackPigeon: PlaybackPlatformApi.PlaybackListenerPigeon? = null
        private set

    private val playbackServiceConnection = object : ServiceConnection {
        override fun onServiceConnected(className: ComponentName, binder: IBinder) {
            // We've bound to LocalService, cast the IBinder and get LocalService instance
            playbackService = (binder as PlaybackService.LocalBinder).getService()
            if (castController != null) {
                playbackService?.addController(castController!!)
            }
            pluginBinding!!
                    .platformViewRegistry
                    .registerViewFactory("bccm-player", PlayerPlatformViewFactory(activity!!, playbackService))
        }

        override fun onServiceDisconnected(arg0: ComponentName) {

        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        pluginBinding = flutterPluginBinding
        playbackPigeon = PlaybackPlatformApi.PlaybackListenerPigeon(flutterPluginBinding.binaryMessenger)

        var castContext: CastContext? = null
        try {
            castContext = CastContext.getSharedInstance(flutterPluginBinding.applicationContext);
            val ccPigeon = ChromecastControllerPigeon.ChromecastPigeon(flutterPluginBinding.binaryMessenger)
            castController = CastPlayerController(castContext, ccPigeon, this)
            castContext.sessionManager.addSessionManagerListener(castController!!)
            flutterPluginBinding
                    .platformViewRegistry
                    .registerViewFactory("bccm-cast-player", BccmCastPlayerViewFactory(castController!!))
        } catch (e: Exception) {
            //TODO: log exception

            flutterPluginBinding
                    .platformViewRegistry
                    .registerViewFactory("bccm-cast-player", EmptyViewFactory())
        }
        flutterPluginBinding
                .platformViewRegistry
                .registerViewFactory("bccm_player/cast_button", FLCastButtonFactory())
    }


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        Intent(binding.applicationContext, PlaybackService::class.java).also { intent ->
            binding.applicationContext.stopService(intent)
        }
        pluginBinding = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        activityBinding = binding
        activityBinding?.addActivityResultListener(this)

        PlaybackPlatformPigeon.setup(pluginBinding!!.binaryMessenger, PlaybackApiImpl(this))
        channel = MethodChannel(pluginBinding!!.binaryMessenger, "bccm_player")
        channel.setMethodCallHandler(this)

        // Bind to LocalService
        Intent(binding.activity, PlaybackService::class.java).also { intent ->
            mBound = binding.activity.bindService(intent, playbackServiceConnection, Context.BIND_AUTO_CREATE)
        }

        val sessionToken = SessionToken(binding.activity, ComponentName(binding.activity, PlaybackService::class.java))
        controllerFuture = MediaController.Builder(binding.activity, sessionToken).buildAsync()
        controllerFuture.addListener({
            1;
        }, MoreExecutors.directExecutor()
        )

        mainScope.launch {
            Log.d("bccm","OnAttachedToActivity")
            BccmPlayerPluginSingleton.eventBus.emit(AttachedToActivityEvent(binding.activity))
        }
        mainScope.launch {
            BccmPlayerPluginSingleton.eventBus.filter { event -> event is PictureInPictureModeChangedEvent}.collect {
                event ->
                val event = event as PictureInPictureModeChangedEvent
                var builder = PlaybackPlatformApi.PictureInPictureModeChangedEvent.Builder()
                builder.setPlayerId(event.playerId)
                builder.setIsInPipMode(event.isInPictureInPictureMode)
                playbackPigeon?.onPictureInPictureModeChanged(builder.build()) {}
            }
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        activityBinding?.removeActivityResultListener(this);
        mainScope.launch {
            Log.d("bccm","OnDetachedFromActivity")
            BccmPlayerPluginSingleton.eventBus.emit(DetachedFromActivityEvent())
        }
        channel.setMethodCallHandler(null)
        if (mBound) {
            pluginBinding!!.applicationContext.unbindService(playbackServiceConnection)
            mBound = false
        }
        MediaController.releaseFuture(controllerFuture)
    }

    fun getPlaybackService(): PlaybackService? {
        return playbackService;
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val pbService = playbackService
                ?: return result.error("playbackServiceIsNull", "playbackService is null", "playbackService is null");
        when (call.method) {
            "open" -> {
                activity!!.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
                val args = call.arguments as HashMap<String, String>
                val url = args["url"]!!;

                val rootLayout: FrameLayout = activity!!.window.decorView.findViewById<View>(R.id.content) as FrameLayout
                val bccmPlayerView = BccmPlayerViewWrapper(activity!!, playbackService!!, activity!!, url)
                rootLayout.addView(bccmPlayerView.view)

                val exitBtn = Button(activity)
                exitBtn.text = "Exit"
                exitBtn.layoutParams = ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
                exitBtn.setOnClickListener {
                    channel.invokeMethod("closingFullscreen", null);
                    activity!!.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED
                    rootLayout.removeView(bccmPlayerView.view)
                }
                rootLayout.addView(exitBtn)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        // TODO: broadcast event, and listen from any playerview with same ID??? something like that
        // nahhh it only needs to be that calling one that needs to listen, i think
        // requestCode: 1, resultCode : 0, data : null

        return false;
    }
}
