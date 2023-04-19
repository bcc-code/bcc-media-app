package media.bcc.bccm_player.chromecast

import android.content.Context
import com.google.android.gms.cast.framework.CastOptions
import com.google.android.gms.cast.framework.OptionsProvider
import com.google.android.gms.cast.framework.SessionProvider
import com.google.android.gms.cast.framework.media.CastMediaOptions
import media.bcc.bccm_player.R

class CastOptionsProvider : OptionsProvider {
    override fun getCastOptions(context: Context): CastOptions {
        val mediaOptions = CastMediaOptions.Builder()
            .setExpandedControllerActivityClassName(CastExpandedControlsActivity::class.java.name)
            .build()
        return CastOptions.Builder()
            .setReceiverApplicationId(context.getString(R.string.cast_app_id))
            .setCastMediaOptions(mediaOptions)
            .build()
    }

    override fun getAdditionalSessionProviders(context: Context): List<SessionProvider>? {
        return null
    }
}