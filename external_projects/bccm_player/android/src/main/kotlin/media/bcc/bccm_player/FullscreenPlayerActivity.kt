package media.bcc.bccm_player

import android.app.Activity
import android.app.ActivityManager
import android.app.PictureInPictureParams
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.content.res.Configuration
import android.os.Build
import android.os.Bundle
import android.os.IBinder
import android.os.Parcelable
import android.util.Log
import android.util.Rational
import android.view.GestureDetector
import android.view.GestureDetector.SimpleOnGestureListener
import android.view.MotionEvent
import android.view.View
import android.widget.ImageButton
import androidx.annotation.RequiresApi
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.ui.PlayerView
import kotlinx.coroutines.*
import kotlinx.parcelize.Parcelize
import media.bcc.bccm_player.databinding.ActivityPictureInPictureBinding


/**
 * An dedicated player activity, used for fullscreen and picture-in-picture modes.
 */
class FullscreenPlayerActivity : SwipeDismissBaseActivity(), Player.Listener {

    private lateinit var binding: ActivityPictureInPictureBinding
    private var _playbackService: PlaybackService? = null
    private var _playerController: ExoPlayerController? = null
    private var _playerView: PlayerView? = null
    private var mBound = false
    private var options: Options? = null
    private val ioScope = CoroutineScope(Dispatchers.IO + SupervisorJob())

    @Parcelize
    data class Options(
            /** **Note:** Primary if null **/ val playerId: String?,
            val startInPictureInPicture: Boolean = false
    ) : Parcelable

    init {
        Log.d("Bccm", "init fullscreenplayer")

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        Log.d("Bccm", "onCreate fullscreenplayer")

        options = intent.extras?.getParcelable("options")

        binding = ActivityPictureInPictureBinding.inflate(layoutInflater)
        setContentView(binding.root)
        layoutInflater.inflate(R.layout.btvplayer_view, binding.root, true)
        _playerView = this.findViewById<PlayerView>(R.id.brunstad_player)


        /*if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false)
            binding.root.windowInsetsController?.hide(WindowInsets.Type.systemBars()
                    or WindowInsets.Type.statusBars()
                    or WindowInsets.Type.navigationBars())
            binding.root.windowInsetsController?.systemBarsBehavior = WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
            binding.root.rootWindowInsets
                    .getInsetsIgnoringVisibility(WindowInsets.Type.statusBars()
                            or WindowInsets.Type.navigationBars())
        } else {
            binding.root.setSystemUiVisibility(View.SYSTEM_UI_FLAG_LOW_PROFILE
                    or View.SYSTEM_UI_FLAG_FULLSCREEN
                    or View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    or View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                    or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                    or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION)
        }*/

        _playerView?.setFullscreenButtonClickListener {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                navToLauncherTask()
            };
            this@FullscreenPlayerActivity.finish()
        }

        // Bind to LocalService
        Intent(this, PlaybackService::class.java).also { intent ->
            mBound = bindService(intent, playbackServiceConnection, Context.BIND_AUTO_CREATE)
        }

        if (options?.startInPictureInPicture == true && Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            enterPictureInPicture()
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val pipButton = findViewById<ImageButton>(R.id.pip_button)
            pipButton.visibility = View.VISIBLE
            pipButton.setOnClickListener {
                enterPictureInPicture()
            }
        }
        //removeLauncherTask(this)
    }

    override fun onUserLeaveHint() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            enterPictureInPicture()
        }
    }
/*
    override fun onPause() {
        Log.d("Bccm", "onPause fullscreenplayer")
        _playerView?.let {
            _playerController?.releasePlayerView(it)
        }
        super.onPause()
    }

    override fun onResume() {
        Log.d("Bccm", "onResume fullscreenplayer")
        _playerView?.let {
            _playerController?.releasePlayerView(it)
        }
        super.onPause()
    }*/

    override fun onStop() {
        // your onStop code
        super.onStop()
    }

    override fun onDestroy() {
        Log.d("Bccm", "onStop fullscreenplayer")

        if (mBound) {
            unbindService(playbackServiceConnection)
            mBound = false
        }

        releasePlayer();

        super.onDestroy()
    }

    override fun finish() {
        releasePlayer()
        super.finish()
    }

    private var playerIsReleased = false;
    fun releasePlayer() {
        if (playerIsReleased) {
            return;
        }
        _playerController?.emitter?.onPictureInPictureModeChanged(false)

        ioScope.launch {
            if (options?.playerId == null) {
                return@launch;
            }
            BccmPlayerPluginSingleton.eventBus.emit(FullscreenPlayerResult(options!!.playerId!!))
            Log.d("bccm", "I'm supposed to be called once")
        }
        _playerView?.let {
            _playerController?.releasePlayerView(it)
        }
        playerIsReleased = true;
    }

    override fun onTransitionDone() {
        releasePlayer()
        finish()
        overridePendingTransition(R.anim.dev2,R.anim.dev2);
    }


    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    fun navToLauncherTask() {
        val activityManager = baseContext.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        // iterate app tasks available and navigate to launcher task (browse task)
        val appTasks = activityManager.appTasks
        Log.d("bccm", "navToLauncherTask: " + appTasks.map { i -> i.taskInfo.baseIntent.toString()}.toString())
        for (task in appTasks) {
            val baseIntent = task.taskInfo.baseIntent
            val categories = baseIntent.categories
            if (categories != null && categories.contains(Intent.CATEGORY_LAUNCHER)) {
                task.moveToFront()

                overridePendingTransition(R.anim.dev2,
                        R.anim.dev2);

                Log.d("bccm", "navigating to : " + task.taskInfo.baseIntent.toString())
                return
            }
        }
    }


    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean, newConfig: Configuration) {
        Log.d("Bccm", "onPictureInPictureModeChanged fullscreenplayer")
        _playerController?.emitter?.onPictureInPictureModeChanged(isInPictureInPictureMode);

        if (isInPictureInPictureMode) {
            // we just entered into pip
            _playerView?.visibility = View.VISIBLE
            _playerView?.hideController();
        } else {
            // we are leaving pip now
            //navToLauncherTask();
            _playerView?.showController();
        }
        super.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun enterPictureInPicture() {
        Log.d("Bccm", "enterPictureInPicture fullscreenplayer")
        _playerView?.visibility = View.INVISIBLE
        val aspectRatio = _playerController?.player?.let {
            if (it.videoSize.width == 0 || it.videoSize.height == 0) null
            else Rational(it.videoSize.width, it.videoSize.height)
        } ?: Rational(16, 9)

        enterPictureInPictureMode(PictureInPictureParams.Builder()
                .setAspectRatio(aspectRatio)
                .build())
    }


    fun removeLauncherTask(appContext: Context): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
            return false;
        }
        val activityManager = (appContext.getSystemService(ACTIVITY_SERVICE) as ActivityManager)
        val appTasks = activityManager.appTasks
        for (task in appTasks) {
            val baseIntent = task.taskInfo.baseIntent
            val categories = baseIntent.categories
            if (categories != null && categories.contains(Intent.CATEGORY_LAUNCHER)) {
               // this.mBackstackLost = true // to keep track
                task.setExcludeFromRecents(true)
                return true
            }
        }
        return false
    }


    override fun onMediaItemTransition(mediaItem: MediaItem?, reason: Int) {
        if (mediaItem == null) {
            finish();
        }
    }

    private val playbackServiceConnection = object : ServiceConnection {
        override fun onServiceConnected(className: ComponentName, binder: IBinder) {
            // We've bound to LocalService, cast the IBinder and get LocalService instance
            _playbackService = (binder as PlaybackService.LocalBinder).getService()
            _playerController = options?.playerId?.let {
                _playbackService?.getController(it) as? ExoPlayerController
            } ?: _playbackService?.getPrimaryController() as? ExoPlayerController
            _playerView?.let {
                _playerController?.takeOwnership(it)
            }
        }

        override fun onServiceDisconnected(arg0: ComponentName) {
            _playbackService = null
        }
    }
}

abstract class SwipeDismissBaseActivity : Activity() {
    private var gestureDetector: GestureDetector? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        gestureDetector = GestureDetector(this, SwipeDetector())
    }

    private inner class SwipeDetector : SimpleOnGestureListener() {
        override fun onFling(e1: MotionEvent, e2: MotionEvent, velocityX: Float, velocityY: Float): Boolean {

            // Check movement along the X-axis. If it exceeds SWIPE_MAX_OFF_PATH,
            // then dismiss the swipe.
            if (Math.abs(e1.x - e2.x) > SWIPE_MAX_OFF_PATH) return false

            // Swipe from left to right.
            // The swipe needs to exceed a certain distance (SWIPE_MIN_DISTANCE)
            // and a certain velocity (SWIPE_THRESHOLD_VELOCITY).
            if (e2.y - e1.y > SWIPE_MIN_DISTANCE && Math.abs(velocityY) > SWIPE_THRESHOLD_VELOCITY) {
                /*overridePendingTransition(R.anim.dev2,R.anim.dev2)
                //finish()
                val myAnimation = AnimationSet(true)
                val animation = TranslateAnimation(0f, 0f, 0f, -100f)
                val opacityAnimation = AlphaAnimation(1f, 0f)
                myAnimation.addAnimation(animation)
                myAnimation.addAnimation(opacityAnimation)
                myAnimation.addAnimation(ScaleAnimation(1f, 0.9f, 1f, 0.9f, 0.5f, 0.5f))
                myAnimation.interpolator = PathInterpolatorCompat.create(0.175f, 0.610f, 0.000f, 1.000f)
                myAnimation.duration = 500
                myAnimation.setAnimationListener(object : AnimationListener {
                    override fun onAnimationStart(animation: Animation) {}
                    override fun onAnimationRepeat(animation: Animation) {}
                    override fun onAnimationEnd(animation: Animation) {
                        this@SwipeDismissBaseActivity.onTransitionDone()
                    }
                })
                window.decorView.findViewById<View>(android.R.id.content).startAnimation(myAnimation);
                overridePendingTransition(R.anim.dev2,R.anim.dev2)*/
                onTransitionDone()
                this@SwipeDismissBaseActivity.finish()
                return true
            }
            return false
        }
    }

    override fun dispatchTouchEvent(ev: MotionEvent?): Boolean {
        // TouchEvent dispatcher.
        if (gestureDetector != null) {
            if (gestureDetector!!.onTouchEvent(ev)) // If the gestureDetector handles the event, a swipe has been
            // executed and no more needs to be done.
                return true
        }
        return super.dispatchTouchEvent(ev)
    }

    override fun onTouchEvent(event: MotionEvent?): Boolean {
        return gestureDetector!!.onTouchEvent(event)
    }

    companion object {
        private const val SWIPE_MIN_DISTANCE = 250
        private const val SWIPE_MAX_OFF_PATH = 350
        private const val SWIPE_THRESHOLD_VELOCITY = 100
    }

    abstract fun onTransitionDone()
}