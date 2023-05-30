package media.bcc.bccm_player.views

import android.content.Context
import android.graphics.BlendMode
import android.graphics.BlendModeColorFilter
import android.graphics.Color
import android.os.Build
import android.view.ContextThemeWrapper
import android.view.View
import androidx.core.graphics.drawable.DrawableCompat
import androidx.mediarouter.app.MediaRouteButton
import com.google.android.gms.cast.framework.CastButtonFactory
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import media.bcc.bccm_player.R

internal class FlutterCastButton(
    context: Context,
    color: Int?
) :
    PlatformView {
    private val _view: View

    class Factory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
        override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
            val params = args as? Map<*, *>?;
            val color = (params?.get("color") as? Long?)?.toInt();
            return FlutterCastButton(context, color)
        }
    }

    override fun getView(): View {
        return _view
    }

    override fun dispose() {}

    init {
        val targetColor = color ?: Color.WHITE
        val wrappedContext = ContextThemeWrapper(context, R.style.Theme_AppCompat_NoActionBar)
        val btn = MediaRouteButton(wrappedContext)

        val castTheme =
            ContextThemeWrapper(wrappedContext, androidx.mediarouter.R.style.Theme_MediaRouter)
        val attrs = castTheme.obtainStyledAttributes(
            null,
            androidx.mediarouter.R.styleable.MediaRouteButton,
            androidx.mediarouter.R.attr.mediaRouteButtonStyle,
            0
        )
        val drawable =
            attrs.getDrawable(androidx.mediarouter.R.styleable.MediaRouteButton_externalRouteEnabledDrawable)
        attrs.recycle()
        if (drawable != null) {
            DrawableCompat.setTint(drawable, targetColor)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                drawable.colorFilter = BlendModeColorFilter(targetColor, BlendMode.SRC_ATOP)
            };
            drawable.state = btn.drawableState
            btn.setRemoteIndicatorDrawable(drawable)
        }
        _view = btn
        CastButtonFactory.setUpMediaRouteButton(context, btn)
    }
}