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
import android.view.View
import android.widget.ImageButton
import androidx.annotation.RequiresApi
import androidx.media3.ui.PlayerView
import kotlinx.parcelize.Parcelize
import media.bcc.bccm_player.databinding.ActivityPictureInPictureBinding

/**
 * An dedicated player activity, used for fullscreen and picture-in-picture modes.
 */
class FullscreenPlayer : Activity(){

    private lateinit var binding: ActivityPictureInPictureBinding
    private var _playbackService: PlaybackService? = null
    private var _playerController: ExoPlayerController? = null
    private var _playerView: PlayerView? = null
    private var mBound = false
    private var options: Options? = null

    @Parcelize
    data class Options(
            val startInPictureInPicture: Boolean = false
    ) : Parcelable

    init {
        Log.d("Bccm", "init fullscreenplayer")

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        Log.d("Bccm", "onCreate fullscreenplayer")

        options = intent.extras?.let {
            it.getParcelable("options")
        }

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
            this@FullscreenPlayer.finish()
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
        Log.d("Bccm", "onStop fullscreenplayer")

        if (mBound) {
            unbindService(playbackServiceConnection)
            mBound = false
        }
        _playerView?.let {
            _playerController?.releasePlayerView(it)
        }

        _playerController?.emitter?.onPictureInPictureModeChanged(false)

        super.onStop()
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

    private val playbackServiceConnection = object : ServiceConnection {
        override fun onServiceConnected(className: ComponentName, binder: IBinder) {
            // We've bound to LocalService, cast the IBinder and get LocalService instance
            _playbackService = (binder as PlaybackService.LocalBinder).getService()
            _playerController = _playbackService?.getPrimaryController() as? ExoPlayerController
            _playerView?.let {
                _playerController?.takeOwnership(it)
            }
        }

        override fun onServiceDisconnected(arg0: ComponentName) {
            _playbackService = null
        }
    }
}
