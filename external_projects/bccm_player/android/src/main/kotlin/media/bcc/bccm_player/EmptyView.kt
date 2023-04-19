package media.bcc.bccm_player

import android.content.Context
import android.view.View
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


class EmptyViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return FLCastButton(context, viewId, creationParams)
    }
}

internal class EmptyView(context: Context, id: Int, creationParams: Map<String?, Any?>?) :
        PlatformView {
    private val _view: View = View(context)

    override fun getView(): View {
        return _view
    }

    override fun dispose() {}
}

