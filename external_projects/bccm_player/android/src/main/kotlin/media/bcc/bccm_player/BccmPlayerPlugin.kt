package media.bcc.bccm_player

import android.app.Activity
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.content.pm.ActivityInfo
import android.os.IBinder
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.FrameLayout
import android.widget.LinearLayout
import androidx.annotation.NonNull
import androidx.media3.session.MediaController
import androidx.media3.session.SessionToken
import androidx.mediarouter.app.MediaRouteButton
import com.google.android.gms.cast.framework.CastButtonFactory
import com.google.android.gms.cast.framework.CastContext
import com.google.common.util.concurrent.ListenableFuture
import com.google.common.util.concurrent.MoreExecutors

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import media.bcc.player.ChromecastControllerPigeon
import media.bcc.player.PlaybackPlatformApi.PlaybackPlatformPigeon

/** BccmPlayerPlugin */
class BccmPlayerPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var pluginBinding: FlutterPlugin.FlutterPluginBinding? = null
  private lateinit var controllerFuture: ListenableFuture<MediaController>
  private var playbackService: PlaybackService? = null
  private var playbackServiceFuture: ListenableFuture<PlaybackService>? = null
  private var mBound: Boolean = false
  private var activity: Activity? = null
  private var castController: CastController? = null

  private val playbackServiceConnection = object : ServiceConnection {
    override fun onServiceConnected(className: ComponentName, binder: IBinder) {
      // We've bound to LocalService, cast the IBinder and get LocalService instance
      playbackService = (binder as PlaybackService.LocalBinder).getService()
      pluginBinding!!
              .platformViewRegistry
              .registerViewFactory("bccm-player", PlayerPlatformViewFactory(activity!!, playbackService))
      mBound = true
    }
    override fun onServiceDisconnected(arg0: ComponentName) {
      mBound = false
    }
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    pluginBinding = flutterPluginBinding
    flutterPluginBinding
            .platformViewRegistry
            .registerViewFactory("bccm_player/cast_button", FLCastButtonFactory())

    val castContext = CastContext.getSharedInstance(flutterPluginBinding.applicationContext);
    val pigeon = ChromecastControllerPigeon.ChromecastPigeon(flutterPluginBinding.binaryMessenger)
    castController = CastController(castContext, pigeon, this)
    castContext.sessionManager.addSessionManagerListener(castController!!)
    pluginBinding!!
            .platformViewRegistry
            .registerViewFactory("bccm-cast-player", BccmCastPlayerViewFactory(castController!!))
  }


  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    Intent(binding.applicationContext, PlaybackService::class.java).also { intent ->
      binding.applicationContext.stopService(intent)
    }
    pluginBinding = null
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity

    PlaybackPlatformPigeon.setup(pluginBinding!!.binaryMessenger, PlaybackApiImpl(this))
    channel = MethodChannel(pluginBinding!!.binaryMessenger, "bccm_player")
    channel.setMethodCallHandler(this)

    // Bind to LocalService
    Intent(binding.activity, PlaybackService::class.java).also { intent ->
      binding.activity.bindService(intent, playbackServiceConnection, Context.BIND_AUTO_CREATE)
    }

    val sessionToken = SessionToken(binding.activity, ComponentName(binding.activity, PlaybackService::class.java))
    controllerFuture = MediaController.Builder(binding.activity, sessionToken).buildAsync()
    controllerFuture.addListener({
        1;
      }, MoreExecutors.directExecutor()
    )
  }

  override fun onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity()
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding)
  }

  override fun onDetachedFromActivity() {

    channel.setMethodCallHandler(null)
    pluginBinding!!.applicationContext.unbindService(playbackServiceConnection)
    MediaController.releaseFuture(controllerFuture)
    mBound = false
  }

  fun getPlaybackService(): PlaybackService? {
    return playbackService;
  }

  fun getCastController(): CastController? {
    return castController;
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    val pbService = playbackService
            ?: return result.error("playbackServiceIsNull", "playbackService is null", "playbackService is null");
    when (call.method) {
      "set_url" -> {
        val args = call.arguments as HashMap<*, *>
        val playerId = args["player_id"] as String;
        val url = args["url"] as String? ?: throw Error("Url cannot be empty");
        val isLive = args["is_live"] as Boolean?;
        val playerController = pbService.getController(playerId) ?: throw Error("Player with id $playerId does not exist.")

        playerController.playWithUrl(url, isLive ?: false)
      }
      "set_primary" -> {
        val args = call.arguments as HashMap<*, *>
        val playerId = args["player_id"] as String;

        pbService.setPrimary(playerId)
        result.success(true)
      }
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
}
