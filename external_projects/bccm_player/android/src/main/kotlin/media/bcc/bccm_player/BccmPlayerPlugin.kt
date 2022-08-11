package media.bcc.bccm_player

import android.R
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
import androidx.annotation.NonNull
import androidx.media3.session.MediaController
import androidx.media3.session.SessionToken
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

/** BccmPlayerPlugin */
class BccmPlayerPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var pluginBinding: FlutterPlugin.FlutterPluginBinding? = null
  private lateinit var controllerFuture: ListenableFuture<MediaController>
  private var binaryMessenger: BinaryMessenger? = null
  private var playbackService: PlaybackService? = null
  private var playbackServiceFuture: ListenableFuture<PlaybackService>? = null
  private var mBound: Boolean = false
  private var activity: Activity? = null

  private val connection = object : ServiceConnection {
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
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (playbackService == null) {
      return result.error("playbackServiceIsNull", "playbackService is null", "playbackService is null");
    }
    when (call.method) {
      "new_player" -> {
        val args = call.arguments as HashMap<*, *>
        val url = args["url"] as String;

        val playerController = playbackService!!.newPlayer()
        playerController.playWithUrl(url)
        result.success(playerController.id)
      }
      "set_primary" -> {
        val args = call.arguments as HashMap<*, *>
        val playerId = args["player_id"] as String;

        playbackService!!.setPrimary(playerId)
        result.success(true)
      }
      "open" -> {

        activity!!.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
        val args = call.arguments as HashMap<String, String>
        val url = args["url"]!!;

        val rootLayout: FrameLayout = activity!!.window.decorView.findViewById<View>(R.id.content) as FrameLayout
        val bccmPlayerView = BccmPlayerView(activity!!, playbackService!!, activity!!, url)
        rootLayout.addView(bccmPlayerView.view)

        val exitBtn = Button(activity)
        exitBtn.text = "Exit"
        exitBtn.layoutParams = ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        exitBtn.setOnClickListener {
          channel.invokeMethod("closingFullscreen", null);
          activity!!.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
          rootLayout.removeView(bccmPlayerView.view)
        }
        rootLayout.addView(exitBtn)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    Intent(binding.applicationContext, PlaybackService::class.java).also { intent ->
      binding.applicationContext.stopService(intent)
    }
    pluginBinding = null
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity

    channel = MethodChannel(pluginBinding!!.binaryMessenger, "bccm_player")
    channel.setMethodCallHandler(this)

    // Bind to LocalService
    Intent(binding.activity, PlaybackService::class.java).also { intent ->
      binding.activity.bindService(intent, connection, Context.BIND_AUTO_CREATE)
    }

    val sessionToken = SessionToken(binding.activity, ComponentName(binding.activity, PlaybackService::class.java))
    controllerFuture = MediaController.Builder(binding.activity, sessionToken).buildAsync()
    controllerFuture.addListener({
       1;
      },
      MoreExecutors.directExecutor()
    )
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onDetachedFromActivity() {
    channel.setMethodCallHandler(null)

    pluginBinding!!.applicationContext.unbindService(connection)
    MediaController.releaseFuture(controllerFuture)
    mBound = false
  }
}
