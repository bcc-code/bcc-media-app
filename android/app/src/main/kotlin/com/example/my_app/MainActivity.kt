package tv.brunstad.app

import android.os.Bundle
import android.os.PersistableBundle
import android.os.StrictMode
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterFragmentActivity() {
    private val _channel = "tv.brunstad.app"

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        if(BuildConfig.DEBUG)
            StrictMode.enableDefaults();
        super.onCreate(savedInstanceState, persistentState)
    }


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, _channel).setMethodCallHandler {
            call, result ->
                result.notImplemented()
        }
    }
}
