package tv.brunstad.app

import android.content.res.Configuration
import android.os.Bundle
import android.os.PersistableBundle
import android.os.StrictMode
import android.view.Window
import io.flutter.BuildConfig
import io.flutter.embedding.android.FlutterFragmentActivity
import media.bcc.bccm_player.BccmPlayerPlugin

class MainActivity : FlutterFragmentActivity() {

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        if (BuildConfig.DEBUG)
            StrictMode.enableDefaults();
        super.onCreate(savedInstanceState, persistentState)
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        requestWindowFeature(Window.FEATURE_ACTIVITY_TRANSITIONS);
    }

    override fun onPictureInPictureModeChanged(
        isInPictureInPictureMode: Boolean,
        newConfig: Configuration
    ) {
        super.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)
        val bccmPlayer =
            flutterEngine?.plugins?.get(BccmPlayerPlugin::class.javaObjectType) as BccmPlayerPlugin?
        bccmPlayer?.handleOnPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)
    }

    // No onBackPressed() override: android:enableOnBackInvokedCallback="true" means it is never
    // called on API 33+, so BccmPlayerPlugin.handleOnBackPressed was dead code. The plugin now
    // registers its own OnBackPressedCallback while the fullscreen overlay is up.
}
