package media.bcc.bccm_player

import android.content.Context
import android.view.ContextThemeWrapper
import android.view.View
import androidx.mediarouter.app.MediaRouteButton
import com.google.android.gms.cast.framework.CastButtonFactory
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class FLCastButtonFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return FLCastButton(context, viewId, creationParams)
    }
}

internal class FLCastButton(context: Context, id: Int, creationParams: Map<String?, Any?>?) :
        PlatformView {
    private val _view: View

    override fun getView(): View {
        return _view
    }

    override fun dispose() {}

    init {
        val wrappedContext = ContextThemeWrapper(context, R.style.Theme_AppCompat_NoActionBar)
        val btn = MediaRouteButton(wrappedContext)
        _view = btn
        CastButtonFactory.setUpMediaRouteButton(context, btn)
    }
}