package media.bcc.bccm_player

import android.view.MotionEvent
import android.view.View
import kotlin.math.abs


class SwipeTouchListener(private val minimumDistance: Double, private val listener: Listener) : View.OnTouchListener {
    private var downX = 0f
    private var downY = 0f
    private var upX = 0f
    private var upY = 0f

    interface Listener {
        fun onTopToBottomSwipe() { }
    }

    override fun onTouch(v: View?, event: MotionEvent): Boolean {
        when (event.action) {
            MotionEvent.ACTION_DOWN -> {
                downX = event.x
                downY = event.y
                return true
            }
            MotionEvent.ACTION_UP -> {
                upX = event.x
                upY = event.y
                val deltaX = downX - upX
                val deltaY = downY - upY
                v?.performClick()

                // swipe vertical?
                if (abs(deltaY) > minimumDistance) {
                    // top or down
                    if (deltaY < 0) {
                        listener.onTopToBottomSwipe()
                        return true
                    }
                }
            }
        }
        return true
    }
}
