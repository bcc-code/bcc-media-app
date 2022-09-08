package media.bcc.bccm_player

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.LinearLayout
import androidx.annotation.NonNull
import androidx.annotation.Nullable
import androidx.media3.cast.CastPlayer
import androidx.media3.ui.PlayerView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


class BccmCastPlayerViewFactory(private val castController: CastPlayerController) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    @NonNull
    override fun create(@NonNull context: Context?, id: Int, @Nullable args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return BccmCastPlayerView(context!!, castController.player)
    }
}

class BccmCastPlayerView(
        private val context: Context,
        private val castPlayer: CastPlayer) : PlatformView {
    private val _v: LinearLayout = LinearLayout(context)
    private var _playerView: PlayerView? = null

    init {
        setup()
    }

    override fun getView(): View {
        return _v
    }

    override fun dispose() {

    }

    fun setup() {
        LayoutInflater.from(context).inflate(R.layout.btvplayer_view, _v, true)

        val playerView = _v.findViewById<PlayerView>(R.id.brunstad_player)
                .also { _playerView = it }

        playerView.player = castPlayer
    }
}