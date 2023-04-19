package media.bcc.bccm_player.views

import android.content.Context
import android.view.View
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


class FlutterEmptyView(context: Context) : PlatformView {

    private val _view: View = View(context)

    class Factory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
        override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
            return FlutterEmptyView(context)
        }

    }

    override fun getView(): View {
        return _view
    }

    override fun dispose() {}
}
