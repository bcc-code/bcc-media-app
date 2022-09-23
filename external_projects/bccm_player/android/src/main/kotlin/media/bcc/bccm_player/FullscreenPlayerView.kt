package media.bcc.bccm_player

import android.content.Context
import android.view.LayoutInflater
import android.widget.*
import androidx.media3.ui.PlayerView
import androidx.media3.ui.PlayerView.FullscreenButtonClickListener


class FullscreenPlayerView(context: Context, val playerController: ExoPlayerController) : LinearLayout(context) {
    val playerView: PlayerView
    init {
        LayoutInflater.from(context).inflate(R.layout.btvplayer_view, this, true)
        playerView = this.findViewById<PlayerView>(R.id.brunstad_player)
        playerController.takeOwnership(playerView)
    }

    fun setFullscreenButtonClickListener(listener: FullscreenButtonClickListener?) {
        playerView.setFullscreenButtonClickListener(listener);
    }

    fun release() {

    }
}