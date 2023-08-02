package tv.brunstad.app

import android.annotation.SuppressLint
import android.content.res.Configuration
import android.os.Bundle
import android.os.PersistableBundle
import android.os.StrictMode
import android.view.View
import android.view.Window
import android.widget.FrameLayout
import io.flutter.embedding.android.FlutterFragmentActivity
import media.bcc.bccm_player.BccmPlayerPlugin
import media.bcc.bccm_player.views.FullscreenPlayerView

class MainActivity : FlutterFragmentActivity() {

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        if (BuildConfig.DEBUG)
            StrictMode.enableDefaults();
        super.onCreate(savedInstanceState, persistentState)
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        requestWindowFeature(Window.FEATURE_ACTIVITY_TRANSITIONS);
    }

    @SuppressLint("MissingSuperCall")
    override fun onPictureInPictureModeChanged(
        isInPictureInPictureMode: Boolean,
        newConfig: Configuration
    ) {
        super.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)
        val bccmPlayer =
            flutterEngine?.plugins?.get(BccmPlayerPlugin::class.javaObjectType) as BccmPlayerPlugin?
        bccmPlayer?.handleOnPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)
    }

    override fun onBackPressed() {
        if (!BccmPlayerPlugin.handleOnBackPressed(this)) {
            super.onBackPressed()
        }
    }
}
