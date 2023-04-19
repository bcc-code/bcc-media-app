package media.bcc.bccm_player.chromecast

import android.view.Menu
import com.google.android.gms.cast.framework.CastButtonFactory
import com.google.android.gms.cast.framework.media.widget.ExpandedControllerActivity
import media.bcc.bccm_player.R

class CastExpandedControlsActivity : ExpandedControllerActivity() {
    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        super.onCreateOptionsMenu(menu)
        menuInflater.inflate(R.menu.cast_expanded_controller, menu)
        CastButtonFactory.setUpMediaRouteButton(this, menu, R.id.media_route_menu_item)
        return true
    }
}