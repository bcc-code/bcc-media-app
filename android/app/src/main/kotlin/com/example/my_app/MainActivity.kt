package tv.brunstad.app

import android.content.res.Configuration
import android.os.Bundle
import android.os.PersistableBundle
import android.os.StrictMode
import android.view.Window
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import media.bcc.bccm_player.BccmPlayerPlugin


class MainActivity: FlutterFragmentActivity() {
    private val _channel = "tv.brunstad.app"

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        if(BuildConfig.DEBUG)
            StrictMode.enableDefaults();
        super.onCreate(savedInstanceState, persistentState)
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        requestWindowFeature(Window.FEATURE_ACTIVITY_TRANSITIONS);
    }


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, _channel).setMethodCallHandler {
            call, result ->
                result.notImplemented()
        }
    }

    override fun onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean, newConfig: Configuration?) {
        val bccmPlayerPlugin = flutterEngine?.plugins?.get(BccmPlayerPlugin::class.javaObjectType)
        (bccmPlayerPlugin as? BccmPlayerPlugin)?.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig);
        super.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)
    }

    override fun onStop() {
        val bccmPlayerPlugin = flutterEngine?.plugins?.get(BccmPlayerPlugin::class.javaObjectType)
        (bccmPlayerPlugin as? BccmPlayerPlugin)?.onStop();
        super.onStop()
    }
}
