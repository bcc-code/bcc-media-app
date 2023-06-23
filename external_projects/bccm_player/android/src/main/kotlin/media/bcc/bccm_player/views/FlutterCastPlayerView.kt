package media.bcc.bccm_player.views

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.LinearLayout
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import media.bcc.bccm_player.BccmPlayerPlugin
import media.bcc.bccm_player.R
import media.bcc.bccm_player.players.chromecast.CastPlayerController
import media.bcc.bccm_player.utils.SystemGestureExcludedLinearLayout

class FlutterCastPlayerView(
    private val context: Context, private val controller: CastPlayerController
) : PlatformView {
    private val _v: LinearLayout = SystemGestureExcludedLinearLayout(context)
    private var _playerView: PlayerView? = null

    class Factory(private val plugin: BccmPlayerPlugin) :
        PlatformViewFactory(StandardMessageCodec.INSTANCE) {
        override fun create(context: Context, id: Int, args: Any?): PlatformView {
            val controller = plugin.getPlaybackService()?.getChromecastController()
            return if (controller != null)
                FlutterCastPlayerView(context, controller)
            else
                FlutterEmptyView(context)
        }
    }

    init {
        setup()
    }

    override fun getView(): View {
        return _v
    }

    override fun dispose() {

    }

    private fun setup() {
        LayoutInflater.from(context).inflate(R.layout.player_view, _v, true)

        val playerView = _v.findViewById<PlayerView>(R.id.brunstad_player).also { _playerView = it }

        playerView.player = controller.player
    }
}